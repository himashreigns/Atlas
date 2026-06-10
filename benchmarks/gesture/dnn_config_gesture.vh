// =============================================================================
// dnn_config_gesture.vh  —  Optimizer output for GestureNet benchmark
//
// Workload : IMU Gesture Recognizer  (smart-home / industrial IoT)
// Network  : CONV(3×3,1→4) → POOL(2×2) → POOL(2×2) → FC(28→5)
// Input    : 6×32 IMU sensor matrix  (6 channels × 32 timesteps)
//            Channels: acc_x, acc_y, acc_z, gyr_x, gyr_y, gyr_z
// Output   : 5 gesture logits  (swipe-L, swipe-R, push, pull, rest)
// Target   : ZedBoard XC7Z020-1CLG484  @100 MHz
//
// The 3×3 CONV kernel captures cross-axis temporal patterns.
// Two POOL stages aggressively downsample for low-weight FC head.
// =============================================================================
`ifndef DNN_CONFIG_GESTURE_VH
`define DNN_CONFIG_GESTURE_VH

// ── Optimizer schedule ──────────────────────────────────────────────────────
`define DNN_NUM_LAYERS          4
`define DNN_NUM_STAGES          1

`define DNN_LAYER0_N            4   // CONV 3×3 1→4   ops=4,320
`define DNN_LAYER1_N            4   // POOL 2×2       ops=120
`define DNN_LAYER2_N            4   // POOL 2×2       ops=28
`define DNN_LAYER3_N            8   // FC   28→5      ops=140

`define DNN_STAGE0_N            8
`define DNN_STAGE0_LAYER_MASK   4'b1111

// ── Performance / resource estimates ────────────────────────────────────────
`define DNN_EST_LATENCY_CYCLES  1135
`define DNN_EST_AREA_INTx10     320    // 32.0 AU
`define DNN_EST_POWER_MWx10     4660   // 466 mW

// ── Topology constants used by tb_gesture.v ─────────────────────────────────
`define GES_IN_H         6    // IMU channels
`define GES_IN_W        32    // timesteps
`define GES_IN_C         1
`define GES_INPUT_SIZE  192   // 6*32

// L0 CONV 3×3 1→4  →  4×30×4
`define GES_L0_K         3
`define GES_L0_OUT_C     4
`define GES_L0_WGTS     36    // 3*3*1*4

// L1 POOL 2×2      →  2×15×4  (floor(4/2)=2, floor(30/2)=15)
// L2 POOL 2×2      →  1×7×4   (floor(2/2)=1, floor(15/2)=7)
// L3 FC 28→5       (1*7*4=28)
`define GES_L3_IN       28
`define GES_L3_OUT       5
`define GES_L3_WGTS    140    // 28*5
`define GES_OUTPUT_SIZE  5

// ── Benchmark stub interface ─────────────────────────────────────────────────
`define DNN_OUTPUT_SIZE  5
`define DNN_GOLDEN_PATH  "golden_gesture_output.memh"

// Weight base addresses
`define GES_WGT_BASE_L0  20'h20000
`define GES_WGT_BASE_L1  20'h20100   // POOL
`define GES_WGT_BASE_L2  20'h20200   // POOL
`define GES_WGT_BASE_L3  20'h20300

`endif  // DNN_CONFIG_GESTURE_VH
