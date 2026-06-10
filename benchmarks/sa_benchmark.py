#!/usr/bin/env python3
"""
benchmarks/sa_benchmark.py — IoT DNN Benchmarks on Basic Systolic Array

Maps the same 5 IoT benchmark networks onto a configurable Weight-Stationary /
Output-Stationary / Input-Stationary systolic array using the analytical cycle
model in systolic_array_simulator/sim_framework/pysim/software_ref.py, then
calls runner.run() per CONV/FC layer so the full pysim infrastructure is
exercised (software_ref fallback, result caching, stats collection).

Networks evaluated (identical workloads to bench-all):
  ECG-Net    : CONV(3×3,1→8)→POOL→POOL→FC(24→2)
  GestureNet : CONV(3×3,1→4)→POOL→POOL→FC(28→5)
  KWS-CNN    : CONV(3×3,1→8)→POOL→POOL→FC(80→10)
  YOLO-Nano  : CONV(3×3,1→4)→POOL→POOL→FC(36→20)
  VWW-Tiny   : CONV(3×3,1→8)→POOL→CONV(3×3,8→16)→POOL

Layer mapping to systolic array operations:
  CONV  →  runner.run(single-layer SimConfig)   [all MACs engaged]
  FC    →  runner.run() with 1×1 kernel          [treated as depth-wise CONV]
  POOL  →  analytical estimate: no MACs, data-movement only

Hardware cost model (100 MHz, conservative 28nm CMOS estimates):
  Area    = array_H × array_W × PE_AREA_AU + CTRL_AREA_AU + SPAD_AREA_AU
  Power   = (compute_cycles × PE_POWER_MW + pool_cycles × PE_IDLE_MW) × N_PEs
            + MEM_POWER_MW  (always-on for SRAM + DRAM interface)

Configurations:
  SA-4×4  : 4×4   = 16 PEs  (area-comparable to our streaming pipeline)
  SA-8×8  : 8×8   = 64 PEs  (standard academic baseline / Google-TPU style)
  SA-16×16: 16×16 = 256 PEs (high-performance reference)

Usage:
    python3 benchmarks/sa_benchmark.py           # from project root
    python3 sa_benchmark.py                      # from benchmarks/
    make bench-sa                                # via Makefile
"""

from __future__ import annotations

import csv
import math
import sys
from dataclasses import dataclass, field
from pathlib import Path
from typing import List, Optional

# ── Resolve path to sim_framework ────────────────────────────────────────────
_SCRIPT   = Path(__file__).resolve()
_SA_ROOT  = _SCRIPT.parents[1] / "systolic_array_simulator" / "sim_framework"

if not _SA_ROOT.exists():
    sys.exit(f"ERROR: systolic_array_simulator/sim_framework not found at {_SA_ROOT}")
sys.path.insert(0, str(_SA_ROOT))

from pysim.software_ref import estimate_cycles          # analytical cycle model
from pysim.sim_config   import SimConfig, LayerConfig   # config dataclasses
from pysim.runner       import run as sa_run            # full runner (caches results)

# ── Hardware cost model constants ─────────────────────────────────────────────
# Area (AU = normalised FPGA/ASIC resource unit, calibrated to match streaming
# pipeline values: N=8 pipeline ≈ 32–36 AU, N=16 ≈ 50 AU)
PE_AREA_AU      = 0.50   # AU per MAC PE (multiply-accumulate + registers + local wiring)
CTRL_AREA_AU    = 4.0    # AU for address generators, tile FSM, DMA control
SPAD_AREA_AU    = 8.0    # AU for shared 16 KB scratchpad SRAM

# Power at 100 MHz (conservative figures for register-file + MAC activity)
PE_POWER_MW     = 3.0    # mW per PE when its MAC is actively computing
PE_IDLE_MW      = 0.5    # mW per PE when idle (pool / fill / drain phases)
MEM_POWER_MW    = 80.0   # mW for SRAM reads/writes + DRAM interface (always-on)

CLK_MHZ         = 100
DATAFLOW        = "OS"   # Output-Stationary (best for small spatial maps)


