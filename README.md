# DNN Accelerator: Constrained Optimization + Comprehensive Verification + Zedboard Timing

End-to-end co-design flow for a streaming DNN accelerator targeting the AMD
ZedBoard (Xilinx XC7Z020-1CLG484). A Python optimizer chooses the per-layer
MAC-array width `N_i` and pipeline fold factor `F` that minimize an objective
(latency / throughput / area) subject to area and power budgets. A TensorFlow
+ fixed-point golden generator emits the bit-exact expected activations. The
chosen configuration drives a comprehensive SystemVerilog testbench *and* a
behavioral Zedboard timing-verification testbench. A Vivado tcl script wraps
the production synth/implement/STA flow for board bring-up.

---

## 1. Optimization formulation

### Decision variables

| Symbol | Domain | Meaning |
|---|---|---|
| `N_i` | `{2, 4, 8, 16, 32}` | MAC-array width assigned to layer `i ∈ {1..L}` |
| `F`   | `{1..L}` | Number of *physical* pipeline stages (after folding) |
| `g(i) ∈ {1..F}` | contiguous grouping | Which physical stage hosts layer `i` |

The grouping `g` is fixed to **balanced contiguous folding**: layers are
sliced into `F` contiguous groups of (near-)equal cardinality, preserving the
streaming dataflow ordering required by the RTL.

### Cost model

For physical stage `j` hosting layer-set `G_j = {i : g(i)=j}`:

```
N_j           = max_{i ∈ G_j} N_i                       (shared MAC array width)
stage_cycles_j = Σ_{i ∈ G_j} ( ceil(ops_i / N_j) + fill )
stage_area_j  = a_ctrl + a_mac · N_j
              + Σ_{i ∈ G_j} (a_bram · ceil(weights_i / bram_depth))
              + a_router
stage_power_j = activity · ( p_mac_dyn · N_j + p_bram_dyn · #BRAM_j ) · f_clk
```

Total cost: `Latency = Σ_j stage_cycles_j`, `Throughput⁻¹ = max_j stage_cycles_j`,
`Area = Σ_j stage_area_j`, `Power = p_static + Σ_j stage_power_j`.

### MINLP statement

```
    minimize     f(N, F)
        N, F
    subject to   Area_total(N, F)  ≤  A_budget
                 Power_total(N, F) ≤  P_budget
                 N_i ∈ {2, 4, 8, 16, 32}             ∀ i ∈ {1..L}
                 F   ∈ {1, 2, ..., L}

with  f ∈ { Latency, Throughput⁻¹, Area }
```

Solved by exhaustive search with floor-area pruning. For LeNet-5 at
`A≤180, P≤2000mW, min-latency`: `N=[2,2,2,32]`, `F=1`, latency = 7663 cycles,
area = 92.0, power = 1699 mW.

The optimum is emitted as `sim/dnn_config.vh` which parameterizes both the
RTL and every testbench.

---

## 2. TensorFlow golden reference

`golden/tf_golden.py` builds the same LeNet-5 in two parallel paths:

1. **Keras float reference** — `tf.keras.layers.Conv2D / MaxPool2D` with
   deterministic weights derived by scaling the testbench's bit patterns
   back to float via the Q-formats. Validates layer shapes and dynamic
   range, prints non-zero output count.
2. **Bit-accurate fixed-point reference** — pure numpy/int integer math
   that mirrors the hardware MAC pipeline:
   - activations Q8.8 (16-bit signed)
   - weights      Q4.12 (16-bit signed)
   - accumulator  int64 → arithmetic shift right by `Q_ACC_SHIFT=20` →
     ReLU → saturate-to-int16

Both paths use the *exact* deterministic bit patterns the comprehensive TB
drives into memory (`input[i]=(i%256)<<8`, `w_l0[i]=((i*7+3)&0xFF)<<4`,
`w_l2[i]=((i*13+5)&0xFF)<<4`), so the golden output is reproducible from
those alone — no random seeds.

