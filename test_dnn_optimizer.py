#!/usr/bin/env python3
# =============================================================================
# test_dnn_optimizer.py
#
# Unit tests for the optimizer's formulation.  These don't run RTL — they
# verify mathematical properties of the cost/cycle models and the solver:
#
#   1. Layer ops/storage counts match hand calculation
#   2. layer_cycles is monotonically non-increasing in N
#   3. layer_area / layer_power are monotonically non-decreasing in N
#   4. Solver respects the budget constraints (no feasible config violates them)
#   5. With infinite budget the optimum is full-throttle (max N, F=1)
#   6. With tight budget the optimum tightens N (folding kicks in)
#   7. Pareto-front extraction is correct
#   8. Verilog header emits all required defines and parses
#
# Run:  python3 test_dnn_optimizer.py
# =============================================================================

import re
import sys
import tempfile
from pathlib import Path
from dnn_optimizer import (
    Layer, HwModel, evaluate, solve, pareto_front,
    emit_verilog_header, lenet5, tiny_vgg, make_balanced_schedule,
)


# -----------------------------------------------------------------------------
# Tiny test harness — no external deps
# -----------------------------------------------------------------------------
PASS = 0
FAIL = 0

def check(name: str, ok: bool, detail: str = "") -> None:
    global PASS, FAIL
    if ok:
        PASS += 1
        print(f"  PASS  {name}")
    else:
        FAIL += 1
        print(f"  FAIL  {name}  ({detail})")


# -----------------------------------------------------------------------------
# 1. Layer arithmetic
# -----------------------------------------------------------------------------
def test_layer_arithmetic():
    print("\n[1] Layer arithmetic")
    # LeNet conv1: 28×28×1 → 24×24×6 via 5×5 kernel
    l = Layer("conv1", "conv", 28, 28, 1, 6, k=5)
    check("conv1 out_h", l.out_h() == 24, f"got {l.out_h()}")
    check("conv1 out_w", l.out_w() == 24, f"got {l.out_w()}")
    # ops = 24*24*6*1*5*5 = 86400
    check("conv1 ops",  l.ops() == 86400, f"got {l.ops()}")
    # weights = 5*5*1*6 = 150
    check("conv1 weights", l.num_weights() == 150)
    # in act = 28*28*1 = 784
    check("conv1 in_act",  l.num_activations_in() == 784)
    # out act = 24*24*6 = 3456
    check("conv1 out_act", l.num_activations_out() == 3456)

    # Pool 2×2 stride 2: 24×24×6 → 12×12×6
    p = Layer("pool1", "pool", 24, 24, 6, 6, k=2, stride=2)
    check("pool1 out_h", p.out_h() == 12)
    check("pool1 out_w", p.out_w() == 12)
    check("pool1 no weights", p.num_weights() == 0)


# -----------------------------------------------------------------------------
# 2 & 3. Monotonicity of the models
# -----------------------------------------------------------------------------
def test_monotonicity():
    print("\n[2,3] Cycle and area/power monotonicity in N")
    m = HwModel()
    l = Layer("c", "conv", 28, 28, 1, 6, k=5)
    cycles = [m.layer_cycles(l, n) for n in (2, 4, 8, 16, 32)]
    check("cycles non-increasing in N",
          all(cycles[i] >= cycles[i+1] for i in range(len(cycles)-1)),
          f"got {cycles}")
    areas = [m.layer_area(l, n) for n in (2, 4, 8, 16, 32)]
    check("area non-decreasing in N",
          all(areas[i] <= areas[i+1] for i in range(len(areas)-1)),
          f"got {areas}")
    powers = [m.layer_power(l, n) for n in (2, 4, 8, 16, 32)]
    check("power non-decreasing in N",
          all(powers[i] <= powers[i+1] for i in range(len(powers)-1)),
          f"got {powers}")


