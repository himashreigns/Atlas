// =============================================================================
// dnn_config_yolo_nano.vh  —  Optimizer output for YOLO-Nano benchmark
//
// Workload : Nano Object Detector  (YOLO-style, 4 grid cells)
// Network  : CONV(3×3,1→4) → POOL(2×2) → POOL(2×2) → FC(36→20)
// Input    : 16×16 grayscale image
// Output   : 20 values  =  4 cells × (x, y, w, h, objectness)
// Target   : ZedBoard XC7Z020-1CLG484  @100 MHz
//
// Grid: 2×2 spatial cells. Each predicts one bounding box.
// All outputs stored as Q8.8 fixed-point; post-processing on ARM core.
// =============================================================================
`ifndef DNN_CONFIG_YOLO_NANO_VH
`define DNN_CONFIG_YOLO_NANO_VH

// ── Optimizer schedule ──────────────────────────────────────────────────────
`define DNN_NUM_LAYERS          4
`define DNN_NUM_STAGES          1

`define DNN_LAYER0_N            4   // CONV 3×3 1→4   ops=7,056
`define DNN_LAYER1_N            4   // POOL 2×2       ops=196
`define DNN_LAYER2_N            4   // POOL 2×2       ops=36
`define DNN_LAYER3_N            8   // FC   36→20     ops=720

`define DNN_STAGE0_N            8
`define DNN_STAGE0_LAYER_MASK   4'b1111

// ── Performance / resource estimates ────────────────────────────────────────
`define DNN_EST_LATENCY_CYCLES  1912
`define DNN_EST_AREA_INTx10     330    // 33.0 AU
`define DNN_EST_POWER_MWx10     8000   // 800 mW

// ── Topology constants used by tb_yolo_nano.v ────────────────────────────────
`define YOLO_IN_H        16
`define YOLO_IN_W        16
`define YOLO_IN_C         1
`define YOLO_INPUT_SIZE  256    // 16*16

// L0 CONV 3×3 1→4  →  14×14×4
`define YOLO_L0_K        3
`define YOLO_L0_OUT_C    4
`define YOLO_L0_WGTS    36    // 3*3*1*4

// L1 POOL 2×2      →   7×7×4
// L2 POOL 2×2      →   3×3×4 = 36  (floor(7/2)=3)
// L3 FC 36→20
`define YOLO_L3_IN       36
`define YOLO_L3_OUT      20
`define YOLO_L3_WGTS    720    // 36*20
`define YOLO_OUTPUT_SIZE 20

// Detection head: 4 grid cells × 5 params (x,y,w,h,conf)
`define YOLO_GRID_CELLS   4
`define YOLO_PARAMS_CELL  5

// ── Benchmark stub interface ─────────────────────────────────────────────────
`define DNN_OUTPUT_SIZE  20
`define DNN_GOLDEN_PATH  "golden_yolo_output.memh"

// Weight base addresses
`define YOLO_WGT_BASE_L0  20'h20000
`define YOLO_WGT_BASE_L1  20'h20100   // POOL
`define YOLO_WGT_BASE_L2  20'h20200   // POOL
`define YOLO_WGT_BASE_L3  20'h20300

`endif  // DNN_CONFIG_YOLO_NANO_VH
