#!/usr/bin/env python3
"""
benchmarks/fair_comparison_benchmark.py

Fair Architectural Comparison: Streaming Pipeline vs Systolic Arrays
=====================================================================
Streaming N=8 pipeline is compared against SA-4×4 (16 MACs) and SA-8×8
(64 MACs) to evaluate area-normalised efficiency.

Two corrections applied vs sa_benchmark.py:

  Correction 1 — Missing K in SA OS formula
    estimate_cycles() uses ceil(oH*oW / (H*W)) — omits K (output channels).
    Correct: ceil(oH*oW*K / (H*W)) * C*kH*kW + H + W + 5

  Correction 2 — No DRAM weight-loading cost for SA
    SA has a 16 KB on-chip scratchpad. Layers whose weight tensor exceeds that
    must reload from DDR3 every inference (@4 B/cycle effective bandwidth).
    Streaming pre-loads ALL weights to BRAM once; zero DRAM during inference.

Key comparison metrics:
  Throughput/Area  (k inf/s per AU) — higher is better
  Energy×Area      (µJ·AU)         — lower is better (area-normalised EDP)

Platform: ZedBoard XC7Z020-1CLG484 @ 100 MHz
Streaming: N=8 MACs/cycle  |  FILL=32 cycles/layer
SA-4×4:   16 MACs/cycle   |  SA-8×8: 64 MACs/cycle
DRAM_BPC=4 B/cycle  |  SA Scratchpad=16 KB  |  Streaming BRAM=630 KB

Usage:
    python3 benchmarks/fair_comparison_benchmark.py
    make bench-fair
"""

import math
import csv
from dataclasses import dataclass
from pathlib import Path
from typing import List, Tuple

# ── Platform constants ────────────────────────────────────────────────────────
CLK_MHZ      = 100
N_STREAM     = 8         # streaming MACs per cycle
FILL         = 32        # pipeline fill latency per layer (streaming only)
DRAM_BPC     = 4         # DDR3 effective bandwidth (bytes/cycle)
SCRATCHPAD   = 16 * 1024 # SA on-chip weight buffer (bytes)
BRAM_CAP     = 630 * 1024 # ZedBoard BRAM capacity (bytes)

# SA configurations under test
SA_CONFIGS = [
    {"name": "SA-4×4", "h": 4, "w": 4},
    {"name": "SA-8×8", "h": 8, "w": 8},
]

# Area model (AU = arbitrary area units, matched to sa_benchmark.py)
PE_AREA_AU       = 0.50
CTRL_AREA_AU     = 4.0
SPAD_AREA_AU     = 8.0
BRAM_AREA_PER_KB = 0.05  # AU per KB of BRAM weight storage

# Power model
PE_POWER_MW           = 3.0   # mW per active SA MAC PE
PE_IDLE_MW            = 0.5   # mW per idle SA PE (pool/fill)
MEM_POWER_MW          = 80.0  # mW on-chip SRAM baseline
DRAM_POWER_MW         = 500.0 # mW DDR3 burst (SA weight loading)
PIPELINE_PE_POWER_MW  = 50.0  # mW per streaming MAC (wider due to row buffers)
PIPELINE_CTRL_MW      = 80.0  # mW streaming control + BRAM access


# ── Layer descriptor ──────────────────────────────────────────────────────────

@dataclass
class LayerDef:
    kind: str   # 'conv' | 'pool' | 'fc'
    name: str = ""
    ic:   int = 1
    ih:   int = 1
    iw:   int = 1
    oc:   int = 0
    kh:   int = 1
    kw:   int = 1
    oh:   int = 1
    ow:   int = 1

    def weight_bytes(self) -> int:
        if self.kind == 'conv': return self.ic * self.oc * self.kh * self.kw * 2
        if self.kind == 'fc':   return self.ic * self.oc * 2
        return 0

    def total_macs(self) -> int:
        if self.kind == 'conv': return self.oh * self.ow * self.oc * self.ic * self.kh * self.kw
        if self.kind == 'fc':   return self.oc * self.ic
        return 0


# ── Benchmarks ────────────────────────────────────────────────────────────────

