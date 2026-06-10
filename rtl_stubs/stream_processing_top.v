// Top-Level Wrapper for FPGA
// Unified streaming neural network processing system
// Supports both fixed pipeline and reconfigurable modes

// MODE: 0 = FIXED_PIPELINE, 1 = RECONFIGURABLE
// String parameters are SystemVerilog-only; use integer for Verilog-2001.
module stream_processing_top #(
    parameter MODE = 1,  // 0=FIXED_PIPELINE  1=RECONFIGURABLE
    
    // Fixed pipeline parameters
    parameter N = 8,
    parameter DATA_W = 16,
    parameter ACC_W = 32,
    parameter ADDR_W = 10,
    parameter NUM_LAYERS = 4,
    
    // Reconfigurable parameters
    parameter TOTAL_MAC_UNITS = 64,
    parameter TOTAL_BRAM_BLOCKS = 32,
    parameter MAX_LAYERS = 16,
    
    // Memory interface
    parameter MEM_ADDR_W = 20,
    parameter MEM_DATA_W = 32
)(
    // Clock and reset
    input wire clk,
    input wire rst_n,  // Active low reset for FPGA
    
    // Control interface (AXI-Lite style)
    input wire [31:0] ctrl_addr,
    input wire [31:0] ctrl_wdata,
    input wire ctrl_wvalid,
    output wire ctrl_wready,
    input wire ctrl_rvalid,
    output wire [31:0] ctrl_rdata,
    output wire ctrl_rready,
    
    // Memory interface (AXI4 simplified)
    output wire [MEM_ADDR_W-1:0] m_axi_araddr,
    output wire m_axi_arvalid,
    input wire m_axi_arready,
    input wire [MEM_DATA_W-1:0] m_axi_rdata,
    input wire m_axi_rvalid,
    output wire m_axi_rready,
    
    output wire [MEM_ADDR_W-1:0] m_axi_awaddr,
    output wire m_axi_awvalid,
    input wire m_axi_awready,
    output wire [MEM_DATA_W-1:0] m_axi_wdata,
    output wire m_axi_wvalid,
    input wire m_axi_wready,
    input wire m_axi_bvalid,
    output wire m_axi_bready,
    
    // Status outputs
    output wire [7:0] status_leds,
    output wire done_interrupt,
    output wire error_interrupt
);

    // Internal reset (synchronous, active high)
    wire rst;
    
    // Reset synchronizer
    reg [2:0] rst_sync;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            rst_sync <= 3'b111;
        else
            rst_sync <= {rst_sync[1:0], 1'b0};
    end
    assign rst = rst_sync[2];
    
    // =========================================================================
    // CONTROL REGISTERS
    // =========================================================================
    
    // Control register addresses
    localparam ADDR_CTRL = 32'h0000;       // Control register
    localparam ADDR_STATUS = 32'h0004;     // Status register
    localparam ADDR_CONFIG = 32'h0008;     // Configuration
    localparam ADDR_INPUT_BASE = 32'h0010; // Input base address
    localparam ADDR_OUTPUT_BASE = 32'h0014;// Output base address
    localparam ADDR_WEIGHT_BASE = 32'h0018;// Weight base address
    
    // Control register
    reg start;
    reg load_weights;
    reg [1:0] operation_mode;  // 0=INFERENCE, 1=TRAIN, 2=TEST
    
    // Status register
    wire network_done;
    wire network_busy;
    wire weights_loaded;
    wire [NUM_LAYERS-1:0] layer_busy;
    
    // Configuration registers
    reg [MEM_ADDR_W-1:0] input_base_addr;
    reg [MEM_ADDR_W-1:0] output_base_addr;
    // Flat packed bus; streaming_nn_system expects [MEM_ADDR_W*NUM_LAYERS-1:0].
    // Unpacked arrays cannot be passed as module ports in Verilog-2001.
    reg [MEM_ADDR_W*NUM_LAYERS-1:0] weights_base_addr;

    // 8-bit slice of NUM_LAYERS; Vivado rejects bit-selects on unsized parameters
    localparam [7:0] NUM_LAYERS_BYTE = NUM_LAYERS & 8'hFF;
    
    // Control register write
    always @(posedge clk) begin
        if (rst) begin
            start <= 0;
            load_weights <= 0;
            operation_mode <= 0;
            input_base_addr <= 0;
            output_base_addr <= 0;
            weights_base_addr <= 0;
        end else begin
            // Auto-clear start
            start <= 0;
            load_weights <= 0;
            
            if (ctrl_wvalid && ctrl_wready) begin
                case (ctrl_addr)
                    ADDR_CTRL: begin
                        start <= ctrl_wdata[0];
                        load_weights <= ctrl_wdata[1];
                        operation_mode <= ctrl_wdata[3:2];
                    end
                    ADDR_INPUT_BASE: input_base_addr <= ctrl_wdata[MEM_ADDR_W-1:0];
                    ADDR_OUTPUT_BASE: output_base_addr <= ctrl_wdata[MEM_ADDR_W-1:0];
                    ADDR_WEIGHT_BASE: weights_base_addr[MEM_ADDR_W-1:0] <= ctrl_wdata[MEM_ADDR_W-1:0];
                endcase
            end
        end
    end
    
    // Control ready (always ready for writes)
    assign ctrl_wready = 1'b1;
    
    // Status register read
    reg [31:0] ctrl_rdata_reg;
    reg ctrl_rready_reg;
    
    always @(posedge clk) begin
        if (rst) begin
            ctrl_rdata_reg <= 0;
            ctrl_rready_reg <= 0;
        end else begin
            ctrl_rready_reg <= 0;
            
            if (ctrl_rvalid) begin
                ctrl_rready_reg <= 1;
                case (ctrl_addr)
                    ADDR_STATUS: begin
                        ctrl_rdata_reg <= {
                            16'd0,
                            layer_busy,
                            3'd0,
                            weights_loaded,
                            network_busy,
                            network_done
                        };
                    end
                    ADDR_CONFIG: begin
                        ctrl_rdata_reg <= {24'd0, NUM_LAYERS_BYTE};
                    end
                    default: ctrl_rdata_reg <= 32'hDEADBEEF;
                endcase
            end
        end
    end
    
    assign ctrl_rdata = ctrl_rdata_reg;
    assign ctrl_rready = ctrl_rready_reg;
    
    // =========================================================================
    // MEMORY INTERFACE CONVERSION
    // =========================================================================
    
    // Internal memory signals (simple read/write)
    wire [MEM_ADDR_W-1:0] mem_addr;
    wire mem_read;
    wire [MEM_DATA_W-1:0] mem_rdata;
    wire mem_rdata_valid;
    wire mem_write;
    wire [MEM_DATA_W-1:0] mem_wdata;
    
    // AXI Read Channel
    reg axi_arvalid_reg;
    reg [MEM_ADDR_W-1:0] axi_araddr_reg;
    
    always @(posedge clk) begin
        if (rst) begin
            axi_arvalid_reg <= 0;
            axi_araddr_reg <= 0;
        end else begin
            if (mem_read && !axi_arvalid_reg) begin
                axi_arvalid_reg <= 1;
                axi_araddr_reg <= mem_addr;
            end else if (axi_arvalid_reg && m_axi_arready) begin
                axi_arvalid_reg <= 0;
            end
        end
    end
    
    assign m_axi_araddr = axi_araddr_reg;
    assign m_axi_arvalid = axi_arvalid_reg;
    assign m_axi_rready = 1'b1;
    assign mem_rdata = m_axi_rdata;
    assign mem_rdata_valid = m_axi_rvalid;
    
    // AXI Write Channel
    reg axi_awvalid_reg;
    reg axi_wvalid_reg;
    reg [MEM_ADDR_W-1:0] axi_awaddr_reg;
    reg [MEM_DATA_W-1:0] axi_wdata_reg;
    
    always @(posedge clk) begin
        if (rst) begin
            axi_awvalid_reg <= 0;
            axi_wvalid_reg <= 0;
            axi_awaddr_reg <= 0;
            axi_wdata_reg <= 0;
        end else begin
            if (mem_write && !axi_awvalid_reg) begin
                axi_awvalid_reg <= 1;
                axi_wvalid_reg <= 1;
                axi_awaddr_reg <= mem_addr;
                axi_wdata_reg <= mem_wdata;
            end else begin
                if (axi_awvalid_reg && m_axi_awready)
                    axi_awvalid_reg <= 0;
                if (axi_wvalid_reg && m_axi_wready)
                    axi_wvalid_reg <= 0;
            end
        end
    end
    
    assign m_axi_awaddr = axi_awaddr_reg;
    assign m_axi_awvalid = axi_awvalid_reg;
    assign m_axi_wdata = axi_wdata_reg;
    assign m_axi_wvalid = axi_wvalid_reg;
    assign m_axi_bready = 1'b1;
    
    // =========================================================================
    // NEURAL NETWORK ACCELERATOR INSTANTIATION
    // =========================================================================
    
    generate
        if (MODE == 0) begin : FIXED_MODE   // 0 = FIXED_PIPELINE
            // Fixed pipeline streaming system
            streaming_nn_system #(
                .N(N),
                .DATA_W(DATA_W),
                .ACC_W(ACC_W),
                .ADDR_W(ADDR_W),
                .NUM_LAYERS(NUM_LAYERS),
                .MEM_ADDR_W(MEM_ADDR_W),
                .MEM_DATA_W(MEM_DATA_W)
            ) nn_core (
                .clk(clk),
                .rst(rst),
                .start_inference(start),
                .inference_done(network_done),
                .system_ready(),
                .load_weights(load_weights),
                .weights_loaded(weights_loaded),
                .mem_addr(mem_addr),
                .mem_read(mem_read),
                .mem_rdata(mem_rdata),
                .mem_rdata_valid(mem_rdata_valid),
                .mem_write(mem_write),
                .mem_wdata(mem_wdata),
                .input_base_addr(input_base_addr),
                .output_base_addr(output_base_addr),
                .weights_base_addr(weights_base_addr),
                .layer_busy(layer_busy),
                .pipeline_active(network_busy)
            );
            
        end else begin : RECONFIG_MODE       // 1 = RECONFIGURABLE
            // Reconfigurable system
            wire config_done;
            
            reconfigurable_nn_accelerator #(
                .TOTAL_MAC_UNITS(TOTAL_MAC_UNITS),
                .TOTAL_BRAM_BLOCKS(TOTAL_BRAM_BLOCKS),
                .DATA_W(DATA_W),
                .ACC_W(ACC_W),
                .MAX_LAYERS(MAX_LAYERS),
                .MAX_VIRTUAL_STAGES(4),
                .CONFIG_W(32)
            ) nn_core (
                .clk(clk),
                .rst(rst),
                .config_valid(ctrl_wvalid && (ctrl_addr >= 32'h0100)),
                .config_data(ctrl_wdata),
                .config_addr(ctrl_addr[7:0]),
                .config_done(config_done),
                .start_network(start),
                .network_done(network_done),
                .network_busy(network_busy),
                .ext_mem_addr(mem_addr),
                .ext_mem_read(mem_read),
                .ext_mem_rdata({96'd0, mem_rdata}),  // Pad to 128-bit
                .ext_mem_rdata_valid(mem_rdata_valid),
                .ext_mem_write(mem_write),
                .ext_mem_wdata(),  // Connect lower 32 bits
                .current_layer_idx(),
                .current_virtual_stage(),
                .stage_active(),
                .mac_utilization(),
                .mem_utilization()
            );
            
            assign weights_loaded = config_done;
            assign layer_busy = {NUM_LAYERS{network_busy}};
            
        end
    endgenerate
    
    // =========================================================================
    // STATUS OUTPUTS
    // =========================================================================
    
    // LED indicators
    assign status_leds[0] = network_busy;
    assign status_leds[1] = network_done;
    assign status_leds[2] = weights_loaded;
    assign status_leds[3] = |layer_busy;
    assign status_leds[7:4] = 4'b0;
    
    // Interrupts
    assign done_interrupt = network_done;
    assign error_interrupt = 1'b0;  // No error detection yet
    
    // =========================================================================
    // DEBUG SIGNALS (for ILA)
    // =========================================================================
    
    (* mark_debug = "true" *) wire debug_start = start;
    (* mark_debug = "true" *) wire debug_done = network_done;
    (* mark_debug = "true" *) wire debug_busy = network_busy;
    (* mark_debug = "true" *) wire [7:0] debug_layer_busy = layer_busy;

endmodule
