#!/usr/bin/env python3
"""
benchmarks/perf_report.py  —  IoT DNN Accelerator Performance Report

Runs each compiled benchmark simulation, parses actual inference latency,
reads area/power estimates from config headers, and computes:

  Metric              Formula
  ──────────────────────────────────────────────────────
  Execution time      cycles / f_clk               (µs)
  Throughput          1 / exec_time                (inf/s)
  Energy/inference    power_mW × exec_time_s       (µJ)
  Area efficiency     throughput / area_AU          (inf/s/AU)

Platform: ZedBoard XC7Z020-1CLG484  @100 MHz

Usage:
    python3 benchmarks/perf_report.py           # from project root
    python3 perf_report.py                      # from benchmarks/
    make bench-report                           # via Makefile
"""

import subprocess
import re
import csv
import sys
from pathlib import Path

# ── Configuration ────────────────────────────────────────────────────────────

CLK_MHZ = 100  # ZedBoard target clock

BENCHMARKS = [
    {
        "name":     "ECG-Net",
        "dir":      "ecg",
        "vvp":      "tb_ecg.vvp",
        "cfg":      "dnn_config_ecg.vh",
        "workload": "Cardiac Anomaly Detection",
        "network":  "CONV(3×3,1→8)→POOL→POOL→FC(24→2)",
        "input":    "128-sample ECG → 16×8",
    },
    {
        "name":     "GestureNet",
        "dir":      "gesture",
        "vvp":      "tb_gesture.vvp",
        "cfg":      "dnn_config_gesture.vh",
        "workload": "IMU Gesture Recognition",
        "network":  "CONV(3×3,1→4)→POOL→POOL→FC(28→5)",
        "input":    "6-axis × 32 timesteps",
    },
    {
        "name":     "KWS-CNN",
        "dir":      "kws",
        "vvp":      "tb_kws.vvp",
        "cfg":      "dnn_config_kws.vh",
        "workload": "Keyword Spotting",
        "network":  "CONV(3×3,1→8)→POOL→POOL→FC(80→10)",
        "input":    "25×10 MFCC",
    },
    {
        "name":     "YOLO-Nano",
        "dir":      "yolo_nano",
        "vvp":      "tb_yolo_nano.vvp",
        "cfg":      "dnn_config_yolo_nano.vh",
        "workload": "Object Detection",
        "network":  "CONV(3×3,1→4)→POOL→POOL→FC(36→20)",
        "input":    "16×16 grayscale → 2×2 grid",
    },
    {
        "name":     "VWW-Tiny",
        "dir":      "vww",
        "vvp":      "tb_vww.vvp",
        "cfg":      "dnn_config_vww.vh",
        "workload": "Visual Wake Words",
        "network":  "CONV(3×3,1→8)→POOL→CONV(3×3,8→16)→POOL",
        "input":    "24×24 grayscale",
    },
]

# ── Helpers ──────────────────────────────────────────────────────────────────

def parse_config_header(cfg_path: Path):
    """Return (area_au: float, power_mw: float) from a dnn_config_*.vh file."""
    area_au = power_mw = None
    text = cfg_path.read_text()
    m = re.search(r'`define\s+DNN_EST_AREA_INTx10\s+(\d+)', text)
    if m:
        area_au = int(m.group(1)) / 10.0
    m = re.search(r'`define\s+DNN_EST_POWER_MWx10\s+(\d+)', text)
    if m:
        power_mw = int(m.group(1)) / 10.0
    return area_au, power_mw


def run_vvp(bench_dir: Path, vvp_file: str) -> str:
    """Run vvp and return combined stdout+stderr."""
    r = subprocess.run(
        ["vvp", vvp_file],
        cwd=bench_dir,
        capture_output=True,
        text=True,
        timeout=300,
        encoding="utf-8",
        errors="replace",
    )
    return r.stdout + r.stderr


def extract_latency(sim_out: str):
    """Parse 'Latency ... : <N> cycles' from simulation output."""
    m = re.search(r'Latency\s*[^:]*:\s*(\d+)\s*cycles', sim_out)
    return int(m.group(1)) if m else None


def extract_pass_fail(sim_out: str):
    """Return (pass_count, total_count) from '  N/M PASS' line."""
    m = re.search(r'(\d+)/(\d+)\s+(?:checks\s+)?PASS', sim_out)
    return (int(m.group(1)), int(m.group(2))) if m else (None, None)


# ── Main ─────────────────────────────────────────────────────────────────────

