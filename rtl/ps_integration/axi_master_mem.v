// =============================================================================
// axi_master_mem.v
//
// Wraps the accelerator's simplified read/write memory interface (separate
// AR/R and AW/W/B with no IDs, no bursts) into a standards-compliant AXI4
// master that can drive a Zynq S_AXI_HP slave port (32-bit data, AXI3-like).
//
// All transactions are single-beat (LEN=0), 32-bit (SIZE=2), INCR (BURST=1).
// A 32-bit BASE_ADDR is added to the accelerator's 20-bit address so it lands
// in a reserved DDR region (configured at boot via INPUT_BASE/OUTPUT_BASE/
// WEIGHT_BASE writes from software).
//
// The accelerator's m_axi_araddr/m_axi_awaddr are already physical-DDR
// offsets relative to BASE_ADDR=0 — i.e. the host writes the lower 20 bits of
// the reserved-memory CMA region into INPUT_BASE/OUTPUT_BASE/WEIGHT_BASE,
// and this wrapper ORs in the upper 12 bits to form the full 32-bit AXI
// address.
// =============================================================================
`default_nettype none

module axi_master_mem #(
    parameter ACCEL_ADDR_W = 20,
    parameter AXI_ADDR_W   = 32,
    parameter AXI_DATA_W   = 32,
    parameter AXI_ID_W     = 6,
    parameter [AXI_ADDR_W-1:0] BASE_ADDR = 32'h1000_0000
)(
    input  wire                    aclk,
    input  wire                    aresetn,

    // From accelerator (simplified)
    input  wire [ACCEL_ADDR_W-1:0] accel_araddr,
    input  wire                    accel_arvalid,
    output wire                    accel_arready,
    output wire [AXI_DATA_W-1:0]   accel_rdata,
    output wire                    accel_rvalid,
    input  wire                    accel_rready,

    input  wire [ACCEL_ADDR_W-1:0] accel_awaddr,
    input  wire                    accel_awvalid,
    output wire                    accel_awready,
    input  wire [AXI_DATA_W-1:0]   accel_wdata,
    input  wire                    accel_wvalid,
    output wire                    accel_wready,
    output wire                    accel_bvalid,
    input  wire                    accel_bready,

    // To Zynq S_AXI_HP (AXI3 / AXI4 32-bit data)
    output wire [AXI_ID_W-1:0]     m_axi_arid,
    output wire [AXI_ADDR_W-1:0]   m_axi_araddr,
    output wire [7:0]              m_axi_arlen,
    output wire [2:0]              m_axi_arsize,
    output wire [1:0]              m_axi_arburst,
    output wire [1:0]              m_axi_arlock,
    output wire [3:0]              m_axi_arcache,
    output wire [2:0]              m_axi_arprot,
    output wire [3:0]              m_axi_arqos,
    output wire                    m_axi_arvalid,
    input  wire                    m_axi_arready,
    input  wire [AXI_ID_W-1:0]     m_axi_rid,
    input  wire [AXI_DATA_W-1:0]   m_axi_rdata,
    input  wire [1:0]              m_axi_rresp,
    input  wire                    m_axi_rlast,
    input  wire                    m_axi_rvalid,
    output wire                    m_axi_rready,

    output wire [AXI_ID_W-1:0]     m_axi_awid,
    output wire [AXI_ADDR_W-1:0]   m_axi_awaddr,
    output wire [7:0]              m_axi_awlen,
    output wire [2:0]              m_axi_awsize,
    output wire [1:0]              m_axi_awburst,
    output wire [1:0]              m_axi_awlock,
    output wire [3:0]              m_axi_awcache,
    output wire [2:0]              m_axi_awprot,
    output wire [3:0]              m_axi_awqos,
    output wire                    m_axi_awvalid,
    input  wire                    m_axi_awready,
    output wire [AXI_ID_W-1:0]     m_axi_wid,
    output wire [AXI_DATA_W-1:0]   m_axi_wdata,
    output wire [(AXI_DATA_W/8)-1:0] m_axi_wstrb,
    output wire                    m_axi_wlast,
    output wire                    m_axi_wvalid,
    input  wire                    m_axi_wready,
    input  wire [AXI_ID_W-1:0]     m_axi_bid,
    input  wire [1:0]              m_axi_bresp,
    input  wire                    m_axi_bvalid,
    output wire                    m_axi_bready
);

    // Address composition: BASE_ADDR is page-aligned, accel address goes in low bits.
    // Each accelerator address word = one 32-bit DDR word (×4 bytes).
    wire [AXI_ADDR_W-1:0] ar_full_addr =
        BASE_ADDR | ({{(AXI_ADDR_W-ACCEL_ADDR_W-2){1'b0}}, accel_araddr, 2'b00});
    wire [AXI_ADDR_W-1:0] aw_full_addr =
        BASE_ADDR | ({{(AXI_ADDR_W-ACCEL_ADDR_W-2){1'b0}}, accel_awaddr, 2'b00});

    // -------------------- Read channel passthrough --------------------
    assign m_axi_arid    = {AXI_ID_W{1'b0}};
    assign m_axi_araddr  = ar_full_addr;
    assign m_axi_arlen   = 8'd0;        // single beat
    assign m_axi_arsize  = 3'd2;        // 4 bytes
    assign m_axi_arburst = 2'b01;       // INCR
    assign m_axi_arlock  = 2'b00;
    assign m_axi_arcache = 4'b0011;     // modifiable + bufferable (HP non-coherent)
    assign m_axi_arprot  = 3'b000;
    assign m_axi_arqos   = 4'b0000;
    assign m_axi_arvalid = accel_arvalid;
    assign accel_arready = m_axi_arready;

    assign accel_rdata   = m_axi_rdata;
    assign accel_rvalid  = m_axi_rvalid;
    assign m_axi_rready  = accel_rready;

    // -------------------- Write channel passthrough -------------------
    assign m_axi_awid    = {AXI_ID_W{1'b0}};
    assign m_axi_awaddr  = aw_full_addr;
    assign m_axi_awlen   = 8'd0;
    assign m_axi_awsize  = 3'd2;
    assign m_axi_awburst = 2'b01;
    assign m_axi_awlock  = 2'b00;
    assign m_axi_awcache = 4'b0011;
    assign m_axi_awprot  = 3'b000;
    assign m_axi_awqos   = 4'b0000;
    assign m_axi_awvalid = accel_awvalid;
    assign accel_awready = m_axi_awready;

    assign m_axi_wid     = {AXI_ID_W{1'b0}};
    assign m_axi_wdata   = accel_wdata;
    assign m_axi_wstrb   = {(AXI_DATA_W/8){1'b1}};
    assign m_axi_wlast   = 1'b1;
    assign m_axi_wvalid  = accel_wvalid;
    assign accel_wready  = m_axi_wready;

    assign accel_bvalid  = m_axi_bvalid;
    assign m_axi_bready  = accel_bready;

    // Silence unused-input warnings
    wire _unused_ok = &{1'b0, m_axi_rid, m_axi_rresp, m_axi_rlast,
                         m_axi_bid, m_axi_bresp, aresetn, aclk, 1'b0};

endmodule

`default_nettype wire
