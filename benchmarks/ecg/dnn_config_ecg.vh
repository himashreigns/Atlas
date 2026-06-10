// =============================================================================
// dnn_config_ecg.vh  —  Optimizer output for ECG-Net benchmark
//
// Workload : ECG Anomaly Detector  (medical IoT wearable)
// Network  : CONV(3×3,1→8) → POOL(2×2) → POOL(2×2) → FC(24→2)
// Input    : 128-sample ECG window reshaped to 16×8 2-D map
// Output   : 2 logits  (normal / anomaly)
// Target   : ZedBoard XC7Z020-1CLG484  @100 MHz
//
// Scale chain: 1 CONV + 2 POOL + FC → HW_OUTPUT_SCALE = 256
// This is the lowest-latency benchmark (~789 cycles), targeting wearable IoT
// devices with strict real-time and energy constraints.
// =============================================================================
`ifndef DNN_CONFIG_ECG_VH
`define DNN_CONFIG_ECG_VH

// ── Optimizer schedule ──────────────────────────────────────────────────────
`define DNN_NUM_LAYERS          4
`define DNN_NUM_STAGES          1

`define DNN_LAYER0_N            8   // CONV 3×3 1→8   ops=6,048
`define DNN_LAYER1_N            8   // POOL 2×2       ops=168
`define DNN_LAYER2_N            4   // POOL 2×2       ops=24
`define DNN_LAYER3_N            8   // FC   24→2      ops=48

`define DNN_STAGE0_N            8
`define DNN_STAGE0_LAYER_MASK   4'b1111

// ── Performance / resource estimates ────────────────────────────────────────
`define DNN_EST_LATENCY_CYCLES  789
`define DNN_EST_AREA_INTx10     320    // 32.0 AU
`define DNN_EST_POWER_MWx10     4660   // 466 mW

// ── Topology constants used by tb_ecg.v ─────────────────────────────────────
`define ECG_IN_H        16
`define ECG_IN_W         8
`define ECG_IN_C         1
`define ECG_INPUT_SIZE  128    // 16*8  (128-sample ECG window)

// L0 CONV 3×3 1→8  →  14×6×8
`define ECG_L0_K         3
`define ECG_L0_OUT_C     8
`define ECG_L0_WGTS     72    // 3*3*1*8

// L1 POOL 2×2  →  7×3×8
// L2 POOL 2×2  →  3×1×8 = 24  (floor(7/2)=3, floor(3/2)=1)
// L3 FC 24→2
`define ECG_L3_IN       24
`define ECG_L3_OUT       2
`define ECG_L3_WGTS     48    // 24*2
`define ECG_OUTPUT_SIZE  2

// ── Benchmark stub interface ─────────────────────────────────────────────────
`define DNN_OUTPUT_SIZE  2
`define DNN_GOLDEN_PATH  "golden_ecg_output.memh"

// Weight base addresses
`define ECG_WGT_BASE_L0  20'h20000
`define ECG_WGT_BASE_L1  20'h20100   // POOL
`define ECG_WGT_BASE_L2  20'h20200   // POOL
`define ECG_WGT_BASE_L3  20'h20300

`endif  // DNN_CONFIG_ECG_VH
