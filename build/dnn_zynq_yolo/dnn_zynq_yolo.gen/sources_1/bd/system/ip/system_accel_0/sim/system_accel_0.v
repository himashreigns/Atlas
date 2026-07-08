// (c) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// (c) Copyright 2022-2026 Advanced Micro Devices, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of AMD and is protected under U.S. and international copyright
// and other intellectual property laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// AMD, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) AMD shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or AMD had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// AMD products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of AMD products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:module_ref:dnn_accel_ps_top:1.0
// IP Revision: 1

`timescale 1ns/1ps

(* IP_DEFINITION_SOURCE = "module_ref" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module system_accel_0 (
  aclk,
  aresetn,
  s_axi_lite_awaddr,
  s_axi_lite_awprot,
  s_axi_lite_awvalid,
  s_axi_lite_awready,
  s_axi_lite_wdata,
  s_axi_lite_wstrb,
  s_axi_lite_wvalid,
  s_axi_lite_wready,
  s_axi_lite_bresp,
  s_axi_lite_bvalid,
  s_axi_lite_bready,
  s_axi_lite_araddr,
  s_axi_lite_arprot,
  s_axi_lite_arvalid,
  s_axi_lite_arready,
  s_axi_lite_rdata,
  s_axi_lite_rresp,
  s_axi_lite_rvalid,
  s_axi_lite_rready,
  m_axi_hp_arid,
  m_axi_hp_araddr,
  m_axi_hp_arlen,
  m_axi_hp_arsize,
  m_axi_hp_arburst,
  m_axi_hp_arlock,
  m_axi_hp_arcache,
  m_axi_hp_arprot,
  m_axi_hp_arqos,
  m_axi_hp_arvalid,
  m_axi_hp_arready,
  m_axi_hp_rid,
  m_axi_hp_rdata,
  m_axi_hp_rresp,
  m_axi_hp_rlast,
  m_axi_hp_rvalid,
  m_axi_hp_rready,
  m_axi_hp_awid,
  m_axi_hp_awaddr,
  m_axi_hp_awlen,
  m_axi_hp_awsize,
  m_axi_hp_awburst,
  m_axi_hp_awlock,
  m_axi_hp_awcache,
  m_axi_hp_awprot,
  m_axi_hp_awqos,
  m_axi_hp_awvalid,
  m_axi_hp_awready,
  m_axi_hp_wid,
  m_axi_hp_wdata,
  m_axi_hp_wstrb,
  m_axi_hp_wlast,
  m_axi_hp_wvalid,
  m_axi_hp_wready,
  m_axi_hp_bid,
  m_axi_hp_bresp,
  m_axi_hp_bvalid,
  m_axi_hp_bready,
  status_leds,
  irq_done
);

(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 aclk CLK" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME aclk, ASSOCIATED_BUSIF m_axi_hp:s_axi_lite, ASSOCIATED_RESET aresetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_ps7_0_FCLK_CLK0, INSERT_VIP 0" *)
input wire aclk;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 aresetn RST" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
input wire aresetn;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite AWADDR" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axi_lite, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 16, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN system_ps7_0_FCLK_CLK0, NUM_READ_THREADS 4, NUM_WRITE_T\
HREADS 4, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *)
input wire [15 : 0] s_axi_lite_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite AWPROT" *)
input wire [2 : 0] s_axi_lite_awprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite AWVALID" *)
input wire s_axi_lite_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite AWREADY" *)
output wire s_axi_lite_awready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite WDATA" *)
input wire [31 : 0] s_axi_lite_wdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite WSTRB" *)
input wire [3 : 0] s_axi_lite_wstrb;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite WVALID" *)
input wire s_axi_lite_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite WREADY" *)
output wire s_axi_lite_wready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite BRESP" *)
output wire [1 : 0] s_axi_lite_bresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite BVALID" *)
output wire s_axi_lite_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite BREADY" *)
input wire s_axi_lite_bready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite ARADDR" *)
input wire [15 : 0] s_axi_lite_araddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite ARPROT" *)
input wire [2 : 0] s_axi_lite_arprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite ARVALID" *)
input wire s_axi_lite_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite ARREADY" *)
output wire s_axi_lite_arready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite RDATA" *)
output wire [31 : 0] s_axi_lite_rdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite RRESP" *)
output wire [1 : 0] s_axi_lite_rresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite RVALID" *)
output wire s_axi_lite_rvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite RREADY" *)
input wire s_axi_lite_rready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp ARID" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axi_hp, DATA_WIDTH 32, PROTOCOL AXI4, FREQ_HZ 100000000, ID_WIDTH 6, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 256, PHASE 0.0, CLK_DOMAIN system_ps7_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREA\
DS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *)
output wire [5 : 0] m_axi_hp_arid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp ARADDR" *)
output wire [31 : 0] m_axi_hp_araddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp ARLEN" *)
output wire [7 : 0] m_axi_hp_arlen;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp ARSIZE" *)
output wire [2 : 0] m_axi_hp_arsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp ARBURST" *)
output wire [1 : 0] m_axi_hp_arburst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp ARLOCK" *)
output wire [1 : 0] m_axi_hp_arlock;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp ARCACHE" *)
output wire [3 : 0] m_axi_hp_arcache;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp ARPROT" *)
output wire [2 : 0] m_axi_hp_arprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp ARQOS" *)
output wire [3 : 0] m_axi_hp_arqos;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp ARVALID" *)
output wire m_axi_hp_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp ARREADY" *)
input wire m_axi_hp_arready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp RID" *)
input wire [5 : 0] m_axi_hp_rid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp RDATA" *)
input wire [31 : 0] m_axi_hp_rdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp RRESP" *)
input wire [1 : 0] m_axi_hp_rresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp RLAST" *)
input wire m_axi_hp_rlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp RVALID" *)
input wire m_axi_hp_rvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp RREADY" *)
output wire m_axi_hp_rready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp AWID" *)
output wire [5 : 0] m_axi_hp_awid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp AWADDR" *)
output wire [31 : 0] m_axi_hp_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp AWLEN" *)
output wire [7 : 0] m_axi_hp_awlen;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp AWSIZE" *)
output wire [2 : 0] m_axi_hp_awsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp AWBURST" *)
output wire [1 : 0] m_axi_hp_awburst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp AWLOCK" *)
output wire [1 : 0] m_axi_hp_awlock;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp AWCACHE" *)
output wire [3 : 0] m_axi_hp_awcache;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp AWPROT" *)
output wire [2 : 0] m_axi_hp_awprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp AWQOS" *)
output wire [3 : 0] m_axi_hp_awqos;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp AWVALID" *)
output wire m_axi_hp_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp AWREADY" *)
input wire m_axi_hp_awready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp WID" *)
output wire [5 : 0] m_axi_hp_wid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp WDATA" *)
output wire [31 : 0] m_axi_hp_wdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp WSTRB" *)
output wire [3 : 0] m_axi_hp_wstrb;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp WLAST" *)
output wire m_axi_hp_wlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp WVALID" *)
output wire m_axi_hp_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp WREADY" *)
input wire m_axi_hp_wready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp BID" *)
input wire [5 : 0] m_axi_hp_bid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp BRESP" *)
input wire [1 : 0] m_axi_hp_bresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp BVALID" *)
input wire m_axi_hp_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp BREADY" *)
output wire m_axi_hp_bready;
output wire [3 : 0] status_leds;
output wire irq_done;

  dnn_accel_ps_top #(
    .AXI_LITE_ADDR_W(16),
    .ACCEL_ADDR_W(20),
    .AXI_DATA_W(32),
    .AXI_ID_W(6),
    .DDR_BASE_ADDR(32'H10000000)
  ) inst (
    .aclk(aclk),
    .aresetn(aresetn),
    .s_axi_lite_awaddr(s_axi_lite_awaddr),
    .s_axi_lite_awprot(s_axi_lite_awprot),
    .s_axi_lite_awvalid(s_axi_lite_awvalid),
    .s_axi_lite_awready(s_axi_lite_awready),
    .s_axi_lite_wdata(s_axi_lite_wdata),
    .s_axi_lite_wstrb(s_axi_lite_wstrb),
    .s_axi_lite_wvalid(s_axi_lite_wvalid),
    .s_axi_lite_wready(s_axi_lite_wready),
    .s_axi_lite_bresp(s_axi_lite_bresp),
    .s_axi_lite_bvalid(s_axi_lite_bvalid),
    .s_axi_lite_bready(s_axi_lite_bready),
    .s_axi_lite_araddr(s_axi_lite_araddr),
    .s_axi_lite_arprot(s_axi_lite_arprot),
    .s_axi_lite_arvalid(s_axi_lite_arvalid),
    .s_axi_lite_arready(s_axi_lite_arready),
    .s_axi_lite_rdata(s_axi_lite_rdata),
    .s_axi_lite_rresp(s_axi_lite_rresp),
    .s_axi_lite_rvalid(s_axi_lite_rvalid),
    .s_axi_lite_rready(s_axi_lite_rready),
    .m_axi_hp_arid(m_axi_hp_arid),
    .m_axi_hp_araddr(m_axi_hp_araddr),
    .m_axi_hp_arlen(m_axi_hp_arlen),
    .m_axi_hp_arsize(m_axi_hp_arsize),
    .m_axi_hp_arburst(m_axi_hp_arburst),
    .m_axi_hp_arlock(m_axi_hp_arlock),
    .m_axi_hp_arcache(m_axi_hp_arcache),
    .m_axi_hp_arprot(m_axi_hp_arprot),
    .m_axi_hp_arqos(m_axi_hp_arqos),
    .m_axi_hp_arvalid(m_axi_hp_arvalid),
    .m_axi_hp_arready(m_axi_hp_arready),
    .m_axi_hp_rid(m_axi_hp_rid),
    .m_axi_hp_rdata(m_axi_hp_rdata),
    .m_axi_hp_rresp(m_axi_hp_rresp),
    .m_axi_hp_rlast(m_axi_hp_rlast),
    .m_axi_hp_rvalid(m_axi_hp_rvalid),
    .m_axi_hp_rready(m_axi_hp_rready),
    .m_axi_hp_awid(m_axi_hp_awid),
    .m_axi_hp_awaddr(m_axi_hp_awaddr),
    .m_axi_hp_awlen(m_axi_hp_awlen),
    .m_axi_hp_awsize(m_axi_hp_awsize),
    .m_axi_hp_awburst(m_axi_hp_awburst),
    .m_axi_hp_awlock(m_axi_hp_awlock),
    .m_axi_hp_awcache(m_axi_hp_awcache),
    .m_axi_hp_awprot(m_axi_hp_awprot),
    .m_axi_hp_awqos(m_axi_hp_awqos),
    .m_axi_hp_awvalid(m_axi_hp_awvalid),
    .m_axi_hp_awready(m_axi_hp_awready),
    .m_axi_hp_wid(m_axi_hp_wid),
    .m_axi_hp_wdata(m_axi_hp_wdata),
    .m_axi_hp_wstrb(m_axi_hp_wstrb),
    .m_axi_hp_wlast(m_axi_hp_wlast),
    .m_axi_hp_wvalid(m_axi_hp_wvalid),
    .m_axi_hp_wready(m_axi_hp_wready),
    .m_axi_hp_bid(m_axi_hp_bid),
    .m_axi_hp_bresp(m_axi_hp_bresp),
    .m_axi_hp_bvalid(m_axi_hp_bvalid),
    .m_axi_hp_bready(m_axi_hp_bready),
    .status_leds(status_leds),
    .irq_done(irq_done)
  );
endmodule