Generates:

```
golden/golden_input.memh        784 x 16b  (28×28 input image)
golden/golden_weights_l0.memh   150 x 16b  (5×5×1×6 conv1 weights)
golden/golden_weights_l2.memh  2400 x 16b  (5×5×6×16 conv2 weights)
golden/golden_output.memh       256 x 16b  (final activations, padded)
golden/golden_meta.json         shapes, Q-format, SHA-256 hashes, stats
```

For LeNet-5 the final activations land in the range `[66, 119]` (varied,
not saturated) — discriminating enough that any DUT producing different
values is caught by TC11.

---

## 3. Comprehensive testbench

`sim/tb_dnn_comprehensive.sv` is parameterized entirely from `dnn_config.vh`
and exercises eleven test cases:

| # | Test | What it checks |
|---|------|----------------|
| TC1 | Reset / ready | After reset, `system_ready=1`, no busy, no done |
| TC2 | Weight load | `weights_loaded` rises after `load_weights` pulse |
| TC3 | Inference latency | Measured cycles within `±LATENCY_TOLERANCE_PCT` of optimizer estimate |
| TC4 | Back-to-back throughput | 4 sequential inferences produce identical cycle counts |
| TC5 | Per-layer activity | Each `layer_busy[i]` sees ≥1 rising edge per inference |
| TC6 | Output non-zero | Output memory not all zero after inference |
| TC7 | Quiescence | After done, all busy/active flags fall, ready re-asserts |
| TC8 | Reset + rerun | Post-reset reload + inference reproduces the latency |
| TC9 | RRM phase alignment | (guarded by `+define+DUT_HAS_RRM`) resource-manager phase tracks layer count |
| TC10| Final functional report | Aggregated pass/fail and slack vs estimate |
| **TC11** | **Golden compare** | **All 256 output positions match `golden_output.memh` bit-exactly** |

Key infrastructure:

- **Pulse helpers** drive control signals on `negedge clk` to eliminate
  active-region races
- **Self-checking helpers** (`check_eq`, `check_range`, `check_true`) maintain
  a global scoreboard
- **`GOLDEN_REPLAY` mode** in the stub loads `golden_output.memh` and writes
  those exact values to the output buffer — validates the comparison
  pipeline; drop in the real RTL and TC11 becomes a true correctness check
- **Global watchdog** caps simulation at `10 × EST_LATENCY_CYCLES` per inference

Two real bugs were caught during integration with the golden flow and
fixed:

1. **Memory undersized.** `memory[0:(1<<16)-1]` couldn't reach
   `output_base_addr = 0x10000`. Reads silently returned `x` (which falsely
   passed `!== 32'h0`). Bumped to `(1<<18)`.
2. **Stub lost one write per layer.** The S_WRITE_OUT case overrode
   `mem_write` to 0 in the same cycle as the final value's NBA, so the 64th
   write of each layer never reached memory (252/256 matches). Gating writes
   on `cycle_counter < 64` with an explicit drain cycle restored all 256.

Result: **18/18 PASS, golden matches = 256/256, max|hw-golden| = 0**.

---

## 4. Zedboard timing verification

`sim/tb_zedboard_timing.sv` is a behavioral timing-verification testbench
for the production board.

### Target
- Part: XC7Z020-1CLG484 (ZedBoard, speed grade -1)
- Clock: 100 MHz on pin Y9 (Bank 13, LVCMOS33) — the on-board oscillator
- Reset: BTNC active-low push-button on pin P16 (Bank 34, LVCMOS18)

### What it tests
- **TT1: Static slack budget.** `slack = T_period − T_cko − T_comb − T_setup − T_uncert`. Must be ≥ 0.
- **TT2-4: Functional correctness at 100 MHz** with `T_CKO + T_COMB ≈ 8 ns`
  of injected delay on every control signal (`rst`, `load_weights`,
  `start_inference`). Reset / ready / weight-load / inference all complete.
