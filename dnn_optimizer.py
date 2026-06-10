#!/usr/bin/env python3
# =============================================================================
# dnn_optimizer.py
# -----------------------------------------------------------------------------
# Design-space exploration tool that decides:
#
#   (a) the MAC-array width  N_i  for each layer i of a DNN, and
#   (b) the pipeline folding factor F (= number of physical pipeline stages),
#
# subject to either an area or a power budget.
#
# It emits a Verilog header (dnn_config.vh) that the comprehensive testbench
# reads to instantiate the streaming_nn_system with the chosen parameters,
# plus a JSON report consumed by the same TB for cross-checking.
# =============================================================================

import argparse
import itertools
import json
import math
import sys
from dataclasses import dataclass, field, asdict
from pathlib import Path
from typing import List, Dict, Tuple, Optional


# -----------------------------------------------------------------------------
# 1. DNN description
# -----------------------------------------------------------------------------
@dataclass
class Layer:
    """A single DNN layer.

    op_type ∈ {"conv", "pool", "fc"}.  All sizes are integers.
    For pool layers k = pool_size, c_in = c_out = channels, no weights.
    """
    name: str
    op_type: str
    in_h: int
    in_w: int
    c_in: int
    c_out: int
    k: int        # kernel size (or pool window)
    stride: int = 1
    padding: int = 0

    # Derived
    def out_h(self) -> int:
        return (self.in_h + 2 * self.padding - self.k) // self.stride + 1

    def out_w(self) -> int:
        return (self.in_w + 2 * self.padding - self.k) // self.stride + 1

    def ops(self) -> int:
        """MAC ops for this layer (1 MAC = 1 mul + 1 add)."""
        if self.op_type == "conv":
            return self.out_h() * self.out_w() * self.c_out * self.c_in * self.k * self.k
        if self.op_type == "fc":
            return self.c_in * self.c_out
        # pool — comparisons only, model as O(out * k*k) "lite ops"
        return self.out_h() * self.out_w() * self.c_out * self.k * self.k // 4

    def num_weights(self) -> int:
        if self.op_type == "conv":
            return self.k * self.k * self.c_in * self.c_out
        if self.op_type == "fc":
            return self.c_in * self.c_out
        return 0

    def num_activations_in(self) -> int:
        return self.in_h * self.in_w * self.c_in

    def num_activations_out(self) -> int:
        return self.out_h() * self.out_w() * self.c_out


# -----------------------------------------------------------------------------
# 2. Cost & performance models
# -----------------------------------------------------------------------------
@dataclass
class HwModel:
    """Linear hardware cost / performance model.

    All units are *relative*; calibrate by setting a_mac / a_bram in the
    same units as A_budget.  Defaults reflect a small Xilinx 7-series FPGA
    style (one MAC ≈ 1 DSP + a few LUTs; one BRAM18 holds ~1024 16-bit words).
    """
    # Area (relative units, e.g. "DSP-equivalents")
    a_mac: float       = 1.0          # per MAC unit
    a_bram: float      = 4.0          # per BRAM block
    a_ctrl: float      = 8.0          # fixed cost per physical pipeline stage
    a_router: float    = 2.0          # per active interconnect port

    # Power (mW at f_clk; activity factor folded in)
    p_mac_dyn: float   = 0.6          # per MAC, per MHz, per activity (mW/MHz)
    p_bram_dyn: float  = 0.15         # per BRAM, per MHz
    p_static: float    = 25.0         # mW, fixed
    f_clk_MHz: float   = 200.0
    activity: float    = 0.35         # average toggle factor

    # Memory model
    bram_depth: int    = 1024         # words per BRAM
    bram_width: int    = 16           # bits per word

    # Allowed array widths (must match hardware-supported values)
    n_choices: Tuple[int, ...] = (2, 4, 8, 16, 32)

    # Pipeline fill / start-up overhead per stage (cycles)
    fill_cycles_per_layer: int = 32

    def bram_count(self, words_needed: int) -> int:
        return max(1, math.ceil(words_needed / self.bram_depth))

    # ------- per-layer costs -------
    def layer_area(self, layer: Layer, n: int) -> float:
        weights_bram = self.bram_count(layer.num_weights()) if layer.num_weights() else 0
        actbuf_bram  = self.bram_count(layer.num_activations_out())
        return (self.a_mac * n
                + self.a_bram * (weights_bram + actbuf_bram)
                + self.a_router)

    def layer_power(self, layer: Layer, n: int) -> float:
        weights_bram = self.bram_count(layer.num_weights()) if layer.num_weights() else 0
        actbuf_bram  = self.bram_count(layer.num_activations_out())
        bram_total = weights_bram + actbuf_bram
        return (self.p_mac_dyn * n * self.f_clk_MHz * self.activity
                + self.p_bram_dyn * bram_total * self.f_clk_MHz)

    def layer_cycles(self, layer: Layer, n: int) -> int:
        """Roofline-style cycle estimate.

        Each cycle the MAC array does N multiply-accumulates.  Add a
        fixed fill/startup so very-small layers don't run in 0 cycles.
        """
        return math.ceil(layer.ops() / n) + self.fill_cycles_per_layer


