// =============================================================================
// dnn_config_kws.vh  —  Optimizer output for KWS-CNN benchmark
//
// Workload : Keyword Spotting CNN  (MLPerf Tiny KWS class)
// Network  : CONV(3×3,1→8) → POOL(2×2) → POOL(2×2) → FC(80→10)
// Input    : 25×10 MFCC feature map  (25 time frames × 10 mel coefficients)
// Output   : 10 keyword logits  (silence, yes, no, up, down, left, right,
//                                on, off, stop)
// Target   : ZedBoard XC7Z020-1CLG484  @100 MHz
//
// Scale chain: 1 CONV + 2 POOL + FC → HW_OUTPUT_SCALE = 256
//   After CONV >>20: hw_int ≈ TF_float  (scale-1)
//   After FC  >>20: hw_int ≈ TF_float / 256
// =============================================================================
`ifndef DNN_CONFIG_KWS_VH
`define DNN_CONFIG_KWS_VH

// ── Optimizer schedule ──────────────────────────────────────────────────────
`define DNN_NUM_LAYERS          4
`define DNN_NUM_STAGES          1

// Per-layer MAC-array widths (N_i ∈ {2,4,8,16,32})
`define DNN_LAYER0_N            8   // CONV 3×3 1→8   ops=13,248
`define DNN_LAYER1_N            8   // POOL 2×2       ops=352
`define DNN_LAYER2_N            4   // POOL 2×2       ops=80
`define DNN_LAYER3_N            8   // FC   80→10     ops=800

// Stage 0 provisions max(N_i) MACs and all layer BRAMs
`define DNN_STAGE0_N            8
`define DNN_STAGE0_LAYER_MASK   4'b1111

// ── Performance / resource estimates ────────────────────────────────────────
`define DNN_EST_LATENCY_CYCLES  1820
`define DNN_EST_AREA_INTx10     355    // 35.5 AU
`define DNN_EST_POWER_MWx10     13000  // 1300 mW

// ── Topology constants used by tb_kws.v ─────────────────────────────────────
`define KWS_IN_H        25
`define KWS_IN_W        10
`define KWS_IN_C         1
`define KWS_INPUT_SIZE  250    // 25*10*1

// L0 CONV 3×3 1→8  →  23×8×8
`define KWS_L0_K         3
`define KWS_L0_OUT_C     8
`define KWS_L0_WGTS     72    // 3*3*1*8

// L1 POOL 2×2  →  11×4×8
// L2 POOL 2×2  →   5×2×8 = 80
// L3 FC 80→10
`define KWS_L3_IN       80
`define KWS_L3_OUT      10
`define KWS_L3_WGTS    800    // 80*10
`define KWS_OUTPUT_SIZE  10

// ── Benchmark stub interface ─────────────────────────────────────────────────
`define DNN_OUTPUT_SIZE  10
`define DNN_GOLDEN_PATH  "golden_kws_output.memh"

// Weight base addresses in external 256K×32b DRAM
`define KWS_WGT_BASE_L0  20'h20000
`define KWS_WGT_BASE_L1  20'h20100   // POOL: no weights
`define KWS_WGT_BASE_L2  20'h20200   // POOL: no weights
`define KWS_WGT_BASE_L3  20'h20300

`endif  // DNN_CONFIG_KWS_VH