- **TT5: Golden compare under the delay model.** Bit-exact match required.
- **TT6: Behavioral setup-margin scoreboard.** Every monitored signal
  change is checked against `T_SETUP_NS` before the next posedge; zero
  violations required.
- **TT7: Behavioral hold-margin scoreboard.** Every signal change is
  checked against `T_HOLD_NS` after the most recent posedge.
- **TT8: Aggregate report** — analytical slack, worst observed setup/hold,
  period budget utilization.

### XC7Z020-1 defaults (used as TB parameters)

| Parameter | Value | Source |
|---|---|---|
| `T_CKO_NS`     | 0.50 | FDRE clock-to-Q, -1 grade typical |
| `T_SETUP_NS`   | 0.30 | FDRE Tas |
| `T_HOLD_NS`    | 0.10 | FDRE Tah |
| `T_COMB_NS`    | 7.50 | Modeled worst routed combinational path |
| `T_UNCERT_NS`  | 0.25 | Clock jitter + skew + derating |
| `CLK_PERIOD_NS`| 10.00| 100 MHz Zedboard PL clock |
| **Slack**      | **+1.45 ns** | budget headroom |

### Sanity check (negative test)
Forcing `T_COMB_NS=12.0` collapses the slack to `−3.05 ns`. TT1 correctly
flips to FAIL, proving the testbench actually rejects timing-broken designs
and isn't rubber-stamping:

```sh
iverilog -g2012 -DGOLDEN_REPLAY -Ptb_zedboard_timing.T_COMB_NS=12.0 \
    -o tb_zed_fail.vvp tb_zedboard_timing.sv ...
vvp tb_zed_fail.vvp
# >>> 1 TIMING TEST(S) FAILED <<<
```

### Why behavioral, not post-impl
True post-implementation timing simulation requires Vivado-generated SDF
back-annotation; Icarus doesn't support `$sdf_annotate`. The behavioral TB
runs the same numerical checks at the source. The production flow is in
`scripts/vivado_timing.tcl`:

```tcl
synth_design -top zedboard_top -part xc7z020clg484-1
opt_design; place_design; phys_opt_design; route_design
report_timing_summary -file build/timing_summary.rpt
write_sdf      -force build/zedboard_top_tsmn.sdf -process_corner slow
write_verilog  -force build/zedboard_top_tsmn.v -mode timesim -sdf_anno true
write_bitstream -force build/zedboard_top.bit
```

Then post-impl simulation in XSim:

```sh
xelab -L unisims_ver -L secureip --debug typical \
      tb_zedboard_timing zedboard_top_tsmn \
      -sdfmax dut=build/zedboard_top_tsmn.sdf
xsim work.tb_zedboard_timing -R
```

### Constraints
`xdc/zedboard.xdc` — full pin-out for clock, reset, status LEDs, DIP-switch
inputs; async reset / switch / LED false-paths; clock uncertainty;
bitstream configuration. Pins verified against the official Digilent
Zedboard Master XDC (Y9 GCLK, P16 BTNC, T22/T21/U22/U21/V22/W22/U19/U14
LD0-LD7, F22/G22 SW0/SW1).

### Top wrapper
`rtl_stubs/zedboard_top.sv` brings status signals (`system_ready`,
`weights_loaded`, `inference_done`, `layer_busy[3:0]`, heartbeat) out to
LD0-LD7, accepts BTNC active-low reset through a 2-FF synchronizer, and
turns SW0/SW1 toggles into one-cycle `start_inference` / `load_weights`
pulses via edge detection. This is the synthesis target the XDC constrains.

---

## 5. Usage

### One-line (recommended)

```sh
./run_optimization.sh
```

Runs the full 5-step pipeline: golden → optimize → compile → sim → timing.

### With overrides

```sh
DNN=lenet5 AREA=120 POWER=1500 OBJ=throughput ./run_optimization.sh
```

### Via make