# -----------------------------------------------------------------------------
# 3. Folding model
# -----------------------------------------------------------------------------
@dataclass
class Schedule:
    """Maps DNN layers to F physical pipeline stages.

    With F = L (no folding), each layer gets its own stage.  With F < L,
    multiple layers share a stage and run time-multiplexed; the stage's
    physical width is the *max* of the widths of the layers it hosts.
    """
    F: int
    groups: List[List[int]]       # groups[j] = list of layer indices on stage j


def make_balanced_schedule(L: int, F: int) -> Schedule:
    """Contiguous grouping: stage j hosts layers [j*L/F .. (j+1)*L/F)."""
    F = max(1, min(F, L))
    groups = [[] for _ in range(F)]
    per = math.ceil(L / F)
    for i in range(L):
        groups[min(i // per, F - 1)].append(i)
    # drop empty stages (can happen if L < per * F)
    groups = [g for g in groups if g]
    return Schedule(F=len(groups), groups=groups)


# -----------------------------------------------------------------------------
# 4. Configuration evaluator
# -----------------------------------------------------------------------------
@dataclass
class Config:
    n_per_layer: List[int]
    F: int
    schedule: Schedule
    area: float
    power: float
    latency_cycles: int
    throughput_inv_cycles: float   # 1 / steady-state cycles-per-input
    feasible_area: bool
    feasible_power: bool

    def score(self) -> float:
        """Lower is better.  Primary: latency.  Tiebreak: area."""
        return self.latency_cycles + 1e-6 * self.area


def evaluate(model: HwModel, dnn: List[Layer], n_per_layer: List[int], F: int,
             A_budget: float, P_budget: float) -> Config:
    """Compute area, power, latency for a candidate (N_i, F) tuple."""
    L = len(dnn)
    sched = make_balanced_schedule(L, F)

    # ---- physical area: per stage, take the widest N hosted there ----
    total_area = 0.0
    total_power = 0.0
    # Cycles per stage = sum of layer cycles assigned to that stage (serial within stage)
    stage_cycles = []
    for grp in sched.groups:
        # stage uses N = max over its layers; layer area uses that shared N
        n_stage = max(n_per_layer[i] for i in grp)
        # area: control overhead per physical stage + per-layer storage + one MAC bank
        stage_a = model.a_ctrl + model.a_mac * n_stage
        stage_p = (model.p_mac_dyn * n_stage * model.f_clk_MHz * model.activity)
        stage_t = 0
        for i in grp:
            layer = dnn[i]
            # storage for this layer (weights+act buffer) lives on this stage
            weights_bram = model.bram_count(layer.num_weights()) if layer.num_weights() else 0
            actbuf_bram  = model.bram_count(layer.num_activations_out())
            stage_a += model.a_bram * (weights_bram + actbuf_bram) + model.a_router
            stage_p += model.p_bram_dyn * (weights_bram + actbuf_bram) * model.f_clk_MHz
            # cycles: layer ops divided by the *stage's* shared N
            stage_t += model.layer_cycles(layer, n_stage)
        stage_cycles.append(stage_t)
        total_area  += stage_a
        total_power += stage_p
    total_power += model.p_static

    # ---- latency model ----
    # With F physical stages and B "macro-batches" (= F passes), the pipeline
    # fills in (F-1)*max(stage_cycles), then each macro-batch costs max(stage_cycles).
    # For a single inference, layers go through all F stages sequentially in time,
    # so: latency = sum(stage_cycles)  (worst case for one input, no pipelining
    # because the input only has one inference's worth of data).
    # Throughput in steady state = 1 / max(stage_cycles).
    t_max = max(stage_cycles)
    latency = sum(stage_cycles)
    throughput = 1.0 / t_max if t_max > 0 else 0.0

    return Config(
        n_per_layer=list(n_per_layer),
        F=sched.F,
        schedule=sched,
        area=total_area,
        power=total_power,
        latency_cycles=latency,
        throughput_inv_cycles=throughput,
        feasible_area=(total_area  <= A_budget),
        feasible_power=(total_power <= P_budget),
    )


# -----------------------------------------------------------------------------
# 5. Solver — exhaustive search with branch-and-bound pruning
# -----------------------------------------------------------------------------
def solve(model: HwModel, dnn: List[Layer], A_budget: float, P_budget: float,
          objective: str = "latency", verbose: bool = False
          ) -> Tuple[Config, List[Config]]:
    """Exhaustive search over (N_i, F).

    The DNNs we target are small (4–10 layers), |n_choices| ≤ 8, F ≤ L,
    so the total search space is |N|^L * L  ≤  8^10 * 10 ≈ 1e10 worst case,
    but for the LeNet shapes used here it's a few thousand evaluations.
    Larger DNNs use the pruning below.
    """
    L = len(dnn)
    n_choices = model.n_choices

    # Cheap lower bound on area / power as a function of width assignments,
    # used to prune partial assignments.  Sum of minimum BRAM costs.
    bram_floor_area = sum(
        model.a_bram * (
            model.bram_count(l.num_weights()) if l.num_weights() else 0
        ) + model.a_bram * model.bram_count(l.num_activations_out())
        for l in dnn
    )

    best: Optional[Config] = None
    feasible_pool: List[Config] = []

    def obj(cfg: Config) -> float:
        if objective == "latency":
            return cfg.latency_cycles + 1e-9 * cfg.area
        if objective == "throughput":
            return -cfg.throughput_inv_cycles + 1e-9 * cfg.area
        if objective == "area":
            return cfg.area + 1e-9 * cfg.latency_cycles
        raise ValueError(f"unknown objective {objective!r}")

    # We bound F ∈ [1, L].  For each F we explore all width tuples.
    n_evals = 0
    for F in range(1, L + 1):
        # quick infeasibility check: with F stages, minimum area ≥ F*a_ctrl + bram_floor
        min_area_F = F * model.a_ctrl + bram_floor_area + L * model.a_router
        if min_area_F > A_budget:
            if verbose:
                print(f"[prune] F={F}: floor area {min_area_F:.1f} > budget {A_budget:.1f}")
            continue

        for widths in itertools.product(n_choices, repeat=L):
            n_evals += 1
            cfg = evaluate(model, dnn, list(widths), F, A_budget, P_budget)
            if cfg.feasible_area and cfg.feasible_power:
                feasible_pool.append(cfg)
                if best is None or obj(cfg) < obj(best):
                    best = cfg

    if verbose:
        print(f"[search] evaluated {n_evals} configurations, "
              f"{len(feasible_pool)} feasible")
    if best is None:
        raise RuntimeError("No feasible configuration found — relax budgets")
    return best, feasible_pool


# -----------------------------------------------------------------------------
# 6. Pareto frontier extraction (for reports)
# -----------------------------------------------------------------------------
def pareto_front(configs: List[Config]) -> List[Config]:
    """Configs that are not dominated in (latency, area, power)."""
    front = []
    for c in configs:
        dominated = False
        for d in configs:
            if d is c:
                continue
            if (d.latency_cycles <= c.latency_cycles and
                d.area          <= c.area          and
                d.power         <= c.power         and
                (d.latency_cycles < c.latency_cycles or
                 d.area          < c.area          or
                 d.power         < c.power)):
                dominated = True
                break
        if not dominated:
            front.append(c)
    front.sort(key=lambda c: c.latency_cycles)
    return front


# -----------------------------------------------------------------------------
# 7. Emit Verilog header that the comprehensive TB will include
# -----------------------------------------------------------------------------
HEADER_TEMPLATE = """\
// =========================================================================
// dnn_config.vh  --  AUTO-GENERATED by dnn_optimizer.py.  DO NOT EDIT.
//
// Generated for: {dnn_name}
// Objective    : {objective}
// Budgets      : area <= {A_budget}, power <= {P_budget} mW
//
// Optimum chosen:
//   per-layer N   = {n_list}
//   fold factor F = {F}
//   est. latency  = {latency} cycles
//   est. area     = {area:.1f}
//   est. power    = {power:.1f} mW
// =========================================================================
`ifndef DNN_CONFIG_VH
`define DNN_CONFIG_VH

`define DNN_NUM_LAYERS    {L}
`define DNN_FOLD_FACTOR   {F}
`define DNN_NUM_STAGES    {F_eff}

// Per-layer MAC array widths --------------------------------------------------
{n_defines}

// Per-physical-stage shared MAC width (= max over hosted layers) -------------
{stage_defines}

// Schedule: stage_layer_map[j] is a bitmask of layer indices hosted on stage j
{schedule_defines}

// Cost / performance estimates the TB will check against measurements --------
`define DNN_EST_LATENCY_CYCLES {latency}
`define DNN_EST_AREA_INTx10    {area_x10}
`define DNN_EST_POWER_MWx10    {power_x10}

`endif // DNN_CONFIG_VH
"""

def emit_verilog_header(path: Path, cfg: Config, dnn_name: str,
                        objective: str, A_budget: float, P_budget: float) -> None:
    L = len(cfg.n_per_layer)
    n_defines = "\n".join(
        f"`define DNN_LAYER{i}_N {n}" for i, n in enumerate(cfg.n_per_layer)
    )
    stage_widths = [max(cfg.n_per_layer[i] for i in g) for g in cfg.schedule.groups]
    stage_defines = "\n".join(
        f"`define DNN_STAGE{j}_N {w}" for j, w in enumerate(stage_widths)
    )
    schedule_defines = "\n".join(
        f"`define DNN_STAGE{j}_LAYER_MASK 'b{format(sum(1 << i for i in g), f'0{L}b')}"
        for j, g in enumerate(cfg.schedule.groups)
    )
    path.write_text(HEADER_TEMPLATE.format(
        dnn_name=dnn_name,
        objective=objective,
        A_budget=A_budget,
        P_budget=P_budget,
        n_list=cfg.n_per_layer,
        F=cfg.F,
        F_eff=len(cfg.schedule.groups),
        latency=cfg.latency_cycles,
        area=cfg.area,
        power=cfg.power,
        L=L,
        n_defines=n_defines,
        stage_defines=stage_defines,
        schedule_defines=schedule_defines,
        area_x10=int(cfg.area * 10),
        power_x10=int(cfg.power * 10),
    ))


# -----------------------------------------------------------------------------
# 8. Built-in DNN library
# -----------------------------------------------------------------------------
def lenet5() -> Tuple[str, List[Layer]]:
    layers = [
        Layer("conv1", "conv", 28, 28, 1,  6, k=5),
        Layer("pool1", "pool", 24, 24, 6,  6, k=2, stride=2),
        Layer("conv2", "conv", 12, 12, 6, 16, k=5),
        Layer("pool2", "pool",  8,  8, 16, 16, k=2, stride=2),
    ]
    return "LeNet5", layers


def tiny_vgg() -> Tuple[str, List[Layer]]:
    layers = [
        Layer("conv1", "conv", 32, 32, 3,  16, k=3, padding=1),
        Layer("conv2", "conv", 32, 32, 16, 16, k=3, padding=1),
        Layer("pool1", "pool", 32, 32, 16, 16, k=2, stride=2),
        Layer("conv3", "conv", 16, 16, 16, 32, k=3, padding=1),
        Layer("pool2", "pool", 16, 16, 32, 32, k=2, stride=2),
        Layer("fc1",   "fc",    1,  1, 32*8*8, 10, k=1),
    ]
    return "TinyVGG", layers


DNN_LIBRARY = {
    "lenet5":  lenet5,
    "tinyvgg": tiny_vgg,
}


# -----------------------------------------------------------------------------
# 9. CLI
# -----------------------------------------------------------------------------
def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--dnn", choices=list(DNN_LIBRARY), default="lenet5")
    ap.add_argument("--area-budget",  type=float, default=200.0,
                    help="Area budget in relative units")
    ap.add_argument("--power-budget", type=float, default=2000.0,
                    help="Power budget in mW")
    ap.add_argument("--objective", choices=["latency", "throughput", "area"],
                    default="latency")
    ap.add_argument("--out-header", default="dnn_config.vh",
                    help="Output Verilog header path")
    ap.add_argument("--out-json",   default="dnn_config.json",
                    help="Output JSON report (consumed by the TB)")
    ap.add_argument("--pareto",     action="store_true",
                    help="Print Pareto frontier")
    ap.add_argument("-v", "--verbose", action="store_true")
    args = ap.parse_args()

    dnn_name, dnn = DNN_LIBRARY[args.dnn]()
    model = HwModel()

    print(f"=== DNN: {dnn_name} ({len(dnn)} layers) ===")
    print(f"=== Objective: {args.objective} ===")
    print(f"=== Budgets: area ≤ {args.area_budget}, "
          f"power ≤ {args.power_budget} mW ===\n")

    best, pool = solve(model, dnn,
                       A_budget=args.area_budget,
                       P_budget=args.power_budget,
                       objective=args.objective,
                       verbose=args.verbose)

    print("Optimum:")
    print(f"  N per layer = {best.n_per_layer}")
    print(f"  fold F      = {best.F}")
    print(f"  schedule    = {best.schedule.groups}")
    print(f"  latency     = {best.latency_cycles} cycles")
    print(f"  throughput  = {best.throughput_inv_cycles:.6f} 1/cycle")
    print(f"  area        = {best.area:.2f}")
    print(f"  power       = {best.power:.2f} mW")

    if args.pareto:
        front = pareto_front(pool)
        print(f"\nPareto frontier ({len(front)} points):")
        print(f"{'latency':>10}  {'area':>8}  {'power':>8}  N_per_layer       F")
        for c in front:
            print(f"  {c.latency_cycles:8d}  {c.area:8.1f}  {c.power:8.1f}  "
                  f"{c.n_per_layer}  F={c.F}")

    emit_verilog_header(Path(args.out_header), best, dnn_name,
                        args.objective, args.area_budget, args.power_budget)
    print(f"\nWrote Verilog header: {args.out_header}")

    json_report = {
        "dnn_name": dnn_name,
        "layers": [asdict(l) for l in dnn],
        "objective": args.objective,
        "area_budget": args.area_budget,
        "power_budget": args.power_budget,
        "best": {
            "n_per_layer": best.n_per_layer,
            "F": best.F,
            "schedule_groups": best.schedule.groups,
            "latency_cycles": best.latency_cycles,
            "throughput_inv_cycles": best.throughput_inv_cycles,
            "area": best.area,
            "power": best.power,
        },
    }
    Path(args.out_json).write_text(json.dumps(json_report, indent=2))
    print(f"Wrote JSON report : {args.out_json}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
