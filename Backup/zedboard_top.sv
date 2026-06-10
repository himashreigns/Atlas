// ===========================================================================
// zedboard_top.sv
// ZedBoard (XC7Z020-CLG484-1) top wrapper for the streaming DNN accelerator.
// Provides:
//   - 100 MHz clock input from on-board oscillator (Y9)
//   - active-low reset from BTNC push-button (P16)
//   - DIP switches SW0/SW1 to manually pulse start_inference / load_weights
//   - LD0..LD7 status LEDs (system_ready, weights_loaded, done, busy, heartbeat)
// Constraints live in xdc/zedboard.xdc.
// ===========================================================================
`timescale 1ns/1ps
`include "dnn_config.vh"

module zedboard_top (
    input  wire        clk,         // Y9, 100 MHz
    input  wire        rst_n,       // BTNC active-low
    input  wire [1:0]  switches,    // SW0 = start_inference, SW1 = load_weights
    output wire [7:0]  leds
);

    // ----------------------------------------------------------------------
    // Reset synchronizer: bring async BTNC into the system clock domain.
    // The XDC declares this path as false_path, so the 2-FF synchronizer is
    // a pure metastability hardener.
    // ----------------------------------------------------------------------
    reg rst_sync_0, rst_sync_1;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            rst_sync_0 <= 1'b1;
            rst_sync_1 <= 1'b1;
        end else begin
            rst_sync_0 <= 1'b0;
            rst_sync_1 <= rst_sync_0;
        end
    end
    wire rst = rst_sync_1;

    // ----------------------------------------------------------------------
    // Switch edge detection: produce one-cycle pulses on rising edge of each
    // switch input (toggling SWn off->on triggers the corresponding action).
    // ----------------------------------------------------------------------
    reg  [1:0] sw_sync_0, sw_sync_1, sw_prev;
    always @(posedge clk) begin
        sw_sync_0 <= switches;
        sw_sync_1 <= sw_sync_0;
        sw_prev   <= sw_sync_1;
    end
    wire start_inference = sw_sync_1[0] & ~sw_prev[0];
    wire load_weights    = sw_sync_1[1] & ~sw_prev[1];

    // ----------------------------------------------------------------------
    // Heartbeat counter: ~1 Hz LED toggle from 100 MHz clock
    // ----------------------------------------------------------------------
    reg [25:0] heartbeat_cnt;
    always @(posedge clk) begin
        if (rst) heartbeat_cnt <= 26'd0;
        else     heartbeat_cnt <= heartbeat_cnt + 1'b1;
    end

    // ----------------------------------------------------------------------
    // Static base addresses for input/output/weight regions in external mem
    // ----------------------------------------------------------------------
    localparam MEM_ADDR_W = 20;
    localparam NUM_LAYERS = `DNN_NUM_LAYERS;

    wire [MEM_ADDR_W-1:0] input_base_addr   = 20'h00000;
    wire [MEM_ADDR_W-1:0] output_base_addr  = 20'h10000;

    // Per-layer weight bases packed into a single vector
    reg [MEM_ADDR_W*NUM_LAYERS-1:0] weights_base_addr;
    initial begin
        weights_base_addr = '0;
        weights_base_addr[MEM_ADDR_W*1-1 -: MEM_ADDR_W] = 20'h20000;
        weights_base_addr[MEM_ADDR_W*2-1 -: MEM_ADDR_W] = 20'h20100;
        weights_base_addr[MEM_ADDR_W*3-1 -: MEM_ADDR_W] = 20'h30000;
        weights_base_addr[MEM_ADDR_W*4-1 -: MEM_ADDR_W] = 20'h30A00;
    end

    // ----------------------------------------------------------------------
    // External memory port (would attach to AXI BRAM controller / DDR3 IP)
    // For the synthesis target a placeholder block-RAM model would be
    // instantiated here; we leave the port floating in this wrapper since
    // the goal is timing / constraint validation, not functional simulation.
    // ----------------------------------------------------------------------
    wire [MEM_ADDR_W-1:0] mem_addr;
    wire                  mem_read;
    wire                  mem_write;
    wire [31:0]           mem_wdata;
    reg  [31:0]           mem_rdata;
    reg                   mem_rdata_valid;

    initial begin
        mem_rdata       = 32'h0;
        mem_rdata_valid = 1'b0;
    end

    // ----------------------------------------------------------------------
    // DUT
    // ----------------------------------------------------------------------
    wire                  inference_done;
    wire                  system_ready;
    wire                  weights_loaded;
    wire [NUM_LAYERS-1:0] layer_busy;
    wire                  pipeline_active;

    streaming_nn_system #(
        .NUM_LAYERS (NUM_LAYERS),
        .MEM_ADDR_W (MEM_ADDR_W),
        .MEM_DATA_W (32)
    ) u_dut (
        .clk              (clk),
        .rst              (rst),
        .start_inference  (start_inference),
        .inference_done   (inference_done),
        .system_ready     (system_ready),
        .load_weights     (load_weights),
        .weights_loaded   (weights_loaded),
        .mem_addr         (mem_addr),
        .mem_read         (mem_read),
        .mem_rdata        (mem_rdata),
        .mem_rdata_valid  (mem_rdata_valid),
        .mem_write        (mem_write),
        .mem_wdata        (mem_wdata),
        .input_base_addr  (input_base_addr),
        .output_base_addr (output_base_addr),
        .weights_base_addr(weights_base_addr),
        .layer_busy       (layer_busy),
        .pipeline_active  (pipeline_active)
    );

    // ----------------------------------------------------------------------
    // LED assignments
    // ----------------------------------------------------------------------
    assign leds[0] = system_ready;
    assign leds[1] = weights_loaded;
    assign leds[2] = inference_done;
    assign leds[3] = layer_busy[0];
    assign leds[4] = (NUM_LAYERS > 1) ? layer_busy[1] : 1'b0;
    assign leds[5] = (NUM_LAYERS > 2) ? layer_busy[2] : 1'b0;
    assign leds[6] = (NUM_LAYERS > 3) ? layer_busy[3] : 1'b0;
    assign leds[7] = heartbeat_cnt[25];   // ~1.5 Hz blink at 100 MHz

endmodule