```sh
make all                      # everything
make optimize AREA=80         # tighter area budget, re-emit header
make golden                   # regenerate golden vectors
make sim                      # comprehensive TB only
make timing                   # Zedboard timing TB only
make pareto                   # print Pareto-optimal points
make unit                     # run optimizer unit tests
make vivado                   # production synth/impl/STA flow
make clean
```

### Standalone golden generator

```sh
cd golden && python3 tf_golden.py .
```

### Standalone optimizer

```sh
python3 dnn_optimizer.py --dnn tiny_vgg \
    --area-budget 400 --power-budget 4000 \
    --objective throughput \
    --out-header sim/dnn_config.vh -v
```

---

## 6. Files

```
dnn_opt/
├── README.md                       (this file)
├── Makefile
├── run_optimization.sh
├── dnn_optimizer.py                (optimizer + Verilog-header emitter)
├── test_dnn_optimizer.py           (30 unit tests, all passing)
├── dnn_config.json                 (machine-readable optimizer result)
├── golden/
│   ├── tf_golden.py                (TF Keras + fixed-point golden generator)
│   ├── golden_input.memh           (deterministic LeNet input)
│   ├── golden_weights_l0.memh      (conv1 weights)
│   ├── golden_weights_l2.memh      (conv2 weights)
│   ├── golden_output.memh          (expected final activations, 256x16b)
│   └── golden_meta.json            (Q-format, hashes, stats)
├── rtl_stubs/
│   ├── streaming_nn_system_stub.sv (behavioral stub w/ GOLDEN_REPLAY mode)
│   └── zedboard_top.sv             (synthesis wrapper for ZedBoard)
├── sim/
│   ├── dnn_config.vh               (header from optimizer)
│   ├── tb_dnn_comprehensive.sv     (11 functional + golden tests, 18 checks)
│   └── tb_zedboard_timing.sv       (8 timing tests, 9 checks)
├── xdc/
│   └── zedboard.xdc                (Zedboard pin & timing constraints)
└── scripts/
    └── vivado_timing.tcl           (production synth/impl/STA flow)
```

---

## 7. Integration with the user-supplied testbenches

The existing testbenches in `tb.zip`
(`tb_mac_array`, `tb_mac_stage`, `tb_streaming_nn_system`,
`tb_runtime_resource_manager`, `tb_hw_vs_golden`, ...) remain valid as
**block-level** suites. The deliverables here are the **system-level**
suite that closes the loop with the optimizer's estimates, the
**TF-bit-accurate** correctness check, and the **timing-margin** check at
the production deploy frequency.

Recommended sequencing:

1. Run block-level TBs to catch regressions on unit-level RTL edits.
2. Run `make all` after any optimizer or layer-spec change — rebuilds
   golden, header, comprehensive TB, and timing TB.
3. Run `make vivado` for the production synth/impl flow and inspect
   `build/timing_summary.rpt` for the true post-route slack.
4. Track three numbers over time as co-design health metrics:
   - "Slack vs estimate" from the comprehensive TB (optimizer vs hw cycles)
   - `max|hw-golden|` from TC11 (must stay 0)
   - "Setup slack" from the Zedboard timing TB (and Vivado WNS once impl'd)

---

## 8. Expected result

```
=== Step 1/5: Golden reference (TensorFlow + fixed-point) ===
  output: 256/256 nonzero, range [66, 119]
=== Step 2/5: Constrained optimization ===
  N* = [2, 2, 2, 32]   F* = 1   latency* = 7663 cycles
=== Step 3/5: Compile comprehensive TB ===
=== Step 4/5: Run comprehensive simulation ===
  Tests run     : 18
  Pass          : 18
  Fail          : 0
  >>> ALL TESTS PASSED <<<
=== Step 5/5: Zedboard timing verification ===
  Setup slack       : 1.450 ns
  Worst setup obs   : 6.700 ns
  Worst hold obs    : 2.900 ns
  Tests run   : 9
  Pass        : 9
  Fail        : 0
  >>> TIMING VERIFICATION PASSED <<<
```

**27/27 PASS.**