# ── Per-layer descriptor ──────────────────────────────────────────────────────
@dataclass
class LayerDef:
    kind:    str          # 'conv' | 'pool' | 'fc'
    name:    str = ""
    ic:      int = 1      # input channels
    ih:      int = 1      # input height
    iw:      int = 1      # input width
    k:       int = 1      # output channels  (CONV/FC)
    kh:      int = 1      # kernel height    (CONV)
    kw:      int = 1      # kernel width     (CONV)
    oh:      int = 1      # output height
    ow:      int = 1      # output width


# ── 5 benchmark networks ──────────────────────────────────────────────────────
# Spatial sizes follow "valid" convolution: out = in - (k - 1)
# Pool halves spatial dims (floor division).

BENCHMARKS: dict[str, dict] = {

    "ECG-Net": {
        "workload": "Cardiac Anomaly Detection",
        "network":  "CONV(3×3,1→8)→POOL→POOL→FC(24→2)",
        "input":    "128-sample ECG → 16×8",
        "layers": [
            LayerDef("conv", "L0-CONV",  ic=1,  ih=16, iw=8,  k=8,  kh=3, kw=3, oh=14, ow=6),
            LayerDef("pool", "L1-POOL",  ic=8,  ih=14, iw=6,                     oh=7,  ow=3),
            LayerDef("pool", "L2-POOL",  ic=8,  ih=7,  iw=3,                     oh=3,  ow=1),
            LayerDef("fc",   "L3-FC",    ic=24, ih=1,  iw=1,  k=2,  kh=1, kw=1, oh=1,  ow=1),
        ],
    },

    "GestureNet": {
        "workload": "IMU Gesture Recognition",
        "network":  "CONV(3×3,1→4)→POOL→POOL→FC(28→5)",
        "input":    "6-axis × 32 timesteps",
        "layers": [
            LayerDef("conv", "L0-CONV",  ic=1,  ih=6,  iw=32, k=4,  kh=3, kw=3, oh=4,  ow=30),
            LayerDef("pool", "L1-POOL",  ic=4,  ih=4,  iw=30,                    oh=2,  ow=15),
            LayerDef("pool", "L2-POOL",  ic=4,  ih=2,  iw=15,                    oh=1,  ow=7),
            LayerDef("fc",   "L3-FC",    ic=28, ih=1,  iw=1,  k=5,  kh=1, kw=1, oh=1,  ow=1),
        ],
    },

    "KWS-CNN": {
        "workload": "Keyword Spotting",
        "network":  "CONV(3×3,1→8)→POOL→POOL→FC(80→10)",
        "input":    "25×10 MFCC",
        "layers": [
            LayerDef("conv", "L0-CONV",  ic=1,  ih=25, iw=10, k=8,  kh=3, kw=3, oh=23, ow=8),
            LayerDef("pool", "L1-POOL",  ic=8,  ih=23, iw=8,                     oh=11, ow=4),
            LayerDef("pool", "L2-POOL",  ic=8,  ih=11, iw=4,                     oh=5,  ow=2),
            LayerDef("fc",   "L3-FC",    ic=80, ih=1,  iw=1,  k=10, kh=1, kw=1, oh=1,  ow=1),
        ],
    },

    "YOLO-Nano": {
        "workload": "Object Detection",
        "network":  "CONV(3×3,1→4)→POOL→POOL→FC(36→20)",
        "input":    "16×16 grayscale → 2×2 grid",
        "layers": [
            LayerDef("conv", "L0-CONV",  ic=1,  ih=16, iw=16, k=4,  kh=3, kw=3, oh=14, ow=14),
            LayerDef("pool", "L1-POOL",  ic=4,  ih=14, iw=14,                    oh=7,  ow=7),
            LayerDef("pool", "L2-POOL",  ic=4,  ih=7,  iw=7,                     oh=3,  ow=3),
            LayerDef("fc",   "L3-FC",    ic=36, ih=1,  iw=1,  k=20, kh=1, kw=1, oh=1,  ow=1),
        ],
    },

    "VWW-Tiny": {
        "workload": "Visual Wake Words",
        "network":  "CONV(3×3,1→8)→POOL→CONV(3×3,8→16)→POOL",
        "input":    "24×24 grayscale",
        "layers": [
            LayerDef("conv", "L0-CONV",  ic=1,  ih=24, iw=24, k=8,  kh=3, kw=3, oh=22, ow=22),
            LayerDef("pool", "L1-POOL",  ic=8,  ih=22, iw=22,                    oh=11, ow=11),
            LayerDef("conv", "L2-CONV",  ic=8,  ih=11, iw=11, k=16, kh=3, kw=3, oh=9,  ow=9),
            LayerDef("pool", "L3-POOL",  ic=16, ih=9,  iw=9,                     oh=4,  ow=4),
        ],
    },
}

