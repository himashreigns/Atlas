// Multi-Stage Streaming Neural Network Pipeline
// Each stage is a fixed NN layer with streaming row buffers
// Pipeline processes feature maps with minimal buffering

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
    output wire [NUM_LAYERS-1:0] layer_busy
);

    // Example configuration: LeNet-5 style CNN
    // Layer 0: CONV 5x5, 1->6 channels, 28x28 input
    // Layer 1: POOL 2x2, 6 channels, 24x24 input  
    // Layer 2: CONV 5x5, 6->16 channels, 12x12 input
    // Layer 3: POOL 2x2, 16 channels, 8x8 input
    
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
    
    // =========================================================================
    // LAYER 0: CONV 5x5, stride=1, 1 input channel, 6 output channels
    // Input: 28x28x1, Output: 24x24x6
    // =========================================================================
    
    streaming_nn_layer_stage #(
        .LAYER_TYPE("CONV"),
        .N(N),
        .DATA_W(DATA_W),
        .ACC_W(ACC_W),
        .ADDR_W(ADDR_W),
        .IMG_ROWS(28),
        .IMG_COLS(28),
        .KERNEL_SIZE(5),
        .STRIDE(1),
        .PADDING(0),
        .IN_CHANNELS(1),
        .OUT_CHANNELS(6)
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
        .wgt_load_data(wgt_load_data),
        .layer_ready(layer_ready_status[0]),
        .layer_busy(layer_busy[0])
    );
    
    // =========================================================================
    // LAYER 1: POOL 2x2, 6 channels
    // Input: 24x24x6, Output: 12x12x6
    // =========================================================================
    
    streaming_nn_layer_stage #(
        .LAYER_TYPE("POOL"),
        .N(N),
        .DATA_W(ACC_W),  // Input is accumulator width from previous layer
        .ACC_W(ACC_W),
        .ADDR_W(ADDR_W),
        .IMG_ROWS(24),
        .IMG_COLS(24),
        .POOL_SIZE(2),
        .IN_CHANNELS(6),
        .OUT_CHANNELS(6)
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
        .wgt_load_data(wgt_load_data),
        .layer_ready(layer_ready_status[1]),
        .layer_busy(layer_busy[1])
    );
    
    // =========================================================================
    // LAYER 2: CONV 5x5, stride=1, 6 input channels, 16 output channels
    // Input: 12x12x6, Output: 8x8x16
    // =========================================================================
    
    streaming_nn_layer_stage #(
        .LAYER_TYPE("CONV"),
        .N(N),
        .DATA_W(ACC_W),
        .ACC_W(ACC_W),
        .ADDR_W(ADDR_W),
        .IMG_ROWS(12),
        .IMG_COLS(12),
        .KERNEL_SIZE(5),
        .STRIDE(1),
        .PADDING(0),
        .IN_CHANNELS(6),
        .OUT_CHANNELS(16)
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
        .wgt_load_data(wgt_load_data),
        .layer_ready(layer_ready_status[2]),
        .layer_busy(layer_busy[2])
    );
    
    // =========================================================================
    // LAYER 3: POOL 2x2, 16 channels
    // Input: 8x8x16, Output: 4x4x16
    // =========================================================================
    
    streaming_nn_layer_stage #(
        .LAYER_TYPE("POOL"),
        .N(N),
        .DATA_W(ACC_W),
        .ACC_W(ACC_W),
        .ADDR_W(ADDR_W),
        .IMG_ROWS(8),
        .IMG_COLS(8),
        .POOL_SIZE(2),
        .IN_CHANNELS(16),
        .OUT_CHANNELS(16)
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
        .wgt_load_data(wgt_load_data),
        .layer_ready(layer_ready_status[3]),
        .layer_busy(layer_busy[3])
    );

endmodule