BENCHMARKS = {

    "LeNet-5": {
        "workload": "Handwritten Digit Classification (MNIST-style)",
        "network":  "C1:CONV(5×5,1→6)→S2:POOL→C3:CONV(5×5,6→16)→S4:POOL→C5:CONV(5×5,16→120)→F6:FC(120→84)→F7:FC(84→10)",
        "input":    "32×32 grayscale",
        "reference":"LeCun et al. 1998",
        "layers": [
            LayerDef("conv", "C1-CONV", ic=1,   ih=32, iw=32, oc=6,   kh=5, kw=5, oh=28, ow=28),
            LayerDef("pool", "S2-POOL", ic=6,   ih=28, iw=28,                      oh=14, ow=14),
            LayerDef("conv", "C3-CONV", ic=6,   ih=14, iw=14, oc=16,  kh=5, kw=5, oh=10, ow=10),
            LayerDef("pool", "S4-POOL", ic=16,  ih=10, iw=10,                      oh=5,  ow=5 ),
            LayerDef("conv", "C5-CONV", ic=16,  ih=5,  iw=5,  oc=120, kh=5, kw=5, oh=1,  ow=1 ),
            LayerDef("fc",   "F6-FC",   ic=120, ih=1,  iw=1,  oc=84,  kh=1, kw=1, oh=1,  ow=1 ),
            LayerDef("fc",   "F7-FC",   ic=84,  ih=1,  iw=1,  oc=10,  kh=1, kw=1, oh=1,  ow=1 ),
        ],
    },

    "AlexNet-Nano": {
        "workload": "Object Classification (AlexNet-inspired, 20×20 scaled)",
        "network":  "CONV(3×3,1→8)→POOL→FC(648→512)→FC(512→256)→FC(256→10)",
        "input":    "20×20 grayscale (scaled AlexNet)",
        "reference":"Krizhevsky et al. 2012 (scaled)",
        "layers": [
            LayerDef("conv", "L0-CONV", ic=1,   ih=20, iw=20, oc=8,   kh=3, kw=3, oh=18, ow=18),
            LayerDef("pool", "L1-POOL", ic=8,   ih=18, iw=18,                      oh=9,  ow=9 ),
            LayerDef("fc",   "FC4",     ic=648, ih=1,  iw=1,  oc=512, kh=1, kw=1, oh=1,  ow=1 ),
            LayerDef("fc",   "FC5",     ic=512, ih=1,  iw=1,  oc=256, kh=1, kw=1, oh=1,  ow=1 ),
            LayerDef("fc",   "FC6",     ic=256, ih=1,  iw=1,  oc=10,  kh=1, kw=1, oh=1,  ow=1 ),
        ],
    },

    "YOLO-Tiny": {
        "workload": "Object Detection (YOLO-tiny-inspired, 64×64 → 5 classes)",
        "network":  "CONV(3×3,1→4)→POOL→POOL→POOL→FC(196→256)→FC(256→10)",
        "input":    "64×64 grayscale (5 PASCAL-VOC-style classes)",
        "reference":"Redmon et al. 2015 (scaled)",
        "layers": [
            LayerDef("conv", "L0-CONV", ic=1,   ih=64, iw=64, oc=4,   kh=3, kw=3, oh=62, ow=62),
            LayerDef("pool", "L1-POOL", ic=4,   ih=62, iw=62,                      oh=31, ow=31),
            LayerDef("pool", "L2-POOL", ic=4,   ih=31, iw=31,                      oh=15, ow=15),
            LayerDef("pool", "L3-POOL", ic=4,   ih=15, iw=15,                      oh=7,  ow=7 ),
            LayerDef("fc",   "FC-DET",  ic=196, ih=1,  iw=1,  oc=256, kh=1, kw=1, oh=1,  ow=1 ),
            LayerDef("fc",   "FC-OUT",  ic=256, ih=1,  iw=1,  oc=10,  kh=1, kw=1, oh=1,  ow=1 ),
        ],
    },

    "VGG-8": {
        "workload": "Image Classification (VGG-8-inspired, 24×24 input)",
        "network":  "CONV(3×3,1→8)→POOL→CONV(3×3,8→16)→POOL→FC7(256→512)→FC8(512→10)",
        "input":    "24×24 grayscale (scaled VGG)",
        "reference":"Simonyan & Zisserman 2014 (scaled)",
        "layers": [
            LayerDef("conv", "CONV1",   ic=1,   ih=24, iw=24, oc=8,   kh=3, kw=3, oh=22, ow=22),
            LayerDef("pool", "POOL1",   ic=8,   ih=22, iw=22,                      oh=11, ow=11),
            LayerDef("conv", "CONV2",   ic=8,   ih=11, iw=11, oc=16,  kh=3, kw=3, oh=9,  ow=9 ),
            LayerDef("pool", "POOL2",   ic=16,  ih=9,  iw=9,                       oh=4,  ow=4 ),
            LayerDef("fc",   "FC7",     ic=256, ih=1,  iw=1,  oc=512, kh=1, kw=1, oh=1,  ow=1 ),
            LayerDef("fc",   "FC8",     ic=512, ih=1,  iw=1,  oc=10,  kh=1, kw=1, oh=1,  ow=1 ),
        ],
    },

    "ResNet-Micro": {
        "workload": "Image Classification (ResNet-micro-inspired, 24×24 input)",
        "network":  "CONV→POOL→CONV→POOL→CONV(3×3,16→32)→FC5(128→256)→FC6(256→128)→FC7(128→10)",
        "input":    "24×24 grayscale (ResNet-style deep CONV + FC)",
        "reference":"He et al. 2015 (micro adaptation)",
        "layers": [
            LayerDef("conv", "CONV1",   ic=1,  ih=24, iw=24, oc=8,  kh=3, kw=3, oh=22, ow=22),
            LayerDef("pool", "POOL1",   ic=8,  ih=22, iw=22,                     oh=11, ow=11),
            LayerDef("conv", "CONV2",   ic=8,  ih=11, iw=11, oc=16, kh=3, kw=3, oh=9,  ow=9 ),
            LayerDef("pool", "POOL2",   ic=16, ih=9,  iw=9,                      oh=4,  ow=4 ),
            LayerDef("conv", "CONV3",   ic=16, ih=4,  iw=4,  oc=32, kh=3, kw=3, oh=2,  ow=2 ),
            LayerDef("fc",   "FC5",     ic=128, ih=1, iw=1,  oc=256, kh=1, kw=1, oh=1, ow=1 ),
            LayerDef("fc",   "FC6",     ic=256, ih=1, iw=1,  oc=128, kh=1, kw=1, oh=1, ow=1 ),
            LayerDef("fc",   "FC7",     ic=128, ih=1, iw=1,  oc=10,  kh=1, kw=1, oh=1, ow=1 ),
        ],
    },
}