# ── Streaming pipeline baseline (from make bench-report) ─────────────────────
PIPELINE_BASELINE = {
    "ECG-Net":    {"cycles": 800,   "exec_us": 8.00,  "throughput_k": 125.0, "energy_uj": 3.728,  "area_au": 32.0, "power_mw": 466},
    "GestureNet": {"cycles": 1147,  "exec_us": 11.47, "throughput_k": 87.2,  "energy_uj": 5.345,  "area_au": 32.0, "power_mw": 466},
    "KWS-CNN":    {"cycles": 1840,  "exec_us": 18.40, "throughput_k": 54.3,  "energy_uj": 23.920, "area_au": 35.5, "power_mw": 1300},
    "YOLO-Nano":  {"cycles": 1942,  "exec_us": 19.42, "throughput_k": 51.5,  "energy_uj": 15.536, "area_au": 33.0, "power_mw": 800},
    "VWW-Tiny":   {"cycles": 10590, "exec_us": 105.90,"throughput_k": 9.4,   "energy_uj": 134.069,"area_au": 50.0, "power_mw": 1266},
}

# ── Array configurations to evaluate ─────────────────────────────────────────
SA_CONFIGS = [
    {"name": "SA-4×4",   "H": 4,  "W": 4},
    {"name": "SA-8×8",   "H": 8,  "W": 8},
    {"name": "SA-16×16", "H": 16, "W": 16},
]


# ── Helper: cycles for a single layer on the systolic array ──────────────────

def conv_or_fc_cycles(l: LayerDef, array_h: int, array_w: int) -> tuple[int, dict]:
    """Use runner.run() (→ software_ref fallback) for one CONV or FC layer.

    Returns (cycles, stats_dict).
    """
    lc = LayerConfig(
        name=l.name,
        input_channels=l.ic,
        input_height=l.ih,
        input_width=l.iw,
        weight_k=l.k,
        weight_c=l.ic,          # kernel input channels == layer input channels
        weight_kh=l.kh,
        weight_kw=l.kw,
        output_channels=l.k,
        output_height=l.oh,
        output_width=l.ow,
    )
    cfg = SimConfig(
        dataflow=DATAFLOW,
        memory="STAMP",
        array_height=array_h,
        array_width=array_w,
        layers=[lc],
    )
    result = sa_run(cfg)
    return result.cycles, result.stats


def pool_cycles(l: LayerDef, array_w: int) -> int:
    """Pool has no MAC operations; estimate data-movement cycles.

    The array reads input tiles of width array_w and performs comparison
    without engaging the MAC units.
    """
    input_pixels = l.ih * l.iw * l.ic
    return math.ceil(input_pixels / array_w) + 5   # +5 pipeline drain


# ── Area and power models ─────────────────────────────────────────────────────

def sa_area_au(H: int, W: int) -> float:
    return H * W * PE_AREA_AU + CTRL_AREA_AU + SPAD_AREA_AU


