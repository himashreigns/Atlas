// =============================================================================
// dnn_accel_ps_top.v
//
// PS-attachable wrapper around stream_processing_top.
//
//   Zynq M_AXI_GP0  ──► s_axi_lite (ctrl regs)
//                       │
//                       └─► axi_lite_ctrl_slave ─► stream_processing_top
//                                                  │  m_axi (simple)
//                                                  ▼
//                                            axi_master_mem
//                                                  │
//   Zynq S_AXI_HP0  ◄──── m_axi (full AXI3)        │
//                       ◄────────────────────────── ┘
//
// One IRQ line out (done_interrupt) → Zynq IRQ_F2P[0].
// =============================================================================
`default_nettype none

module dnn_accel_ps_top #(
    parameter AXI_LITE_ADDR_W = 16,
    parameter ACCEL_ADDR_W    = 20,
    parameter AXI_DATA_W      = 32,
    parameter AXI_ID_W        = 6,
    parameter [31:0] DDR_BASE_ADDR = 32'h1000_0000
)(
    input  wire                    aclk,
    input  wire                    aresetn,

    // ----- AXI-Lite slave (from PS M_AXI_GP0) -----
    input  wire [AXI_LITE_ADDR_W-1:0] s_axi_lite_awaddr,
    input  wire [2:0]              s_axi_lite_awprot,
    input  wire                    s_axi_lite_awvalid,
    output wire                    s_axi_lite_awready,
    input  wire [31:0]             s_axi_lite_wdata,
    input  wire [3:0]              s_axi_lite_wstrb,
    input  wire                    s_axi_lite_wvalid,
    output wire                    s_axi_lite_wready,
    output wire [1:0]              s_axi_lite_bresp,
    output wire                    s_axi_lite_bvalid,
    input  wire                    s_axi_lite_bready,
    input  wire [AXI_LITE_ADDR_W-1:0] s_axi_lite_araddr,
    input  wire [2:0]              s_axi_lite_arprot,
    input  wire                    s_axi_lite_arvalid,
    output wire                    s_axi_lite_arready,
    output wire [31:0]             s_axi_lite_rdata,
    output wire [1:0]              s_axi_lite_rresp,
    output wire                    s_axi_lite_rvalid,
    input  wire                    s_axi_lite_rready,

    // ----- AXI master (to PS S_AXI_HP0) -----
    output wire [AXI_ID_W-1:0]     m_axi_hp_arid,
    output wire [31:0]             m_axi_hp_araddr,
    output wire [7:0]              m_axi_hp_arlen,
    output wire [2:0]              m_axi_hp_arsize,
    output wire [1:0]              m_axi_hp_arburst,
    output wire [1:0]              m_axi_hp_arlock,
    output wire [3:0]              m_axi_hp_arcache,
    output wire [2:0]              m_axi_hp_arprot,
    output wire [3:0]              m_axi_hp_arqos,
    output wire                    m_axi_hp_arvalid,
    input  wire                    m_axi_hp_arready,
    input  wire [AXI_ID_W-1:0]     m_axi_hp_rid,
    input  wire [AXI_DATA_W-1:0]   m_axi_hp_rdata,
    input  wire [1:0]              m_axi_hp_rresp,
    input  wire                    m_axi_hp_rlast,
    input  wire                    m_axi_hp_rvalid,
    output wire                    m_axi_hp_rready,
    output wire [AXI_ID_W-1:0]     m_axi_hp_awid,
    output wire [31:0]             m_axi_hp_awaddr,
    output wire [7:0]              m_axi_hp_awlen,
    output wire [2:0]              m_axi_hp_awsize,
    output wire [1:0]              m_axi_hp_awburst,
    output wire [1:0]              m_axi_hp_awlock,
    output wire [3:0]              m_axi_hp_awcache,
    output wire [2:0]              m_axi_hp_awprot,
    output wire [3:0]              m_axi_hp_awqos,
    output wire                    m_axi_hp_awvalid,
    input  wire                    m_axi_hp_awready,
    output wire [AXI_ID_W-1:0]     m_axi_hp_wid,
    output wire [AXI_DATA_W-1:0]   m_axi_hp_wdata,
    output wire [(AXI_DATA_W/8)-1:0] m_axi_hp_wstrb,
    output wire                    m_axi_hp_wlast,
    output wire                    m_axi_hp_wvalid,
    input  wire                    m_axi_hp_wready,
    input  wire [AXI_ID_W-1:0]     m_axi_hp_bid,
    input  wire [1:0]              m_axi_hp_bresp,
    input  wire                    m_axi_hp_bvalid,
    output wire                    m_axi_hp_bready,

    // ----- Sideband -----
    output wire [3:0]              status_leds, // {layer_busy_or, weights_loaded, done, busy}
    output wire                    irq_done
);

    // -------------------- Control plane bridge --------------------
    wire [31:0] ctrl_addr;
    wire [31:0] ctrl_wdata;
    wire        ctrl_wvalid;
    wire        ctrl_wready;
    wire        ctrl_rvalid;
    wire [31:0] ctrl_rdata;
    wire        ctrl_rready;

    axi_lite_ctrl_slave #(
        .ADDR_W(AXI_LITE_ADDR_W)
    ) u_ctrl_bridge (
        .s_axi_aclk    (aclk),
        .s_axi_aresetn (aresetn),
        .s_axi_awaddr  (s_axi_lite_awaddr),
        .s_axi_awprot  (s_axi_lite_awprot),
        .s_axi_awvalid (s_axi_lite_awvalid),
        .s_axi_awready (s_axi_lite_awready),
        .s_axi_wdata   (s_axi_lite_wdata),
        .s_axi_wstrb   (s_axi_lite_wstrb),
        .s_axi_wvalid  (s_axi_lite_wvalid),
        .s_axi_wready  (s_axi_lite_wready),
        .s_axi_bresp   (s_axi_lite_bresp),
        .s_axi_bvalid  (s_axi_lite_bvalid),
        .s_axi_bready  (s_axi_lite_bready),
        .s_axi_araddr  (s_axi_lite_araddr),
        .s_axi_arprot  (s_axi_lite_arprot),
        .s_axi_arvalid (s_axi_lite_arvalid),
        .s_axi_arready (s_axi_lite_arready),
        .s_axi_rdata   (s_axi_lite_rdata),
        .s_axi_rresp   (s_axi_lite_rresp),
        .s_axi_rvalid  (s_axi_lite_rvalid),
        .s_axi_rready  (s_axi_lite_rready),
        .ctrl_addr     (ctrl_addr),
        .ctrl_wdata    (ctrl_wdata),
        .ctrl_wvalid   (ctrl_wvalid),
        .ctrl_wready   (ctrl_wready),
        .ctrl_rvalid   (ctrl_rvalid),
        .ctrl_rdata    (ctrl_rdata),
        .ctrl_rready   (ctrl_rready)
    );

    // -------------------- Accelerator --------------------
    wire [ACCEL_ADDR_W-1:0] accel_araddr;
    wire                    accel_arvalid;
    wire                    accel_arready;
    wire [AXI_DATA_W-1:0]   accel_rdata;
    wire                    accel_rvalid;
    wire                    accel_rready;

    wire [ACCEL_ADDR_W-1:0] accel_awaddr;
    wire                    accel_awvalid;
    wire                    accel_awready;
    wire [AXI_DATA_W-1:0]   accel_wdata;
    wire                    accel_wvalid;
    wire                    accel_wready;
    wire                    accel_bvalid;
    wire                    accel_bready;

    wire [7:0] accel_leds;
    wire       accel_done_irq;
    wire       accel_err_irq;

    stream_processing_top #(
        // MODE=0 uses streaming_nn_system (synthesizable). MODE=1 selects
        // reconfigurable_nn_accelerator, which is presently simulation-only
        // (loop bound at line 234 not statically computable).
        .MODE(0),
        .MEM_ADDR_W(ACCEL_ADDR_W),
        .MEM_DATA_W(AXI_DATA_W)
    ) u_accel (
        .clk             (aclk),
        .rst_n           (aresetn),

        .ctrl_addr       (ctrl_addr),
        .ctrl_wdata      (ctrl_wdata),
        .ctrl_wvalid     (ctrl_wvalid),
        .ctrl_wready     (ctrl_wready),
        .ctrl_rvalid     (ctrl_rvalid),
        .ctrl_rdata      (ctrl_rdata),
        .ctrl_rready     (ctrl_rready),

        .m_axi_araddr    (accel_araddr),
        .m_axi_arvalid   (accel_arvalid),
        .m_axi_arready   (accel_arready),
        .m_axi_rdata     (accel_rdata),
        .m_axi_rvalid    (accel_rvalid),
        .m_axi_rready    (accel_rready),

        .m_axi_awaddr    (accel_awaddr),
        .m_axi_awvalid   (accel_awvalid),
        .m_axi_awready   (accel_awready),
        .m_axi_wdata     (accel_wdata),
        .m_axi_wvalid    (accel_wvalid),
        .m_axi_wready    (accel_wready),
        .m_axi_bvalid    (accel_bvalid),
        .m_axi_bready    (accel_bready),

        .status_leds     (accel_leds),
        .done_interrupt  (accel_done_irq),
        .error_interrupt (accel_err_irq)
    );

    // -------------------- Memory plane bridge --------------------
    axi_master_mem #(
        .ACCEL_ADDR_W (ACCEL_ADDR_W),
        .AXI_ADDR_W   (32),
        .AXI_DATA_W   (AXI_DATA_W),
        .AXI_ID_W     (AXI_ID_W),
        .BASE_ADDR    (DDR_BASE_ADDR)
    ) u_mem_bridge (
        .aclk           (aclk),
        .aresetn        (aresetn),

        .accel_araddr   (accel_araddr),
        .accel_arvalid  (accel_arvalid),
        .accel_arready  (accel_arready),
        .accel_rdata    (accel_rdata),
        .accel_rvalid   (accel_rvalid),
        .accel_rready   (accel_rready),

        .accel_awaddr   (accel_awaddr),
        .accel_awvalid  (accel_awvalid),
        .accel_awready  (accel_awready),
        .accel_wdata    (accel_wdata),
        .accel_wvalid   (accel_wvalid),
        .accel_wready   (accel_wready),
        .accel_bvalid   (accel_bvalid),
        .accel_bready   (accel_bready),

        .m_axi_arid     (m_axi_hp_arid),
        .m_axi_araddr   (m_axi_hp_araddr),
        .m_axi_arlen    (m_axi_hp_arlen),
        .m_axi_arsize   (m_axi_hp_arsize),
        .m_axi_arburst  (m_axi_hp_arburst),
        .m_axi_arlock   (m_axi_hp_arlock),
        .m_axi_arcache  (m_axi_hp_arcache),
        .m_axi_arprot   (m_axi_hp_arprot),
        .m_axi_arqos    (m_axi_hp_arqos),
        .m_axi_arvalid  (m_axi_hp_arvalid),
        .m_axi_arready  (m_axi_hp_arready),
        .m_axi_rid      (m_axi_hp_rid),
        .m_axi_rdata    (m_axi_hp_rdata),
        .m_axi_rresp    (m_axi_hp_rresp),
        .m_axi_rlast    (m_axi_hp_rlast),
        .m_axi_rvalid   (m_axi_hp_rvalid),
        .m_axi_rready   (m_axi_hp_rready),
        .m_axi_awid     (m_axi_hp_awid),
        .m_axi_awaddr   (m_axi_hp_awaddr),
        .m_axi_awlen    (m_axi_hp_awlen),
        .m_axi_awsize   (m_axi_hp_awsize),
        .m_axi_awburst  (m_axi_hp_awburst),
        .m_axi_awlock   (m_axi_hp_awlock),
        .m_axi_awcache  (m_axi_hp_awcache),
        .m_axi_awprot   (m_axi_hp_awprot),
        .m_axi_awqos    (m_axi_hp_awqos),
        .m_axi_awvalid  (m_axi_hp_awvalid),
        .m_axi_awready  (m_axi_hp_awready),
        .m_axi_wid      (m_axi_hp_wid),
        .m_axi_wdata    (m_axi_hp_wdata),
        .m_axi_wstrb    (m_axi_hp_wstrb),
        .m_axi_wlast    (m_axi_hp_wlast),
        .m_axi_wvalid   (m_axi_hp_wvalid),
        .m_axi_wready   (m_axi_hp_wready),
        .m_axi_bid      (m_axi_hp_bid),
        .m_axi_bresp    (m_axi_hp_bresp),
        .m_axi_bvalid   (m_axi_hp_bvalid),
        .m_axi_bready   (m_axi_hp_bready)
    );

    assign status_leds = accel_leds[3:0];
    assign irq_done    = accel_done_irq | accel_err_irq;

endmodule

`default_nettype wire