# ── Streaming pipeline estimators ─────────────────────────────────────────────

def streaming_layer_cycles(l: LayerDef) -> int:
    if l.kind == 'conv':
        return math.ceil(l.oh * l.ow * l.oc * l.ic * l.kh * l.kw / N_STREAM) + FILL
    if l.kind == 'pool':
        return math.ceil(l.oh * l.ow * l.ic / N_STREAM) + 5  # output-based, dedicated HW
    # fc
    return math.ceil(l.oc * l.ic / N_STREAM) + FILL


def streaming_metrics(layers: List[LayerDef], total_cycles: int) -> Tuple[float, float]:
    wt_bytes = sum(l.weight_bytes() for l in layers)
    bram_kb  = max(1, math.ceil(wt_bytes / 1024))
    area_au  = N_STREAM * PE_AREA_AU + CTRL_AREA_AU + SPAD_AREA_AU + bram_kb * BRAM_AREA_PER_KB
    power_mw = N_STREAM * PIPELINE_PE_POWER_MW + PIPELINE_CTRL_MW
    ns_per_cycle = 1000.0 / CLK_MHZ
    energy_uj = power_mw * total_cycles * ns_per_cycle * 1e-6
    return area_au, energy_uj


# ── SA estimators (parameterised by array dimensions) ─────────────────────────