def sa_energy_uj(layer_results: list[dict], H: int, W: int) -> tuple[float, float]:
    """Compute total energy and derive average power over exec time.

    Returns (energy_uj, avg_power_mw).
    Power is split: PE_POWER_MW × N_PEs during compute, PE_IDLE_MW during pool.
    MEM_POWER_MW is always-on.
    """
    n_pes = H * W
    total_energy_pj = 0.0
    ns_per_cycle = 1000.0 / CLK_MHZ   # nanoseconds per cycle

    for lr in layer_results:
        cyc = lr["cycles"]
        if lr["kind"] in ("conv", "fc"):
            power_mw = n_pes * PE_POWER_MW + MEM_POWER_MW
        else:   # pool — no MAC activity
            power_mw = n_pes * PE_IDLE_MW + MEM_POWER_MW
        # energy (pJ) = power_mW × time_ns = power_mW × cycles × ns_per_cycle
        total_energy_pj += power_mw * cyc * ns_per_cycle

    total_cycles = sum(lr["cycles"] for lr in layer_results)
    energy_uj    = total_energy_pj * 1e-6   # pJ → µJ
    total_time_ns = total_cycles * ns_per_cycle
    avg_power_mw  = (total_energy_pj / total_time_ns) if total_time_ns > 0 else 0.0
    return energy_uj, avg_power_mw


# ── Per-benchmark simulation across all SA configs ───────────────────────────

def run_benchmark(bench_name: str, bench_def: dict, sa_H: int, sa_W: int) -> dict:
    """Simulate one benchmark on one SA config. Returns a result dict."""
    layer_results = []
    total_bytes   = 0
    total_macs    = 0

    for l in bench_def["layers"]:
        if l.kind in ("conv", "fc"):
            cyc, stats = conv_or_fc_cycles(l, sa_H, sa_W)
            total_bytes += stats.get("bytes_loaded", 0)
            # Total MACs = K × C × kH × kW × oH × oW
            total_macs  += l.k * l.ic * l.kh * l.kw * l.oh * l.ow
        else:
            cyc = pool_cycles(l, sa_W)
            stats = {}
        layer_results.append({"name": l.name, "kind": l.kind, "cycles": cyc, "stats": stats})

    total_cycles  = sum(r["cycles"] for r in layer_results)
    exec_us        = total_cycles / CLK_MHZ
    throughput_k   = (1e6 / exec_us) / 1000.0  if exec_us > 0 else 0
    area_au        = sa_area_au(sa_H, sa_W)
    energy_uj, avg_power_mw = sa_energy_uj(layer_results, sa_H, sa_W)
    mac_util_pct   = (total_macs / (total_cycles * sa_H * sa_W)) * 100 if total_cycles > 0 else 0

    return {
        "benchmark":    bench_name,
        "workload":     bench_def["workload"],
        "network":      bench_def["network"],
        "input":        bench_def["input"],
        "sa_name":      f"SA-{sa_H}×{sa_W}",
        "array_h":      sa_H,
        "array_w":      sa_W,
        "n_pes":        sa_H * sa_W,
        "dataflow":     DATAFLOW,
        "cycles":       total_cycles,
        "exec_us":      exec_us,
        "throughput_k": throughput_k,
        "energy_uj":    energy_uj,
        "avg_power_mw": avg_power_mw,
        "area_au":      area_au,
        "mac_util_pct": mac_util_pct,
        "total_macs":   total_macs,
        "dram_bytes":   total_bytes,
        "layer_results": layer_results,
    }


# ── Main ──────────────────────────────────────────────────────────────────────

