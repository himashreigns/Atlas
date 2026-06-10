// =============================================================================
// dnn_config_vww.vh  —  Optimizer output for VWW-Tiny benchmark
//
// Workload : Visual Wake Words  (MLPerf Tiny VWW class)
// Network  : CONV(3×3,1→8) → POOL(2×2) → CONV(3×3,8→16) → POOL(2×2)
// Input    : 24×24 grayscale image  (person / no-person classification)
// Output   : 4×4×16 = 256 feature activations  (fed to off-chip classifier)
// Target   : ZedBoard XC7Z020-1CLG484  @100 MHz
// =============================================================================
`ifndef DNN_CONFIG_VWW_VH
`define DNN_CONFIG_VWW_VH

// ── Optimizer schedule ──────────────────────────────────────────────────────
`define DNN_NUM_LAYERS          4
`define DNN_NUM_STAGES          1

// Per-layer MAC-array widths
`define DNN_LAYER0_N            8   // CONV 3×3 1→8    ops=34,848
`define DNN_LAYER1_N            8   // POOL 2×2        ops=968
`define DNN_LAYER2_N           16   // CONV 3×3 8→16   ops=93,312
`define DNN_LAYER3_N           16   // POOL 2×2        ops=256

`define DNN_STAGE0_N           16
`define DNN_STAGE0_LAYER_MASK   4'b1111

// ── Performance / resource estimates ────────────────────────────────────────
`define DNN_EST_LATENCY_CYCLES  10325
`define DNN_EST_AREA_INTx10     500    // 50.0 AU
`define DNN_EST_POWER_MWx10     12660  // 1266 mW

// ── Topology constants used by tb_vww.v ─────────────────────────────────────
`define VWW_IN_H        24
`define VWW_IN_W        24
`define VWW_IN_C         1
`define VWW_INPUT_SIZE  576    // 24*24*1

// L0 CONV 3×3 1→8  →  22×22×8
`define VWW_L0_K         3
`define VWW_L0_OUT_C     8
`define VWW_L0_WGTS     72    // 3*3*1*8

// L1 POOL 2×2      →  11×11×8
// L2 CONV 3×3 8→16 →   9×9×16
`define VWW_L2_K         3
`define VWW_L2_OUT_C    16
`define VWW_L2_WGTS   1152    // 3*3*8*16

// L3 POOL 2×2      →   4×4×16 = 256 outputs
`define VWW_OUTPUT_SIZE  256

// ── Benchmark stub interface ─────────────────────────────────────────────────
`define DNN_OUTPUT_SIZE  256
`define DNN_GOLDEN_PATH  "golden_vww_output.memh"

// Weight base addresses in external 256K×32b DRAM
`define VWW_WGT_BASE_L0  20'h20000
`define VWW_WGT_BASE_L1  20'h20100   // POOL: no weights
`define VWW_WGT_BASE_L2  20'h20200
`define VWW_WGT_BASE_L3  20'h30700   // POOL: no weights

`endif  // DNN_CONFIG_VWW_VH