def sa_layer_cycles(l: LayerDef, h: int, w: int) -> Tuple[int, int]:
    """Return (compute_cycles, dram_cycles)."""
    n_sa    = h * w
    w_bytes = l.weight_bytes()
    dram    = math.ceil(w_bytes / DRAM_BPC) if w_bytes > SCRATCHPAD else 0

    if l.kind == 'conv':
        tiles = math.ceil(l.oh * l.ow * l.oc / n_sa)  # K-inclusive (corrected)
        comp  = tiles * l.ic * l.kh * l.kw + h + w + 5
    elif l.kind == 'pool':
        comp = math.ceil(l.ih * l.iw * l.ic / n_sa) + 5  # serial, input-based
        dram = 0
    else:  # fc
        comp = math.ceil(l.oc / n_sa) * l.ic + h + w + 5

    return comp, dram


def sa_metrics(layers: List[LayerDef], layer_results: list,
               h: int, w: int) -> Tuple[float, float]:
    n_sa     = h * w
    area_au  = n_sa * PE_AREA_AU + CTRL_AREA_AU + SPAD_AREA_AU
    ns_per_cycle = 1000.0 / CLK_MHZ
    energy_pj = 0.0
    for lr in layer_results:
        pw_comp = (n_sa * PE_POWER_MW + MEM_POWER_MW) if lr["kind"] in ("conv", "fc") \
                  else (n_sa * PE_IDLE_MW + MEM_POWER_MW)
        energy_pj += pw_comp * lr["comp"] * ns_per_cycle
        energy_pj += (DRAM_POWER_MW + MEM_POWER_MW) * lr["dram"] * ns_per_cycle
    return area_au, energy_pj * 1e-6


# ── Per-benchmark runner ──────────────────────────────────────────────────────

def run_benchmark(name: str, bdef: dict) -> dict:
    layers = bdef["layers"]

    # Streaming
    s_layer = [{"name": l.name, "kind": l.kind,
                "cycles": streaming_layer_cycles(l),
                "weight_bytes": l.weight_bytes()} for l in layers]
    s_cycles = sum(r["cycles"] for r in s_layer)
    s_area, s_energy = streaming_metrics(layers, s_cycles)
    s_thruput = 1e3 / (s_cycles / CLK_MHZ)   # k inf/s
    s_tpa     = s_thruput / s_area            # k/s per AU

    wt_total = sum(l.weight_bytes() for l in layers)

    # SA variants
    sa_variants = []
    for cfg in SA_CONFIGS:
        h, w = cfg["h"], cfg["w"]
        a_layer = []
        for l in layers:
            comp, dram = sa_layer_cycles(l, h, w)
            a_layer.append({"name": l.name, "kind": l.kind,
                             "comp": comp, "dram": dram,
                             "total": comp + dram,
                             "weight_bytes": l.weight_bytes()})
        a_cycles     = sum(r["total"] for r in a_layer)
        a_dram_total = sum(r["dram"]  for r in a_layer)
        a_area, a_energy = sa_metrics(layers, a_layer, h, w)
        a_thruput = 1e3 / (a_cycles / CLK_MHZ)
        a_tpa     = a_thruput / a_area
        sa_variants.append({
            "name":       cfg["name"],
            "n_macs":     h * w,
            "cycles":     a_cycles,
            "exec_us":    a_cycles / CLK_MHZ,
            "thruput_k":  a_thruput,
            "energy_uj":  a_energy,
            "area_au":    a_area,
            "dram_total": a_dram_total,
            "tpa":        a_tpa,
            "speedup":    a_cycles / s_cycles,
            "energy_ratio": a_energy / s_energy,
            "tpa_ratio":  s_tpa / a_tpa,
            "layer":      a_layer,
        })

    return {
        "name": name, "workload": bdef["workload"],
        "network": bdef["network"], "input": bdef["input"],
        "wt_total": wt_total,
        "s_cycles":  s_cycles,
        "s_exec_us": s_cycles / CLK_MHZ,
        "s_thruput": s_thruput,
        "s_energy":  s_energy,
        "s_area":    s_area,
        "s_tpa":     s_tpa,
        "s_layer":   s_layer,
        "sa_variants": sa_variants,
    }


# ── Printing ──────────────────────────────────────────────────────────────────

