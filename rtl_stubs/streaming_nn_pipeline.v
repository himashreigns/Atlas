// Multi-Stage Streaming Neural Network Pipeline
// Each stage is a fixed NN layer with streaming row buffers
//
// CURRENT TOPOLOGY: YOLO-Nano (per benchmarks/yolo_nano/dnn_config_yolo_nano.vh)
//   Layer 0: CONV 3x3, 1->4 channels, 16x16 input  -> 14x14x4
//   Layer 1: POOL 2x2, 4 channels,    14x14 input  ->  7x7x4
//   Layer 2: POOL 2x2, 4 channels,     7x7 input   ->  3x3x4 (= 36)
//   Layer 3: FC, 36->20                            -> 20

module streaming_nn_pipeline #(
    parameter N        = 8,      // MAC array width
    parameter DATA_W   = 16,
    parameter ACC_W    = 32,
    parameter ADDR_W   = 10,

    // Number of layers in pipeline
    parameter NUM_LAYERS = 4
)(
    input  wire clk,
    input  wire rst,

    // Input stream (from sensor/memory)
    input  wire [DATA_W-1:0] pipeline_in_data,
    input  wire pipeline_in_valid,
    output wire pipeline_in_ready,

    // Output stream (to memory/next pipeline)
    output wire [ACC_W-1:0] pipeline_out_data,
    output wire pipeline_out_valid,
    input  wire pipeline_out_ready,

    // Weight loading interface (for all layers)
    input  wire [NUM_LAYERS-1:0] wgt_load_en,
    input  wire [ADDR_W-1:0] wgt_load_addr,
    input  wire [DATA_W-1:0] wgt_load_data,

    // Pipeline status
    output wire pipeline_ready,
    output wire [NUM_LAYERS-1:0] layer_busy,
    output wire [NUM_LAYERS-1:0] layer_ready_out
);

    // Inter-layer streaming connections
    wire [ACC_W-1:0] layer_data [0:NUM_LAYERS];
    wire [NUM_LAYERS:0] layer_valid;
    wire [NUM_LAYERS:0] layer_ready_sig;

    // Connect pipeline input/output
    assign layer_data[0] = {{(ACC_W-DATA_W){1'b0}}, pipeline_in_data};
    assign layer_valid[0] = pipeline_in_valid;
    assign pipeline_in_ready = layer_ready_sig[0];

    assign pipeline_out_data = layer_data[NUM_LAYERS];
    assign pipeline_out_valid = layer_valid[NUM_LAYERS];
    assign layer_ready_sig[NUM_LAYERS] = pipeline_out_ready;

    // Status
    wire [NUM_LAYERS-1:0] layer_ready_status;
    assign pipeline_ready = &layer_ready_status;
    assign layer_ready_out = layer_ready_status;

    // =========================================================================
    // LAYER 0: CONV 3x3, stride=1, pad=0, 1 input channel, 4 output channels
    // Input: 16x16x1, Output: 14x14x4
    // Weights: 3*3*1*4 = 36
    // =========================================================================

    streaming_nn_layer_stage #(
        .LAYER_TYPE(0),   // CONV
        .N(N),
        .DATA_W(DATA_W),
        .ACC_W(ACC_W),
        .ADDR_W(ADDR_W),
        .IMG_ROWS(16),
        .IMG_COLS(16),
        .KERNEL_SIZE(3),
        .STRIDE(1),
        .PADDING(0),
        .IN_CHANNELS(1),
        .OUT_CHANNELS(4)
    ) layer_0 (
        .clk(clk),
        .rst(rst),
        .stream_in_data(layer_data[0][DATA_W-1:0]),
        .stream_in_valid(layer_valid[0]),
        .stream_in_ready(layer_ready_sig[0]),
        .stream_out_data(layer_data[1]),
        .stream_out_valid(layer_valid[1]),
        .stream_out_ready(layer_ready_sig[1]),
        .wgt_load_en(wgt_load_en[0]),
        .wgt_load_addr(wgt_load_addr),
        .wgt_load_data({{(ACC_W-DATA_W){1'b0}}, wgt_load_data}),
        .layer_ready(layer_ready_status[0]),
        .layer_busy(layer_busy[0])
    );

    // =========================================================================
    // LAYER 1: POOL 2x2, 4 channels
    // Input: 14x14x4, Output: 7x7x4
    // =========================================================================

    streaming_nn_layer_stage #(
        .LAYER_TYPE(2),   // POOL
        .N(N),
        .DATA_W(ACC_W),
        .ACC_W(ACC_W),
        .ADDR_W(ADDR_W),
        .IMG_ROWS(14),
        .IMG_COLS(14),
        .POOL_SIZE(2),
        .IN_CHANNELS(4),
        .OUT_CHANNELS(4)
    ) layer_1 (
        .clk(clk),
        .rst(rst),
        .stream_in_data(layer_data[1]),
        .stream_in_valid(layer_valid[1]),
        .stream_in_ready(layer_ready_sig[1]),
        .stream_out_data(layer_data[2]),
        .stream_out_valid(layer_valid[2]),
        .stream_out_ready(layer_ready_sig[2]),
        .wgt_load_en(wgt_load_en[1]),
        .wgt_load_addr(wgt_load_addr),
        .wgt_load_data({{(ACC_W-DATA_W){1'b0}}, wgt_load_data}),
        .layer_ready(layer_ready_status[1]),
        .layer_busy(layer_busy[1])
    );

    // =========================================================================
    // LAYER 2: POOL 2x2, 4 channels
    // Input: 7x7x4 (effectively 6x6 with floor), Output: 3x3x4 (= 36)
    // =========================================================================

    streaming_nn_layer_stage #(
        .LAYER_TYPE(2),   // POOL  (was CONV in LeNet topology)
        .N(N),
        .DATA_W(ACC_W),
        .ACC_W(ACC_W),
        .ADDR_W(ADDR_W),
        .IMG_ROWS(7),
        .IMG_COLS(7),
        .POOL_SIZE(2),
        .IN_CHANNELS(4),
        .OUT_CHANNELS(4)
    ) layer_2 (
        .clk(clk),
        .rst(rst),
        .stream_in_data(layer_data[2]),
        .stream_in_valid(layer_valid[2]),
        .stream_in_ready(layer_ready_sig[2]),
        .stream_out_data(layer_data[3]),
        .stream_out_valid(layer_valid[3]),
        .stream_out_ready(layer_ready_sig[3]),
        .wgt_load_en(wgt_load_en[2]),
        .wgt_load_addr(wgt_load_addr),
        .wgt_load_data({{(ACC_W-DATA_W){1'b0}}, wgt_load_data}),
        .layer_ready(layer_ready_status[2]),
        .layer_busy(layer_busy[2])
    );

    // =========================================================================
    // LAYER 3: FC 36 -> 20 (YOLO detection head; 4 cells * 5 params)
    // Weights: 36*20 = 720
    // =========================================================================

    streaming_nn_layer_stage #(
        .LAYER_TYPE(1),   // FC  (was POOL in LeNet topology)
        .N(N),
        .DATA_W(ACC_W),
        .ACC_W(ACC_W),
        .ADDR_W(ADDR_W),
        .FC_INPUT_SIZE(36),
        .FC_OUTPUT_SIZE(20)
    ) layer_3 (
        .clk(clk),
        .rst(rst),
        .stream_in_data(layer_data[3]),
        .stream_in_valid(layer_valid[3]),
        .stream_in_ready(layer_ready_sig[3]),
        .stream_out_data(layer_data[4]),
        .stream_out_valid(layer_valid[4]),
        .stream_out_ready(layer_ready_sig[4]),
        .wgt_load_en(wgt_load_en[3]),
        .wgt_load_addr(wgt_load_addr),
        .wgt_load_data({{(ACC_W-DATA_W){1'b0}}, wgt_load_data}),
        .layer_ready(layer_ready_status[3]),
        .layer_busy(layer_busy[3])
    );

endmodule