def main():
    # Resolve benchmark root regardless of cwd
    script_dir = Path(__file__).resolve().parent

    print()
    print("═" * 74)
    print("  IoT DNN Accelerator — Performance Benchmark Report")
    print("  Platform : ZedBoard XC7Z020-1CLG484  @100 MHz")
    print("  Q-format : activations Q8.8, weights Q4.12, shift >>20")
    print("═" * 74)

    results = []
    missing = []

    for b in BENCHMARKS:
        bench_dir = script_dir / b["dir"]
        vvp_path  = bench_dir / b["vvp"]
        cfg_path  = bench_dir / b["cfg"]

        if not vvp_path.exists():
            missing.append(b["name"])
            print(f"\n  [{b['name']}]  ⚠  {b['vvp']} not found — run 'make bench-all' first")
            continue

        print(f"\n  [{b['name']}]  {b['workload']}")
        print(f"     Network  : {b['network']}")
        print(f"     Input    : {b['input']}")

        # Static estimates from config header
        area_au, power_mw = parse_config_header(cfg_path)

        # Actual latency from simulation
        sim_out = run_vvp(bench_dir, b["vvp"])
        cycles  = extract_latency(sim_out)
        passed, total = extract_pass_fail(sim_out)

        if cycles is None:
            print("     ERROR: could not parse latency from simulation output")
            continue

        # Derived metrics
        exec_us      = cycles / CLK_MHZ                  # µs
        throughput   = 1e6 / exec_us                      # inf/s
        energy_uj    = (power_mw / 1000.0) * (exec_us / 1e6) * 1e6  # µJ
        area_eff     = throughput / area_au if area_au else None

        status = f"{passed}/{total} PASS" if passed is not None else "?"
        print(f"     TB result: {status}")
        print(f"     Latency  : {cycles:,} cycles  = {exec_us:.2f} µs  @{CLK_MHZ} MHz")
        print(f"     Throughput: {throughput:,.1f} inf/s  ({throughput/1000:.1f} k inf/s)")
        print(f"     Energy   : {energy_uj:.3f} µJ / inference")
        print(f"     Area     : {area_au:.1f} AU   |   Power: {power_mw:.0f} mW")
        if area_eff:
            print(f"     Efficiency: {area_eff:.0f} (inf/s)/AU")

        results.append({
            "name":       b["name"],
            "workload":   b["workload"],
            "network":    b["network"],
            "input":      b["input"],
            "cycles":     cycles,
            "exec_us":    exec_us,
            "throughput": throughput,
            "energy_uj":  energy_uj,
            "power_mw":   power_mw,
            "area_au":    area_au,
            "area_eff":   area_eff,
            "tb_status":  status,
        })

    if not results:
        print("\n  No results. Run 'make bench-all' to compile and simulate first.\n")
        sys.exit(1)

    # ── Summary table ─────────────────────────────────────────────────────────
    print()
    print("═" * 74)
    print("  PERFORMANCE SUMMARY  (sorted by throughput ↓)")
    print("═" * 74)
    results_sorted = sorted(results, key=lambda r: r["throughput"], reverse=True)

    hdr = (f"  {'Benchmark':<13}"
           f"  {'Cycles':>8}"
           f"  {'Time(µs)':>9}"
           f"  {'Thruput(k/s)':>13}"
           f"  {'Energy(µJ)':>11}"
           f"  {'Area(AU)':>9}"
           f"  {'Pwr(mW)':>8}")
    print(hdr)
    print("  " + "─" * 70)
    for r in results_sorted:
        print(f"  {r['name']:<13}"
              f"  {r['cycles']:>8,}"
              f"  {r['exec_us']:>9.2f}"
              f"  {r['throughput']/1000:>13.1f}"
              f"  {r['energy_uj']:>11.3f}"
              f"  {r['area_au']:>9.1f}"
              f"  {r['power_mw']:>8.0f}")
    print("  " + "─" * 70)

    # ── Derived rankings ──────────────────────────────────────────────────────
    best_tput   = max(results, key=lambda r: r["throughput"])
    best_energy = min(results, key=lambda r: r["energy_uj"])
    best_area   = min(results, key=lambda r: r["area_au"])
    best_eff    = max(results, key=lambda r: r["area_eff"] or 0)

    print(f"\n  ★ Highest throughput   : {best_tput['name']:<12}"
          f"  {best_tput['throughput']/1000:.1f} k inf/s")
    print(f"  ★ Lowest energy/inf    : {best_energy['name']:<12}"
          f"  {best_energy['energy_uj']:.3f} µJ")
    print(f"  ★ Smallest footprint   : {best_area['name']:<12}"
          f"  {best_area['area_au']:.1f} AU")
    print(f"  ★ Best area efficiency : {best_eff['name']:<12}"
          f"  {best_eff['area_eff']:.0f} (inf/s)/AU")

    # ── Area-energy Pareto ────────────────────────────────────────────────────
    print()
    print("  AREA vs ENERGY TRADE-OFF")
    print("  " + "─" * 42)
    print(f"  {'Benchmark':<13}  {'Area(AU)':>8}  {'Energy(µJ)':>11}  {'Eff(inf/s/AU)':>13}")
    print("  " + "─" * 42)
    for r in sorted(results, key=lambda r: r["area_au"]):
        print(f"  {r['name']:<13}  {r['area_au']:>8.1f}  {r['energy_uj']:>11.3f}"
              f"  {r['area_eff']:>13.0f}")

    # ── CSV export ────────────────────────────────────────────────────────────
    csv_path = script_dir / "perf_results.csv"
    fields = ["benchmark", "workload", "network", "input_shape",
              "cycles", "exec_time_us", "throughput_k_inf_per_s",
              "energy_uj", "power_mw", "area_au", "area_efficiency_inf_s_au",
              "tb_status"]
    with open(csv_path, "w", newline="") as f:
        w = csv.DictWriter(f, fieldnames=fields)
        w.writeheader()
        for r in results:
            w.writerow({
                "benchmark":                  r["name"],
                "workload":                   r["workload"],
                "network":                    r["network"],
                "input_shape":                r["input"],
                "cycles":                     r["cycles"],
                "exec_time_us":               f"{r['exec_us']:.4f}",
                "throughput_k_inf_per_s":     f"{r['throughput']/1000:.4f}",
                "energy_uj":                  f"{r['energy_uj']:.4f}",
                "power_mw":                   f"{r['power_mw']:.1f}",
                "area_au":                    f"{r['area_au']:.1f}",
                "area_efficiency_inf_s_au":   f"{r['area_eff']:.2f}" if r["area_eff"] else "",
                "tb_status":                  r["tb_status"],
            })

    print(f"\n  CSV written → benchmarks/perf_results.csv")
    print("═" * 74)
    print()

    if missing:
        print(f"  Skipped (not compiled): {', '.join(missing)}")
        print(f"  Run 'make bench-all' then 'make bench-report'\n")


if __name__ == "__main__":
    main()