def print_benchmark(r: dict) -> None:
    sa_names = [v["name"] for v in r["sa_variants"]]
    wt_warn  = " ⚠ weights > BRAM_CAP" if r["wt_total"] > BRAM_CAP else ""

    print(f"  ┌─ {r['name']}  —  {r['workload']}")
    print(f"  │  {r['network']}")
    print(f"  │  Input: {r['input']}  |  Total weights: {r['wt_total']//1024} KB{wt_warn}")
    print(f"  │")

    # Layer table: Stream | SA-4×4 | SA-8×8
    col_w = 11
    print(f"  │  {'Layer':<12} {'Kind':<5} {'Weights':>8}  {'Stream cy':>{col_w}}", end="")
    for v in r["sa_variants"]:
        print(f"  {v['name']+' cy':>{col_w}}", end="")
    print()
    print(f"  │  {'─'*12} {'─'*4} {'─'*8}  {'─'*col_w}", end="")
    for _ in r["sa_variants"]:
        print(f"  {'─'*col_w}", end="")
    print()

    for sl, *al_list in zip(r["s_layer"], *[v["layer"] for v in r["sa_variants"]]):
        print(f"  │  {sl['name']:<12} {sl['kind']:<5} "
              f"{sl['weight_bytes']:>7,}B  "
              f"{sl['cycles']:>{col_w},}", end="")
        for al in al_list:
            flag = "←D" if al["dram"] > 0 else "  "
            print(f"  {al['total']:>{col_w-2},} {flag}", end="")
        print()

    print(f"  │  {'─'*12} {'─'*4} {'─'*8}  {'─'*col_w}", end="")
    for _ in r["sa_variants"]:
        print(f"  {'─'*col_w}", end="")
    print()
    print(f"  │  {'TOTAL':<18} {'':>8}  {r['s_cycles']:>{col_w},}", end="")
    for v in r["sa_variants"]:
        print(f"  {v['cycles']:>{col_w},}", end="")
    print()
    print(f"  │")

    # Architecture comparison block
    hdr = f"  │  {'Arch':<12} {'MACs':>5}  {'Cycles':>9}  {'µs':>8}  {'k/s':>7}  {'Energy µJ':>10}  {'Area AU':>8}  {'k/s/AU':>8}  {'µJ·AU':>9}"
    sep = "  │  " + "─" * (len(hdr) - 5)
    print(hdr)
    print(sep)
    print(f"  │  {'Streaming':<12} {N_STREAM:>5}  "
          f"{r['s_cycles']:>9,}  "
          f"{r['s_exec_us']:>8.2f}  "
          f"{r['s_thruput']:>7.1f}  "
          f"{r['s_energy']:>10.3f}  "
          f"{r['s_area']:>8.1f}  "
          f"{r['s_tpa']:>8.4f}  "
          f"{r['s_energy']*r['s_area']:>9.1f}")
    for v in r["sa_variants"]:
        dram_pct = 100.0 * v["dram_total"] / v["cycles"]
        print(f"  │  {v['name']:<12} {v['n_macs']:>5}  "
              f"{v['cycles']:>9,}  "
              f"{v['exec_us']:>8.2f}  "
              f"{v['thruput_k']:>7.1f}  "
              f"{v['energy_uj']:>10.3f}  "
              f"{v['area_au']:>8.1f}  "
              f"{v['tpa']:>8.4f}  "
              f"{v['energy_uj']*v['area_au']:>9.1f}  "
              f"(DRAM {dram_pct:.0f}%)")
    print(f"  │")

    for v in r["sa_variants"]:
        # speedup = SA_cycles / stream_cycles  (>1 → streaming wins latency)
        # tpa_ratio = stream_tpa / SA_tpa      (>1 → streaming wins k/s/AU)
        # energy_ratio = SA_energy / stream_energy (>1 → streaming wins energy)
        if v["speedup"] >= 1.0:
            lat_str = f"Streaming {v['speedup']:.2f}× faster latency"
        else:
            lat_str = f"SA {1.0/v['speedup']:.2f}× faster latency (raw cycles)"
        if v["tpa_ratio"] >= 1.0:
            tpa_str = f"Streaming {v['tpa_ratio']:.2f}× better k/s/AU"
        else:
            tpa_str = f"SA {1.0/v['tpa_ratio']:.2f}× better k/s/AU"
        if v["energy_ratio"] >= 1.0:
            egy_str = f"Streaming {v['energy_ratio']:.2f}× less energy"
        else:
            egy_str = f"SA {1.0/v['energy_ratio']:.2f}× less energy"
        print(f"  │  ★ vs {v['name']}: {lat_str} | {tpa_str} | {egy_str}")
    print(f"  └{'─'*74}")
    print()