# -----------------------------------------------------------------------------
# 4. Feasibility / budget respect
# -----------------------------------------------------------------------------
def test_feasibility():
    print("\n[4] All returned configs respect budgets")
    m = HwModel()
    _, dnn = lenet5()
    best, pool = solve(m, dnn, A_budget=150, P_budget=1500,
                       objective="latency", verbose=False)
    check("best is feasible (area)",  best.area  <= 150)
    check("best is feasible (power)", best.power <= 1500)
    check("all pool entries feasible (area)",
          all(c.area <= 150 for c in pool))
    check("all pool entries feasible (power)",
          all(c.power <= 1500 for c in pool))


# -----------------------------------------------------------------------------
# 5. Infinite-budget regime → maximum width chosen
# -----------------------------------------------------------------------------
def test_infinite_budget():
    print("\n[5] Infinite budget → max width selected")
    m = HwModel()
    _, dnn = lenet5()
    best, _ = solve(m, dnn, A_budget=1e9, P_budget=1e9,
                    objective="latency")
    # The fastest config uses N=32 (max) on the dominant compute layer.
    # With F=1 folding, the shared stage uses max(N_i) = 32 anyway.
    stage_widths = [max(best.n_per_layer[i] for i in g)
                    for g in best.schedule.groups]
    check("max stage width == 32",
          max(stage_widths) == 32,
          f"got stage_widths={stage_widths}")


# -----------------------------------------------------------------------------
# 6. Tight budget → either folding or width reduction
# -----------------------------------------------------------------------------
def test_tight_budget():
    print("\n[6] Tight budget forces width/folding trade-off")
    m = HwModel()
    _, dnn = lenet5()
    # Pick a budget so tight that N=32 with no folding is infeasible
    best_tight,  _ = solve(m, dnn, A_budget=80,  P_budget=10_000, objective="latency")
    best_loose,  _ = solve(m, dnn, A_budget=300, P_budget=10_000, objective="latency")
    check("tight budget yields ≤ area than loose",
          best_tight.area <= best_loose.area + 1e-6,
          f"tight={best_tight.area}, loose={best_loose.area}")
    check("tight budget yields ≥ latency than loose",
          best_tight.latency_cycles >= best_loose.latency_cycles,
          f"tight={best_tight.latency_cycles}, loose={best_loose.latency_cycles}")


# -----------------------------------------------------------------------------
# 7. Pareto-front correctness
# -----------------------------------------------------------------------------
def test_pareto():
    print("\n[7] Pareto front is non-dominated")
    m = HwModel()
    _, dnn = lenet5()
    _, pool = solve(m, dnn, A_budget=200, P_budget=2000, objective="latency")
    front = pareto_front(pool)
    # Every front point must NOT be dominated by any other front point
    ok = True
    for a in front:
        for b in front:
            if a is b: continue
            if (b.latency_cycles <= a.latency_cycles and
                b.area          <= a.area          and
                b.power         <= a.power         and
                (b.latency_cycles < a.latency_cycles or
                 b.area          < a.area          or
                 b.power         < a.power)):
                ok = False
                break
        if not ok: break
    check("front internally non-dominated", ok)
    # And every pool point dominated by some front point (or on front)
    front_set = {id(c) for c in front}
    coverage_ok = True
    for c in pool:
        if id(c) in front_set: continue
        dominated_by_front = any(
            (f.latency_cycles <= c.latency_cycles and
             f.area          <= c.area          and
             f.power         <= c.power) and
            (f.latency_cycles <  c.latency_cycles or
             f.area          <  c.area          or
             f.power         <  c.power)
            for f in front
        )
        if not dominated_by_front:
            coverage_ok = False
            break
    check("pool fully covered by front", coverage_ok)