def main():
    script_dir = Path(__file__).resolve().parent

    print()
    print("═" * 80)
    print("  IoT DNN — Systolic Array Benchmark")
    print(f"  Simulator: {_SA_ROOT.relative_to(_SA_ROOT.parents[3])}")
    print(f"  Dataflow : {DATAFLOW} (Output-Stationary)")
    print(f"  Clock    : {CLK_MHZ} MHz")
    print("═" * 80)

    # ── Simulate all (benchmark × SA-config) combinations ──────────────────
    all_results: list[dict] = []

    for bench_name, bench_def in BENCHMARKS.items():
        print(f"\n  ┌─ {bench_name}  —  {bench_def['workload']}")
        print(f"  │  Network : {bench_def['network']}")
        print(f"  │  Input   : {bench_def['input']}")

        for sa in SA_CONFIGS:
            r = run_benchmark(bench_name, bench_def, sa["H"], sa["W"])
            all_results.append(r)

            # Per-layer breakdown for SA-8×8
            if sa["H"] == 8:
                print(f"  │  [{sa['name']}]  layers:", end="")
                for lr in r["layer_results"]:
                    print(f"  {lr['name']}={lr['cycles']}cy", end="")
                print()

            print(f"  │  [{sa['name']}]  "
                  f"cycles={r['cycles']:,}  "
                  f"time={r['exec_us']:.2f}µs  "
                  f"thruput={r['throughput_k']:.1f}k/s  "
                  f"energy={r['energy_uj']:.3f}µJ  "
                  f"area={r['area_au']:.1f}AU  "
                  f"util={r['mac_util_pct']:.0f}%")
        print("  └" + "─" * 68)

    # ── Summary table: SA-8×8 vs streaming pipeline ─────────────────────────
    sa8_results = [r for r in all_results if r["array_h"] == 8]

    print()
    print("═" * 80)
    print("  PERFORMANCE SUMMARY — SA-8×8 (Output-Stationary, 64 PEs) @100 MHz")
    print("═" * 80)
    sa8_sorted = sorted(sa8_results, key=lambda r: r["throughput_k"], reverse=True)
    hdr = (f"  {'Benchmark':<13}  {'Cycles':>8}  {'Time(µs)':>9}  "
           f"{'Thruput(k/s)':>13}  {'Energy(µJ)':>11}  {'Area(AU)':>9}  {'Util%':>6}")
    print(hdr)
    print("  " + "─" * 76)
    for r in sa8_sorted:
        print(f"  {r['benchmark']:<13}  {r['cycles']:>8,}  {r['exec_us']:>9.2f}  "
              f"  {r['throughput_k']:>12.1f}  {r['energy_uj']:>11.3f}  "
              f"  {r['area_au']:>8.1f}  {r['mac_util_pct']:>5.0f}%")
    print("  " + "─" * 76)

    # ── Head-to-head comparison table ────────────────────────────────────────
    print()
    print("═" * 80)
    print("  HEAD-TO-HEAD: Streaming Pipeline vs SA-4×4 vs SA-8×8 vs SA-16×16")
    print("  (ratio columns: SA / Pipeline — lower = SA is better)")
    print("═" * 80)

    bench_order = ["ECG-Net", "GestureNet", "KWS-CNN", "YOLO-Nano", "VWW-Tiny"]

    # Header
    print(f"\n  {'':13}  {'Architecture':<12}  {'Cycles':>8}  {'Time(µs)':>9}  "
          f"{'Thruput(k/s)':>13}  {'Energy(µJ)':>11}  {'Area(AU)':>9}")
    print("  " + "─" * 78)

    speedup_sum   = {s["name"]: 0.0 for s in SA_CONFIGS}
    energy_sum    = {s["name"]: 0.0 for s in SA_CONFIGS}
    n_benchmarks  = len(bench_order)

    for bname in bench_order:
        bl = PIPELINE_BASELINE[bname]
        # Print pipeline row
        print(f"  {bname:<13}  {'Pipeline':<12}  "
              f"{bl['cycles']:>8,}  {bl['exec_us']:>9.2f}  "
              f"  {bl['throughput_k']:>12.1f}  {bl['energy_uj']:>11.3f}  "
              f"  {bl['area_au']:>8.1f}")
        # Print SA rows with ratio
        for sa in SA_CONFIGS:
            r = next(x for x in all_results
                     if x["benchmark"] == bname and x["array_h"] == sa["H"])
            spd = bl["exec_us"] / r["exec_us"] if r["exec_us"] > 0 else 0
            egy = r["energy_uj"] / bl["energy_uj"] if bl["energy_uj"] > 0 else 0
            speedup_sum[sa["name"]] += spd
            energy_sum[sa["name"]]  += egy
            ratio_str = f"  ×{spd:.1f} faster, {egy:.2f}× energy"
            print(f"  {'':13}  {r['sa_name']:<12}  "
                  f"{r['cycles']:>8,}  {r['exec_us']:>9.2f}  "
                  f"  {r['throughput_k']:>12.1f}  {r['energy_uj']:>11.3f}  "
                  f"  {r['area_au']:>8.1f}"
                  f"   {ratio_str}")
        print()

    # Geo-mean summaries
    print("  " + "─" * 78)
    print("  Average speedup and energy ratio vs. streaming pipeline:")
    for sa in SA_CONFIGS:
        avg_spd = speedup_sum[sa["name"]] / n_benchmarks
        avg_egy = energy_sum[sa["name"]]  / n_benchmarks
        area    = sa_area_au(sa["H"], sa["W"])
        print(f"    {sa['name']:<10}  area={area:.1f}AU  "
              f"avg_speedup=×{avg_spd:.1f}  avg_energy_ratio={avg_egy:.2f}×")

    # ── All-config sweep table ────────────────────────────────────────────────
    print()
    print("═" * 80)
    print("  FULL SWEEP — all benchmarks × all SA configs")
    print("═" * 80)
    sweep_sorted = sorted(all_results,
                          key=lambda r: (r["benchmark"], r["array_h"]))
    print(f"  {'Benchmark':<13}  {'Config':<10}  {'PEs':>4}  "
          f"{'Cycles':>8}  {'µs':>7}  {'k/s':>10}  "
          f"{'µJ':>8}  {'AU':>7}  {'Util%':>6}")
    print("  " + "─" * 76)
    prev = ""
    for r in sweep_sorted:
        sep = "  " if r["benchmark"] == prev else "\n  "
        print(f"{sep}{r['benchmark']:<13}  {r['sa_name']:<10}  {r['n_pes']:>4}  "
              f"{r['cycles']:>8,}  {r['exec_us']:>7.2f}  {r['throughput_k']:>10.1f}  "
              f"{r['energy_uj']:>8.3f}  {r['area_au']:>7.1f}  {r['mac_util_pct']:>5.0f}%")
        prev = r["benchmark"]

    # ── CSV export ────────────────────────────────────────────────────────────
    csv_path = script_dir / "sa_perf_results.csv"
    fields = ["benchmark", "workload", "architecture", "n_pes", "dataflow",
              "cycles", "exec_time_us", "throughput_k_inf_per_s",
              "energy_uj", "avg_power_mw", "area_au", "mac_util_pct",
              "total_macs", "dram_bytes"]
    with open(csv_path, "w", newline="") as f:
        w = csv.DictWriter(f, fieldnames=fields)
        w.writeheader()
        # Include pipeline baseline rows too for easy comparison
        for bname in bench_order:
            bl = PIPELINE_BASELINE[bname]
            w.writerow({
                "benchmark":               bname,
                "workload":                BENCHMARKS[bname]["workload"],
                "architecture":            "Streaming-Pipeline",
                "n_pes":                   8,
                "dataflow":                "pipelined",
                "cycles":                  bl["cycles"],
                "exec_time_us":            f"{bl['exec_us']:.4f}",
                "throughput_k_inf_per_s":  f"{bl['throughput_k']:.4f}",
                "energy_uj":               f"{bl['energy_uj']:.4f}",
                "avg_power_mw":            f"{bl['power_mw']:.1f}",
                "area_au":                 f"{bl['area_au']:.1f}",
                "mac_util_pct":            "100",
                "total_macs":              "",
                "dram_bytes":              "",
            })
        for r in all_results:
            w.writerow({
                "benchmark":               r["benchmark"],
                "workload":                r["workload"],
                "architecture":            r["sa_name"],
                "n_pes":                   r["n_pes"],
                "dataflow":                r["dataflow"],
                "cycles":                  r["cycles"],
                "exec_time_us":            f"{r['exec_us']:.4f}",
                "throughput_k_inf_per_s":  f"{r['throughput_k']:.4f}",
                "energy_uj":               f"{r['energy_uj']:.4f}",
                "avg_power_mw":            f"{r['avg_power_mw']:.1f}",
                "area_au":                 f"{r['area_au']:.1f}",
                "mac_util_pct":            f"{r['mac_util_pct']:.1f}",
                "total_macs":              r["total_macs"],
                "dram_bytes":              r["dram_bytes"],
            })

    print(f"\n  CSV written → benchmarks/sa_perf_results.csv")
    print("═" * 80)
    print()


if __name__ == "__main__":
    main()