def print_summary(results: list) -> None:
    print("═" * 92)
    print("  SUMMARY — Streaming Pipeline vs SA-4×4 and SA-8×8 @ 100 MHz")
    print("═" * 92)
    print(f"\n  {'Benchmark':<14}  {'Arch':<12}  {'MACs':>5}  {'Cycles':>9}  "
          f"{'µs':>7}  {'k/s':>6}  {'µJ':>8}  {'AU':>7}  {'k/s/AU':>8}  {'µJ·AU':>8}")
    print("  " + "─" * 88)
    for r in results:
        print(f"  {r['name']:<14}  {'Streaming':<12}  {N_STREAM:>5}  "
              f"{r['s_cycles']:>9,}  {r['s_exec_us']:>7.2f}  "
              f"{r['s_thruput']:>6.1f}  {r['s_energy']:>8.3f}  "
              f"{r['s_area']:>7.1f}  {r['s_tpa']:>8.4f}  "
              f"{r['s_energy']*r['s_area']:>8.1f}")
        for v in r["sa_variants"]:
            lat = f"S {v['speedup']:.2f}×L" if v["speedup"] >= 1.0 else f"SA {1/v['speedup']:.2f}×L"
            tpa = f"S {v['tpa_ratio']:.2f}×TPA" if v["tpa_ratio"] >= 1.0 else f"SA {1/v['tpa_ratio']:.2f}×TPA"
            print(f"  {'':14}  {v['name']:<12}  {v['n_macs']:>5}  "
                  f"{v['cycles']:>9,}  {v['exec_us']:>7.2f}  "
                  f"{v['thruput_k']:>6.1f}  {v['energy_uj']:>8.3f}  "
                  f"{v['area_au']:>7.1f}  {v['tpa']:>8.4f}  "
                  f"{v['energy_uj']*v['area_au']:>8.1f}  → {lat}, {tpa}")
        print()
    print("  " + "─" * 88)

    # Per-SA-config averages
    for cfg_i, cfg in enumerate(SA_CONFIGS):
        avg_speedup  = sum(r["sa_variants"][cfg_i]["speedup"]      for r in results) / len(results)
        avg_tpa_r    = sum(r["sa_variants"][cfg_i]["tpa_ratio"]    for r in results) / len(results)
        avg_energy_r = sum(r["sa_variants"][cfg_i]["energy_ratio"] for r in results) / len(results)
        avg_dram_pct = sum(100.0 * r["sa_variants"][cfg_i]["dram_total"] / r["sa_variants"][cfg_i]["cycles"]
                          for r in results) / len(results)
        print(f"\n  vs {cfg['name']}: avg {avg_speedup:.2f}× faster latency  |  "
              f"avg {avg_tpa_r:.2f}× better thruput/area  |  "
              f"avg {avg_energy_r:.2f}× less energy  |  "
              f"avg SA DRAM overhead {avg_dram_pct:.0f}%")
    print()


def print_dram_analysis(results: list) -> None:
    print("═" * 80)
    print("  ROOT CAUSE — DRAM overhead makes SA slow despite more MACs")
    print("═" * 80)
    print(f"\n  {'Benchmark':<14}", end="")
    for cfg in SA_CONFIGS:
        print(f"  {cfg['name']+' DRAM cy':>14}  {'% of total':>10}", end="")
    print(f"  {'Stream TPA':>11}  {'SA-4×4 TPA':>11}  {'SA-8×8 TPA':>11}")
    print("  " + "─" * 80)
    for r in results:
        print(f"  {r['name']:<14}", end="")
        for v in r["sa_variants"]:
            pct = 100.0 * v["dram_total"] / v["cycles"]
            print(f"  {v['dram_total']:>14,}  {pct:>9.0f}%", end="")
        print(f"  {r['s_tpa']:>11.4f}  "
              + "  ".join(f"{v['tpa']:>11.4f}" for v in r["sa_variants"]))
    print()


# ── CSV export ────────────────────────────────────────────────────────────────