# -----------------------------------------------------------------------------
# 8. Verilog header parses & contains every required define
# -----------------------------------------------------------------------------
def test_verilog_emission():
    print("\n[8] Verilog header emission")
    m = HwModel()
    name, dnn = lenet5()
    best, _ = solve(m, dnn, A_budget=200, P_budget=2000, objective="latency")
    with tempfile.NamedTemporaryFile(mode="w", suffix=".vh", delete=False) as f:
        path = Path(f.name)
    emit_verilog_header(path, best, name, "latency", 200, 2000)
    txt = path.read_text()
    required = [
        r"`define DNN_NUM_LAYERS\s+4",
        r"`define DNN_FOLD_FACTOR\s+\d+",
        r"`define DNN_NUM_STAGES\s+\d+",
        r"`define DNN_LAYER0_N\s+\d+",
        r"`define DNN_LAYER1_N\s+\d+",
        r"`define DNN_LAYER2_N\s+\d+",
        r"`define DNN_LAYER3_N\s+\d+",
        r"`define DNN_STAGE0_N\s+\d+",
        r"`define DNN_STAGE0_LAYER_MASK\s+'b[01]+",
        r"`define DNN_EST_LATENCY_CYCLES\s+\d+",
        r"`define DNN_EST_AREA_INTx10\s+\d+",
        r"`define DNN_EST_POWER_MWx10\s+\d+",
        r"`ifndef DNN_CONFIG_VH",
        r"`endif",
    ]
    all_found = True
    for rx in required:
        if not re.search(rx, txt):
            all_found = False
            print(f"    missing: {rx}")
    check("all required defines present", all_found)
    path.unlink()


# -----------------------------------------------------------------------------
# 9. Schedule validity
# -----------------------------------------------------------------------------
def test_schedule():
    print("\n[9] Schedule construction")
    s = make_balanced_schedule(4, 1)
    check("F=1: all layers in stage 0", s.groups == [[0, 1, 2, 3]])
    s = make_balanced_schedule(4, 2)
    check("F=2: layers split 2/2",
          s.groups == [[0, 1], [2, 3]],
          f"got {s.groups}")
    s = make_balanced_schedule(4, 4)
    check("F=4: one layer per stage",
          s.groups == [[0], [1], [2], [3]],
          f"got {s.groups}")
    s = make_balanced_schedule(4, 8)
    check("F>L gets capped to L",
          len(s.groups) == 4 and sum(len(g) for g in s.groups) == 4)


# -----------------------------------------------------------------------------
# 10. Cross-check: cycle estimate equals manual compute for a known case
# -----------------------------------------------------------------------------
def test_cycle_estimate():
    print("\n[10] Cycle estimate matches manual calculation")
    m = HwModel(fill_cycles_per_layer=10)
    l = Layer("c", "conv", 4, 4, 1, 1, k=3)   # out 2x2x1, ops = 2*2*1*1*3*3 = 36
    check("ops=36",  l.ops() == 36)
    check("cycles N=4  = ceil(36/4)+10 = 19",
          m.layer_cycles(l, 4) == 19, f"got {m.layer_cycles(l, 4)}")
    check("cycles N=8  = ceil(36/8)+10 = 15",
          m.layer_cycles(l, 8) == 15, f"got {m.layer_cycles(l, 8)}")
    check("cycles N=32 = ceil(36/32)+10 = 12",
          m.layer_cycles(l, 32) == 12, f"got {m.layer_cycles(l, 32)}")


# -----------------------------------------------------------------------------
def main() -> int:
    print("=" * 60)
    print("DNN Optimizer Unit Tests")
    print("=" * 60)
    test_layer_arithmetic()
    test_monotonicity()
    test_feasibility()
    test_infinite_budget()
    test_tight_budget()
    test_pareto()
    test_verilog_emission()
    test_schedule()
    test_cycle_estimate()
    print("=" * 60)
    print(f"  {PASS} passed, {FAIL} failed")
    print("=" * 60)
    return 0 if FAIL == 0 else 1


if __name__ == "__main__":
    sys.exit(main())
