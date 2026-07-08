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
    
    // External memory interface (for weights and input data).
    // mem_addr / mem_read are driven by a combinational MUX over the three
    // internal FSMs (weight loader, input feeder, output collector) so the
    // signals have a single driver as synthesis/DRC requires.
    output wire [MEM_ADDR_W-1:0] mem_addr,
    output wire mem_read,
    input  wire [MEM_DATA_W-1:0] mem_rdata,
    input  wire mem_rdata_valid,
    output reg  mem_write,
    output reg  [MEM_DATA_W-1:0] mem_wdata,
    
    // Configuration (base addresses in external memory)
    input  wire [MEM_ADDR_W-1:0] input_base_addr,
    input  wire [MEM_ADDR_W-1:0] output_base_addr,
    input  wire [MEM_ADDR_W*NUM_LAYERS-1:0] weights_base_addr,  // Flattened: layer[i] = weights_base_addr[MEM_ADDR_W*(i+1)-1 : MEM_ADDR_W*i]

    // Tensor sizes (NEW: host-programmable so the same bitstream can serve
    // different topologies — LeNet 784/256, YOLO-Nano 256/20, etc.)
    input  wire [15:0] input_size_in,                          // pixels per frame
    input  wire [15:0] output_size_in,                         // output elements
    input  wire [ADDR_W*NUM_LAYERS-1:0] weights_per_layer_in,  // per-layer wgt count

    // Debug/monitoring
    output wire [NUM_LAYERS-1:0] layer_busy,
    output wire [NUM_LAYERS-1:0] layer_ready_dbg,   // each layer's ready flag
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
        .layer_busy(layer_busy),
        .layer_ready_out(layer_ready_dbg)
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
    
    // Weights size per layer. Driven by `weights_per_layer_in` packed bus
    // from the top-level config registers so the host can rewire the pipeline
    // for different workloads (LeNet, YOLO-Nano, etc.) at boot time.
    wire [ADDR_W-1:0] weights_per_layer [0:NUM_LAYERS-1];
    genvar gi;
    generate
        for (gi = 0; gi < NUM_LAYERS; gi = gi + 1) begin : WPL
            assign weights_per_layer[gi] =
                weights_per_layer_in[gi*ADDR_W +: ADDR_W];
        end
    endgenerate
    
    always @(posedge clk) begin
        if (rst) begin
            wl_state <= WL_IDLE;
            wl_layer_idx <= 0;
            wl_addr_cnt <= 0;
            wl_mem_addr <= 0;
            weights_loaded <= 0;
            wgt_load_en_reg <= 0;
        end else begin
            // Default
            wgt_load_en_reg <= 0;
            
            case (wl_state)
                WL_IDLE: begin
                    // Refuse a weight load while the pipeline is mid-frame:
                    // WL and IF share mem_rdata_valid, so a load issued while
                    // the feeder is waiting on a read would cross-feed data
                    // between the two FSMs. Recovery path is soft reset first.
                    if (load_weights && !(|layer_busy)) begin
                        wl_layer_idx <= 0;
                        wl_addr_cnt <= 0;
                        wl_mem_addr <= weights_base_addr[MEM_ADDR_W*1-1 -: MEM_ADDR_W];  // index 0
                        weights_loaded <= 0;
                        wl_state <= WL_READ_MEM;
                    end
                end
                
                WL_READ_MEM: begin
                    if (weights_per_layer[wl_layer_idx] > 0) begin
                        // mem_addr / mem_read are driven combinationally
                        // (see assigns below); just advance the FSM.
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
                        // Do NOT reset wl_mem_addr — the per-layer base
                        // registers were never wired up beyond layer 0, so
                        // just keep reading DRAM sequentially from where the
                        // previous layer's block ended. C must lay weights
                        // out contiguously in the order the pipeline
                        // consumes them (Layer 0, [skip pool], [skip pool],
                        // Layer 3, ...).
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
    localparam IF_HOLD     = 2'b11;   // skid: hold beat until pipeline accepts
    
    reg [1:0] if_state;
    reg [MEM_ADDR_W-1:0] if_mem_addr;
    reg [15:0] if_pixel_cnt;
    
    // Input image size: 28x28x1 = 784 pixels
    // INPUT_SIZE is now driven by the input_size_in port (host-programmable
    // via the CTRL register window). Default 256 pixels (YOLO-Nano 16x16) if
    // the host doesn't program it.
    wire [15:0] INPUT_SIZE = (input_size_in != 16'd0) ? input_size_in : 16'd256;
    
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
                    // Interlock: never start feeding while any layer is still
                    // mid-frame — overlapping frames permanently misalign the
                    // streaming pipeline. (The top wrapper also gates START on
                    // network_busy; this guards direct-core users like the TB.)
                    if (start_inference && weights_loaded && !(|layer_busy)) begin
                        if_mem_addr <= input_base_addr;
                        if_pixel_cnt <= 0;
                        if_state <= IF_READ_MEM;
                    end
                end

                IF_READ_MEM: begin
                    // mem_addr / mem_read driven combinationally below
                    if_state <= IF_FEED;
                end

                IF_FEED: begin
                    // mem_rdata_valid is a single-cycle pulse from the AXI
                    // read channel. Latch the beat unconditionally — the old
                    // code required pipeline_in_ready on that exact cycle and
                    // otherwise LOST the pixel and deadlocked (no further
                    // read is ever issued from this state).
                    if (mem_rdata_valid) begin
                        input_data_reg <= mem_rdata[DATA_W-1:0];
                        input_valid_reg <= 1;
                        if_state <= IF_HOLD;
                    end
                end

                IF_HOLD: begin
                    // Present the beat until the pipeline takes it
                    // (valid && ready handshake), then move on.
                    if (pipeline_in_ready) begin
                        input_valid_reg <= 0;
                        if_pixel_cnt <= if_pixel_cnt + 1;
                        if_mem_addr <= if_mem_addr + 1;

                        if (if_pixel_cnt >= INPUT_SIZE - 1) begin
                            if_state <= IF_IDLE;
                        end else begin
                            if_state <= IF_READ_MEM;
                        end
                    end else begin
                        input_valid_reg <= 1;   // hold against the default clear
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
    // OUTPUT_SIZE driven by output_size_in port; default 20 (YOLO-Nano: 4
    // grid cells * 5 params).
    wire [15:0] OUTPUT_SIZE = (output_size_in != 16'd0) ? output_size_in : 16'd20;
    
    reg pipeline_out_ready_reg;
    // Ready is only presented to the layer when we are NOT waiting on the
    // AXI write channel to accept a previous beat. Without this pause every
    // second write was being dropped because stream_processing_top's write
    // FSM ignores mem_write pulses while its axi_awvalid_reg is still 1.
    reg [3:0] oc_write_wait;
    localparam [3:0] OC_WRITE_LATENCY = 4'd8;   // safe for S_AXI_HP0 single-beat
    assign pipeline_out_ready = pipeline_out_ready_reg && (oc_write_wait == 4'd0);

    // Registered address held stable while mem_write is high, so the mem_addr
    // mux presents the correct address on the cycle the AXI FSM latches it.
    // (Previously the mux used the live oc_mem_addr, which had already
    //  advanced by the time mem_write pulsed, and the mux condition also
    //  went false — so writes landed at address 0.)
    reg                  oc_wr_active;
    reg [MEM_ADDR_W-1:0] oc_wr_addr;

    always @(posedge clk) begin
        if (rst) begin
            oc_state <= OC_IDLE;
            oc_mem_addr <= 0;
            oc_pixel_cnt <= 0;
            pipeline_out_ready_reg <= 0;
            inference_done <= 0;
            mem_write <= 0;
            oc_write_wait <= 4'd0;
            oc_wr_active <= 1'b0;
            oc_wr_addr   <= {MEM_ADDR_W{1'b0}};
        end else begin
            mem_write <= 0;  // Default
            inference_done <= 0;
            oc_wr_active <= 1'b0;   // pulses for 1 cycle alongside mem_write
            if (oc_write_wait != 4'd0) oc_write_wait <= oc_write_wait - 4'd1;

            case (oc_state)
                OC_IDLE: begin
                    pipeline_out_ready_reg <= 1'b0;
                    // Same interlock as the input feeder — both FSMs observe
                    // the identical condition and launch on the same cycle.
                    if (start_inference && weights_loaded && !(|layer_busy)) begin
                        oc_mem_addr <= output_base_addr;
                        oc_pixel_cnt <= 0;
                        pipeline_out_ready_reg <= 1'b1;
                        oc_state <= OC_COLLECT;
                    end
                end

                OC_COLLECT: begin
                    if (pipeline_out_valid && pipeline_out_ready) begin
                        mem_wdata     <= {{(MEM_DATA_W-ACC_W){1'b0}}, pipeline_out_data};
                        mem_write     <= 1'b1;
                        oc_wr_active  <= 1'b1;
                        oc_wr_addr    <= oc_mem_addr;   // hold for the write cycle
                        oc_pixel_cnt  <= oc_pixel_cnt + 1;
                        oc_mem_addr   <= oc_mem_addr + 1;
                        oc_write_wait <= OC_WRITE_LATENCY;

                        if (oc_pixel_cnt >= OUTPUT_SIZE - 1) begin
                            inference_done         <= 1'b1;
                            pipeline_out_ready_reg <= 1'b0;
                            oc_state               <= OC_IDLE;
                        end
                    end
                end

                default: oc_state <= OC_IDLE;
            endcase
        end
    end
    
    // =========================================================================
    // SHARED MEMORY BUS — single-driver mux
    // =========================================================================
    // The three FSMs above (WL, IF, OC) are mutually exclusive on the bus:
    //   WL  : only active when load_weights triggered (before inference)
    //   IF  : active in IF_READ_MEM for one cycle per input pixel
    //   OC  : drives the bus the cycle a valid+ready handshake fires in
    //         OC_COLLECT (= the same cycle mem_write pulses high)
    // The mux below produces a single-driver mem_addr / mem_read so DRC is
    // happy. Priority WL > IF > OC by construction.

    assign mem_addr = (wl_state == WL_READ_MEM) ? wl_mem_addr :
                      (if_state == IF_READ_MEM) ? if_mem_addr :
                      oc_wr_active               ? oc_wr_addr :
                                                  {MEM_ADDR_W{1'b0}};

    // NOTE: WL_READ_MEM is also entered for zero-weight layers (the skip
    // path); qualifying with weights_per_layer prevents a SPURIOUS read
    // request there. On the real AXI bus those spurious responses came back
    // later and were consumed as weight data — shifting every subsequent
    // layer's weights (bit-exact in the idealized sim, garbage on the board).
    assign mem_read = (wl_state == WL_READ_MEM &&
                       weights_per_layer[wl_layer_idx] > 0) ||
                      (if_state == IF_READ_MEM);

    // =========================================================================
    // STATUS SIGNALS
    // =========================================================================

    assign system_ready = weights_loaded && pipeline_ready &&
                         (if_state == IF_IDLE) && (oc_state == OC_IDLE);

    assign pipeline_active = (if_state != IF_IDLE) || (oc_state != OC_IDLE) ||
                            (|layer_busy);

endmodule
