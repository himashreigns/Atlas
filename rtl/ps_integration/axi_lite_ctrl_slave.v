// =============================================================================
// axi_lite_ctrl_slave.v
//
// Standard AXI4-Lite slave that bridges PS M_AXI_GP0 to the simplified ctrl
// handshake used by stream_processing_top:
//   ctrl_addr / ctrl_wdata / ctrl_wvalid / ctrl_wready  (write)
//   ctrl_addr / ctrl_rvalid / ctrl_rdata / ctrl_rready  (read)
//
// Modelled after the canonical Xilinx AXI-Lite slave template — keep the
// FSM SHORT, deassert ready signals only AFTER a transfer has completed,
// and hold response valid until acknowledged.
// =============================================================================
`default_nettype none

module axi_lite_ctrl_slave #(
    parameter ADDR_W = 16
)(
    input  wire                  s_axi_aclk,
    input  wire                  s_axi_aresetn,

    // ---- AXI4-Lite slave ----------------------------------------------------
    input  wire [ADDR_W-1:0]     s_axi_awaddr,
    input  wire [2:0]            s_axi_awprot,
    input  wire                  s_axi_awvalid,
    output reg                   s_axi_awready,
    input  wire [31:0]           s_axi_wdata,
    input  wire [3:0]            s_axi_wstrb,
    input  wire                  s_axi_wvalid,
    output reg                   s_axi_wready,
    output reg  [1:0]            s_axi_bresp,
    output reg                   s_axi_bvalid,
    input  wire                  s_axi_bready,
    input  wire [ADDR_W-1:0]     s_axi_araddr,
    input  wire [2:0]            s_axi_arprot,
    input  wire                  s_axi_arvalid,
    output reg                   s_axi_arready,
    output reg  [31:0]           s_axi_rdata,
    output reg  [1:0]            s_axi_rresp,
    output reg                   s_axi_rvalid,
    input  wire                  s_axi_rready,

    // ---- Simplified ctrl interface (to stream_processing_top) ---------------
    output wire [31:0]           ctrl_addr,
    output reg  [31:0]           ctrl_wdata,
    output reg                   ctrl_wvalid,
    input  wire                  ctrl_wready,
    output reg                   ctrl_rvalid,
    input  wire [31:0]           ctrl_rdata,
    input  wire                  ctrl_rready
);

    // Latched per-direction addresses + mux to the single ctrl_addr port
    reg [31:0] aw_addr_q;
    reg [31:0] ar_addr_q;
    assign ctrl_addr = ctrl_wvalid ? aw_addr_q : ar_addr_q;

    // -------------------------------------------------------------------------
    // WRITE channel
    // -------------------------------------------------------------------------
    // Two flags drive the FSM:
    //   aw_done = AW handshake captured (awvalid & awready)
    //   w_done  = W  handshake captured (wvalid  & wready)
    // When BOTH are captured, pulse ctrl_wvalid for one cycle and assert
    // s_axi_bvalid. Hold s_axi_bvalid until s_axi_bready handshakes back.
    reg aw_done, w_done;

    always @(posedge s_axi_aclk) begin
        if (!s_axi_aresetn) begin
            s_axi_awready <= 1'b0;
            s_axi_wready  <= 1'b0;
            s_axi_bvalid  <= 1'b0;
            s_axi_bresp   <= 2'b00;
            aw_addr_q     <= 32'b0;
            ctrl_wdata    <= 32'b0;
            ctrl_wvalid   <= 1'b0;
            aw_done       <= 1'b0;
            w_done        <= 1'b0;
        end else begin
            // Default: ctrl_wvalid pulses for exactly 1 cycle when both
            // handshakes are captured.
            ctrl_wvalid <= 1'b0;

            // --- AW handshake -------------------------------------------------
            if (!aw_done) begin
                s_axi_awready <= 1'b1;
                if (s_axi_awvalid && s_axi_awready) begin
                    aw_addr_q     <= {{(32-ADDR_W){1'b0}}, s_axi_awaddr};
                    s_axi_awready <= 1'b0;
                    aw_done       <= 1'b1;
                end
            end

            // --- W handshake --------------------------------------------------
            if (!w_done) begin
                s_axi_wready <= 1'b1;
                if (s_axi_wvalid && s_axi_wready) begin
                    ctrl_wdata   <= s_axi_wdata;
                    s_axi_wready <= 1'b0;
                    w_done       <= 1'b1;
                end
            end

            // --- Both arrived: deliver and respond ----------------------------
            if (aw_done && w_done && !s_axi_bvalid) begin
                ctrl_wvalid  <= 1'b1;
                s_axi_bvalid <= 1'b1;
                s_axi_bresp  <= 2'b00;
            end

            // --- B handshake (response acknowledged) --------------------------
            if (s_axi_bvalid && s_axi_bready) begin
                s_axi_bvalid <= 1'b0;
                aw_done      <= 1'b0;
                w_done       <= 1'b0;
            end
        end
    end

    // -------------------------------------------------------------------------
    // READ channel
    // -------------------------------------------------------------------------
    reg ar_done;
    reg data_ready;

    always @(posedge s_axi_aclk) begin
        if (!s_axi_aresetn) begin
            s_axi_arready <= 1'b0;
            s_axi_rvalid  <= 1'b0;
            s_axi_rresp   <= 2'b00;
            s_axi_rdata   <= 32'b0;
            ar_addr_q     <= 32'b0;
            ctrl_rvalid   <= 1'b0;
            ar_done       <= 1'b0;
            data_ready    <= 1'b0;
        end else begin
            // --- AR handshake -------------------------------------------------
            if (!ar_done) begin
                s_axi_arready <= 1'b1;
                if (s_axi_arvalid && s_axi_arready) begin
                    ar_addr_q     <= {{(32-ADDR_W){1'b0}}, s_axi_araddr};
                    s_axi_arready <= 1'b0;
                    ar_done       <= 1'b1;
                    ctrl_rvalid   <= 1'b1;   // request data from core
                    data_ready    <= 1'b0;
                end
            end

            // --- Wait for data from core --------------------------------------
            if (ctrl_rvalid && ctrl_rready) begin
                s_axi_rdata  <= ctrl_rdata;
                s_axi_rresp  <= 2'b00;
                s_axi_rvalid <= 1'b1;
                ctrl_rvalid  <= 1'b0;
                data_ready   <= 1'b1;
            end

            // --- R handshake --------------------------------------------------
            if (s_axi_rvalid && s_axi_rready) begin
                s_axi_rvalid <= 1'b0;
                ar_done      <= 1'b0;
                data_ready   <= 1'b0;
            end
        end
    end

endmodule

`default_nettype wire
