// Complete Streaming NN System with Pipeline Manager
// Includes weight loading, input feeding, and output collection

module streaming_nn_system #(
    parameter N        = 8,
    parameter DATA_W   = 16,
    parameter ACC_W    = 32,
    parameter ADDR_W   = 10,
    parameter NUM_LAYERS = 4,
    
    // External memory interface
    parameter MEM_ADDR_W = 20,
    parameter MEM_DATA_W = 32
)(
    input  wire clk,
    input  wire rst,
    
    // Control interface
    input  wire start_inference,      // Start processing one frame/batch
    output reg  inference_done,       // Processing complete
    output wire system_ready,         // Ready for new inference
    
    input  wire load_weights,         // Load weights from memory
    output reg  weights_loaded,       // Weights loaded and ready
    
    // External memory interface (for weights and input data)
    output reg [MEM_ADDR_W-1:0] mem_addr,
    output reg mem_read,
    input  wire [MEM_DATA_W-1:0] mem_rdata,
    input  wire mem_rdata_valid,
    output reg mem_write,
    output reg [MEM_DATA_W-1:0] mem_wdata,
    
    // Configuration (base addresses in external memory)
    input  wire [MEM_ADDR_W-1:0] input_base_addr,
    input  wire [MEM_ADDR_W-1:0] output_base_addr,
    input  wire [MEM_ADDR_W-1:0] weights_base_addr [0:NUM_LAYERS-1],
    
    // Debug/monitoring
    output wire [NUM_LAYERS-1:0] layer_busy,
    output wire pipeline_active
);

    // =========================================================================
    // PIPELINE INSTANCE
    // =========================================================================
    
    wire [DATA_W-1:0] pipeline_in_data;
    wire pipeline_in_valid;
    wire pipeline_in_ready;
    
    wire [ACC_W-1:0] pipeline_out_data;
    wire pipeline_out_valid;
    wire pipeline_out_ready;
    
    wire [NUM_LAYERS-1:0] wgt_load_en;
    wire [ADDR_W-1:0] wgt_load_addr;
    wire [DATA_W-1:0] wgt_load_data;
    
    wire pipeline_ready;
    
    streaming_nn_pipeline #(
        .N(N),
        .DATA_W(DATA_W),
        .ACC_W(ACC_W),
        .ADDR_W(ADDR_W),
        .NUM_LAYERS(NUM_LAYERS)
    ) pipeline (
        .clk(clk),
        .rst(rst),
        .pipeline_in_data(pipeline_in_data),
        .pipeline_in_valid(pipeline_in_valid),
        .pipeline_in_ready(pipeline_in_ready),
        .pipeline_out_data(pipeline_out_data),
        .pipeline_out_valid(pipeline_out_valid),
        .pipeline_out_ready(pipeline_out_ready),
        .wgt_load_en(wgt_load_en),
        .wgt_load_addr(wgt_load_addr),
        .wgt_load_data(wgt_load_data),
        .pipeline_ready(pipeline_ready),
        .layer_busy(layer_busy)
    );
    
    // =========================================================================
    // WEIGHT LOADER FSM
    // =========================================================================
    
    localparam WL_IDLE        = 3'b000;
    localparam WL_READ_MEM    = 3'b001;
    localparam WL_WRITE_LAYER = 3'b010;
    localparam WL_NEXT_LAYER  = 3'b011;
    localparam WL_DONE        = 3'b100;
    
    reg [2:0] wl_state;
    reg [3:0] wl_layer_idx;
    reg [ADDR_W-1:0] wl_addr_cnt;
    reg [MEM_ADDR_W-1:0] wl_mem_addr;
    
    // Weight loading control
    reg [NUM_LAYERS-1:0] wgt_load_en_reg;
    reg [ADDR_W-1:0] wgt_load_addr_reg;
    reg [DATA_W-1:0] wgt_load_data_reg;
    
    assign wgt_load_en = wgt_load_en_reg;
    assign wgt_load_addr = wgt_load_addr_reg;
    assign wgt_load_data = wgt_load_data_reg;
    
    // Weights size per layer (example - should be calculated based on layer params)
    // Layer 0: 5x5x1x6 = 150 weights
    // Layer 1: No weights (pooling)
    // Layer 2: 5x5x6x16 = 2400 weights
    // Layer 3: No weights (pooling)
    reg [ADDR_W-1:0] weights_per_layer [0:NUM_LAYERS-1];
    
    initial begin
        weights_per_layer[0] = 150;   // CONV 5x5x1x6
        weights_per_layer[1] = 0;     // POOL (no weights)
        weights_per_layer[2] = 2400;  // CONV 5x5x6x16
        weights_per_layer[3] = 0;     // POOL (no weights)
    end
    
    always @(posedge clk) begin
        if (rst) begin
            wl_state <= WL_IDLE;
            wl_layer_idx <= 0;
            wl_addr_cnt <= 0;
            wl_mem_addr <= 0;
            weights_loaded <= 0;
            wgt_load_en_reg <= 0;
            mem_read <= 0;
        end else begin
            // Default
            mem_read <= 0;
            wgt_load_en_reg <= 0;
            
            case (wl_state)
                WL_IDLE: begin
                    if (load_weights) begin
                        wl_layer_idx <= 0;
                        wl_addr_cnt <= 0;
                        wl_mem_addr <= weights_base_addr[0];
                        weights_loaded <= 0;
                        wl_state <= WL_READ_MEM;
                    end
                end
                
                WL_READ_MEM: begin
                    if (weights_per_layer[wl_layer_idx] > 0) begin
                        // Request memory read
                        mem_addr <= wl_mem_addr;
                        mem_read <= 1;
                        wl_state <= WL_WRITE_LAYER;
                    end else begin
                        // Skip layers with no weights (pooling)
                        wl_state <= WL_NEXT_LAYER;
                    end
                end
                
                WL_WRITE_LAYER: begin
                    if (mem_rdata_valid) begin
                        // Write to current layer's weight memory
                        wgt_load_en_reg[wl_layer_idx] <= 1;
                        wgt_load_addr_reg <= wl_addr_cnt;
                        wgt_load_data_reg <= mem_rdata[DATA_W-1:0];
                        
                        // Increment counters
                        wl_addr_cnt <= wl_addr_cnt + 1;
                        wl_mem_addr <= wl_mem_addr + 1;
                        
                        // Check if layer complete
                        if (wl_addr_cnt >= weights_per_layer[wl_layer_idx] - 1) begin
                            wl_state <= WL_NEXT_LAYER;
                        end else begin
                            wl_state <= WL_READ_MEM;
                        end
                    end
                end
                
                WL_NEXT_LAYER: begin
                    wl_addr_cnt <= 0;
                    
                    if (wl_layer_idx < NUM_LAYERS - 1) begin
                        wl_layer_idx <= wl_layer_idx + 1;
                        wl_mem_addr <= weights_base_addr[wl_layer_idx + 1];
                        wl_state <= WL_READ_MEM;
                    end else begin
                        wl_state <= WL_DONE;
                    end
                end
                
                WL_DONE: begin
                    weights_loaded <= 1;
                    wl_state <= WL_IDLE;
                end
            endcase
        end
    end
    
    // =========================================================================
    // INPUT FEEDER FSM
    // =========================================================================
    
    localparam IF_IDLE     = 2'b00;
    localparam IF_READ_MEM = 2'b01;
    localparam IF_FEED     = 2'b10;
    
    reg [1:0] if_state;
    reg [MEM_ADDR_W-1:0] if_mem_addr;
    reg [15:0] if_pixel_cnt;
    
    // Input image size: 28x28x1 = 784 pixels
    localparam INPUT_SIZE = 784;
    
    reg [DATA_W-1:0] input_data_reg;
    reg input_valid_reg;
    
    assign pipeline_in_data = input_data_reg;
    assign pipeline_in_valid = input_valid_reg;
    
    always @(posedge clk) begin
        if (rst) begin
            if_state <= IF_IDLE;
            if_mem_addr <= 0;
            if_pixel_cnt <= 0;
            input_valid_reg <= 0;
        end else begin
            input_valid_reg <= 0;  // Default
            
            case (if_state)
                IF_IDLE: begin
                    if (start_inference && weights_loaded && pipeline_ready) begin
                        if_mem_addr <= input_base_addr;
                        if_pixel_cnt <= 0;
                        if_state <= IF_READ_MEM;
                    end
                end
                
                IF_READ_MEM: begin
                    mem_addr <= if_mem_addr;
                    mem_read <= 1;
                    if_state <= IF_FEED;
                end
                
                IF_FEED: begin
                    if (mem_rdata_valid) begin
                        if (pipeline_in_ready) begin
                            input_data_reg <= mem_rdata[DATA_W-1:0];
                            input_valid_reg <= 1;
                            
                            if_pixel_cnt <= if_pixel_cnt + 1;
                            if_mem_addr <= if_mem_addr + 1;
                            
                            if (if_pixel_cnt >= INPUT_SIZE - 1) begin
                                if_state <= IF_IDLE;
                            end else begin
                                if_state <= IF_READ_MEM;
                            end
                        end
                    end
                end
            endcase
        end
    end
    
    // =========================================================================
    // OUTPUT COLLECTOR FSM
    // =========================================================================
    
    localparam OC_IDLE  = 2'b00;
    localparam OC_COLLECT = 2'b01;
    localparam OC_WRITE = 2'b10;
    
    reg [1:0] oc_state;
    reg [MEM_ADDR_W-1:0] oc_mem_addr;
    reg [15:0] oc_pixel_cnt;
    
    // Output size: 4x4x16 = 256 values
    localparam OUTPUT_SIZE = 256;
    
    reg pipeline_out_ready_reg;
    assign pipeline_out_ready = pipeline_out_ready_reg;
    
    always @(posedge clk) begin
        if (rst) begin
            oc_state <= OC_IDLE;
            oc_mem_addr <= 0;
            oc_pixel_cnt <= 0;
            pipeline_out_ready_reg <= 0;
            inference_done <= 0;
            mem_write <= 0;
        end else begin
            mem_write <= 0;  // Default
            inference_done <= 0;
            
            case (oc_state)
                OC_IDLE: begin
                    if (start_inference && weights_loaded && pipeline_ready) begin
                        oc_mem_addr <= output_base_addr;
                        oc_pixel_cnt <= 0;
                        pipeline_out_ready_reg <= 1;
                        oc_state <= OC_COLLECT;
                    end
                end
                
                OC_COLLECT: begin
                    if (pipeline_out_valid) begin
                        oc_state <= OC_WRITE;
                    end
                end
                
                OC_WRITE: begin
                    mem_addr <= oc_mem_addr;
                    mem_wdata <= {{(MEM_DATA_W-ACC_W){1'b0}}, pipeline_out_data};
                    mem_write <= 1;
                    
                    oc_pixel_cnt <= oc_pixel_cnt + 1;
                    oc_mem_addr <= oc_mem_addr + 1;
                    
                    if (oc_pixel_cnt >= OUTPUT_SIZE - 1) begin
                        inference_done <= 1;
                        pipeline_out_ready_reg <= 0;
                        oc_state <= OC_IDLE;
                    end else begin
                        oc_state <= OC_COLLECT;
                    end
                end
            endcase
        end
    end
    
    // =========================================================================
    // STATUS SIGNALS
    // =========================================================================
    
    assign system_ready = weights_loaded && pipeline_ready && 
                         (if_state == IF_IDLE) && (oc_state == OC_IDLE);
    
    assign pipeline_active = (if_state != IF_IDLE) || (oc_state != OC_IDLE) || 
                            (|layer_busy);

endmodule