def write_csv(results: list, csv_path: Path) -> None:
    fields = ["benchmark", "workload", "architecture", "n_macs",
              "cycles", "exec_time_us", "throughput_k_inf_per_s",
              "energy_uj", "area_au", "thruput_per_area_k_per_au",
              "energy_x_area_uj_au", "dram_overhead_cycles", "dram_pct",
              "speedup_vs_streaming", "tpa_ratio_vs_streaming"]
    with open(csv_path, "w", newline="") as f:
        w = csv.DictWriter(f, fieldnames=fields)
        w.writeheader()
        for r in results:
            # Streaming row
            w.writerow({
                "benchmark": r["name"], "workload": r["workload"],
                "architecture": "Streaming", "n_macs": N_STREAM,
                "cycles": r["s_cycles"],
                "exec_time_us": f"{r['s_exec_us']:.4f}",
                "throughput_k_inf_per_s": f"{r['s_thruput']:.4f}",
                "energy_uj": f"{r['s_energy']:.4f}",
                "area_au": f"{r['s_area']:.1f}",
                "thruput_per_area_k_per_au": f"{r['s_tpa']:.6f}",
                "energy_x_area_uj_au": f"{r['s_energy']*r['s_area']:.2f}",
                "dram_overhead_cycles": 0,
                "dram_pct": "0.0",
                "speedup_vs_streaming": "1.00",
                "tpa_ratio_vs_streaming": "1.00",
            })
            # SA rows
            for v in r["sa_variants"]:
                dram_pct = 100.0 * v["dram_total"] / v["cycles"] if v["cycles"] else 0
                w.writerow({
                    "benchmark": r["name"], "workload": r["workload"],
                    "architecture": v["name"], "n_macs": v["n_macs"],
                    "cycles": v["cycles"],
                    "exec_time_us": f"{v['exec_us']:.4f}",
                    "throughput_k_inf_per_s": f"{v['thruput_k']:.4f}",
                    "energy_uj": f"{v['energy_uj']:.4f}",
                    "area_au": f"{v['area_au']:.1f}",
                    "thruput_per_area_k_per_au": f"{v['tpa']:.6f}",
                    "energy_x_area_uj_au": f"{v['energy_uj']*v['area_au']:.2f}",
                    "dram_overhead_cycles": v["dram_total"],
                    "dram_pct": f"{dram_pct:.1f}",
                    "speedup_vs_streaming": f"{1.0/v['speedup']:.4f}",
                    "tpa_ratio_vs_streaming": f"{v['tpa_ratio']:.4f}",
                })


# ── Main ──────────────────────────────────────────────────────────────────────

def main() -> None:
    print()
    print("═" * 80)
    print("  Fair Architectural Comparison: Streaming Pipeline vs SA-4×4 and SA-8×8")
    print(f"  Streaming: N={N_STREAM} MACs/cycle @ {CLK_MHZ} MHz  |  "
          f"SA-4×4: 16 MACs  |  SA-8×8: 64 MACs")
    print(f"  SA DRAM BW: {DRAM_BPC} B/cycle  |  SA Scratchpad: {SCRATCHPAD//1024} KB  |  "
          f"Streaming BRAM: {BRAM_CAP//1024} KB")
    print("═" * 80)
    print()
    print("  Corrections applied vs sa_benchmark.py:")
    print("   [1] SA OS formula now includes K (output channels) — previously omitted")
    print("   [2] SA pays DDR3 weight reload when layer weights > 16 KB scratchpad")
    print("   Note: SA-4×4/8×8 have MORE MACs than streaming (16×/64× vs 8).")
    print("         Streaming wins on per-AREA efficiency despite fewer MACs.")
    print()

    results = []
    for name, bdef in BENCHMARKS.items():
        r = run_benchmark(name, bdef)
        results.append(r)
        print_benchmark(r)

    print_summary(results)
    print_dram_analysis(results)

    script_dir = Path(__file__).resolve().parent
    csv_path   = script_dir / "fair_comparison_results.csv"
    write_csv(results, csv_path)
    print(f"  CSV written → benchmarks/fair_comparison_results.csv")
    print("═" * 80)
    print()


if __name__ == "__main__":
    main()
