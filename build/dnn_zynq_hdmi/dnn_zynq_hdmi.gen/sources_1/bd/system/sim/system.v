//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
//Date        : Wed Jul  8 19:49:31 2026
//Host        : chathupa-Nitro-AN515-55 running 64-bit Ubuntu 24.04.3 LTS
//Command     : generate_target system.bd
//Design      : system
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module m00_couplers_imp_9IKH7F
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arburst,
    M_AXI_arcache,
    M_AXI_arid,
    M_AXI_arlen,
    M_AXI_arlock,
    M_AXI_arprot,
    M_AXI_arqos,
    M_AXI_arready,
    M_AXI_arregion,
    M_AXI_arsize,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awburst,
    M_AXI_awcache,
    M_AXI_awid,
    M_AXI_awlen,
    M_AXI_awlock,
    M_AXI_awprot,
    M_AXI_awqos,
    M_AXI_awready,
    M_AXI_awregion,
    M_AXI_awsize,
    M_AXI_awvalid,
    M_AXI_bid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rid,
    M_AXI_rlast,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wlast,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arburst,
    S_AXI_arcache,
    S_AXI_arid,
    S_AXI_arlen,
    S_AXI_arlock,
    S_AXI_arprot,
    S_AXI_arqos,
    S_AXI_arready,
    S_AXI_arregion,
    S_AXI_arsize,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awburst,
    S_AXI_awcache,
    S_AXI_awid,
    S_AXI_awlen,
    S_AXI_awlock,
    S_AXI_awprot,
    S_AXI_awqos,
    S_AXI_awready,
    S_AXI_awregion,
    S_AXI_awsize,
    S_AXI_awvalid,
    S_AXI_bid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rid,
    S_AXI_rlast,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wlast,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  output [1:0]M_AXI_arburst;
  output [3:0]M_AXI_arcache;
  output [11:0]M_AXI_arid;
  output [7:0]M_AXI_arlen;
  output [0:0]M_AXI_arlock;
  output [2:0]M_AXI_arprot;
  output [3:0]M_AXI_arqos;
  input M_AXI_arready;
  output [3:0]M_AXI_arregion;
  output [2:0]M_AXI_arsize;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  output [1:0]M_AXI_awburst;
  output [3:0]M_AXI_awcache;
  output [11:0]M_AXI_awid;
  output [7:0]M_AXI_awlen;
  output [0:0]M_AXI_awlock;
  output [2:0]M_AXI_awprot;
  output [3:0]M_AXI_awqos;
  input M_AXI_awready;
  output [3:0]M_AXI_awregion;
  output [2:0]M_AXI_awsize;
  output M_AXI_awvalid;
  input [11:0]M_AXI_bid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  input [11:0]M_AXI_rid;
  input M_AXI_rlast;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  output M_AXI_wlast;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [1:0]S_AXI_arburst;
  input [3:0]S_AXI_arcache;
  input [11:0]S_AXI_arid;
  input [7:0]S_AXI_arlen;
  input [0:0]S_AXI_arlock;
  input [2:0]S_AXI_arprot;
  input [3:0]S_AXI_arqos;
  output S_AXI_arready;
  input [3:0]S_AXI_arregion;
  input [2:0]S_AXI_arsize;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [1:0]S_AXI_awburst;
  input [3:0]S_AXI_awcache;
  input [11:0]S_AXI_awid;
  input [7:0]S_AXI_awlen;
  input [0:0]S_AXI_awlock;
  input [2:0]S_AXI_awprot;
  input [3:0]S_AXI_awqos;
  output S_AXI_awready;
  input [3:0]S_AXI_awregion;
  input [2:0]S_AXI_awsize;
  input S_AXI_awvalid;
  output [11:0]S_AXI_bid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  output [11:0]S_AXI_rid;
  output S_AXI_rlast;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  input S_AXI_wlast;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire [31:0]M_AXI_araddr;
  wire [1:0]M_AXI_arburst;
  wire [3:0]M_AXI_arcache;
  wire [11:0]M_AXI_arid;
  wire [7:0]M_AXI_arlen;
  wire [0:0]M_AXI_arlock;
  wire [2:0]M_AXI_arprot;
  wire [3:0]M_AXI_arqos;
  wire [3:0]M_AXI_arregion;
  wire [2:0]M_AXI_arsize;
  wire M_AXI_arvalid;
  wire [31:0]M_AXI_awaddr;
  wire [1:0]M_AXI_awburst;
  wire [3:0]M_AXI_awcache;
  wire [11:0]M_AXI_awid;
  wire [7:0]M_AXI_awlen;
  wire [0:0]M_AXI_awlock;
  wire [2:0]M_AXI_awprot;
  wire [3:0]M_AXI_awqos;
  wire [3:0]M_AXI_awregion;
  wire [2:0]M_AXI_awsize;
  wire M_AXI_awvalid;
  wire M_AXI_bready;
  wire M_AXI_rready;
  wire [31:0]M_AXI_wdata;
  wire M_AXI_wlast;
  wire [3:0]M_AXI_wstrb;
  wire M_AXI_wvalid;
  wire S_AXI_arready;
  wire S_AXI_awready;
  wire [11:0]S_AXI_bid;
  wire [1:0]S_AXI_bresp;
  wire S_AXI_bvalid;
  wire [31:0]S_AXI_rdata;
  wire [11:0]S_AXI_rid;
  wire S_AXI_rlast;
  wire [1:0]S_AXI_rresp;
  wire S_AXI_rvalid;
  wire S_AXI_wready;

  assign M_AXI_araddr = S_AXI_araddr[31:0];
  assign M_AXI_arburst = S_AXI_arburst[1:0];
  assign M_AXI_arcache = S_AXI_arcache[3:0];
  assign M_AXI_arid = S_AXI_arid[11:0];
  assign M_AXI_arlen = S_AXI_arlen[7:0];
  assign M_AXI_arlock = S_AXI_arlock[0];
  assign M_AXI_arprot = S_AXI_arprot[2:0];
  assign M_AXI_arqos = S_AXI_arqos[3:0];
  assign M_AXI_arregion = S_AXI_arregion[3:0];
  assign M_AXI_arsize = S_AXI_arsize[2:0];
  assign M_AXI_arvalid = S_AXI_arvalid;
  assign M_AXI_awaddr = S_AXI_awaddr[31:0];
  assign M_AXI_awburst = S_AXI_awburst[1:0];
  assign M_AXI_awcache = S_AXI_awcache[3:0];
  assign M_AXI_awid = S_AXI_awid[11:0];
  assign M_AXI_awlen = S_AXI_awlen[7:0];
  assign M_AXI_awlock = S_AXI_awlock[0];
  assign M_AXI_awprot = S_AXI_awprot[2:0];
  assign M_AXI_awqos = S_AXI_awqos[3:0];
  assign M_AXI_awregion = S_AXI_awregion[3:0];
  assign M_AXI_awsize = S_AXI_awsize[2:0];
  assign M_AXI_awvalid = S_AXI_awvalid;
  assign M_AXI_bready = S_AXI_bready;
  assign M_AXI_rready = S_AXI_rready;
  assign M_AXI_wdata = S_AXI_wdata[31:0];
  assign M_AXI_wlast = S_AXI_wlast;
  assign M_AXI_wstrb = S_AXI_wstrb[3:0];
  assign M_AXI_wvalid = S_AXI_wvalid;
  assign S_AXI_arready = M_AXI_arready;
  assign S_AXI_awready = M_AXI_awready;
  assign S_AXI_bid = M_AXI_bid[11:0];
  assign S_AXI_bresp = M_AXI_bresp[1:0];
  assign S_AXI_bvalid = M_AXI_bvalid;
  assign S_AXI_rdata = M_AXI_rdata[31:0];
  assign S_AXI_rid = M_AXI_rid[11:0];
  assign S_AXI_rlast = M_AXI_rlast;
  assign S_AXI_rresp = M_AXI_rresp[1:0];
  assign S_AXI_rvalid = M_AXI_rvalid;
  assign S_AXI_wready = M_AXI_wready;
endmodule

module m01_couplers_imp_12VSN7U
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arburst,
    M_AXI_arcache,
    M_AXI_arid,
    M_AXI_arlen,
    M_AXI_arlock,
    M_AXI_arprot,
    M_AXI_arqos,
    M_AXI_arready,
    M_AXI_arregion,
    M_AXI_arsize,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awburst,
    M_AXI_awcache,
    M_AXI_awid,
    M_AXI_awlen,
    M_AXI_awlock,
    M_AXI_awprot,
    M_AXI_awqos,
    M_AXI_awready,
    M_AXI_awregion,
    M_AXI_awsize,
    M_AXI_awvalid,
    M_AXI_bid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rid,
    M_AXI_rlast,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wlast,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arburst,
    S_AXI_arcache,
    S_AXI_arid,
    S_AXI_arlen,
    S_AXI_arlock,
    S_AXI_arprot,
    S_AXI_arqos,
    S_AXI_arready,
    S_AXI_arregion,
    S_AXI_arsize,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awburst,
    S_AXI_awcache,
    S_AXI_awid,
    S_AXI_awlen,
    S_AXI_awlock,
    S_AXI_awprot,
    S_AXI_awqos,
    S_AXI_awready,
    S_AXI_awregion,
    S_AXI_awsize,
    S_AXI_awvalid,
    S_AXI_bid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rid,
    S_AXI_rlast,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wlast,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  output [1:0]M_AXI_arburst;
  output [3:0]M_AXI_arcache;
  output [11:0]M_AXI_arid;
  output [7:0]M_AXI_arlen;
  output [0:0]M_AXI_arlock;
  output [2:0]M_AXI_arprot;
  output [3:0]M_AXI_arqos;
  input M_AXI_arready;
  output [3:0]M_AXI_arregion;
  output [2:0]M_AXI_arsize;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  output [1:0]M_AXI_awburst;
  output [3:0]M_AXI_awcache;
  output [11:0]M_AXI_awid;
  output [7:0]M_AXI_awlen;
  output [0:0]M_AXI_awlock;
  output [2:0]M_AXI_awprot;
  output [3:0]M_AXI_awqos;
  input M_AXI_awready;
  output [3:0]M_AXI_awregion;
  output [2:0]M_AXI_awsize;
  output M_AXI_awvalid;
  input [11:0]M_AXI_bid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  input [11:0]M_AXI_rid;
  input M_AXI_rlast;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  output M_AXI_wlast;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [1:0]S_AXI_arburst;
  input [3:0]S_AXI_arcache;
  input [11:0]S_AXI_arid;
  input [7:0]S_AXI_arlen;
  input [0:0]S_AXI_arlock;
  input [2:0]S_AXI_arprot;
  input [3:0]S_AXI_arqos;
  output S_AXI_arready;
  input [3:0]S_AXI_arregion;
  input [2:0]S_AXI_arsize;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [1:0]S_AXI_awburst;
  input [3:0]S_AXI_awcache;
  input [11:0]S_AXI_awid;
  input [7:0]S_AXI_awlen;
  input [0:0]S_AXI_awlock;
  input [2:0]S_AXI_awprot;
  input [3:0]S_AXI_awqos;
  output S_AXI_awready;
  input [3:0]S_AXI_awregion;
  input [2:0]S_AXI_awsize;
  input S_AXI_awvalid;
  output [11:0]S_AXI_bid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  output [11:0]S_AXI_rid;
  output S_AXI_rlast;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  input S_AXI_wlast;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire [31:0]M_AXI_araddr;
  wire [1:0]M_AXI_arburst;
  wire [3:0]M_AXI_arcache;
  wire [11:0]M_AXI_arid;
  wire [7:0]M_AXI_arlen;
  wire [0:0]M_AXI_arlock;
  wire [2:0]M_AXI_arprot;
  wire [3:0]M_AXI_arqos;
  wire [3:0]M_AXI_arregion;
  wire [2:0]M_AXI_arsize;
  wire M_AXI_arvalid;
  wire [31:0]M_AXI_awaddr;
  wire [1:0]M_AXI_awburst;
  wire [3:0]M_AXI_awcache;
  wire [11:0]M_AXI_awid;
  wire [7:0]M_AXI_awlen;
  wire [0:0]M_AXI_awlock;
  wire [2:0]M_AXI_awprot;
  wire [3:0]M_AXI_awqos;
  wire [3:0]M_AXI_awregion;
  wire [2:0]M_AXI_awsize;
  wire M_AXI_awvalid;
  wire M_AXI_bready;
  wire M_AXI_rready;
  wire [31:0]M_AXI_wdata;
  wire M_AXI_wlast;
  wire [3:0]M_AXI_wstrb;
  wire M_AXI_wvalid;
  wire S_AXI_arready;
  wire S_AXI_awready;
  wire [11:0]S_AXI_bid;
  wire [1:0]S_AXI_bresp;
  wire S_AXI_bvalid;
  wire [31:0]S_AXI_rdata;
  wire [11:0]S_AXI_rid;
  wire S_AXI_rlast;
  wire [1:0]S_AXI_rresp;
  wire S_AXI_rvalid;
  wire S_AXI_wready;

  assign M_AXI_araddr = S_AXI_araddr[31:0];
  assign M_AXI_arburst = S_AXI_arburst[1:0];
  assign M_AXI_arcache = S_AXI_arcache[3:0];
  assign M_AXI_arid = S_AXI_arid[11:0];
  assign M_AXI_arlen = S_AXI_arlen[7:0];
  assign M_AXI_arlock = S_AXI_arlock[0];
  assign M_AXI_arprot = S_AXI_arprot[2:0];
  assign M_AXI_arqos = S_AXI_arqos[3:0];
  assign M_AXI_arregion = S_AXI_arregion[3:0];
  assign M_AXI_arsize = S_AXI_arsize[2:0];
  assign M_AXI_arvalid = S_AXI_arvalid;
  assign M_AXI_awaddr = S_AXI_awaddr[31:0];
  assign M_AXI_awburst = S_AXI_awburst[1:0];
  assign M_AXI_awcache = S_AXI_awcache[3:0];
  assign M_AXI_awid = S_AXI_awid[11:0];
  assign M_AXI_awlen = S_AXI_awlen[7:0];
  assign M_AXI_awlock = S_AXI_awlock[0];
  assign M_AXI_awprot = S_AXI_awprot[2:0];
  assign M_AXI_awqos = S_AXI_awqos[3:0];
  assign M_AXI_awregion = S_AXI_awregion[3:0];
  assign M_AXI_awsize = S_AXI_awsize[2:0];
  assign M_AXI_awvalid = S_AXI_awvalid;
  assign M_AXI_bready = S_AXI_bready;
  assign M_AXI_rready = S_AXI_rready;
  assign M_AXI_wdata = S_AXI_wdata[31:0];
  assign M_AXI_wlast = S_AXI_wlast;
  assign M_AXI_wstrb = S_AXI_wstrb[3:0];
  assign M_AXI_wvalid = S_AXI_wvalid;
  assign S_AXI_arready = M_AXI_arready;
  assign S_AXI_awready = M_AXI_awready;
  assign S_AXI_bid = M_AXI_bid[11:0];
  assign S_AXI_bresp = M_AXI_bresp[1:0];
  assign S_AXI_bvalid = M_AXI_bvalid;
  assign S_AXI_rdata = M_AXI_rdata[31:0];
  assign S_AXI_rid = M_AXI_rid[11:0];
  assign S_AXI_rlast = M_AXI_rlast;
  assign S_AXI_rresp = M_AXI_rresp[1:0];
  assign S_AXI_rvalid = M_AXI_rvalid;
  assign S_AXI_wready = M_AXI_wready;
endmodule

module m02_couplers_imp_1A1BVY0
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arburst,
    S_AXI_arcache,
    S_AXI_arid,
    S_AXI_arlen,
    S_AXI_arlock,
    S_AXI_arprot,
    S_AXI_arqos,
    S_AXI_arready,
    S_AXI_arregion,
    S_AXI_arsize,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awburst,
    S_AXI_awcache,
    S_AXI_awid,
    S_AXI_awlen,
    S_AXI_awlock,
    S_AXI_awprot,
    S_AXI_awqos,
    S_AXI_awready,
    S_AXI_awregion,
    S_AXI_awsize,
    S_AXI_awvalid,
    S_AXI_bid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rid,
    S_AXI_rlast,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wlast,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [1:0]S_AXI_arburst;
  input [3:0]S_AXI_arcache;
  input [11:0]S_AXI_arid;
  input [7:0]S_AXI_arlen;
  input [0:0]S_AXI_arlock;
  input [2:0]S_AXI_arprot;
  input [3:0]S_AXI_arqos;
  output S_AXI_arready;
  input [3:0]S_AXI_arregion;
  input [2:0]S_AXI_arsize;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [1:0]S_AXI_awburst;
  input [3:0]S_AXI_awcache;
  input [11:0]S_AXI_awid;
  input [7:0]S_AXI_awlen;
  input [0:0]S_AXI_awlock;
  input [2:0]S_AXI_awprot;
  input [3:0]S_AXI_awqos;
  output S_AXI_awready;
  input [3:0]S_AXI_awregion;
  input [2:0]S_AXI_awsize;
  input S_AXI_awvalid;
  output [11:0]S_AXI_bid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  output [11:0]S_AXI_rid;
  output S_AXI_rlast;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  input S_AXI_wlast;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire [31:0]M_AXI_araddr;
  wire M_AXI_arready;
  wire M_AXI_arvalid;
  wire [31:0]M_AXI_awaddr;
  wire M_AXI_awready;
  wire M_AXI_awvalid;
  wire M_AXI_bready;
  wire [1:0]M_AXI_bresp;
  wire M_AXI_bvalid;
  wire [31:0]M_AXI_rdata;
  wire M_AXI_rready;
  wire [1:0]M_AXI_rresp;
  wire M_AXI_rvalid;
  wire [31:0]M_AXI_wdata;
  wire M_AXI_wready;
  wire [3:0]M_AXI_wstrb;
  wire M_AXI_wvalid;
  wire S_ACLK;
  wire S_ARESETN;
  wire [31:0]S_AXI_araddr;
  wire [1:0]S_AXI_arburst;
  wire [3:0]S_AXI_arcache;
  wire [11:0]S_AXI_arid;
  wire [7:0]S_AXI_arlen;
  wire [0:0]S_AXI_arlock;
  wire [2:0]S_AXI_arprot;
  wire [3:0]S_AXI_arqos;
  wire S_AXI_arready;
  wire [3:0]S_AXI_arregion;
  wire [2:0]S_AXI_arsize;
  wire S_AXI_arvalid;
  wire [31:0]S_AXI_awaddr;
  wire [1:0]S_AXI_awburst;
  wire [3:0]S_AXI_awcache;
  wire [11:0]S_AXI_awid;
  wire [7:0]S_AXI_awlen;
  wire [0:0]S_AXI_awlock;
  wire [2:0]S_AXI_awprot;
  wire [3:0]S_AXI_awqos;
  wire S_AXI_awready;
  wire [3:0]S_AXI_awregion;
  wire [2:0]S_AXI_awsize;
  wire S_AXI_awvalid;
  wire [11:0]S_AXI_bid;
  wire S_AXI_bready;
  wire [1:0]S_AXI_bresp;
  wire S_AXI_bvalid;
  wire [31:0]S_AXI_rdata;
  wire [11:0]S_AXI_rid;
  wire S_AXI_rlast;
  wire S_AXI_rready;
  wire [1:0]S_AXI_rresp;
  wire S_AXI_rvalid;
  wire [31:0]S_AXI_wdata;
  wire S_AXI_wlast;
  wire S_AXI_wready;
  wire [3:0]S_AXI_wstrb;
  wire S_AXI_wvalid;

  system_axi_ic_ctrl_imp_auto_pc_0 auto_pc
       (.aclk(S_ACLK),
        .aresetn(S_ARESETN),
        .m_axi_araddr(M_AXI_araddr),
        .m_axi_arready(M_AXI_arready),
        .m_axi_arvalid(M_AXI_arvalid),
        .m_axi_awaddr(M_AXI_awaddr),
        .m_axi_awready(M_AXI_awready),
        .m_axi_awvalid(M_AXI_awvalid),
        .m_axi_bready(M_AXI_bready),
        .m_axi_bresp(M_AXI_bresp),
        .m_axi_bvalid(M_AXI_bvalid),
        .m_axi_rdata(M_AXI_rdata),
        .m_axi_rready(M_AXI_rready),
        .m_axi_rresp(M_AXI_rresp),
        .m_axi_rvalid(M_AXI_rvalid),
        .m_axi_wdata(M_AXI_wdata),
        .m_axi_wready(M_AXI_wready),
        .m_axi_wstrb(M_AXI_wstrb),
        .m_axi_wvalid(M_AXI_wvalid),
        .s_axi_araddr(S_AXI_araddr),
        .s_axi_arburst(S_AXI_arburst),
        .s_axi_arcache(S_AXI_arcache),
        .s_axi_arid(S_AXI_arid),
        .s_axi_arlen(S_AXI_arlen),
        .s_axi_arlock(S_AXI_arlock),
        .s_axi_arprot(S_AXI_arprot),
        .s_axi_arqos(S_AXI_arqos),
        .s_axi_arready(S_AXI_arready),
        .s_axi_arregion(S_AXI_arregion),
        .s_axi_arsize(S_AXI_arsize),
        .s_axi_arvalid(S_AXI_arvalid),
        .s_axi_awaddr(S_AXI_awaddr),
        .s_axi_awburst(S_AXI_awburst),
        .s_axi_awcache(S_AXI_awcache),
        .s_axi_awid(S_AXI_awid),
        .s_axi_awlen(S_AXI_awlen),
        .s_axi_awlock(S_AXI_awlock),
        .s_axi_awprot(S_AXI_awprot),
        .s_axi_awqos(S_AXI_awqos),
        .s_axi_awready(S_AXI_awready),
        .s_axi_awregion(S_AXI_awregion),
        .s_axi_awsize(S_AXI_awsize),
        .s_axi_awvalid(S_AXI_awvalid),
        .s_axi_bid(S_AXI_bid),
        .s_axi_bready(S_AXI_bready),
        .s_axi_bresp(S_AXI_bresp),
        .s_axi_bvalid(S_AXI_bvalid),
        .s_axi_rdata(S_AXI_rdata),
        .s_axi_rid(S_AXI_rid),
        .s_axi_rlast(S_AXI_rlast),
        .s_axi_rready(S_AXI_rready),
        .s_axi_rresp(S_AXI_rresp),
        .s_axi_rvalid(S_AXI_rvalid),
        .s_axi_wdata(S_AXI_wdata),
        .s_axi_wlast(S_AXI_wlast),
        .s_axi_wready(S_AXI_wready),
        .s_axi_wstrb(S_AXI_wstrb),
        .s_axi_wvalid(S_AXI_wvalid));
endmodule

module s00_couplers_imp_1G0JM81
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arburst,
    M_AXI_arcache,
    M_AXI_arid,
    M_AXI_arlen,
    M_AXI_arlock,
    M_AXI_arprot,
    M_AXI_arqos,
    M_AXI_arready,
    M_AXI_arsize,
    M_AXI_arvalid,
    M_AXI_rdata,
    M_AXI_rid,
    M_AXI_rlast,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arburst,
    S_AXI_arcache,
    S_AXI_arid,
    S_AXI_arlen,
    S_AXI_arlock,
    S_AXI_arprot,
    S_AXI_arqos,
    S_AXI_arready,
    S_AXI_arsize,
    S_AXI_arvalid,
    S_AXI_rdata,
    S_AXI_rid,
    S_AXI_rlast,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  output [1:0]M_AXI_arburst;
  output [3:0]M_AXI_arcache;
  output [5:0]M_AXI_arid;
  output [3:0]M_AXI_arlen;
  output [1:0]M_AXI_arlock;
  output [2:0]M_AXI_arprot;
  output [3:0]M_AXI_arqos;
  input M_AXI_arready;
  output [2:0]M_AXI_arsize;
  output M_AXI_arvalid;
  input [31:0]M_AXI_rdata;
  input [5:0]M_AXI_rid;
  input M_AXI_rlast;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [1:0]S_AXI_arburst;
  input [3:0]S_AXI_arcache;
  input [5:0]S_AXI_arid;
  input [7:0]S_AXI_arlen;
  input [1:0]S_AXI_arlock;
  input [2:0]S_AXI_arprot;
  input [3:0]S_AXI_arqos;
  output S_AXI_arready;
  input [2:0]S_AXI_arsize;
  input S_AXI_arvalid;
  output [31:0]S_AXI_rdata;
  output [5:0]S_AXI_rid;
  output S_AXI_rlast;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;

  wire [31:0]M_AXI_araddr;
  wire [1:0]M_AXI_arburst;
  wire [3:0]M_AXI_arcache;
  wire [5:0]M_AXI_arid;
  wire [3:0]M_AXI_arlen;
  wire [1:0]M_AXI_arlock;
  wire [2:0]M_AXI_arprot;
  wire [3:0]M_AXI_arqos;
  wire M_AXI_arready;
  wire [2:0]M_AXI_arsize;
  wire M_AXI_arvalid;
  wire [31:0]M_AXI_rdata;
  wire [5:0]M_AXI_rid;
  wire M_AXI_rlast;
  wire M_AXI_rready;
  wire [1:0]M_AXI_rresp;
  wire M_AXI_rvalid;
  wire S_ACLK;
  wire S_ARESETN;
  wire [31:0]S_AXI_araddr;
  wire [1:0]S_AXI_arburst;
  wire [3:0]S_AXI_arcache;
  wire [5:0]S_AXI_arid;
  wire [7:0]S_AXI_arlen;
  wire [1:0]S_AXI_arlock;
  wire [2:0]S_AXI_arprot;
  wire [3:0]S_AXI_arqos;
  wire S_AXI_arready;
  wire [2:0]S_AXI_arsize;
  wire S_AXI_arvalid;
  wire [31:0]S_AXI_rdata;
  wire [5:0]S_AXI_rid;
  wire S_AXI_rlast;
  wire S_AXI_rready;
  wire [1:0]S_AXI_rresp;
  wire S_AXI_rvalid;

  system_axi_ic_vid_imp_auto_pc_0 auto_pc
       (.aclk(S_ACLK),
        .aresetn(S_ARESETN),
        .m_axi_araddr(M_AXI_araddr),
        .m_axi_arburst(M_AXI_arburst),
        .m_axi_arcache(M_AXI_arcache),
        .m_axi_arid(M_AXI_arid),
        .m_axi_arlen(M_AXI_arlen),
        .m_axi_arlock(M_AXI_arlock),
        .m_axi_arprot(M_AXI_arprot),
        .m_axi_arqos(M_AXI_arqos),
        .m_axi_arready(M_AXI_arready),
        .m_axi_arsize(M_AXI_arsize),
        .m_axi_arvalid(M_AXI_arvalid),
        .m_axi_rdata(M_AXI_rdata),
        .m_axi_rid(M_AXI_rid),
        .m_axi_rlast(M_AXI_rlast),
        .m_axi_rready(M_AXI_rready),
        .m_axi_rresp(M_AXI_rresp),
        .m_axi_rvalid(M_AXI_rvalid),
        .s_axi_araddr(S_AXI_araddr),
        .s_axi_arburst(S_AXI_arburst),
        .s_axi_arcache(S_AXI_arcache),
        .s_axi_arid(S_AXI_arid),
        .s_axi_arlen(S_AXI_arlen),
        .s_axi_arlock(S_AXI_arlock[0]),
        .s_axi_arprot(S_AXI_arprot),
        .s_axi_arqos(S_AXI_arqos),
        .s_axi_arready(S_AXI_arready),
        .s_axi_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arsize(S_AXI_arsize),
        .s_axi_arvalid(S_AXI_arvalid),
        .s_axi_rdata(S_AXI_rdata),
        .s_axi_rid(S_AXI_rid),
        .s_axi_rlast(S_AXI_rlast),
        .s_axi_rready(S_AXI_rready),
        .s_axi_rresp(S_AXI_rresp),
        .s_axi_rvalid(S_AXI_rvalid));
endmodule

module s00_couplers_imp_61HG22
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arburst,
    M_AXI_arcache,
    M_AXI_arid,
    M_AXI_arlen,
    M_AXI_arlock,
    M_AXI_arprot,
    M_AXI_arqos,
    M_AXI_arready,
    M_AXI_arsize,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awburst,
    M_AXI_awcache,
    M_AXI_awid,
    M_AXI_awlen,
    M_AXI_awlock,
    M_AXI_awprot,
    M_AXI_awqos,
    M_AXI_awready,
    M_AXI_awsize,
    M_AXI_awvalid,
    M_AXI_bid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rid,
    M_AXI_rlast,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wlast,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arburst,
    S_AXI_arcache,
    S_AXI_arid,
    S_AXI_arlen,
    S_AXI_arlock,
    S_AXI_arprot,
    S_AXI_arqos,
    S_AXI_arready,
    S_AXI_arsize,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awburst,
    S_AXI_awcache,
    S_AXI_awid,
    S_AXI_awlen,
    S_AXI_awlock,
    S_AXI_awprot,
    S_AXI_awqos,
    S_AXI_awready,
    S_AXI_awsize,
    S_AXI_awvalid,
    S_AXI_bid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rid,
    S_AXI_rlast,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wid,
    S_AXI_wlast,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  output [1:0]M_AXI_arburst;
  output [3:0]M_AXI_arcache;
  output [11:0]M_AXI_arid;
  output [7:0]M_AXI_arlen;
  output [0:0]M_AXI_arlock;
  output [2:0]M_AXI_arprot;
  output [3:0]M_AXI_arqos;
  input M_AXI_arready;
  output [2:0]M_AXI_arsize;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  output [1:0]M_AXI_awburst;
  output [3:0]M_AXI_awcache;
  output [11:0]M_AXI_awid;
  output [7:0]M_AXI_awlen;
  output [0:0]M_AXI_awlock;
  output [2:0]M_AXI_awprot;
  output [3:0]M_AXI_awqos;
  input M_AXI_awready;
  output [2:0]M_AXI_awsize;
  output M_AXI_awvalid;
  input [11:0]M_AXI_bid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  input [11:0]M_AXI_rid;
  input M_AXI_rlast;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  output M_AXI_wlast;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [1:0]S_AXI_arburst;
  input [3:0]S_AXI_arcache;
  input [11:0]S_AXI_arid;
  input [3:0]S_AXI_arlen;
  input [1:0]S_AXI_arlock;
  input [2:0]S_AXI_arprot;
  input [3:0]S_AXI_arqos;
  output S_AXI_arready;
  input [2:0]S_AXI_arsize;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [1:0]S_AXI_awburst;
  input [3:0]S_AXI_awcache;
  input [11:0]S_AXI_awid;
  input [3:0]S_AXI_awlen;
  input [1:0]S_AXI_awlock;
  input [2:0]S_AXI_awprot;
  input [3:0]S_AXI_awqos;
  output S_AXI_awready;
  input [2:0]S_AXI_awsize;
  input S_AXI_awvalid;
  output [11:0]S_AXI_bid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  output [11:0]S_AXI_rid;
  output S_AXI_rlast;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  input [11:0]S_AXI_wid;
  input S_AXI_wlast;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire [31:0]M_AXI_araddr;
  wire [1:0]M_AXI_arburst;
  wire [3:0]M_AXI_arcache;
  wire [11:0]M_AXI_arid;
  wire [7:0]M_AXI_arlen;
  wire [0:0]M_AXI_arlock;
  wire [2:0]M_AXI_arprot;
  wire [3:0]M_AXI_arqos;
  wire M_AXI_arready;
  wire [2:0]M_AXI_arsize;
  wire M_AXI_arvalid;
  wire [31:0]M_AXI_awaddr;
  wire [1:0]M_AXI_awburst;
  wire [3:0]M_AXI_awcache;
  wire [11:0]M_AXI_awid;
  wire [7:0]M_AXI_awlen;
  wire [0:0]M_AXI_awlock;
  wire [2:0]M_AXI_awprot;
  wire [3:0]M_AXI_awqos;
  wire M_AXI_awready;
  wire [2:0]M_AXI_awsize;
  wire M_AXI_awvalid;
  wire [11:0]M_AXI_bid;
  wire M_AXI_bready;
  wire [1:0]M_AXI_bresp;
  wire M_AXI_bvalid;
  wire [31:0]M_AXI_rdata;
  wire [11:0]M_AXI_rid;
  wire M_AXI_rlast;
  wire M_AXI_rready;
  wire [1:0]M_AXI_rresp;
  wire M_AXI_rvalid;
  wire [31:0]M_AXI_wdata;
  wire M_AXI_wlast;
  wire M_AXI_wready;
  wire [3:0]M_AXI_wstrb;
  wire M_AXI_wvalid;
  wire S_ACLK;
  wire S_ARESETN;
  wire [31:0]S_AXI_araddr;
  wire [1:0]S_AXI_arburst;
  wire [3:0]S_AXI_arcache;
  wire [11:0]S_AXI_arid;
  wire [3:0]S_AXI_arlen;
  wire [1:0]S_AXI_arlock;
  wire [2:0]S_AXI_arprot;
  wire [3:0]S_AXI_arqos;
  wire S_AXI_arready;
  wire [2:0]S_AXI_arsize;
  wire S_AXI_arvalid;
  wire [31:0]S_AXI_awaddr;
  wire [1:0]S_AXI_awburst;
  wire [3:0]S_AXI_awcache;
  wire [11:0]S_AXI_awid;
  wire [3:0]S_AXI_awlen;
  wire [1:0]S_AXI_awlock;
  wire [2:0]S_AXI_awprot;
  wire [3:0]S_AXI_awqos;
  wire S_AXI_awready;
  wire [2:0]S_AXI_awsize;
  wire S_AXI_awvalid;
  wire [11:0]S_AXI_bid;
  wire S_AXI_bready;
  wire [1:0]S_AXI_bresp;
  wire S_AXI_bvalid;
  wire [31:0]S_AXI_rdata;
  wire [11:0]S_AXI_rid;
  wire S_AXI_rlast;
  wire S_AXI_rready;
  wire [1:0]S_AXI_rresp;
  wire S_AXI_rvalid;
  wire [31:0]S_AXI_wdata;
  wire [11:0]S_AXI_wid;
  wire S_AXI_wlast;
  wire S_AXI_wready;
  wire [3:0]S_AXI_wstrb;
  wire S_AXI_wvalid;

  system_axi_ic_ctrl_imp_auto_pc_1 auto_pc
       (.aclk(S_ACLK),
        .aresetn(S_ARESETN),
        .m_axi_araddr(M_AXI_araddr),
        .m_axi_arburst(M_AXI_arburst),
        .m_axi_arcache(M_AXI_arcache),
        .m_axi_arid(M_AXI_arid),
        .m_axi_arlen(M_AXI_arlen),
        .m_axi_arlock(M_AXI_arlock),
        .m_axi_arprot(M_AXI_arprot),
        .m_axi_arqos(M_AXI_arqos),
        .m_axi_arready(M_AXI_arready),
        .m_axi_arsize(M_AXI_arsize),
        .m_axi_arvalid(M_AXI_arvalid),
        .m_axi_awaddr(M_AXI_awaddr),
        .m_axi_awburst(M_AXI_awburst),
        .m_axi_awcache(M_AXI_awcache),
        .m_axi_awid(M_AXI_awid),
        .m_axi_awlen(M_AXI_awlen),
        .m_axi_awlock(M_AXI_awlock),
        .m_axi_awprot(M_AXI_awprot),
        .m_axi_awqos(M_AXI_awqos),
        .m_axi_awready(M_AXI_awready),
        .m_axi_awsize(M_AXI_awsize),
        .m_axi_awvalid(M_AXI_awvalid),
        .m_axi_bid(M_AXI_bid),
        .m_axi_bready(M_AXI_bready),
        .m_axi_bresp(M_AXI_bresp),
        .m_axi_bvalid(M_AXI_bvalid),
        .m_axi_rdata(M_AXI_rdata),
        .m_axi_rid(M_AXI_rid),
        .m_axi_rlast(M_AXI_rlast),
        .m_axi_rready(M_AXI_rready),
        .m_axi_rresp(M_AXI_rresp),
        .m_axi_rvalid(M_AXI_rvalid),
        .m_axi_wdata(M_AXI_wdata),
        .m_axi_wlast(M_AXI_wlast),
        .m_axi_wready(M_AXI_wready),
        .m_axi_wstrb(M_AXI_wstrb),
        .m_axi_wvalid(M_AXI_wvalid),
        .s_axi_araddr(S_AXI_araddr),
        .s_axi_arburst(S_AXI_arburst),
        .s_axi_arcache(S_AXI_arcache),
        .s_axi_arid(S_AXI_arid),
        .s_axi_arlen(S_AXI_arlen),
        .s_axi_arlock(S_AXI_arlock),
        .s_axi_arprot(S_AXI_arprot),
        .s_axi_arqos(S_AXI_arqos),
        .s_axi_arready(S_AXI_arready),
        .s_axi_arsize(S_AXI_arsize),
        .s_axi_arvalid(S_AXI_arvalid),
        .s_axi_awaddr(S_AXI_awaddr),
        .s_axi_awburst(S_AXI_awburst),
        .s_axi_awcache(S_AXI_awcache),
        .s_axi_awid(S_AXI_awid),
        .s_axi_awlen(S_AXI_awlen),
        .s_axi_awlock(S_AXI_awlock),
        .s_axi_awprot(S_AXI_awprot),
        .s_axi_awqos(S_AXI_awqos),
        .s_axi_awready(S_AXI_awready),
        .s_axi_awsize(S_AXI_awsize),
        .s_axi_awvalid(S_AXI_awvalid),
        .s_axi_bid(S_AXI_bid),
        .s_axi_bready(S_AXI_bready),
        .s_axi_bresp(S_AXI_bresp),
        .s_axi_bvalid(S_AXI_bvalid),
        .s_axi_rdata(S_AXI_rdata),
        .s_axi_rid(S_AXI_rid),
        .s_axi_rlast(S_AXI_rlast),
        .s_axi_rready(S_AXI_rready),
        .s_axi_rresp(S_AXI_rresp),
        .s_axi_rvalid(S_AXI_rvalid),
        .s_axi_wdata(S_AXI_wdata),
        .s_axi_wid(S_AXI_wid),
        .s_axi_wlast(S_AXI_wlast),
        .s_axi_wready(S_AXI_wready),
        .s_axi_wstrb(S_AXI_wstrb),
        .s_axi_wvalid(S_AXI_wvalid));
endmodule

module s00_couplers_imp_PTFNND
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arburst,
    M_AXI_arcache,
    M_AXI_arid,
    M_AXI_arlen,
    M_AXI_arlock,
    M_AXI_arprot,
    M_AXI_arqos,
    M_AXI_arready,
    M_AXI_arsize,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awburst,
    M_AXI_awcache,
    M_AXI_awid,
    M_AXI_awlen,
    M_AXI_awlock,
    M_AXI_awprot,
    M_AXI_awqos,
    M_AXI_awready,
    M_AXI_awsize,
    M_AXI_awvalid,
    M_AXI_bid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rid,
    M_AXI_rlast,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wid,
    M_AXI_wlast,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arburst,
    S_AXI_arcache,
    S_AXI_arid,
    S_AXI_arlen,
    S_AXI_arlock,
    S_AXI_arprot,
    S_AXI_arqos,
    S_AXI_arready,
    S_AXI_arsize,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awburst,
    S_AXI_awcache,
    S_AXI_awid,
    S_AXI_awlen,
    S_AXI_awlock,
    S_AXI_awprot,
    S_AXI_awqos,
    S_AXI_awready,
    S_AXI_awsize,
    S_AXI_awvalid,
    S_AXI_bid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rid,
    S_AXI_rlast,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wlast,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  output [1:0]M_AXI_arburst;
  output [3:0]M_AXI_arcache;
  output [5:0]M_AXI_arid;
  output [3:0]M_AXI_arlen;
  output [1:0]M_AXI_arlock;
  output [2:0]M_AXI_arprot;
  output [3:0]M_AXI_arqos;
  input M_AXI_arready;
  output [2:0]M_AXI_arsize;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  output [1:0]M_AXI_awburst;
  output [3:0]M_AXI_awcache;
  output [5:0]M_AXI_awid;
  output [3:0]M_AXI_awlen;
  output [1:0]M_AXI_awlock;
  output [2:0]M_AXI_awprot;
  output [3:0]M_AXI_awqos;
  input M_AXI_awready;
  output [2:0]M_AXI_awsize;
  output M_AXI_awvalid;
  input [5:0]M_AXI_bid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  input [5:0]M_AXI_rid;
  input M_AXI_rlast;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  output [5:0]M_AXI_wid;
  output M_AXI_wlast;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [1:0]S_AXI_arburst;
  input [3:0]S_AXI_arcache;
  input [5:0]S_AXI_arid;
  input [7:0]S_AXI_arlen;
  input [1:0]S_AXI_arlock;
  input [2:0]S_AXI_arprot;
  input [3:0]S_AXI_arqos;
  output S_AXI_arready;
  input [2:0]S_AXI_arsize;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [1:0]S_AXI_awburst;
  input [3:0]S_AXI_awcache;
  input [5:0]S_AXI_awid;
  input [7:0]S_AXI_awlen;
  input [1:0]S_AXI_awlock;
  input [2:0]S_AXI_awprot;
  input [3:0]S_AXI_awqos;
  output S_AXI_awready;
  input [2:0]S_AXI_awsize;
  input S_AXI_awvalid;
  output [5:0]S_AXI_bid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  output [5:0]S_AXI_rid;
  output S_AXI_rlast;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  input S_AXI_wlast;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire [31:0]M_AXI_araddr;
  wire [1:0]M_AXI_arburst;
  wire [3:0]M_AXI_arcache;
  wire [5:0]M_AXI_arid;
  wire [3:0]M_AXI_arlen;
  wire [1:0]M_AXI_arlock;
  wire [2:0]M_AXI_arprot;
  wire [3:0]M_AXI_arqos;
  wire M_AXI_arready;
  wire [2:0]M_AXI_arsize;
  wire M_AXI_arvalid;
  wire [31:0]M_AXI_awaddr;
  wire [1:0]M_AXI_awburst;
  wire [3:0]M_AXI_awcache;
  wire [5:0]M_AXI_awid;
  wire [3:0]M_AXI_awlen;
  wire [1:0]M_AXI_awlock;
  wire [2:0]M_AXI_awprot;
  wire [3:0]M_AXI_awqos;
  wire M_AXI_awready;
  wire [2:0]M_AXI_awsize;
  wire M_AXI_awvalid;
  wire [5:0]M_AXI_bid;
  wire M_AXI_bready;
  wire [1:0]M_AXI_bresp;
  wire M_AXI_bvalid;
  wire [31:0]M_AXI_rdata;
  wire [5:0]M_AXI_rid;
  wire M_AXI_rlast;
  wire M_AXI_rready;
  wire [1:0]M_AXI_rresp;
  wire M_AXI_rvalid;
  wire [31:0]M_AXI_wdata;
  wire [5:0]M_AXI_wid;
  wire M_AXI_wlast;
  wire M_AXI_wready;
  wire [3:0]M_AXI_wstrb;
  wire M_AXI_wvalid;
  wire S_ACLK;
  wire S_ARESETN;
  wire [31:0]S_AXI_araddr;
  wire [1:0]S_AXI_arburst;
  wire [3:0]S_AXI_arcache;
  wire [5:0]S_AXI_arid;
  wire [7:0]S_AXI_arlen;
  wire [1:0]S_AXI_arlock;
  wire [2:0]S_AXI_arprot;
  wire [3:0]S_AXI_arqos;
  wire S_AXI_arready;
  wire [2:0]S_AXI_arsize;
  wire S_AXI_arvalid;
  wire [31:0]S_AXI_awaddr;
  wire [1:0]S_AXI_awburst;
  wire [3:0]S_AXI_awcache;
  wire [5:0]S_AXI_awid;
  wire [7:0]S_AXI_awlen;
  wire [1:0]S_AXI_awlock;
  wire [2:0]S_AXI_awprot;
  wire [3:0]S_AXI_awqos;
  wire S_AXI_awready;
  wire [2:0]S_AXI_awsize;
  wire S_AXI_awvalid;
  wire [5:0]S_AXI_bid;
  wire S_AXI_bready;
  wire [1:0]S_AXI_bresp;
  wire S_AXI_bvalid;
  wire [31:0]S_AXI_rdata;
  wire [5:0]S_AXI_rid;
  wire S_AXI_rlast;
  wire S_AXI_rready;
  wire [1:0]S_AXI_rresp;
  wire S_AXI_rvalid;
  wire [31:0]S_AXI_wdata;
  wire S_AXI_wlast;
  wire S_AXI_wready;
  wire [3:0]S_AXI_wstrb;
  wire S_AXI_wvalid;

  system_axi_ic_mem_imp_auto_pc_0 auto_pc
       (.aclk(S_ACLK),
        .aresetn(S_ARESETN),
        .m_axi_araddr(M_AXI_araddr),
        .m_axi_arburst(M_AXI_arburst),
        .m_axi_arcache(M_AXI_arcache),
        .m_axi_arid(M_AXI_arid),
        .m_axi_arlen(M_AXI_arlen),
        .m_axi_arlock(M_AXI_arlock),
        .m_axi_arprot(M_AXI_arprot),
        .m_axi_arqos(M_AXI_arqos),
        .m_axi_arready(M_AXI_arready),
        .m_axi_arsize(M_AXI_arsize),
        .m_axi_arvalid(M_AXI_arvalid),
        .m_axi_awaddr(M_AXI_awaddr),
        .m_axi_awburst(M_AXI_awburst),
        .m_axi_awcache(M_AXI_awcache),
        .m_axi_awid(M_AXI_awid),
        .m_axi_awlen(M_AXI_awlen),
        .m_axi_awlock(M_AXI_awlock),
        .m_axi_awprot(M_AXI_awprot),
        .m_axi_awqos(M_AXI_awqos),
        .m_axi_awready(M_AXI_awready),
        .m_axi_awsize(M_AXI_awsize),
        .m_axi_awvalid(M_AXI_awvalid),
        .m_axi_bid(M_AXI_bid),
        .m_axi_bready(M_AXI_bready),
        .m_axi_bresp(M_AXI_bresp),
        .m_axi_bvalid(M_AXI_bvalid),
        .m_axi_rdata(M_AXI_rdata),
        .m_axi_rid(M_AXI_rid),
        .m_axi_rlast(M_AXI_rlast),
        .m_axi_rready(M_AXI_rready),
        .m_axi_rresp(M_AXI_rresp),
        .m_axi_rvalid(M_AXI_rvalid),
        .m_axi_wdata(M_AXI_wdata),
        .m_axi_wid(M_AXI_wid),
        .m_axi_wlast(M_AXI_wlast),
        .m_axi_wready(M_AXI_wready),
        .m_axi_wstrb(M_AXI_wstrb),
        .m_axi_wvalid(M_AXI_wvalid),
        .s_axi_araddr(S_AXI_araddr),
        .s_axi_arburst(S_AXI_arburst),
        .s_axi_arcache(S_AXI_arcache),
        .s_axi_arid(S_AXI_arid),
        .s_axi_arlen(S_AXI_arlen),
        .s_axi_arlock(S_AXI_arlock[0]),
        .s_axi_arprot(S_AXI_arprot),
        .s_axi_arqos(S_AXI_arqos),
        .s_axi_arready(S_AXI_arready),
        .s_axi_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arsize(S_AXI_arsize),
        .s_axi_arvalid(S_AXI_arvalid),
        .s_axi_awaddr(S_AXI_awaddr),
        .s_axi_awburst(S_AXI_awburst),
        .s_axi_awcache(S_AXI_awcache),
        .s_axi_awid(S_AXI_awid),
        .s_axi_awlen(S_AXI_awlen),
        .s_axi_awlock(S_AXI_awlock[0]),
        .s_axi_awprot(S_AXI_awprot),
        .s_axi_awqos(S_AXI_awqos),
        .s_axi_awready(S_AXI_awready),
        .s_axi_awregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awsize(S_AXI_awsize),
        .s_axi_awvalid(S_AXI_awvalid),
        .s_axi_bid(S_AXI_bid),
        .s_axi_bready(S_AXI_bready),
        .s_axi_bresp(S_AXI_bresp),
        .s_axi_bvalid(S_AXI_bvalid),
        .s_axi_rdata(S_AXI_rdata),
        .s_axi_rid(S_AXI_rid),
        .s_axi_rlast(S_AXI_rlast),
        .s_axi_rready(S_AXI_rready),
        .s_axi_rresp(S_AXI_rresp),
        .s_axi_rvalid(S_AXI_rvalid),
        .s_axi_wdata(S_AXI_wdata),
        .s_axi_wlast(S_AXI_wlast),
        .s_axi_wready(S_AXI_wready),
        .s_axi_wstrb(S_AXI_wstrb),
        .s_axi_wvalid(S_AXI_wvalid));
endmodule

(* CORE_GENERATION_INFO = "system,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=system,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=21,numReposBlks=12,numNonXlnxBlks=0,numHierBlks=9,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=2,numPkgbdBlks=0,bdsource=USER,da_ps7_cnt=1,synth_mode=Hierarchical}" *) (* HW_HANDOFF = "system.hwdef" *) 
module system
   (DDR_addr,
    DDR_ba,
    DDR_cas_n,
    DDR_ck_n,
    DDR_ck_p,
    DDR_cke,
    DDR_cs_n,
    DDR_dm,
    DDR_dq,
    DDR_dqs_n,
    DDR_dqs_p,
    DDR_odt,
    DDR_ras_n,
    DDR_reset_n,
    DDR_we_n,
    FIXED_IO_ddr_vrn,
    FIXED_IO_ddr_vrp,
    FIXED_IO_mio,
    FIXED_IO_ps_clk,
    FIXED_IO_ps_porb,
    FIXED_IO_ps_srstb,
    hdmi_clk,
    hdmi_d,
    hdmi_de,
    hdmi_hsync,
    hdmi_iic_scl_i,
    hdmi_iic_scl_o,
    hdmi_iic_scl_t,
    hdmi_iic_sda_i,
    hdmi_iic_sda_o,
    hdmi_iic_sda_t,
    hdmi_vsync,
    leds,
    vga_b,
    vga_g,
    vga_hsync,
    vga_r,
    vga_vsync);
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR ADDR" *) (* X_INTERFACE_MODE = "Master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DDR, AXI_ARBITRATION_SCHEME TDM, BURST_LENGTH 8, CAN_DEBUG false, CAS_LATENCY 11, CAS_WRITE_LATENCY 11, CS_ENABLED true, DATA_MASK_ENABLED true, DATA_WIDTH 8, MEMORY_TYPE COMPONENTS, MEM_ADDR_MAP ROW_COLUMN_BANK, SLOT Single, TIMEPERIOD_PS 1250" *) inout [14:0]DDR_addr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR BA" *) inout [2:0]DDR_ba;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CAS_N" *) inout DDR_cas_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CK_N" *) inout DDR_ck_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CK_P" *) inout DDR_ck_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CKE" *) inout DDR_cke;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CS_N" *) inout DDR_cs_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR DM" *) inout [3:0]DDR_dm;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR DQ" *) inout [31:0]DDR_dq;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR DQS_N" *) inout [3:0]DDR_dqs_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR DQS_P" *) inout [3:0]DDR_dqs_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR ODT" *) inout DDR_odt;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR RAS_N" *) inout DDR_ras_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR RESET_N" *) inout DDR_reset_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR WE_N" *) inout DDR_we_n;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO DDR_VRN" *) (* X_INTERFACE_MODE = "Master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME FIXED_IO, CAN_DEBUG false" *) inout FIXED_IO_ddr_vrn;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO DDR_VRP" *) inout FIXED_IO_ddr_vrp;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO MIO" *) inout [53:0]FIXED_IO_mio;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_CLK" *) inout FIXED_IO_ps_clk;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_PORB" *) inout FIXED_IO_ps_porb;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_SRSTB" *) inout FIXED_IO_ps_srstb;
  output hdmi_clk;
  output [15:0]hdmi_d;
  output hdmi_de;
  output hdmi_hsync;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 hdmi_iic SCL_I" *) (* X_INTERFACE_MODE = "Master" *) input hdmi_iic_scl_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 hdmi_iic SCL_O" *) output hdmi_iic_scl_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 hdmi_iic SCL_T" *) output hdmi_iic_scl_t;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 hdmi_iic SDA_I" *) input hdmi_iic_sda_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 hdmi_iic SDA_O" *) output hdmi_iic_sda_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 hdmi_iic SDA_T" *) output hdmi_iic_sda_t;
  output hdmi_vsync;
  output [3:0]leds;
  output [3:0]vga_b;
  output [3:0]vga_g;
  output vga_hsync;
  output [3:0]vga_r;
  output vga_vsync;

  wire [14:0]DDR_addr;
  wire [2:0]DDR_ba;
  wire DDR_cas_n;
  wire DDR_ck_n;
  wire DDR_ck_p;
  wire DDR_cke;
  wire DDR_cs_n;
  wire [3:0]DDR_dm;
  wire [31:0]DDR_dq;
  wire [3:0]DDR_dqs_n;
  wire [3:0]DDR_dqs_p;
  wire DDR_odt;
  wire DDR_ras_n;
  wire DDR_reset_n;
  wire DDR_we_n;
  wire FIXED_IO_ddr_vrn;
  wire FIXED_IO_ddr_vrp;
  wire [53:0]FIXED_IO_mio;
  wire FIXED_IO_ps_clk;
  wire FIXED_IO_ps_porb;
  wire FIXED_IO_ps_srstb;
  wire accel_irq_done;
  wire [31:0]accel_m_axi_hp_ARADDR;
  wire [1:0]accel_m_axi_hp_ARBURST;
  wire [3:0]accel_m_axi_hp_ARCACHE;
  wire [5:0]accel_m_axi_hp_ARID;
  wire [7:0]accel_m_axi_hp_ARLEN;
  wire [1:0]accel_m_axi_hp_ARLOCK;
  wire [2:0]accel_m_axi_hp_ARPROT;
  wire [3:0]accel_m_axi_hp_ARQOS;
  wire accel_m_axi_hp_ARREADY;
  wire [2:0]accel_m_axi_hp_ARSIZE;
  wire accel_m_axi_hp_ARVALID;
  wire [31:0]accel_m_axi_hp_AWADDR;
  wire [1:0]accel_m_axi_hp_AWBURST;
  wire [3:0]accel_m_axi_hp_AWCACHE;
  wire [5:0]accel_m_axi_hp_AWID;
  wire [7:0]accel_m_axi_hp_AWLEN;
  wire [1:0]accel_m_axi_hp_AWLOCK;
  wire [2:0]accel_m_axi_hp_AWPROT;
  wire [3:0]accel_m_axi_hp_AWQOS;
  wire accel_m_axi_hp_AWREADY;
  wire [2:0]accel_m_axi_hp_AWSIZE;
  wire accel_m_axi_hp_AWVALID;
  wire [5:0]accel_m_axi_hp_BID;
  wire accel_m_axi_hp_BREADY;
  wire [1:0]accel_m_axi_hp_BRESP;
  wire accel_m_axi_hp_BVALID;
  wire [31:0]accel_m_axi_hp_RDATA;
  wire [5:0]accel_m_axi_hp_RID;
  wire accel_m_axi_hp_RLAST;
  wire accel_m_axi_hp_RREADY;
  wire [1:0]accel_m_axi_hp_RRESP;
  wire accel_m_axi_hp_RVALID;
  wire [31:0]accel_m_axi_hp_WDATA;
  wire accel_m_axi_hp_WLAST;
  wire accel_m_axi_hp_WREADY;
  wire [3:0]accel_m_axi_hp_WSTRB;
  wire accel_m_axi_hp_WVALID;
  wire [31:0]axi_ic_ctrl_M00_AXI_ARADDR;
  wire [1:0]axi_ic_ctrl_M00_AXI_ARBURST;
  wire [3:0]axi_ic_ctrl_M00_AXI_ARCACHE;
  wire [11:0]axi_ic_ctrl_M00_AXI_ARID;
  wire [7:0]axi_ic_ctrl_M00_AXI_ARLEN;
  wire [0:0]axi_ic_ctrl_M00_AXI_ARLOCK;
  wire [2:0]axi_ic_ctrl_M00_AXI_ARPROT;
  wire [3:0]axi_ic_ctrl_M00_AXI_ARQOS;
  wire axi_ic_ctrl_M00_AXI_ARREADY;
  wire [3:0]axi_ic_ctrl_M00_AXI_ARREGION;
  wire [2:0]axi_ic_ctrl_M00_AXI_ARSIZE;
  wire axi_ic_ctrl_M00_AXI_ARVALID;
  wire [31:0]axi_ic_ctrl_M00_AXI_AWADDR;
  wire [1:0]axi_ic_ctrl_M00_AXI_AWBURST;
  wire [3:0]axi_ic_ctrl_M00_AXI_AWCACHE;
  wire [11:0]axi_ic_ctrl_M00_AXI_AWID;
  wire [7:0]axi_ic_ctrl_M00_AXI_AWLEN;
  wire [0:0]axi_ic_ctrl_M00_AXI_AWLOCK;
  wire [2:0]axi_ic_ctrl_M00_AXI_AWPROT;
  wire [3:0]axi_ic_ctrl_M00_AXI_AWQOS;
  wire axi_ic_ctrl_M00_AXI_AWREADY;
  wire [3:0]axi_ic_ctrl_M00_AXI_AWREGION;
  wire [2:0]axi_ic_ctrl_M00_AXI_AWSIZE;
  wire axi_ic_ctrl_M00_AXI_AWVALID;
  wire [11:0]axi_ic_ctrl_M00_AXI_BID;
  wire axi_ic_ctrl_M00_AXI_BREADY;
  wire [1:0]axi_ic_ctrl_M00_AXI_BRESP;
  wire axi_ic_ctrl_M00_AXI_BVALID;
  wire [31:0]axi_ic_ctrl_M00_AXI_RDATA;
  wire [11:0]axi_ic_ctrl_M00_AXI_RID;
  wire axi_ic_ctrl_M00_AXI_RLAST;
  wire axi_ic_ctrl_M00_AXI_RREADY;
  wire [1:0]axi_ic_ctrl_M00_AXI_RRESP;
  wire axi_ic_ctrl_M00_AXI_RVALID;
  wire [31:0]axi_ic_ctrl_M00_AXI_WDATA;
  wire axi_ic_ctrl_M00_AXI_WLAST;
  wire axi_ic_ctrl_M00_AXI_WREADY;
  wire [3:0]axi_ic_ctrl_M00_AXI_WSTRB;
  wire axi_ic_ctrl_M00_AXI_WVALID;
  wire [31:0]axi_ic_ctrl_M01_AXI_ARADDR;
  wire [1:0]axi_ic_ctrl_M01_AXI_ARBURST;
  wire [3:0]axi_ic_ctrl_M01_AXI_ARCACHE;
  wire [11:0]axi_ic_ctrl_M01_AXI_ARID;
  wire [7:0]axi_ic_ctrl_M01_AXI_ARLEN;
  wire [0:0]axi_ic_ctrl_M01_AXI_ARLOCK;
  wire [2:0]axi_ic_ctrl_M01_AXI_ARPROT;
  wire [3:0]axi_ic_ctrl_M01_AXI_ARQOS;
  wire axi_ic_ctrl_M01_AXI_ARREADY;
  wire [3:0]axi_ic_ctrl_M01_AXI_ARREGION;
  wire [2:0]axi_ic_ctrl_M01_AXI_ARSIZE;
  wire axi_ic_ctrl_M01_AXI_ARVALID;
  wire [31:0]axi_ic_ctrl_M01_AXI_AWADDR;
  wire [1:0]axi_ic_ctrl_M01_AXI_AWBURST;
  wire [3:0]axi_ic_ctrl_M01_AXI_AWCACHE;
  wire [11:0]axi_ic_ctrl_M01_AXI_AWID;
  wire [7:0]axi_ic_ctrl_M01_AXI_AWLEN;
  wire [0:0]axi_ic_ctrl_M01_AXI_AWLOCK;
  wire [2:0]axi_ic_ctrl_M01_AXI_AWPROT;
  wire [3:0]axi_ic_ctrl_M01_AXI_AWQOS;
  wire axi_ic_ctrl_M01_AXI_AWREADY;
  wire [3:0]axi_ic_ctrl_M01_AXI_AWREGION;
  wire [2:0]axi_ic_ctrl_M01_AXI_AWSIZE;
  wire axi_ic_ctrl_M01_AXI_AWVALID;
  wire [11:0]axi_ic_ctrl_M01_AXI_BID;
  wire axi_ic_ctrl_M01_AXI_BREADY;
  wire [1:0]axi_ic_ctrl_M01_AXI_BRESP;
  wire axi_ic_ctrl_M01_AXI_BVALID;
  wire [31:0]axi_ic_ctrl_M01_AXI_RDATA;
  wire [11:0]axi_ic_ctrl_M01_AXI_RID;
  wire axi_ic_ctrl_M01_AXI_RLAST;
  wire axi_ic_ctrl_M01_AXI_RREADY;
  wire [1:0]axi_ic_ctrl_M01_AXI_RRESP;
  wire axi_ic_ctrl_M01_AXI_RVALID;
  wire [31:0]axi_ic_ctrl_M01_AXI_WDATA;
  wire axi_ic_ctrl_M01_AXI_WLAST;
  wire axi_ic_ctrl_M01_AXI_WREADY;
  wire [3:0]axi_ic_ctrl_M01_AXI_WSTRB;
  wire axi_ic_ctrl_M01_AXI_WVALID;
  wire [31:0]axi_ic_ctrl_M02_AXI_ARADDR;
  wire axi_ic_ctrl_M02_AXI_ARREADY;
  wire axi_ic_ctrl_M02_AXI_ARVALID;
  wire [31:0]axi_ic_ctrl_M02_AXI_AWADDR;
  wire axi_ic_ctrl_M02_AXI_AWREADY;
  wire axi_ic_ctrl_M02_AXI_AWVALID;
  wire axi_ic_ctrl_M02_AXI_BREADY;
  wire [1:0]axi_ic_ctrl_M02_AXI_BRESP;
  wire axi_ic_ctrl_M02_AXI_BVALID;
  wire [31:0]axi_ic_ctrl_M02_AXI_RDATA;
  wire axi_ic_ctrl_M02_AXI_RREADY;
  wire [1:0]axi_ic_ctrl_M02_AXI_RRESP;
  wire axi_ic_ctrl_M02_AXI_RVALID;
  wire [31:0]axi_ic_ctrl_M02_AXI_WDATA;
  wire axi_ic_ctrl_M02_AXI_WREADY;
  wire [3:0]axi_ic_ctrl_M02_AXI_WSTRB;
  wire axi_ic_ctrl_M02_AXI_WVALID;
  wire [31:0]axi_ic_mem_M00_AXI_ARADDR;
  wire [1:0]axi_ic_mem_M00_AXI_ARBURST;
  wire [3:0]axi_ic_mem_M00_AXI_ARCACHE;
  wire [5:0]axi_ic_mem_M00_AXI_ARID;
  wire [3:0]axi_ic_mem_M00_AXI_ARLEN;
  wire [1:0]axi_ic_mem_M00_AXI_ARLOCK;
  wire [2:0]axi_ic_mem_M00_AXI_ARPROT;
  wire [3:0]axi_ic_mem_M00_AXI_ARQOS;
  wire axi_ic_mem_M00_AXI_ARREADY;
  wire [2:0]axi_ic_mem_M00_AXI_ARSIZE;
  wire axi_ic_mem_M00_AXI_ARVALID;
  wire [31:0]axi_ic_mem_M00_AXI_AWADDR;
  wire [1:0]axi_ic_mem_M00_AXI_AWBURST;
  wire [3:0]axi_ic_mem_M00_AXI_AWCACHE;
  wire [5:0]axi_ic_mem_M00_AXI_AWID;
  wire [3:0]axi_ic_mem_M00_AXI_AWLEN;
  wire [1:0]axi_ic_mem_M00_AXI_AWLOCK;
  wire [2:0]axi_ic_mem_M00_AXI_AWPROT;
  wire [3:0]axi_ic_mem_M00_AXI_AWQOS;
  wire axi_ic_mem_M00_AXI_AWREADY;
  wire [2:0]axi_ic_mem_M00_AXI_AWSIZE;
  wire axi_ic_mem_M00_AXI_AWVALID;
  wire [5:0]axi_ic_mem_M00_AXI_BID;
  wire axi_ic_mem_M00_AXI_BREADY;
  wire [1:0]axi_ic_mem_M00_AXI_BRESP;
  wire axi_ic_mem_M00_AXI_BVALID;
  wire [31:0]axi_ic_mem_M00_AXI_RDATA;
  wire [5:0]axi_ic_mem_M00_AXI_RID;
  wire axi_ic_mem_M00_AXI_RLAST;
  wire axi_ic_mem_M00_AXI_RREADY;
  wire [1:0]axi_ic_mem_M00_AXI_RRESP;
  wire axi_ic_mem_M00_AXI_RVALID;
  wire [31:0]axi_ic_mem_M00_AXI_WDATA;
  wire [5:0]axi_ic_mem_M00_AXI_WID;
  wire axi_ic_mem_M00_AXI_WLAST;
  wire axi_ic_mem_M00_AXI_WREADY;
  wire [3:0]axi_ic_mem_M00_AXI_WSTRB;
  wire axi_ic_mem_M00_AXI_WVALID;
  wire [31:0]axi_ic_vid_M00_AXI_ARADDR;
  wire [1:0]axi_ic_vid_M00_AXI_ARBURST;
  wire [3:0]axi_ic_vid_M00_AXI_ARCACHE;
  wire [5:0]axi_ic_vid_M00_AXI_ARID;
  wire [3:0]axi_ic_vid_M00_AXI_ARLEN;
  wire [1:0]axi_ic_vid_M00_AXI_ARLOCK;
  wire [2:0]axi_ic_vid_M00_AXI_ARPROT;
  wire [3:0]axi_ic_vid_M00_AXI_ARQOS;
  wire axi_ic_vid_M00_AXI_ARREADY;
  wire [2:0]axi_ic_vid_M00_AXI_ARSIZE;
  wire axi_ic_vid_M00_AXI_ARVALID;
  wire [31:0]axi_ic_vid_M00_AXI_RDATA;
  wire [5:0]axi_ic_vid_M00_AXI_RID;
  wire axi_ic_vid_M00_AXI_RLAST;
  wire axi_ic_vid_M00_AXI_RREADY;
  wire [1:0]axi_ic_vid_M00_AXI_RRESP;
  wire axi_ic_vid_M00_AXI_RVALID;
  wire [15:0]axi_pc_ctrl_M_AXI_ARADDR;
  wire [2:0]axi_pc_ctrl_M_AXI_ARPROT;
  wire axi_pc_ctrl_M_AXI_ARREADY;
  wire axi_pc_ctrl_M_AXI_ARVALID;
  wire [15:0]axi_pc_ctrl_M_AXI_AWADDR;
  wire [2:0]axi_pc_ctrl_M_AXI_AWPROT;
  wire axi_pc_ctrl_M_AXI_AWREADY;
  wire axi_pc_ctrl_M_AXI_AWVALID;
  wire axi_pc_ctrl_M_AXI_BREADY;
  wire [1:0]axi_pc_ctrl_M_AXI_BRESP;
  wire axi_pc_ctrl_M_AXI_BVALID;
  wire [31:0]axi_pc_ctrl_M_AXI_RDATA;
  wire axi_pc_ctrl_M_AXI_RREADY;
  wire [1:0]axi_pc_ctrl_M_AXI_RRESP;
  wire axi_pc_ctrl_M_AXI_RVALID;
  wire [31:0]axi_pc_ctrl_M_AXI_WDATA;
  wire axi_pc_ctrl_M_AXI_WREADY;
  wire [3:0]axi_pc_ctrl_M_AXI_WSTRB;
  wire axi_pc_ctrl_M_AXI_WVALID;
  wire [15:0]axi_pc_hdmi_M_AXI_ARADDR;
  wire [2:0]axi_pc_hdmi_M_AXI_ARPROT;
  wire axi_pc_hdmi_M_AXI_ARREADY;
  wire axi_pc_hdmi_M_AXI_ARVALID;
  wire [15:0]axi_pc_hdmi_M_AXI_AWADDR;
  wire [2:0]axi_pc_hdmi_M_AXI_AWPROT;
  wire axi_pc_hdmi_M_AXI_AWREADY;
  wire axi_pc_hdmi_M_AXI_AWVALID;
  wire axi_pc_hdmi_M_AXI_BREADY;
  wire [1:0]axi_pc_hdmi_M_AXI_BRESP;
  wire axi_pc_hdmi_M_AXI_BVALID;
  wire [31:0]axi_pc_hdmi_M_AXI_RDATA;
  wire axi_pc_hdmi_M_AXI_RREADY;
  wire [1:0]axi_pc_hdmi_M_AXI_RRESP;
  wire axi_pc_hdmi_M_AXI_RVALID;
  wire [31:0]axi_pc_hdmi_M_AXI_WDATA;
  wire axi_pc_hdmi_M_AXI_WREADY;
  wire [3:0]axi_pc_hdmi_M_AXI_WSTRB;
  wire axi_pc_hdmi_M_AXI_WVALID;
  wire hdmi_clk;
  wire [15:0]hdmi_d;
  wire hdmi_de;
  wire hdmi_hsync;
  wire hdmi_iic_scl_i;
  wire hdmi_iic_scl_o;
  wire hdmi_iic_scl_t;
  wire hdmi_iic_sda_i;
  wire hdmi_iic_sda_o;
  wire hdmi_iic_sda_t;
  wire [31:0]hdmi_m_axi_hp_ARADDR;
  wire [1:0]hdmi_m_axi_hp_ARBURST;
  wire [3:0]hdmi_m_axi_hp_ARCACHE;
  wire [5:0]hdmi_m_axi_hp_ARID;
  wire [7:0]hdmi_m_axi_hp_ARLEN;
  wire [1:0]hdmi_m_axi_hp_ARLOCK;
  wire [2:0]hdmi_m_axi_hp_ARPROT;
  wire [3:0]hdmi_m_axi_hp_ARQOS;
  wire hdmi_m_axi_hp_ARREADY;
  wire [2:0]hdmi_m_axi_hp_ARSIZE;
  wire hdmi_m_axi_hp_ARVALID;
  wire [31:0]hdmi_m_axi_hp_RDATA;
  wire [5:0]hdmi_m_axi_hp_RID;
  wire hdmi_m_axi_hp_RLAST;
  wire hdmi_m_axi_hp_RREADY;
  wire [1:0]hdmi_m_axi_hp_RRESP;
  wire hdmi_m_axi_hp_RVALID;
  wire hdmi_vsync;
  wire [3:0]leds;
  wire ps7_FCLK_CLK0;
  wire ps7_FCLK_CLK1;
  wire ps7_FCLK_RESET0_N;
  wire [31:0]ps7_M_AXI_GP0_ARADDR;
  wire [1:0]ps7_M_AXI_GP0_ARBURST;
  wire [3:0]ps7_M_AXI_GP0_ARCACHE;
  wire [11:0]ps7_M_AXI_GP0_ARID;
  wire [3:0]ps7_M_AXI_GP0_ARLEN;
  wire [1:0]ps7_M_AXI_GP0_ARLOCK;
  wire [2:0]ps7_M_AXI_GP0_ARPROT;
  wire [3:0]ps7_M_AXI_GP0_ARQOS;
  wire ps7_M_AXI_GP0_ARREADY;
  wire [2:0]ps7_M_AXI_GP0_ARSIZE;
  wire ps7_M_AXI_GP0_ARVALID;
  wire [31:0]ps7_M_AXI_GP0_AWADDR;
  wire [1:0]ps7_M_AXI_GP0_AWBURST;
  wire [3:0]ps7_M_AXI_GP0_AWCACHE;
  wire [11:0]ps7_M_AXI_GP0_AWID;
  wire [3:0]ps7_M_AXI_GP0_AWLEN;
  wire [1:0]ps7_M_AXI_GP0_AWLOCK;
  wire [2:0]ps7_M_AXI_GP0_AWPROT;
  wire [3:0]ps7_M_AXI_GP0_AWQOS;
  wire ps7_M_AXI_GP0_AWREADY;
  wire [2:0]ps7_M_AXI_GP0_AWSIZE;
  wire ps7_M_AXI_GP0_AWVALID;
  wire [11:0]ps7_M_AXI_GP0_BID;
  wire ps7_M_AXI_GP0_BREADY;
  wire [1:0]ps7_M_AXI_GP0_BRESP;
  wire ps7_M_AXI_GP0_BVALID;
  wire [31:0]ps7_M_AXI_GP0_RDATA;
  wire [11:0]ps7_M_AXI_GP0_RID;
  wire ps7_M_AXI_GP0_RLAST;
  wire ps7_M_AXI_GP0_RREADY;
  wire [1:0]ps7_M_AXI_GP0_RRESP;
  wire ps7_M_AXI_GP0_RVALID;
  wire [31:0]ps7_M_AXI_GP0_WDATA;
  wire [11:0]ps7_M_AXI_GP0_WID;
  wire ps7_M_AXI_GP0_WLAST;
  wire ps7_M_AXI_GP0_WREADY;
  wire [3:0]ps7_M_AXI_GP0_WSTRB;
  wire ps7_M_AXI_GP0_WVALID;
  wire [0:0]rst_sys_peripheral_aresetn;
  wire [3:0]vga_b;
  wire [3:0]vga_g;
  wire vga_hsync;
  wire [3:0]vga_r;
  wire vga_vsync;

  system_accel_0 accel
       (.aclk(ps7_FCLK_CLK0),
        .aresetn(rst_sys_peripheral_aresetn),
        .irq_done(accel_irq_done),
        .m_axi_hp_araddr(accel_m_axi_hp_ARADDR),
        .m_axi_hp_arburst(accel_m_axi_hp_ARBURST),
        .m_axi_hp_arcache(accel_m_axi_hp_ARCACHE),
        .m_axi_hp_arid(accel_m_axi_hp_ARID),
        .m_axi_hp_arlen(accel_m_axi_hp_ARLEN),
        .m_axi_hp_arlock(accel_m_axi_hp_ARLOCK),
        .m_axi_hp_arprot(accel_m_axi_hp_ARPROT),
        .m_axi_hp_arqos(accel_m_axi_hp_ARQOS),
        .m_axi_hp_arready(accel_m_axi_hp_ARREADY),
        .m_axi_hp_arsize(accel_m_axi_hp_ARSIZE),
        .m_axi_hp_arvalid(accel_m_axi_hp_ARVALID),
        .m_axi_hp_awaddr(accel_m_axi_hp_AWADDR),
        .m_axi_hp_awburst(accel_m_axi_hp_AWBURST),
        .m_axi_hp_awcache(accel_m_axi_hp_AWCACHE),
        .m_axi_hp_awid(accel_m_axi_hp_AWID),
        .m_axi_hp_awlen(accel_m_axi_hp_AWLEN),
        .m_axi_hp_awlock(accel_m_axi_hp_AWLOCK),
        .m_axi_hp_awprot(accel_m_axi_hp_AWPROT),
        .m_axi_hp_awqos(accel_m_axi_hp_AWQOS),
        .m_axi_hp_awready(accel_m_axi_hp_AWREADY),
        .m_axi_hp_awsize(accel_m_axi_hp_AWSIZE),
        .m_axi_hp_awvalid(accel_m_axi_hp_AWVALID),
        .m_axi_hp_bid(accel_m_axi_hp_BID),
        .m_axi_hp_bready(accel_m_axi_hp_BREADY),
        .m_axi_hp_bresp(accel_m_axi_hp_BRESP),
        .m_axi_hp_bvalid(accel_m_axi_hp_BVALID),
        .m_axi_hp_rdata(accel_m_axi_hp_RDATA),
        .m_axi_hp_rid(accel_m_axi_hp_RID),
        .m_axi_hp_rlast(accel_m_axi_hp_RLAST),
        .m_axi_hp_rready(accel_m_axi_hp_RREADY),
        .m_axi_hp_rresp(accel_m_axi_hp_RRESP),
        .m_axi_hp_rvalid(accel_m_axi_hp_RVALID),
        .m_axi_hp_wdata(accel_m_axi_hp_WDATA),
        .m_axi_hp_wlast(accel_m_axi_hp_WLAST),
        .m_axi_hp_wready(accel_m_axi_hp_WREADY),
        .m_axi_hp_wstrb(accel_m_axi_hp_WSTRB),
        .m_axi_hp_wvalid(accel_m_axi_hp_WVALID),
        .s_axi_lite_araddr(axi_pc_ctrl_M_AXI_ARADDR),
        .s_axi_lite_arprot(axi_pc_ctrl_M_AXI_ARPROT),
        .s_axi_lite_arready(axi_pc_ctrl_M_AXI_ARREADY),
        .s_axi_lite_arvalid(axi_pc_ctrl_M_AXI_ARVALID),
        .s_axi_lite_awaddr(axi_pc_ctrl_M_AXI_AWADDR),
        .s_axi_lite_awprot(axi_pc_ctrl_M_AXI_AWPROT),
        .s_axi_lite_awready(axi_pc_ctrl_M_AXI_AWREADY),
        .s_axi_lite_awvalid(axi_pc_ctrl_M_AXI_AWVALID),
        .s_axi_lite_bready(axi_pc_ctrl_M_AXI_BREADY),
        .s_axi_lite_bresp(axi_pc_ctrl_M_AXI_BRESP),
        .s_axi_lite_bvalid(axi_pc_ctrl_M_AXI_BVALID),
        .s_axi_lite_rdata(axi_pc_ctrl_M_AXI_RDATA),
        .s_axi_lite_rready(axi_pc_ctrl_M_AXI_RREADY),
        .s_axi_lite_rresp(axi_pc_ctrl_M_AXI_RRESP),
        .s_axi_lite_rvalid(axi_pc_ctrl_M_AXI_RVALID),
        .s_axi_lite_wdata(axi_pc_ctrl_M_AXI_WDATA),
        .s_axi_lite_wready(axi_pc_ctrl_M_AXI_WREADY),
        .s_axi_lite_wstrb(axi_pc_ctrl_M_AXI_WSTRB),
        .s_axi_lite_wvalid(axi_pc_ctrl_M_AXI_WVALID),
        .status_leds(leds));
  system_axi_ic_ctrl_0 axi_ic_ctrl
       (.ACLK(ps7_FCLK_CLK0),
        .ARESETN(rst_sys_peripheral_aresetn),
        .M00_ACLK(ps7_FCLK_CLK0),
        .M00_ARESETN(rst_sys_peripheral_aresetn),
        .M00_AXI_araddr(axi_ic_ctrl_M00_AXI_ARADDR),
        .M00_AXI_arburst(axi_ic_ctrl_M00_AXI_ARBURST),
        .M00_AXI_arcache(axi_ic_ctrl_M00_AXI_ARCACHE),
        .M00_AXI_arid(axi_ic_ctrl_M00_AXI_ARID),
        .M00_AXI_arlen(axi_ic_ctrl_M00_AXI_ARLEN),
        .M00_AXI_arlock(axi_ic_ctrl_M00_AXI_ARLOCK),
        .M00_AXI_arprot(axi_ic_ctrl_M00_AXI_ARPROT),
        .M00_AXI_arqos(axi_ic_ctrl_M00_AXI_ARQOS),
        .M00_AXI_arready(axi_ic_ctrl_M00_AXI_ARREADY),
        .M00_AXI_arregion(axi_ic_ctrl_M00_AXI_ARREGION),
        .M00_AXI_arsize(axi_ic_ctrl_M00_AXI_ARSIZE),
        .M00_AXI_arvalid(axi_ic_ctrl_M00_AXI_ARVALID),
        .M00_AXI_awaddr(axi_ic_ctrl_M00_AXI_AWADDR),
        .M00_AXI_awburst(axi_ic_ctrl_M00_AXI_AWBURST),
        .M00_AXI_awcache(axi_ic_ctrl_M00_AXI_AWCACHE),
        .M00_AXI_awid(axi_ic_ctrl_M00_AXI_AWID),
        .M00_AXI_awlen(axi_ic_ctrl_M00_AXI_AWLEN),
        .M00_AXI_awlock(axi_ic_ctrl_M00_AXI_AWLOCK),
        .M00_AXI_awprot(axi_ic_ctrl_M00_AXI_AWPROT),
        .M00_AXI_awqos(axi_ic_ctrl_M00_AXI_AWQOS),
        .M00_AXI_awready(axi_ic_ctrl_M00_AXI_AWREADY),
        .M00_AXI_awregion(axi_ic_ctrl_M00_AXI_AWREGION),
        .M00_AXI_awsize(axi_ic_ctrl_M00_AXI_AWSIZE),
        .M00_AXI_awvalid(axi_ic_ctrl_M00_AXI_AWVALID),
        .M00_AXI_bid(axi_ic_ctrl_M00_AXI_BID),
        .M00_AXI_bready(axi_ic_ctrl_M00_AXI_BREADY),
        .M00_AXI_bresp(axi_ic_ctrl_M00_AXI_BRESP),
        .M00_AXI_bvalid(axi_ic_ctrl_M00_AXI_BVALID),
        .M00_AXI_rdata(axi_ic_ctrl_M00_AXI_RDATA),
        .M00_AXI_rid(axi_ic_ctrl_M00_AXI_RID),
        .M00_AXI_rlast(axi_ic_ctrl_M00_AXI_RLAST),
        .M00_AXI_rready(axi_ic_ctrl_M00_AXI_RREADY),
        .M00_AXI_rresp(axi_ic_ctrl_M00_AXI_RRESP),
        .M00_AXI_rvalid(axi_ic_ctrl_M00_AXI_RVALID),
        .M00_AXI_wdata(axi_ic_ctrl_M00_AXI_WDATA),
        .M00_AXI_wlast(axi_ic_ctrl_M00_AXI_WLAST),
        .M00_AXI_wready(axi_ic_ctrl_M00_AXI_WREADY),
        .M00_AXI_wstrb(axi_ic_ctrl_M00_AXI_WSTRB),
        .M00_AXI_wvalid(axi_ic_ctrl_M00_AXI_WVALID),
        .M01_ACLK(ps7_FCLK_CLK0),
        .M01_ARESETN(rst_sys_peripheral_aresetn),
        .M01_AXI_araddr(axi_ic_ctrl_M01_AXI_ARADDR),
        .M01_AXI_arburst(axi_ic_ctrl_M01_AXI_ARBURST),
        .M01_AXI_arcache(axi_ic_ctrl_M01_AXI_ARCACHE),
        .M01_AXI_arid(axi_ic_ctrl_M01_AXI_ARID),
        .M01_AXI_arlen(axi_ic_ctrl_M01_AXI_ARLEN),
        .M01_AXI_arlock(axi_ic_ctrl_M01_AXI_ARLOCK),
        .M01_AXI_arprot(axi_ic_ctrl_M01_AXI_ARPROT),
        .M01_AXI_arqos(axi_ic_ctrl_M01_AXI_ARQOS),
        .M01_AXI_arready(axi_ic_ctrl_M01_AXI_ARREADY),
        .M01_AXI_arregion(axi_ic_ctrl_M01_AXI_ARREGION),
        .M01_AXI_arsize(axi_ic_ctrl_M01_AXI_ARSIZE),
        .M01_AXI_arvalid(axi_ic_ctrl_M01_AXI_ARVALID),
        .M01_AXI_awaddr(axi_ic_ctrl_M01_AXI_AWADDR),
        .M01_AXI_awburst(axi_ic_ctrl_M01_AXI_AWBURST),
        .M01_AXI_awcache(axi_ic_ctrl_M01_AXI_AWCACHE),
        .M01_AXI_awid(axi_ic_ctrl_M01_AXI_AWID),
        .M01_AXI_awlen(axi_ic_ctrl_M01_AXI_AWLEN),
        .M01_AXI_awlock(axi_ic_ctrl_M01_AXI_AWLOCK),
        .M01_AXI_awprot(axi_ic_ctrl_M01_AXI_AWPROT),
        .M01_AXI_awqos(axi_ic_ctrl_M01_AXI_AWQOS),
        .M01_AXI_awready(axi_ic_ctrl_M01_AXI_AWREADY),
        .M01_AXI_awregion(axi_ic_ctrl_M01_AXI_AWREGION),
        .M01_AXI_awsize(axi_ic_ctrl_M01_AXI_AWSIZE),
        .M01_AXI_awvalid(axi_ic_ctrl_M01_AXI_AWVALID),
        .M01_AXI_bid(axi_ic_ctrl_M01_AXI_BID),
        .M01_AXI_bready(axi_ic_ctrl_M01_AXI_BREADY),
        .M01_AXI_bresp(axi_ic_ctrl_M01_AXI_BRESP),
        .M01_AXI_bvalid(axi_ic_ctrl_M01_AXI_BVALID),
        .M01_AXI_rdata(axi_ic_ctrl_M01_AXI_RDATA),
        .M01_AXI_rid(axi_ic_ctrl_M01_AXI_RID),
        .M01_AXI_rlast(axi_ic_ctrl_M01_AXI_RLAST),
        .M01_AXI_rready(axi_ic_ctrl_M01_AXI_RREADY),
        .M01_AXI_rresp(axi_ic_ctrl_M01_AXI_RRESP),
        .M01_AXI_rvalid(axi_ic_ctrl_M01_AXI_RVALID),
        .M01_AXI_wdata(axi_ic_ctrl_M01_AXI_WDATA),
        .M01_AXI_wlast(axi_ic_ctrl_M01_AXI_WLAST),
        .M01_AXI_wready(axi_ic_ctrl_M01_AXI_WREADY),
        .M01_AXI_wstrb(axi_ic_ctrl_M01_AXI_WSTRB),
        .M01_AXI_wvalid(axi_ic_ctrl_M01_AXI_WVALID),
        .M02_ACLK(ps7_FCLK_CLK0),
        .M02_ARESETN(rst_sys_peripheral_aresetn),
        .M02_AXI_araddr(axi_ic_ctrl_M02_AXI_ARADDR),
        .M02_AXI_arready(axi_ic_ctrl_M02_AXI_ARREADY),
        .M02_AXI_arvalid(axi_ic_ctrl_M02_AXI_ARVALID),
        .M02_AXI_awaddr(axi_ic_ctrl_M02_AXI_AWADDR),
        .M02_AXI_awready(axi_ic_ctrl_M02_AXI_AWREADY),
        .M02_AXI_awvalid(axi_ic_ctrl_M02_AXI_AWVALID),
        .M02_AXI_bready(axi_ic_ctrl_M02_AXI_BREADY),
        .M02_AXI_bresp(axi_ic_ctrl_M02_AXI_BRESP),
        .M02_AXI_bvalid(axi_ic_ctrl_M02_AXI_BVALID),
        .M02_AXI_rdata(axi_ic_ctrl_M02_AXI_RDATA),
        .M02_AXI_rready(axi_ic_ctrl_M02_AXI_RREADY),
        .M02_AXI_rresp(axi_ic_ctrl_M02_AXI_RRESP),
        .M02_AXI_rvalid(axi_ic_ctrl_M02_AXI_RVALID),
        .M02_AXI_wdata(axi_ic_ctrl_M02_AXI_WDATA),
        .M02_AXI_wready(axi_ic_ctrl_M02_AXI_WREADY),
        .M02_AXI_wstrb(axi_ic_ctrl_M02_AXI_WSTRB),
        .M02_AXI_wvalid(axi_ic_ctrl_M02_AXI_WVALID),
        .S00_ACLK(ps7_FCLK_CLK0),
        .S00_ARESETN(rst_sys_peripheral_aresetn),
        .S00_AXI_araddr(ps7_M_AXI_GP0_ARADDR),
        .S00_AXI_arburst(ps7_M_AXI_GP0_ARBURST),
        .S00_AXI_arcache(ps7_M_AXI_GP0_ARCACHE),
        .S00_AXI_arid(ps7_M_AXI_GP0_ARID),
        .S00_AXI_arlen(ps7_M_AXI_GP0_ARLEN),
        .S00_AXI_arlock(ps7_M_AXI_GP0_ARLOCK),
        .S00_AXI_arprot(ps7_M_AXI_GP0_ARPROT),
        .S00_AXI_arqos(ps7_M_AXI_GP0_ARQOS),
        .S00_AXI_arready(ps7_M_AXI_GP0_ARREADY),
        .S00_AXI_arsize(ps7_M_AXI_GP0_ARSIZE),
        .S00_AXI_arvalid(ps7_M_AXI_GP0_ARVALID),
        .S00_AXI_awaddr(ps7_M_AXI_GP0_AWADDR),
        .S00_AXI_awburst(ps7_M_AXI_GP0_AWBURST),
        .S00_AXI_awcache(ps7_M_AXI_GP0_AWCACHE),
        .S00_AXI_awid(ps7_M_AXI_GP0_AWID),
        .S00_AXI_awlen(ps7_M_AXI_GP0_AWLEN),
        .S00_AXI_awlock(ps7_M_AXI_GP0_AWLOCK),
        .S00_AXI_awprot(ps7_M_AXI_GP0_AWPROT),
        .S00_AXI_awqos(ps7_M_AXI_GP0_AWQOS),
        .S00_AXI_awready(ps7_M_AXI_GP0_AWREADY),
        .S00_AXI_awsize(ps7_M_AXI_GP0_AWSIZE),
        .S00_AXI_awvalid(ps7_M_AXI_GP0_AWVALID),
        .S00_AXI_bid(ps7_M_AXI_GP0_BID),
        .S00_AXI_bready(ps7_M_AXI_GP0_BREADY),
        .S00_AXI_bresp(ps7_M_AXI_GP0_BRESP),
        .S00_AXI_bvalid(ps7_M_AXI_GP0_BVALID),
        .S00_AXI_rdata(ps7_M_AXI_GP0_RDATA),
        .S00_AXI_rid(ps7_M_AXI_GP0_RID),
        .S00_AXI_rlast(ps7_M_AXI_GP0_RLAST),
        .S00_AXI_rready(ps7_M_AXI_GP0_RREADY),
        .S00_AXI_rresp(ps7_M_AXI_GP0_RRESP),
        .S00_AXI_rvalid(ps7_M_AXI_GP0_RVALID),
        .S00_AXI_wdata(ps7_M_AXI_GP0_WDATA),
        .S00_AXI_wid(ps7_M_AXI_GP0_WID),
        .S00_AXI_wlast(ps7_M_AXI_GP0_WLAST),
        .S00_AXI_wready(ps7_M_AXI_GP0_WREADY),
        .S00_AXI_wstrb(ps7_M_AXI_GP0_WSTRB),
        .S00_AXI_wvalid(ps7_M_AXI_GP0_WVALID));
  system_axi_ic_mem_0 axi_ic_mem
       (.ACLK(ps7_FCLK_CLK0),
        .ARESETN(rst_sys_peripheral_aresetn),
        .M00_ACLK(ps7_FCLK_CLK0),
        .M00_ARESETN(rst_sys_peripheral_aresetn),
        .M00_AXI_araddr(axi_ic_mem_M00_AXI_ARADDR),
        .M00_AXI_arburst(axi_ic_mem_M00_AXI_ARBURST),
        .M00_AXI_arcache(axi_ic_mem_M00_AXI_ARCACHE),
        .M00_AXI_arid(axi_ic_mem_M00_AXI_ARID),
        .M00_AXI_arlen(axi_ic_mem_M00_AXI_ARLEN),
        .M00_AXI_arlock(axi_ic_mem_M00_AXI_ARLOCK),
        .M00_AXI_arprot(axi_ic_mem_M00_AXI_ARPROT),
        .M00_AXI_arqos(axi_ic_mem_M00_AXI_ARQOS),
        .M00_AXI_arready(axi_ic_mem_M00_AXI_ARREADY),
        .M00_AXI_arsize(axi_ic_mem_M00_AXI_ARSIZE),
        .M00_AXI_arvalid(axi_ic_mem_M00_AXI_ARVALID),
        .M00_AXI_awaddr(axi_ic_mem_M00_AXI_AWADDR),
        .M00_AXI_awburst(axi_ic_mem_M00_AXI_AWBURST),
        .M00_AXI_awcache(axi_ic_mem_M00_AXI_AWCACHE),
        .M00_AXI_awid(axi_ic_mem_M00_AXI_AWID),
        .M00_AXI_awlen(axi_ic_mem_M00_AXI_AWLEN),
        .M00_AXI_awlock(axi_ic_mem_M00_AXI_AWLOCK),
        .M00_AXI_awprot(axi_ic_mem_M00_AXI_AWPROT),
        .M00_AXI_awqos(axi_ic_mem_M00_AXI_AWQOS),
        .M00_AXI_awready(axi_ic_mem_M00_AXI_AWREADY),
        .M00_AXI_awsize(axi_ic_mem_M00_AXI_AWSIZE),
        .M00_AXI_awvalid(axi_ic_mem_M00_AXI_AWVALID),
        .M00_AXI_bid(axi_ic_mem_M00_AXI_BID),
        .M00_AXI_bready(axi_ic_mem_M00_AXI_BREADY),
        .M00_AXI_bresp(axi_ic_mem_M00_AXI_BRESP),
        .M00_AXI_bvalid(axi_ic_mem_M00_AXI_BVALID),
        .M00_AXI_rdata(axi_ic_mem_M00_AXI_RDATA),
        .M00_AXI_rid(axi_ic_mem_M00_AXI_RID),
        .M00_AXI_rlast(axi_ic_mem_M00_AXI_RLAST),
        .M00_AXI_rready(axi_ic_mem_M00_AXI_RREADY),
        .M00_AXI_rresp(axi_ic_mem_M00_AXI_RRESP),
        .M00_AXI_rvalid(axi_ic_mem_M00_AXI_RVALID),
        .M00_AXI_wdata(axi_ic_mem_M00_AXI_WDATA),
        .M00_AXI_wid(axi_ic_mem_M00_AXI_WID),
        .M00_AXI_wlast(axi_ic_mem_M00_AXI_WLAST),
        .M00_AXI_wready(axi_ic_mem_M00_AXI_WREADY),
        .M00_AXI_wstrb(axi_ic_mem_M00_AXI_WSTRB),
        .M00_AXI_wvalid(axi_ic_mem_M00_AXI_WVALID),
        .S00_ACLK(ps7_FCLK_CLK0),
        .S00_ARESETN(rst_sys_peripheral_aresetn),
        .S00_AXI_araddr(accel_m_axi_hp_ARADDR),
        .S00_AXI_arburst(accel_m_axi_hp_ARBURST),
        .S00_AXI_arcache(accel_m_axi_hp_ARCACHE),
        .S00_AXI_arid(accel_m_axi_hp_ARID),
        .S00_AXI_arlen(accel_m_axi_hp_ARLEN),
        .S00_AXI_arlock(accel_m_axi_hp_ARLOCK),
        .S00_AXI_arprot(accel_m_axi_hp_ARPROT),
        .S00_AXI_arqos(accel_m_axi_hp_ARQOS),
        .S00_AXI_arready(accel_m_axi_hp_ARREADY),
        .S00_AXI_arsize(accel_m_axi_hp_ARSIZE),
        .S00_AXI_arvalid(accel_m_axi_hp_ARVALID),
        .S00_AXI_awaddr(accel_m_axi_hp_AWADDR),
        .S00_AXI_awburst(accel_m_axi_hp_AWBURST),
        .S00_AXI_awcache(accel_m_axi_hp_AWCACHE),
        .S00_AXI_awid(accel_m_axi_hp_AWID),
        .S00_AXI_awlen(accel_m_axi_hp_AWLEN),
        .S00_AXI_awlock(accel_m_axi_hp_AWLOCK),
        .S00_AXI_awprot(accel_m_axi_hp_AWPROT),
        .S00_AXI_awqos(accel_m_axi_hp_AWQOS),
        .S00_AXI_awready(accel_m_axi_hp_AWREADY),
        .S00_AXI_awsize(accel_m_axi_hp_AWSIZE),
        .S00_AXI_awvalid(accel_m_axi_hp_AWVALID),
        .S00_AXI_bid(accel_m_axi_hp_BID),
        .S00_AXI_bready(accel_m_axi_hp_BREADY),
        .S00_AXI_bresp(accel_m_axi_hp_BRESP),
        .S00_AXI_bvalid(accel_m_axi_hp_BVALID),
        .S00_AXI_rdata(accel_m_axi_hp_RDATA),
        .S00_AXI_rid(accel_m_axi_hp_RID),
        .S00_AXI_rlast(accel_m_axi_hp_RLAST),
        .S00_AXI_rready(accel_m_axi_hp_RREADY),
        .S00_AXI_rresp(accel_m_axi_hp_RRESP),
        .S00_AXI_rvalid(accel_m_axi_hp_RVALID),
        .S00_AXI_wdata(accel_m_axi_hp_WDATA),
        .S00_AXI_wlast(accel_m_axi_hp_WLAST),
        .S00_AXI_wready(accel_m_axi_hp_WREADY),
        .S00_AXI_wstrb(accel_m_axi_hp_WSTRB),
        .S00_AXI_wvalid(accel_m_axi_hp_WVALID));
  system_axi_ic_vid_0 axi_ic_vid
       (.ACLK(ps7_FCLK_CLK0),
        .ARESETN(rst_sys_peripheral_aresetn),
        .M00_ACLK(ps7_FCLK_CLK0),
        .M00_ARESETN(rst_sys_peripheral_aresetn),
        .M00_AXI_araddr(axi_ic_vid_M00_AXI_ARADDR),
        .M00_AXI_arburst(axi_ic_vid_M00_AXI_ARBURST),
        .M00_AXI_arcache(axi_ic_vid_M00_AXI_ARCACHE),
        .M00_AXI_arid(axi_ic_vid_M00_AXI_ARID),
        .M00_AXI_arlen(axi_ic_vid_M00_AXI_ARLEN),
        .M00_AXI_arlock(axi_ic_vid_M00_AXI_ARLOCK),
        .M00_AXI_arprot(axi_ic_vid_M00_AXI_ARPROT),
        .M00_AXI_arqos(axi_ic_vid_M00_AXI_ARQOS),
        .M00_AXI_arready(axi_ic_vid_M00_AXI_ARREADY),
        .M00_AXI_arsize(axi_ic_vid_M00_AXI_ARSIZE),
        .M00_AXI_arvalid(axi_ic_vid_M00_AXI_ARVALID),
        .M00_AXI_rdata(axi_ic_vid_M00_AXI_RDATA),
        .M00_AXI_rid(axi_ic_vid_M00_AXI_RID),
        .M00_AXI_rlast(axi_ic_vid_M00_AXI_RLAST),
        .M00_AXI_rready(axi_ic_vid_M00_AXI_RREADY),
        .M00_AXI_rresp(axi_ic_vid_M00_AXI_RRESP),
        .M00_AXI_rvalid(axi_ic_vid_M00_AXI_RVALID),
        .S00_ACLK(ps7_FCLK_CLK0),
        .S00_ARESETN(rst_sys_peripheral_aresetn),
        .S00_AXI_araddr(hdmi_m_axi_hp_ARADDR),
        .S00_AXI_arburst(hdmi_m_axi_hp_ARBURST),
        .S00_AXI_arcache(hdmi_m_axi_hp_ARCACHE),
        .S00_AXI_arid(hdmi_m_axi_hp_ARID),
        .S00_AXI_arlen(hdmi_m_axi_hp_ARLEN),
        .S00_AXI_arlock(hdmi_m_axi_hp_ARLOCK),
        .S00_AXI_arprot(hdmi_m_axi_hp_ARPROT),
        .S00_AXI_arqos(hdmi_m_axi_hp_ARQOS),
        .S00_AXI_arready(hdmi_m_axi_hp_ARREADY),
        .S00_AXI_arsize(hdmi_m_axi_hp_ARSIZE),
        .S00_AXI_arvalid(hdmi_m_axi_hp_ARVALID),
        .S00_AXI_rdata(hdmi_m_axi_hp_RDATA),
        .S00_AXI_rid(hdmi_m_axi_hp_RID),
        .S00_AXI_rlast(hdmi_m_axi_hp_RLAST),
        .S00_AXI_rready(hdmi_m_axi_hp_RREADY),
        .S00_AXI_rresp(hdmi_m_axi_hp_RRESP),
        .S00_AXI_rvalid(hdmi_m_axi_hp_RVALID));
  system_axi_iic_hdmi_0 axi_iic_hdmi
       (.s_axi_aclk(ps7_FCLK_CLK0),
        .s_axi_araddr(axi_ic_ctrl_M02_AXI_ARADDR[8:0]),
        .s_axi_aresetn(rst_sys_peripheral_aresetn),
        .s_axi_arready(axi_ic_ctrl_M02_AXI_ARREADY),
        .s_axi_arvalid(axi_ic_ctrl_M02_AXI_ARVALID),
        .s_axi_awaddr(axi_ic_ctrl_M02_AXI_AWADDR[8:0]),
        .s_axi_awready(axi_ic_ctrl_M02_AXI_AWREADY),
        .s_axi_awvalid(axi_ic_ctrl_M02_AXI_AWVALID),
        .s_axi_bready(axi_ic_ctrl_M02_AXI_BREADY),
        .s_axi_bresp(axi_ic_ctrl_M02_AXI_BRESP),
        .s_axi_bvalid(axi_ic_ctrl_M02_AXI_BVALID),
        .s_axi_rdata(axi_ic_ctrl_M02_AXI_RDATA),
        .s_axi_rready(axi_ic_ctrl_M02_AXI_RREADY),
        .s_axi_rresp(axi_ic_ctrl_M02_AXI_RRESP),
        .s_axi_rvalid(axi_ic_ctrl_M02_AXI_RVALID),
        .s_axi_wdata(axi_ic_ctrl_M02_AXI_WDATA),
        .s_axi_wready(axi_ic_ctrl_M02_AXI_WREADY),
        .s_axi_wstrb(axi_ic_ctrl_M02_AXI_WSTRB),
        .s_axi_wvalid(axi_ic_ctrl_M02_AXI_WVALID),
        .scl_i(hdmi_iic_scl_i),
        .scl_o(hdmi_iic_scl_o),
        .scl_t(hdmi_iic_scl_t),
        .sda_i(hdmi_iic_sda_i),
        .sda_o(hdmi_iic_sda_o),
        .sda_t(hdmi_iic_sda_t));
  system_axi_pc_ctrl_0 axi_pc_ctrl
       (.aclk(ps7_FCLK_CLK0),
        .aresetn(rst_sys_peripheral_aresetn),
        .m_axi_araddr(axi_pc_ctrl_M_AXI_ARADDR),
        .m_axi_arprot(axi_pc_ctrl_M_AXI_ARPROT),
        .m_axi_arready(axi_pc_ctrl_M_AXI_ARREADY),
        .m_axi_arvalid(axi_pc_ctrl_M_AXI_ARVALID),
        .m_axi_awaddr(axi_pc_ctrl_M_AXI_AWADDR),
        .m_axi_awprot(axi_pc_ctrl_M_AXI_AWPROT),
        .m_axi_awready(axi_pc_ctrl_M_AXI_AWREADY),
        .m_axi_awvalid(axi_pc_ctrl_M_AXI_AWVALID),
        .m_axi_bready(axi_pc_ctrl_M_AXI_BREADY),
        .m_axi_bresp(axi_pc_ctrl_M_AXI_BRESP),
        .m_axi_bvalid(axi_pc_ctrl_M_AXI_BVALID),
        .m_axi_rdata(axi_pc_ctrl_M_AXI_RDATA),
        .m_axi_rready(axi_pc_ctrl_M_AXI_RREADY),
        .m_axi_rresp(axi_pc_ctrl_M_AXI_RRESP),
        .m_axi_rvalid(axi_pc_ctrl_M_AXI_RVALID),
        .m_axi_wdata(axi_pc_ctrl_M_AXI_WDATA),
        .m_axi_wready(axi_pc_ctrl_M_AXI_WREADY),
        .m_axi_wstrb(axi_pc_ctrl_M_AXI_WSTRB),
        .m_axi_wvalid(axi_pc_ctrl_M_AXI_WVALID),
        .s_axi_araddr(axi_ic_ctrl_M00_AXI_ARADDR[15:0]),
        .s_axi_arburst(axi_ic_ctrl_M00_AXI_ARBURST),
        .s_axi_arcache(axi_ic_ctrl_M00_AXI_ARCACHE),
        .s_axi_arid(axi_ic_ctrl_M00_AXI_ARID),
        .s_axi_arlen(axi_ic_ctrl_M00_AXI_ARLEN),
        .s_axi_arlock(axi_ic_ctrl_M00_AXI_ARLOCK),
        .s_axi_arprot(axi_ic_ctrl_M00_AXI_ARPROT),
        .s_axi_arqos(axi_ic_ctrl_M00_AXI_ARQOS),
        .s_axi_arready(axi_ic_ctrl_M00_AXI_ARREADY),
        .s_axi_arregion(axi_ic_ctrl_M00_AXI_ARREGION),
        .s_axi_arsize(axi_ic_ctrl_M00_AXI_ARSIZE),
        .s_axi_arvalid(axi_ic_ctrl_M00_AXI_ARVALID),
        .s_axi_awaddr(axi_ic_ctrl_M00_AXI_AWADDR[15:0]),
        .s_axi_awburst(axi_ic_ctrl_M00_AXI_AWBURST),
        .s_axi_awcache(axi_ic_ctrl_M00_AXI_AWCACHE),
        .s_axi_awid(axi_ic_ctrl_M00_AXI_AWID),
        .s_axi_awlen(axi_ic_ctrl_M00_AXI_AWLEN),
        .s_axi_awlock(axi_ic_ctrl_M00_AXI_AWLOCK),
        .s_axi_awprot(axi_ic_ctrl_M00_AXI_AWPROT),
        .s_axi_awqos(axi_ic_ctrl_M00_AXI_AWQOS),
        .s_axi_awready(axi_ic_ctrl_M00_AXI_AWREADY),
        .s_axi_awregion(axi_ic_ctrl_M00_AXI_AWREGION),
        .s_axi_awsize(axi_ic_ctrl_M00_AXI_AWSIZE),
        .s_axi_awvalid(axi_ic_ctrl_M00_AXI_AWVALID),
        .s_axi_bid(axi_ic_ctrl_M00_AXI_BID),
        .s_axi_bready(axi_ic_ctrl_M00_AXI_BREADY),
        .s_axi_bresp(axi_ic_ctrl_M00_AXI_BRESP),
        .s_axi_bvalid(axi_ic_ctrl_M00_AXI_BVALID),
        .s_axi_rdata(axi_ic_ctrl_M00_AXI_RDATA),
        .s_axi_rid(axi_ic_ctrl_M00_AXI_RID),
        .s_axi_rlast(axi_ic_ctrl_M00_AXI_RLAST),
        .s_axi_rready(axi_ic_ctrl_M00_AXI_RREADY),
        .s_axi_rresp(axi_ic_ctrl_M00_AXI_RRESP),
        .s_axi_rvalid(axi_ic_ctrl_M00_AXI_RVALID),
        .s_axi_wdata(axi_ic_ctrl_M00_AXI_WDATA),
        .s_axi_wlast(axi_ic_ctrl_M00_AXI_WLAST),
        .s_axi_wready(axi_ic_ctrl_M00_AXI_WREADY),
        .s_axi_wstrb(axi_ic_ctrl_M00_AXI_WSTRB),
        .s_axi_wvalid(axi_ic_ctrl_M00_AXI_WVALID));
  system_axi_pc_hdmi_0 axi_pc_hdmi
       (.aclk(ps7_FCLK_CLK0),
        .aresetn(rst_sys_peripheral_aresetn),
        .m_axi_araddr(axi_pc_hdmi_M_AXI_ARADDR),
        .m_axi_arprot(axi_pc_hdmi_M_AXI_ARPROT),
        .m_axi_arready(axi_pc_hdmi_M_AXI_ARREADY),
        .m_axi_arvalid(axi_pc_hdmi_M_AXI_ARVALID),
        .m_axi_awaddr(axi_pc_hdmi_M_AXI_AWADDR),
        .m_axi_awprot(axi_pc_hdmi_M_AXI_AWPROT),
        .m_axi_awready(axi_pc_hdmi_M_AXI_AWREADY),
        .m_axi_awvalid(axi_pc_hdmi_M_AXI_AWVALID),
        .m_axi_bready(axi_pc_hdmi_M_AXI_BREADY),
        .m_axi_bresp(axi_pc_hdmi_M_AXI_BRESP),
        .m_axi_bvalid(axi_pc_hdmi_M_AXI_BVALID),
        .m_axi_rdata(axi_pc_hdmi_M_AXI_RDATA),
        .m_axi_rready(axi_pc_hdmi_M_AXI_RREADY),
        .m_axi_rresp(axi_pc_hdmi_M_AXI_RRESP),
        .m_axi_rvalid(axi_pc_hdmi_M_AXI_RVALID),
        .m_axi_wdata(axi_pc_hdmi_M_AXI_WDATA),
        .m_axi_wready(axi_pc_hdmi_M_AXI_WREADY),
        .m_axi_wstrb(axi_pc_hdmi_M_AXI_WSTRB),
        .m_axi_wvalid(axi_pc_hdmi_M_AXI_WVALID),
        .s_axi_araddr(axi_ic_ctrl_M01_AXI_ARADDR[15:0]),
        .s_axi_arburst(axi_ic_ctrl_M01_AXI_ARBURST),
        .s_axi_arcache(axi_ic_ctrl_M01_AXI_ARCACHE),
        .s_axi_arid(axi_ic_ctrl_M01_AXI_ARID),
        .s_axi_arlen(axi_ic_ctrl_M01_AXI_ARLEN),
        .s_axi_arlock(axi_ic_ctrl_M01_AXI_ARLOCK),
        .s_axi_arprot(axi_ic_ctrl_M01_AXI_ARPROT),
        .s_axi_arqos(axi_ic_ctrl_M01_AXI_ARQOS),
        .s_axi_arready(axi_ic_ctrl_M01_AXI_ARREADY),
        .s_axi_arregion(axi_ic_ctrl_M01_AXI_ARREGION),
        .s_axi_arsize(axi_ic_ctrl_M01_AXI_ARSIZE),
        .s_axi_arvalid(axi_ic_ctrl_M01_AXI_ARVALID),
        .s_axi_awaddr(axi_ic_ctrl_M01_AXI_AWADDR[15:0]),
        .s_axi_awburst(axi_ic_ctrl_M01_AXI_AWBURST),
        .s_axi_awcache(axi_ic_ctrl_M01_AXI_AWCACHE),
        .s_axi_awid(axi_ic_ctrl_M01_AXI_AWID),
        .s_axi_awlen(axi_ic_ctrl_M01_AXI_AWLEN),
        .s_axi_awlock(axi_ic_ctrl_M01_AXI_AWLOCK),
        .s_axi_awprot(axi_ic_ctrl_M01_AXI_AWPROT),
        .s_axi_awqos(axi_ic_ctrl_M01_AXI_AWQOS),
        .s_axi_awready(axi_ic_ctrl_M01_AXI_AWREADY),
        .s_axi_awregion(axi_ic_ctrl_M01_AXI_AWREGION),
        .s_axi_awsize(axi_ic_ctrl_M01_AXI_AWSIZE),
        .s_axi_awvalid(axi_ic_ctrl_M01_AXI_AWVALID),
        .s_axi_bid(axi_ic_ctrl_M01_AXI_BID),
        .s_axi_bready(axi_ic_ctrl_M01_AXI_BREADY),
        .s_axi_bresp(axi_ic_ctrl_M01_AXI_BRESP),
        .s_axi_bvalid(axi_ic_ctrl_M01_AXI_BVALID),
        .s_axi_rdata(axi_ic_ctrl_M01_AXI_RDATA),
        .s_axi_rid(axi_ic_ctrl_M01_AXI_RID),
        .s_axi_rlast(axi_ic_ctrl_M01_AXI_RLAST),
        .s_axi_rready(axi_ic_ctrl_M01_AXI_RREADY),
        .s_axi_rresp(axi_ic_ctrl_M01_AXI_RRESP),
        .s_axi_rvalid(axi_ic_ctrl_M01_AXI_RVALID),
        .s_axi_wdata(axi_ic_ctrl_M01_AXI_WDATA),
        .s_axi_wlast(axi_ic_ctrl_M01_AXI_WLAST),
        .s_axi_wready(axi_ic_ctrl_M01_AXI_WREADY),
        .s_axi_wstrb(axi_ic_ctrl_M01_AXI_WSTRB),
        .s_axi_wvalid(axi_ic_ctrl_M01_AXI_WVALID));
  system_hdmi_0 hdmi
       (.aclk(ps7_FCLK_CLK0),
        .aresetn(rst_sys_peripheral_aresetn),
        .hdmi_clk(hdmi_clk),
        .hdmi_d(hdmi_d),
        .hdmi_de(hdmi_de),
        .hdmi_hsync(hdmi_hsync),
        .hdmi_vsync(hdmi_vsync),
        .m_axi_hp_araddr(hdmi_m_axi_hp_ARADDR),
        .m_axi_hp_arburst(hdmi_m_axi_hp_ARBURST),
        .m_axi_hp_arcache(hdmi_m_axi_hp_ARCACHE),
        .m_axi_hp_arid(hdmi_m_axi_hp_ARID),
        .m_axi_hp_arlen(hdmi_m_axi_hp_ARLEN),
        .m_axi_hp_arlock(hdmi_m_axi_hp_ARLOCK),
        .m_axi_hp_arprot(hdmi_m_axi_hp_ARPROT),
        .m_axi_hp_arqos(hdmi_m_axi_hp_ARQOS),
        .m_axi_hp_arready(hdmi_m_axi_hp_ARREADY),
        .m_axi_hp_arsize(hdmi_m_axi_hp_ARSIZE),
        .m_axi_hp_arvalid(hdmi_m_axi_hp_ARVALID),
        .m_axi_hp_rdata(hdmi_m_axi_hp_RDATA),
        .m_axi_hp_rid(hdmi_m_axi_hp_RID),
        .m_axi_hp_rlast(hdmi_m_axi_hp_RLAST),
        .m_axi_hp_rready(hdmi_m_axi_hp_RREADY),
        .m_axi_hp_rresp(hdmi_m_axi_hp_RRESP),
        .m_axi_hp_rvalid(hdmi_m_axi_hp_RVALID),
        .pixel_clk(ps7_FCLK_CLK1),
        .s_axi_lite_araddr(axi_pc_hdmi_M_AXI_ARADDR),
        .s_axi_lite_arprot(axi_pc_hdmi_M_AXI_ARPROT),
        .s_axi_lite_arready(axi_pc_hdmi_M_AXI_ARREADY),
        .s_axi_lite_arvalid(axi_pc_hdmi_M_AXI_ARVALID),
        .s_axi_lite_awaddr(axi_pc_hdmi_M_AXI_AWADDR),
        .s_axi_lite_awprot(axi_pc_hdmi_M_AXI_AWPROT),
        .s_axi_lite_awready(axi_pc_hdmi_M_AXI_AWREADY),
        .s_axi_lite_awvalid(axi_pc_hdmi_M_AXI_AWVALID),
        .s_axi_lite_bready(axi_pc_hdmi_M_AXI_BREADY),
        .s_axi_lite_bresp(axi_pc_hdmi_M_AXI_BRESP),
        .s_axi_lite_bvalid(axi_pc_hdmi_M_AXI_BVALID),
        .s_axi_lite_rdata(axi_pc_hdmi_M_AXI_RDATA),
        .s_axi_lite_rready(axi_pc_hdmi_M_AXI_RREADY),
        .s_axi_lite_rresp(axi_pc_hdmi_M_AXI_RRESP),
        .s_axi_lite_rvalid(axi_pc_hdmi_M_AXI_RVALID),
        .s_axi_lite_wdata(axi_pc_hdmi_M_AXI_WDATA),
        .s_axi_lite_wready(axi_pc_hdmi_M_AXI_WREADY),
        .s_axi_lite_wstrb(axi_pc_hdmi_M_AXI_WSTRB),
        .s_axi_lite_wvalid(axi_pc_hdmi_M_AXI_WVALID),
        .vga_b(vga_b),
        .vga_g(vga_g),
        .vga_hsync(vga_hsync),
        .vga_r(vga_r),
        .vga_vsync(vga_vsync));
  system_ps7_0 ps7
       (.DDR_Addr(DDR_addr),
        .DDR_BankAddr(DDR_ba),
        .DDR_CAS_n(DDR_cas_n),
        .DDR_CKE(DDR_cke),
        .DDR_CS_n(DDR_cs_n),
        .DDR_Clk(DDR_ck_p),
        .DDR_Clk_n(DDR_ck_n),
        .DDR_DM(DDR_dm),
        .DDR_DQ(DDR_dq),
        .DDR_DQS(DDR_dqs_p),
        .DDR_DQS_n(DDR_dqs_n),
        .DDR_DRSTB(DDR_reset_n),
        .DDR_ODT(DDR_odt),
        .DDR_RAS_n(DDR_ras_n),
        .DDR_VRN(FIXED_IO_ddr_vrn),
        .DDR_VRP(FIXED_IO_ddr_vrp),
        .DDR_WEB(DDR_we_n),
        .ENET0_MDIO_I(1'b0),
        .FCLK_CLK0(ps7_FCLK_CLK0),
        .FCLK_CLK1(ps7_FCLK_CLK1),
        .FCLK_RESET0_N(ps7_FCLK_RESET0_N),
        .IRQ_F2P(accel_irq_done),
        .MIO(FIXED_IO_mio),
        .M_AXI_GP0_ACLK(ps7_FCLK_CLK0),
        .M_AXI_GP0_ARADDR(ps7_M_AXI_GP0_ARADDR),
        .M_AXI_GP0_ARBURST(ps7_M_AXI_GP0_ARBURST),
        .M_AXI_GP0_ARCACHE(ps7_M_AXI_GP0_ARCACHE),
        .M_AXI_GP0_ARID(ps7_M_AXI_GP0_ARID),
        .M_AXI_GP0_ARLEN(ps7_M_AXI_GP0_ARLEN),
        .M_AXI_GP0_ARLOCK(ps7_M_AXI_GP0_ARLOCK),
        .M_AXI_GP0_ARPROT(ps7_M_AXI_GP0_ARPROT),
        .M_AXI_GP0_ARQOS(ps7_M_AXI_GP0_ARQOS),
        .M_AXI_GP0_ARREADY(ps7_M_AXI_GP0_ARREADY),
        .M_AXI_GP0_ARSIZE(ps7_M_AXI_GP0_ARSIZE),
        .M_AXI_GP0_ARVALID(ps7_M_AXI_GP0_ARVALID),
        .M_AXI_GP0_AWADDR(ps7_M_AXI_GP0_AWADDR),
        .M_AXI_GP0_AWBURST(ps7_M_AXI_GP0_AWBURST),
        .M_AXI_GP0_AWCACHE(ps7_M_AXI_GP0_AWCACHE),
        .M_AXI_GP0_AWID(ps7_M_AXI_GP0_AWID),
        .M_AXI_GP0_AWLEN(ps7_M_AXI_GP0_AWLEN),
        .M_AXI_GP0_AWLOCK(ps7_M_AXI_GP0_AWLOCK),
        .M_AXI_GP0_AWPROT(ps7_M_AXI_GP0_AWPROT),
        .M_AXI_GP0_AWQOS(ps7_M_AXI_GP0_AWQOS),
        .M_AXI_GP0_AWREADY(ps7_M_AXI_GP0_AWREADY),
        .M_AXI_GP0_AWSIZE(ps7_M_AXI_GP0_AWSIZE),
        .M_AXI_GP0_AWVALID(ps7_M_AXI_GP0_AWVALID),
        .M_AXI_GP0_BID(ps7_M_AXI_GP0_BID),
        .M_AXI_GP0_BREADY(ps7_M_AXI_GP0_BREADY),
        .M_AXI_GP0_BRESP(ps7_M_AXI_GP0_BRESP),
        .M_AXI_GP0_BVALID(ps7_M_AXI_GP0_BVALID),
        .M_AXI_GP0_RDATA(ps7_M_AXI_GP0_RDATA),
        .M_AXI_GP0_RID(ps7_M_AXI_GP0_RID),
        .M_AXI_GP0_RLAST(ps7_M_AXI_GP0_RLAST),
        .M_AXI_GP0_RREADY(ps7_M_AXI_GP0_RREADY),
        .M_AXI_GP0_RRESP(ps7_M_AXI_GP0_RRESP),
        .M_AXI_GP0_RVALID(ps7_M_AXI_GP0_RVALID),
        .M_AXI_GP0_WDATA(ps7_M_AXI_GP0_WDATA),
        .M_AXI_GP0_WID(ps7_M_AXI_GP0_WID),
        .M_AXI_GP0_WLAST(ps7_M_AXI_GP0_WLAST),
        .M_AXI_GP0_WREADY(ps7_M_AXI_GP0_WREADY),
        .M_AXI_GP0_WSTRB(ps7_M_AXI_GP0_WSTRB),
        .M_AXI_GP0_WVALID(ps7_M_AXI_GP0_WVALID),
        .PS_CLK(FIXED_IO_ps_clk),
        .PS_PORB(FIXED_IO_ps_porb),
        .PS_SRSTB(FIXED_IO_ps_srstb),
        .SDIO0_WP(1'b0),
        .S_AXI_HP0_ACLK(ps7_FCLK_CLK0),
        .S_AXI_HP0_ARADDR(axi_ic_mem_M00_AXI_ARADDR),
        .S_AXI_HP0_ARBURST(axi_ic_mem_M00_AXI_ARBURST),
        .S_AXI_HP0_ARCACHE(axi_ic_mem_M00_AXI_ARCACHE),
        .S_AXI_HP0_ARID(axi_ic_mem_M00_AXI_ARID),
        .S_AXI_HP0_ARLEN(axi_ic_mem_M00_AXI_ARLEN),
        .S_AXI_HP0_ARLOCK(axi_ic_mem_M00_AXI_ARLOCK),
        .S_AXI_HP0_ARPROT(axi_ic_mem_M00_AXI_ARPROT),
        .S_AXI_HP0_ARQOS(axi_ic_mem_M00_AXI_ARQOS),
        .S_AXI_HP0_ARREADY(axi_ic_mem_M00_AXI_ARREADY),
        .S_AXI_HP0_ARSIZE(axi_ic_mem_M00_AXI_ARSIZE),
        .S_AXI_HP0_ARVALID(axi_ic_mem_M00_AXI_ARVALID),
        .S_AXI_HP0_AWADDR(axi_ic_mem_M00_AXI_AWADDR),
        .S_AXI_HP0_AWBURST(axi_ic_mem_M00_AXI_AWBURST),
        .S_AXI_HP0_AWCACHE(axi_ic_mem_M00_AXI_AWCACHE),
        .S_AXI_HP0_AWID(axi_ic_mem_M00_AXI_AWID),
        .S_AXI_HP0_AWLEN(axi_ic_mem_M00_AXI_AWLEN),
        .S_AXI_HP0_AWLOCK(axi_ic_mem_M00_AXI_AWLOCK),
        .S_AXI_HP0_AWPROT(axi_ic_mem_M00_AXI_AWPROT),
        .S_AXI_HP0_AWQOS(axi_ic_mem_M00_AXI_AWQOS),
        .S_AXI_HP0_AWREADY(axi_ic_mem_M00_AXI_AWREADY),
        .S_AXI_HP0_AWSIZE(axi_ic_mem_M00_AXI_AWSIZE),
        .S_AXI_HP0_AWVALID(axi_ic_mem_M00_AXI_AWVALID),
        .S_AXI_HP0_BID(axi_ic_mem_M00_AXI_BID),
        .S_AXI_HP0_BREADY(axi_ic_mem_M00_AXI_BREADY),
        .S_AXI_HP0_BRESP(axi_ic_mem_M00_AXI_BRESP),
        .S_AXI_HP0_BVALID(axi_ic_mem_M00_AXI_BVALID),
        .S_AXI_HP0_RDATA(axi_ic_mem_M00_AXI_RDATA),
        .S_AXI_HP0_RDISSUECAP1_EN(1'b0),
        .S_AXI_HP0_RID(axi_ic_mem_M00_AXI_RID),
        .S_AXI_HP0_RLAST(axi_ic_mem_M00_AXI_RLAST),
        .S_AXI_HP0_RREADY(axi_ic_mem_M00_AXI_RREADY),
        .S_AXI_HP0_RRESP(axi_ic_mem_M00_AXI_RRESP),
        .S_AXI_HP0_RVALID(axi_ic_mem_M00_AXI_RVALID),
        .S_AXI_HP0_WDATA(axi_ic_mem_M00_AXI_WDATA),
        .S_AXI_HP0_WID(axi_ic_mem_M00_AXI_WID),
        .S_AXI_HP0_WLAST(axi_ic_mem_M00_AXI_WLAST),
        .S_AXI_HP0_WREADY(axi_ic_mem_M00_AXI_WREADY),
        .S_AXI_HP0_WRISSUECAP1_EN(1'b0),
        .S_AXI_HP0_WSTRB(axi_ic_mem_M00_AXI_WSTRB),
        .S_AXI_HP0_WVALID(axi_ic_mem_M00_AXI_WVALID),
        .S_AXI_HP1_ACLK(ps7_FCLK_CLK0),
        .S_AXI_HP1_ARADDR(axi_ic_vid_M00_AXI_ARADDR),
        .S_AXI_HP1_ARBURST(axi_ic_vid_M00_AXI_ARBURST),
        .S_AXI_HP1_ARCACHE(axi_ic_vid_M00_AXI_ARCACHE),
        .S_AXI_HP1_ARID(axi_ic_vid_M00_AXI_ARID),
        .S_AXI_HP1_ARLEN(axi_ic_vid_M00_AXI_ARLEN),
        .S_AXI_HP1_ARLOCK(axi_ic_vid_M00_AXI_ARLOCK),
        .S_AXI_HP1_ARPROT(axi_ic_vid_M00_AXI_ARPROT),
        .S_AXI_HP1_ARQOS(axi_ic_vid_M00_AXI_ARQOS),
        .S_AXI_HP1_ARREADY(axi_ic_vid_M00_AXI_ARREADY),
        .S_AXI_HP1_ARSIZE(axi_ic_vid_M00_AXI_ARSIZE),
        .S_AXI_HP1_ARVALID(axi_ic_vid_M00_AXI_ARVALID),
        .S_AXI_HP1_AWADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP1_AWBURST({1'b0,1'b1}),
        .S_AXI_HP1_AWCACHE({1'b0,1'b0,1'b1,1'b1}),
        .S_AXI_HP1_AWID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP1_AWLEN({1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP1_AWLOCK({1'b0,1'b0}),
        .S_AXI_HP1_AWPROT({1'b0,1'b0,1'b0}),
        .S_AXI_HP1_AWQOS({1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP1_AWSIZE({1'b0,1'b1,1'b0}),
        .S_AXI_HP1_AWVALID(1'b0),
        .S_AXI_HP1_BREADY(1'b0),
        .S_AXI_HP1_RDATA(axi_ic_vid_M00_AXI_RDATA),
        .S_AXI_HP1_RDISSUECAP1_EN(1'b0),
        .S_AXI_HP1_RID(axi_ic_vid_M00_AXI_RID),
        .S_AXI_HP1_RLAST(axi_ic_vid_M00_AXI_RLAST),
        .S_AXI_HP1_RREADY(axi_ic_vid_M00_AXI_RREADY),
        .S_AXI_HP1_RRESP(axi_ic_vid_M00_AXI_RRESP),
        .S_AXI_HP1_RVALID(axi_ic_vid_M00_AXI_RVALID),
        .S_AXI_HP1_WDATA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP1_WID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP1_WLAST(1'b0),
        .S_AXI_HP1_WRISSUECAP1_EN(1'b0),
        .S_AXI_HP1_WSTRB({1'b1,1'b1,1'b1,1'b1}),
        .S_AXI_HP1_WVALID(1'b0),
        .USB0_VBUS_PWRFAULT(1'b0));
  system_rst_sys_0 rst_sys
       (.aux_reset_in(1'b1),
        .dcm_locked(1'b1),
        .ext_reset_in(ps7_FCLK_RESET0_N),
        .mb_debug_sys_rst(1'b0),
        .peripheral_aresetn(rst_sys_peripheral_aresetn),
        .slowest_sync_clk(ps7_FCLK_CLK0));
endmodule

module system_axi_ic_ctrl_0
   (ACLK,
    ARESETN,
    M00_ACLK,
    M00_ARESETN,
    M00_AXI_araddr,
    M00_AXI_arburst,
    M00_AXI_arcache,
    M00_AXI_arid,
    M00_AXI_arlen,
    M00_AXI_arlock,
    M00_AXI_arprot,
    M00_AXI_arqos,
    M00_AXI_arready,
    M00_AXI_arregion,
    M00_AXI_arsize,
    M00_AXI_arvalid,
    M00_AXI_awaddr,
    M00_AXI_awburst,
    M00_AXI_awcache,
    M00_AXI_awid,
    M00_AXI_awlen,
    M00_AXI_awlock,
    M00_AXI_awprot,
    M00_AXI_awqos,
    M00_AXI_awready,
    M00_AXI_awregion,
    M00_AXI_awsize,
    M00_AXI_awvalid,
    M00_AXI_bid,
    M00_AXI_bready,
    M00_AXI_bresp,
    M00_AXI_bvalid,
    M00_AXI_rdata,
    M00_AXI_rid,
    M00_AXI_rlast,
    M00_AXI_rready,
    M00_AXI_rresp,
    M00_AXI_rvalid,
    M00_AXI_wdata,
    M00_AXI_wlast,
    M00_AXI_wready,
    M00_AXI_wstrb,
    M00_AXI_wvalid,
    M01_ACLK,
    M01_ARESETN,
    M01_AXI_araddr,
    M01_AXI_arburst,
    M01_AXI_arcache,
    M01_AXI_arid,
    M01_AXI_arlen,
    M01_AXI_arlock,
    M01_AXI_arprot,
    M01_AXI_arqos,
    M01_AXI_arready,
    M01_AXI_arregion,
    M01_AXI_arsize,
    M01_AXI_arvalid,
    M01_AXI_awaddr,
    M01_AXI_awburst,
    M01_AXI_awcache,
    M01_AXI_awid,
    M01_AXI_awlen,
    M01_AXI_awlock,
    M01_AXI_awprot,
    M01_AXI_awqos,
    M01_AXI_awready,
    M01_AXI_awregion,
    M01_AXI_awsize,
    M01_AXI_awvalid,
    M01_AXI_bid,
    M01_AXI_bready,
    M01_AXI_bresp,
    M01_AXI_bvalid,
    M01_AXI_rdata,
    M01_AXI_rid,
    M01_AXI_rlast,
    M01_AXI_rready,
    M01_AXI_rresp,
    M01_AXI_rvalid,
    M01_AXI_wdata,
    M01_AXI_wlast,
    M01_AXI_wready,
    M01_AXI_wstrb,
    M01_AXI_wvalid,
    M02_ACLK,
    M02_ARESETN,
    M02_AXI_araddr,
    M02_AXI_arready,
    M02_AXI_arvalid,
    M02_AXI_awaddr,
    M02_AXI_awready,
    M02_AXI_awvalid,
    M02_AXI_bready,
    M02_AXI_bresp,
    M02_AXI_bvalid,
    M02_AXI_rdata,
    M02_AXI_rready,
    M02_AXI_rresp,
    M02_AXI_rvalid,
    M02_AXI_wdata,
    M02_AXI_wready,
    M02_AXI_wstrb,
    M02_AXI_wvalid,
    S00_ACLK,
    S00_ARESETN,
    S00_AXI_araddr,
    S00_AXI_arburst,
    S00_AXI_arcache,
    S00_AXI_arid,
    S00_AXI_arlen,
    S00_AXI_arlock,
    S00_AXI_arprot,
    S00_AXI_arqos,
    S00_AXI_arready,
    S00_AXI_arsize,
    S00_AXI_arvalid,
    S00_AXI_awaddr,
    S00_AXI_awburst,
    S00_AXI_awcache,
    S00_AXI_awid,
    S00_AXI_awlen,
    S00_AXI_awlock,
    S00_AXI_awprot,
    S00_AXI_awqos,
    S00_AXI_awready,
    S00_AXI_awsize,
    S00_AXI_awvalid,
    S00_AXI_bid,
    S00_AXI_bready,
    S00_AXI_bresp,
    S00_AXI_bvalid,
    S00_AXI_rdata,
    S00_AXI_rid,
    S00_AXI_rlast,
    S00_AXI_rready,
    S00_AXI_rresp,
    S00_AXI_rvalid,
    S00_AXI_wdata,
    S00_AXI_wid,
    S00_AXI_wlast,
    S00_AXI_wready,
    S00_AXI_wstrb,
    S00_AXI_wvalid);
  input ACLK;
  input ARESETN;
  input M00_ACLK;
  input M00_ARESETN;
  output [31:0]M00_AXI_araddr;
  output [1:0]M00_AXI_arburst;
  output [3:0]M00_AXI_arcache;
  output [11:0]M00_AXI_arid;
  output [7:0]M00_AXI_arlen;
  output [0:0]M00_AXI_arlock;
  output [2:0]M00_AXI_arprot;
  output [3:0]M00_AXI_arqos;
  input M00_AXI_arready;
  output [3:0]M00_AXI_arregion;
  output [2:0]M00_AXI_arsize;
  output M00_AXI_arvalid;
  output [31:0]M00_AXI_awaddr;
  output [1:0]M00_AXI_awburst;
  output [3:0]M00_AXI_awcache;
  output [11:0]M00_AXI_awid;
  output [7:0]M00_AXI_awlen;
  output [0:0]M00_AXI_awlock;
  output [2:0]M00_AXI_awprot;
  output [3:0]M00_AXI_awqos;
  input M00_AXI_awready;
  output [3:0]M00_AXI_awregion;
  output [2:0]M00_AXI_awsize;
  output M00_AXI_awvalid;
  input [11:0]M00_AXI_bid;
  output M00_AXI_bready;
  input [1:0]M00_AXI_bresp;
  input M00_AXI_bvalid;
  input [31:0]M00_AXI_rdata;
  input [11:0]M00_AXI_rid;
  input M00_AXI_rlast;
  output M00_AXI_rready;
  input [1:0]M00_AXI_rresp;
  input M00_AXI_rvalid;
  output [31:0]M00_AXI_wdata;
  output M00_AXI_wlast;
  input M00_AXI_wready;
  output [3:0]M00_AXI_wstrb;
  output M00_AXI_wvalid;
  input M01_ACLK;
  input M01_ARESETN;
  output [31:0]M01_AXI_araddr;
  output [1:0]M01_AXI_arburst;
  output [3:0]M01_AXI_arcache;
  output [11:0]M01_AXI_arid;
  output [7:0]M01_AXI_arlen;
  output [0:0]M01_AXI_arlock;
  output [2:0]M01_AXI_arprot;
  output [3:0]M01_AXI_arqos;
  input M01_AXI_arready;
  output [3:0]M01_AXI_arregion;
  output [2:0]M01_AXI_arsize;
  output M01_AXI_arvalid;
  output [31:0]M01_AXI_awaddr;
  output [1:0]M01_AXI_awburst;
  output [3:0]M01_AXI_awcache;
  output [11:0]M01_AXI_awid;
  output [7:0]M01_AXI_awlen;
  output [0:0]M01_AXI_awlock;
  output [2:0]M01_AXI_awprot;
  output [3:0]M01_AXI_awqos;
  input M01_AXI_awready;
  output [3:0]M01_AXI_awregion;
  output [2:0]M01_AXI_awsize;
  output M01_AXI_awvalid;
  input [11:0]M01_AXI_bid;
  output M01_AXI_bready;
  input [1:0]M01_AXI_bresp;
  input M01_AXI_bvalid;
  input [31:0]M01_AXI_rdata;
  input [11:0]M01_AXI_rid;
  input M01_AXI_rlast;
  output M01_AXI_rready;
  input [1:0]M01_AXI_rresp;
  input M01_AXI_rvalid;
  output [31:0]M01_AXI_wdata;
  output M01_AXI_wlast;
  input M01_AXI_wready;
  output [3:0]M01_AXI_wstrb;
  output M01_AXI_wvalid;
  input M02_ACLK;
  input M02_ARESETN;
  output [31:0]M02_AXI_araddr;
  input M02_AXI_arready;
  output M02_AXI_arvalid;
  output [31:0]M02_AXI_awaddr;
  input M02_AXI_awready;
  output M02_AXI_awvalid;
  output M02_AXI_bready;
  input [1:0]M02_AXI_bresp;
  input M02_AXI_bvalid;
  input [31:0]M02_AXI_rdata;
  output M02_AXI_rready;
  input [1:0]M02_AXI_rresp;
  input M02_AXI_rvalid;
  output [31:0]M02_AXI_wdata;
  input M02_AXI_wready;
  output [3:0]M02_AXI_wstrb;
  output M02_AXI_wvalid;
  input S00_ACLK;
  input S00_ARESETN;
  input [31:0]S00_AXI_araddr;
  input [1:0]S00_AXI_arburst;
  input [3:0]S00_AXI_arcache;
  input [11:0]S00_AXI_arid;
  input [3:0]S00_AXI_arlen;
  input [1:0]S00_AXI_arlock;
  input [2:0]S00_AXI_arprot;
  input [3:0]S00_AXI_arqos;
  output S00_AXI_arready;
  input [2:0]S00_AXI_arsize;
  input S00_AXI_arvalid;
  input [31:0]S00_AXI_awaddr;
  input [1:0]S00_AXI_awburst;
  input [3:0]S00_AXI_awcache;
  input [11:0]S00_AXI_awid;
  input [3:0]S00_AXI_awlen;
  input [1:0]S00_AXI_awlock;
  input [2:0]S00_AXI_awprot;
  input [3:0]S00_AXI_awqos;
  output S00_AXI_awready;
  input [2:0]S00_AXI_awsize;
  input S00_AXI_awvalid;
  output [11:0]S00_AXI_bid;
  input S00_AXI_bready;
  output [1:0]S00_AXI_bresp;
  output S00_AXI_bvalid;
  output [31:0]S00_AXI_rdata;
  output [11:0]S00_AXI_rid;
  output S00_AXI_rlast;
  input S00_AXI_rready;
  output [1:0]S00_AXI_rresp;
  output S00_AXI_rvalid;
  input [31:0]S00_AXI_wdata;
  input [11:0]S00_AXI_wid;
  input S00_AXI_wlast;
  output S00_AXI_wready;
  input [3:0]S00_AXI_wstrb;
  input S00_AXI_wvalid;

  wire ACLK;
  wire ARESETN;
  wire [31:0]M00_AXI_araddr;
  wire [1:0]M00_AXI_arburst;
  wire [3:0]M00_AXI_arcache;
  wire [11:0]M00_AXI_arid;
  wire [7:0]M00_AXI_arlen;
  wire [0:0]M00_AXI_arlock;
  wire [2:0]M00_AXI_arprot;
  wire [3:0]M00_AXI_arqos;
  wire M00_AXI_arready;
  wire [3:0]M00_AXI_arregion;
  wire [2:0]M00_AXI_arsize;
  wire M00_AXI_arvalid;
  wire [31:0]M00_AXI_awaddr;
  wire [1:0]M00_AXI_awburst;
  wire [3:0]M00_AXI_awcache;
  wire [11:0]M00_AXI_awid;
  wire [7:0]M00_AXI_awlen;
  wire [0:0]M00_AXI_awlock;
  wire [2:0]M00_AXI_awprot;
  wire [3:0]M00_AXI_awqos;
  wire M00_AXI_awready;
  wire [3:0]M00_AXI_awregion;
  wire [2:0]M00_AXI_awsize;
  wire M00_AXI_awvalid;
  wire [11:0]M00_AXI_bid;
  wire M00_AXI_bready;
  wire [1:0]M00_AXI_bresp;
  wire M00_AXI_bvalid;
  wire [31:0]M00_AXI_rdata;
  wire [11:0]M00_AXI_rid;
  wire M00_AXI_rlast;
  wire M00_AXI_rready;
  wire [1:0]M00_AXI_rresp;
  wire M00_AXI_rvalid;
  wire [31:0]M00_AXI_wdata;
  wire M00_AXI_wlast;
  wire M00_AXI_wready;
  wire [3:0]M00_AXI_wstrb;
  wire M00_AXI_wvalid;
  wire [31:0]M01_AXI_araddr;
  wire [1:0]M01_AXI_arburst;
  wire [3:0]M01_AXI_arcache;
  wire [11:0]M01_AXI_arid;
  wire [7:0]M01_AXI_arlen;
  wire [0:0]M01_AXI_arlock;
  wire [2:0]M01_AXI_arprot;
  wire [3:0]M01_AXI_arqos;
  wire M01_AXI_arready;
  wire [3:0]M01_AXI_arregion;
  wire [2:0]M01_AXI_arsize;
  wire M01_AXI_arvalid;
  wire [31:0]M01_AXI_awaddr;
  wire [1:0]M01_AXI_awburst;
  wire [3:0]M01_AXI_awcache;
  wire [11:0]M01_AXI_awid;
  wire [7:0]M01_AXI_awlen;
  wire [0:0]M01_AXI_awlock;
  wire [2:0]M01_AXI_awprot;
  wire [3:0]M01_AXI_awqos;
  wire M01_AXI_awready;
  wire [3:0]M01_AXI_awregion;
  wire [2:0]M01_AXI_awsize;
  wire M01_AXI_awvalid;
  wire [11:0]M01_AXI_bid;
  wire M01_AXI_bready;
  wire [1:0]M01_AXI_bresp;
  wire M01_AXI_bvalid;
  wire [31:0]M01_AXI_rdata;
  wire [11:0]M01_AXI_rid;
  wire M01_AXI_rlast;
  wire M01_AXI_rready;
  wire [1:0]M01_AXI_rresp;
  wire M01_AXI_rvalid;
  wire [31:0]M01_AXI_wdata;
  wire M01_AXI_wlast;
  wire M01_AXI_wready;
  wire [3:0]M01_AXI_wstrb;
  wire M01_AXI_wvalid;
  wire [31:0]M02_AXI_araddr;
  wire M02_AXI_arready;
  wire M02_AXI_arvalid;
  wire [31:0]M02_AXI_awaddr;
  wire M02_AXI_awready;
  wire M02_AXI_awvalid;
  wire M02_AXI_bready;
  wire [1:0]M02_AXI_bresp;
  wire M02_AXI_bvalid;
  wire [31:0]M02_AXI_rdata;
  wire M02_AXI_rready;
  wire [1:0]M02_AXI_rresp;
  wire M02_AXI_rvalid;
  wire [31:0]M02_AXI_wdata;
  wire M02_AXI_wready;
  wire [3:0]M02_AXI_wstrb;
  wire M02_AXI_wvalid;
  wire [31:0]S00_AXI_araddr;
  wire [1:0]S00_AXI_arburst;
  wire [3:0]S00_AXI_arcache;
  wire [11:0]S00_AXI_arid;
  wire [3:0]S00_AXI_arlen;
  wire [1:0]S00_AXI_arlock;
  wire [2:0]S00_AXI_arprot;
  wire [3:0]S00_AXI_arqos;
  wire S00_AXI_arready;
  wire [2:0]S00_AXI_arsize;
  wire S00_AXI_arvalid;
  wire [31:0]S00_AXI_awaddr;
  wire [1:0]S00_AXI_awburst;
  wire [3:0]S00_AXI_awcache;
  wire [11:0]S00_AXI_awid;
  wire [3:0]S00_AXI_awlen;
  wire [1:0]S00_AXI_awlock;
  wire [2:0]S00_AXI_awprot;
  wire [3:0]S00_AXI_awqos;
  wire S00_AXI_awready;
  wire [2:0]S00_AXI_awsize;
  wire S00_AXI_awvalid;
  wire [11:0]S00_AXI_bid;
  wire S00_AXI_bready;
  wire [1:0]S00_AXI_bresp;
  wire S00_AXI_bvalid;
  wire [31:0]S00_AXI_rdata;
  wire [11:0]S00_AXI_rid;
  wire S00_AXI_rlast;
  wire S00_AXI_rready;
  wire [1:0]S00_AXI_rresp;
  wire S00_AXI_rvalid;
  wire [31:0]S00_AXI_wdata;
  wire [11:0]S00_AXI_wid;
  wire S00_AXI_wlast;
  wire S00_AXI_wready;
  wire [3:0]S00_AXI_wstrb;
  wire S00_AXI_wvalid;
  wire [31:0]s00_couplers_to_xbar_ARADDR;
  wire [1:0]s00_couplers_to_xbar_ARBURST;
  wire [3:0]s00_couplers_to_xbar_ARCACHE;
  wire [11:0]s00_couplers_to_xbar_ARID;
  wire [7:0]s00_couplers_to_xbar_ARLEN;
  wire [0:0]s00_couplers_to_xbar_ARLOCK;
  wire [2:0]s00_couplers_to_xbar_ARPROT;
  wire [3:0]s00_couplers_to_xbar_ARQOS;
  wire [0:0]s00_couplers_to_xbar_ARREADY;
  wire [2:0]s00_couplers_to_xbar_ARSIZE;
  wire s00_couplers_to_xbar_ARVALID;
  wire [31:0]s00_couplers_to_xbar_AWADDR;
  wire [1:0]s00_couplers_to_xbar_AWBURST;
  wire [3:0]s00_couplers_to_xbar_AWCACHE;
  wire [11:0]s00_couplers_to_xbar_AWID;
  wire [7:0]s00_couplers_to_xbar_AWLEN;
  wire [0:0]s00_couplers_to_xbar_AWLOCK;
  wire [2:0]s00_couplers_to_xbar_AWPROT;
  wire [3:0]s00_couplers_to_xbar_AWQOS;
  wire [0:0]s00_couplers_to_xbar_AWREADY;
  wire [2:0]s00_couplers_to_xbar_AWSIZE;
  wire s00_couplers_to_xbar_AWVALID;
  wire [11:0]s00_couplers_to_xbar_BID;
  wire s00_couplers_to_xbar_BREADY;
  wire [1:0]s00_couplers_to_xbar_BRESP;
  wire [0:0]s00_couplers_to_xbar_BVALID;
  wire [31:0]s00_couplers_to_xbar_RDATA;
  wire [11:0]s00_couplers_to_xbar_RID;
  wire [0:0]s00_couplers_to_xbar_RLAST;
  wire s00_couplers_to_xbar_RREADY;
  wire [1:0]s00_couplers_to_xbar_RRESP;
  wire [0:0]s00_couplers_to_xbar_RVALID;
  wire [31:0]s00_couplers_to_xbar_WDATA;
  wire s00_couplers_to_xbar_WLAST;
  wire [0:0]s00_couplers_to_xbar_WREADY;
  wire [3:0]s00_couplers_to_xbar_WSTRB;
  wire s00_couplers_to_xbar_WVALID;
  wire [31:0]xbar_to_m00_couplers_ARADDR;
  wire [1:0]xbar_to_m00_couplers_ARBURST;
  wire [3:0]xbar_to_m00_couplers_ARCACHE;
  wire [11:0]xbar_to_m00_couplers_ARID;
  wire [7:0]xbar_to_m00_couplers_ARLEN;
  wire [0:0]xbar_to_m00_couplers_ARLOCK;
  wire [2:0]xbar_to_m00_couplers_ARPROT;
  wire [3:0]xbar_to_m00_couplers_ARQOS;
  wire xbar_to_m00_couplers_ARREADY;
  wire [3:0]xbar_to_m00_couplers_ARREGION;
  wire [2:0]xbar_to_m00_couplers_ARSIZE;
  wire [0:0]xbar_to_m00_couplers_ARVALID;
  wire [31:0]xbar_to_m00_couplers_AWADDR;
  wire [1:0]xbar_to_m00_couplers_AWBURST;
  wire [3:0]xbar_to_m00_couplers_AWCACHE;
  wire [11:0]xbar_to_m00_couplers_AWID;
  wire [7:0]xbar_to_m00_couplers_AWLEN;
  wire [0:0]xbar_to_m00_couplers_AWLOCK;
  wire [2:0]xbar_to_m00_couplers_AWPROT;
  wire [3:0]xbar_to_m00_couplers_AWQOS;
  wire xbar_to_m00_couplers_AWREADY;
  wire [3:0]xbar_to_m00_couplers_AWREGION;
  wire [2:0]xbar_to_m00_couplers_AWSIZE;
  wire [0:0]xbar_to_m00_couplers_AWVALID;
  wire [11:0]xbar_to_m00_couplers_BID;
  wire [0:0]xbar_to_m00_couplers_BREADY;
  wire [1:0]xbar_to_m00_couplers_BRESP;
  wire xbar_to_m00_couplers_BVALID;
  wire [31:0]xbar_to_m00_couplers_RDATA;
  wire [11:0]xbar_to_m00_couplers_RID;
  wire xbar_to_m00_couplers_RLAST;
  wire [0:0]xbar_to_m00_couplers_RREADY;
  wire [1:0]xbar_to_m00_couplers_RRESP;
  wire xbar_to_m00_couplers_RVALID;
  wire [31:0]xbar_to_m00_couplers_WDATA;
  wire [0:0]xbar_to_m00_couplers_WLAST;
  wire xbar_to_m00_couplers_WREADY;
  wire [3:0]xbar_to_m00_couplers_WSTRB;
  wire [0:0]xbar_to_m00_couplers_WVALID;
  wire [63:32]xbar_to_m01_couplers_ARADDR;
  wire [3:2]xbar_to_m01_couplers_ARBURST;
  wire [7:4]xbar_to_m01_couplers_ARCACHE;
  wire [23:12]xbar_to_m01_couplers_ARID;
  wire [15:8]xbar_to_m01_couplers_ARLEN;
  wire [1:1]xbar_to_m01_couplers_ARLOCK;
  wire [5:3]xbar_to_m01_couplers_ARPROT;
  wire [7:4]xbar_to_m01_couplers_ARQOS;
  wire xbar_to_m01_couplers_ARREADY;
  wire [7:4]xbar_to_m01_couplers_ARREGION;
  wire [5:3]xbar_to_m01_couplers_ARSIZE;
  wire [1:1]xbar_to_m01_couplers_ARVALID;
  wire [63:32]xbar_to_m01_couplers_AWADDR;
  wire [3:2]xbar_to_m01_couplers_AWBURST;
  wire [7:4]xbar_to_m01_couplers_AWCACHE;
  wire [23:12]xbar_to_m01_couplers_AWID;
  wire [15:8]xbar_to_m01_couplers_AWLEN;
  wire [1:1]xbar_to_m01_couplers_AWLOCK;
  wire [5:3]xbar_to_m01_couplers_AWPROT;
  wire [7:4]xbar_to_m01_couplers_AWQOS;
  wire xbar_to_m01_couplers_AWREADY;
  wire [7:4]xbar_to_m01_couplers_AWREGION;
  wire [5:3]xbar_to_m01_couplers_AWSIZE;
  wire [1:1]xbar_to_m01_couplers_AWVALID;
  wire [11:0]xbar_to_m01_couplers_BID;
  wire [1:1]xbar_to_m01_couplers_BREADY;
  wire [1:0]xbar_to_m01_couplers_BRESP;
  wire xbar_to_m01_couplers_BVALID;
  wire [31:0]xbar_to_m01_couplers_RDATA;
  wire [11:0]xbar_to_m01_couplers_RID;
  wire xbar_to_m01_couplers_RLAST;
  wire [1:1]xbar_to_m01_couplers_RREADY;
  wire [1:0]xbar_to_m01_couplers_RRESP;
  wire xbar_to_m01_couplers_RVALID;
  wire [63:32]xbar_to_m01_couplers_WDATA;
  wire [1:1]xbar_to_m01_couplers_WLAST;
  wire xbar_to_m01_couplers_WREADY;
  wire [7:4]xbar_to_m01_couplers_WSTRB;
  wire [1:1]xbar_to_m01_couplers_WVALID;
  wire [95:64]xbar_to_m02_couplers_ARADDR;
  wire [5:4]xbar_to_m02_couplers_ARBURST;
  wire [11:8]xbar_to_m02_couplers_ARCACHE;
  wire [35:24]xbar_to_m02_couplers_ARID;
  wire [23:16]xbar_to_m02_couplers_ARLEN;
  wire [2:2]xbar_to_m02_couplers_ARLOCK;
  wire [8:6]xbar_to_m02_couplers_ARPROT;
  wire [11:8]xbar_to_m02_couplers_ARQOS;
  wire xbar_to_m02_couplers_ARREADY;
  wire [11:8]xbar_to_m02_couplers_ARREGION;
  wire [8:6]xbar_to_m02_couplers_ARSIZE;
  wire [2:2]xbar_to_m02_couplers_ARVALID;
  wire [95:64]xbar_to_m02_couplers_AWADDR;
  wire [5:4]xbar_to_m02_couplers_AWBURST;
  wire [11:8]xbar_to_m02_couplers_AWCACHE;
  wire [35:24]xbar_to_m02_couplers_AWID;
  wire [23:16]xbar_to_m02_couplers_AWLEN;
  wire [2:2]xbar_to_m02_couplers_AWLOCK;
  wire [8:6]xbar_to_m02_couplers_AWPROT;
  wire [11:8]xbar_to_m02_couplers_AWQOS;
  wire xbar_to_m02_couplers_AWREADY;
  wire [11:8]xbar_to_m02_couplers_AWREGION;
  wire [8:6]xbar_to_m02_couplers_AWSIZE;
  wire [2:2]xbar_to_m02_couplers_AWVALID;
  wire [11:0]xbar_to_m02_couplers_BID;
  wire [2:2]xbar_to_m02_couplers_BREADY;
  wire [1:0]xbar_to_m02_couplers_BRESP;
  wire xbar_to_m02_couplers_BVALID;
  wire [31:0]xbar_to_m02_couplers_RDATA;
  wire [11:0]xbar_to_m02_couplers_RID;
  wire xbar_to_m02_couplers_RLAST;
  wire [2:2]xbar_to_m02_couplers_RREADY;
  wire [1:0]xbar_to_m02_couplers_RRESP;
  wire xbar_to_m02_couplers_RVALID;
  wire [95:64]xbar_to_m02_couplers_WDATA;
  wire [2:2]xbar_to_m02_couplers_WLAST;
  wire xbar_to_m02_couplers_WREADY;
  wire [11:8]xbar_to_m02_couplers_WSTRB;
  wire [2:2]xbar_to_m02_couplers_WVALID;

  m00_couplers_imp_9IKH7F m00_couplers
       (.M_ACLK(ACLK),
        .M_ARESETN(ARESETN),
        .M_AXI_araddr(M00_AXI_araddr),
        .M_AXI_arburst(M00_AXI_arburst),
        .M_AXI_arcache(M00_AXI_arcache),
        .M_AXI_arid(M00_AXI_arid),
        .M_AXI_arlen(M00_AXI_arlen),
        .M_AXI_arlock(M00_AXI_arlock),
        .M_AXI_arprot(M00_AXI_arprot),
        .M_AXI_arqos(M00_AXI_arqos),
        .M_AXI_arready(M00_AXI_arready),
        .M_AXI_arregion(M00_AXI_arregion),
        .M_AXI_arsize(M00_AXI_arsize),
        .M_AXI_arvalid(M00_AXI_arvalid),
        .M_AXI_awaddr(M00_AXI_awaddr),
        .M_AXI_awburst(M00_AXI_awburst),
        .M_AXI_awcache(M00_AXI_awcache),
        .M_AXI_awid(M00_AXI_awid),
        .M_AXI_awlen(M00_AXI_awlen),
        .M_AXI_awlock(M00_AXI_awlock),
        .M_AXI_awprot(M00_AXI_awprot),
        .M_AXI_awqos(M00_AXI_awqos),
        .M_AXI_awready(M00_AXI_awready),
        .M_AXI_awregion(M00_AXI_awregion),
        .M_AXI_awsize(M00_AXI_awsize),
        .M_AXI_awvalid(M00_AXI_awvalid),
        .M_AXI_bid(M00_AXI_bid),
        .M_AXI_bready(M00_AXI_bready),
        .M_AXI_bresp(M00_AXI_bresp),
        .M_AXI_bvalid(M00_AXI_bvalid),
        .M_AXI_rdata(M00_AXI_rdata),
        .M_AXI_rid(M00_AXI_rid),
        .M_AXI_rlast(M00_AXI_rlast),
        .M_AXI_rready(M00_AXI_rready),
        .M_AXI_rresp(M00_AXI_rresp),
        .M_AXI_rvalid(M00_AXI_rvalid),
        .M_AXI_wdata(M00_AXI_wdata),
        .M_AXI_wlast(M00_AXI_wlast),
        .M_AXI_wready(M00_AXI_wready),
        .M_AXI_wstrb(M00_AXI_wstrb),
        .M_AXI_wvalid(M00_AXI_wvalid),
        .S_ACLK(ACLK),
        .S_ARESETN(ARESETN),
        .S_AXI_araddr(xbar_to_m00_couplers_ARADDR),
        .S_AXI_arburst(xbar_to_m00_couplers_ARBURST),
        .S_AXI_arcache(xbar_to_m00_couplers_ARCACHE),
        .S_AXI_arid(xbar_to_m00_couplers_ARID),
        .S_AXI_arlen(xbar_to_m00_couplers_ARLEN),
        .S_AXI_arlock(xbar_to_m00_couplers_ARLOCK),
        .S_AXI_arprot(xbar_to_m00_couplers_ARPROT),
        .S_AXI_arqos(xbar_to_m00_couplers_ARQOS),
        .S_AXI_arready(xbar_to_m00_couplers_ARREADY),
        .S_AXI_arregion(xbar_to_m00_couplers_ARREGION),
        .S_AXI_arsize(xbar_to_m00_couplers_ARSIZE),
        .S_AXI_arvalid(xbar_to_m00_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m00_couplers_AWADDR),
        .S_AXI_awburst(xbar_to_m00_couplers_AWBURST),
        .S_AXI_awcache(xbar_to_m00_couplers_AWCACHE),
        .S_AXI_awid(xbar_to_m00_couplers_AWID),
        .S_AXI_awlen(xbar_to_m00_couplers_AWLEN),
        .S_AXI_awlock(xbar_to_m00_couplers_AWLOCK),
        .S_AXI_awprot(xbar_to_m00_couplers_AWPROT),
        .S_AXI_awqos(xbar_to_m00_couplers_AWQOS),
        .S_AXI_awready(xbar_to_m00_couplers_AWREADY),
        .S_AXI_awregion(xbar_to_m00_couplers_AWREGION),
        .S_AXI_awsize(xbar_to_m00_couplers_AWSIZE),
        .S_AXI_awvalid(xbar_to_m00_couplers_AWVALID),
        .S_AXI_bid(xbar_to_m00_couplers_BID),
        .S_AXI_bready(xbar_to_m00_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m00_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m00_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m00_couplers_RDATA),
        .S_AXI_rid(xbar_to_m00_couplers_RID),
        .S_AXI_rlast(xbar_to_m00_couplers_RLAST),
        .S_AXI_rready(xbar_to_m00_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m00_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m00_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m00_couplers_WDATA),
        .S_AXI_wlast(xbar_to_m00_couplers_WLAST),
        .S_AXI_wready(xbar_to_m00_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m00_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m00_couplers_WVALID));
  m01_couplers_imp_12VSN7U m01_couplers
       (.M_ACLK(ACLK),
        .M_ARESETN(ARESETN),
        .M_AXI_araddr(M01_AXI_araddr),
        .M_AXI_arburst(M01_AXI_arburst),
        .M_AXI_arcache(M01_AXI_arcache),
        .M_AXI_arid(M01_AXI_arid),
        .M_AXI_arlen(M01_AXI_arlen),
        .M_AXI_arlock(M01_AXI_arlock),
        .M_AXI_arprot(M01_AXI_arprot),
        .M_AXI_arqos(M01_AXI_arqos),
        .M_AXI_arready(M01_AXI_arready),
        .M_AXI_arregion(M01_AXI_arregion),
        .M_AXI_arsize(M01_AXI_arsize),
        .M_AXI_arvalid(M01_AXI_arvalid),
        .M_AXI_awaddr(M01_AXI_awaddr),
        .M_AXI_awburst(M01_AXI_awburst),
        .M_AXI_awcache(M01_AXI_awcache),
        .M_AXI_awid(M01_AXI_awid),
        .M_AXI_awlen(M01_AXI_awlen),
        .M_AXI_awlock(M01_AXI_awlock),
        .M_AXI_awprot(M01_AXI_awprot),
        .M_AXI_awqos(M01_AXI_awqos),
        .M_AXI_awready(M01_AXI_awready),
        .M_AXI_awregion(M01_AXI_awregion),
        .M_AXI_awsize(M01_AXI_awsize),
        .M_AXI_awvalid(M01_AXI_awvalid),
        .M_AXI_bid(M01_AXI_bid),
        .M_AXI_bready(M01_AXI_bready),
        .M_AXI_bresp(M01_AXI_bresp),
        .M_AXI_bvalid(M01_AXI_bvalid),
        .M_AXI_rdata(M01_AXI_rdata),
        .M_AXI_rid(M01_AXI_rid),
        .M_AXI_rlast(M01_AXI_rlast),
        .M_AXI_rready(M01_AXI_rready),
        .M_AXI_rresp(M01_AXI_rresp),
        .M_AXI_rvalid(M01_AXI_rvalid),
        .M_AXI_wdata(M01_AXI_wdata),
        .M_AXI_wlast(M01_AXI_wlast),
        .M_AXI_wready(M01_AXI_wready),
        .M_AXI_wstrb(M01_AXI_wstrb),
        .M_AXI_wvalid(M01_AXI_wvalid),
        .S_ACLK(ACLK),
        .S_ARESETN(ARESETN),
        .S_AXI_araddr(xbar_to_m01_couplers_ARADDR),
        .S_AXI_arburst(xbar_to_m01_couplers_ARBURST),
        .S_AXI_arcache(xbar_to_m01_couplers_ARCACHE),
        .S_AXI_arid(xbar_to_m01_couplers_ARID),
        .S_AXI_arlen(xbar_to_m01_couplers_ARLEN),
        .S_AXI_arlock(xbar_to_m01_couplers_ARLOCK),
        .S_AXI_arprot(xbar_to_m01_couplers_ARPROT),
        .S_AXI_arqos(xbar_to_m01_couplers_ARQOS),
        .S_AXI_arready(xbar_to_m01_couplers_ARREADY),
        .S_AXI_arregion(xbar_to_m01_couplers_ARREGION),
        .S_AXI_arsize(xbar_to_m01_couplers_ARSIZE),
        .S_AXI_arvalid(xbar_to_m01_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m01_couplers_AWADDR),
        .S_AXI_awburst(xbar_to_m01_couplers_AWBURST),
        .S_AXI_awcache(xbar_to_m01_couplers_AWCACHE),
        .S_AXI_awid(xbar_to_m01_couplers_AWID),
        .S_AXI_awlen(xbar_to_m01_couplers_AWLEN),
        .S_AXI_awlock(xbar_to_m01_couplers_AWLOCK),
        .S_AXI_awprot(xbar_to_m01_couplers_AWPROT),
        .S_AXI_awqos(xbar_to_m01_couplers_AWQOS),
        .S_AXI_awready(xbar_to_m01_couplers_AWREADY),
        .S_AXI_awregion(xbar_to_m01_couplers_AWREGION),
        .S_AXI_awsize(xbar_to_m01_couplers_AWSIZE),
        .S_AXI_awvalid(xbar_to_m01_couplers_AWVALID),
        .S_AXI_bid(xbar_to_m01_couplers_BID),
        .S_AXI_bready(xbar_to_m01_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m01_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m01_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m01_couplers_RDATA),
        .S_AXI_rid(xbar_to_m01_couplers_RID),
        .S_AXI_rlast(xbar_to_m01_couplers_RLAST),
        .S_AXI_rready(xbar_to_m01_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m01_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m01_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m01_couplers_WDATA),
        .S_AXI_wlast(xbar_to_m01_couplers_WLAST),
        .S_AXI_wready(xbar_to_m01_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m01_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m01_couplers_WVALID));
  m02_couplers_imp_1A1BVY0 m02_couplers
       (.M_ACLK(ACLK),
        .M_ARESETN(ARESETN),
        .M_AXI_araddr(M02_AXI_araddr),
        .M_AXI_arready(M02_AXI_arready),
        .M_AXI_arvalid(M02_AXI_arvalid),
        .M_AXI_awaddr(M02_AXI_awaddr),
        .M_AXI_awready(M02_AXI_awready),
        .M_AXI_awvalid(M02_AXI_awvalid),
        .M_AXI_bready(M02_AXI_bready),
        .M_AXI_bresp(M02_AXI_bresp),
        .M_AXI_bvalid(M02_AXI_bvalid),
        .M_AXI_rdata(M02_AXI_rdata),
        .M_AXI_rready(M02_AXI_rready),
        .M_AXI_rresp(M02_AXI_rresp),
        .M_AXI_rvalid(M02_AXI_rvalid),
        .M_AXI_wdata(M02_AXI_wdata),
        .M_AXI_wready(M02_AXI_wready),
        .M_AXI_wstrb(M02_AXI_wstrb),
        .M_AXI_wvalid(M02_AXI_wvalid),
        .S_ACLK(ACLK),
        .S_ARESETN(ARESETN),
        .S_AXI_araddr(xbar_to_m02_couplers_ARADDR),
        .S_AXI_arburst(xbar_to_m02_couplers_ARBURST),
        .S_AXI_arcache(xbar_to_m02_couplers_ARCACHE),
        .S_AXI_arid(xbar_to_m02_couplers_ARID),
        .S_AXI_arlen(xbar_to_m02_couplers_ARLEN),
        .S_AXI_arlock(xbar_to_m02_couplers_ARLOCK),
        .S_AXI_arprot(xbar_to_m02_couplers_ARPROT),
        .S_AXI_arqos(xbar_to_m02_couplers_ARQOS),
        .S_AXI_arready(xbar_to_m02_couplers_ARREADY),
        .S_AXI_arregion(xbar_to_m02_couplers_ARREGION),
        .S_AXI_arsize(xbar_to_m02_couplers_ARSIZE),
        .S_AXI_arvalid(xbar_to_m02_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m02_couplers_AWADDR),
        .S_AXI_awburst(xbar_to_m02_couplers_AWBURST),
        .S_AXI_awcache(xbar_to_m02_couplers_AWCACHE),
        .S_AXI_awid(xbar_to_m02_couplers_AWID),
        .S_AXI_awlen(xbar_to_m02_couplers_AWLEN),
        .S_AXI_awlock(xbar_to_m02_couplers_AWLOCK),
        .S_AXI_awprot(xbar_to_m02_couplers_AWPROT),
        .S_AXI_awqos(xbar_to_m02_couplers_AWQOS),
        .S_AXI_awready(xbar_to_m02_couplers_AWREADY),
        .S_AXI_awregion(xbar_to_m02_couplers_AWREGION),
        .S_AXI_awsize(xbar_to_m02_couplers_AWSIZE),
        .S_AXI_awvalid(xbar_to_m02_couplers_AWVALID),
        .S_AXI_bid(xbar_to_m02_couplers_BID),
        .S_AXI_bready(xbar_to_m02_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m02_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m02_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m02_couplers_RDATA),
        .S_AXI_rid(xbar_to_m02_couplers_RID),
        .S_AXI_rlast(xbar_to_m02_couplers_RLAST),
        .S_AXI_rready(xbar_to_m02_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m02_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m02_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m02_couplers_WDATA),
        .S_AXI_wlast(xbar_to_m02_couplers_WLAST),
        .S_AXI_wready(xbar_to_m02_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m02_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m02_couplers_WVALID));
  s00_couplers_imp_61HG22 s00_couplers
       (.M_ACLK(ACLK),
        .M_ARESETN(ARESETN),
        .M_AXI_araddr(s00_couplers_to_xbar_ARADDR),
        .M_AXI_arburst(s00_couplers_to_xbar_ARBURST),
        .M_AXI_arcache(s00_couplers_to_xbar_ARCACHE),
        .M_AXI_arid(s00_couplers_to_xbar_ARID),
        .M_AXI_arlen(s00_couplers_to_xbar_ARLEN),
        .M_AXI_arlock(s00_couplers_to_xbar_ARLOCK),
        .M_AXI_arprot(s00_couplers_to_xbar_ARPROT),
        .M_AXI_arqos(s00_couplers_to_xbar_ARQOS),
        .M_AXI_arready(s00_couplers_to_xbar_ARREADY),
        .M_AXI_arsize(s00_couplers_to_xbar_ARSIZE),
        .M_AXI_arvalid(s00_couplers_to_xbar_ARVALID),
        .M_AXI_awaddr(s00_couplers_to_xbar_AWADDR),
        .M_AXI_awburst(s00_couplers_to_xbar_AWBURST),
        .M_AXI_awcache(s00_couplers_to_xbar_AWCACHE),
        .M_AXI_awid(s00_couplers_to_xbar_AWID),
        .M_AXI_awlen(s00_couplers_to_xbar_AWLEN),
        .M_AXI_awlock(s00_couplers_to_xbar_AWLOCK),
        .M_AXI_awprot(s00_couplers_to_xbar_AWPROT),
        .M_AXI_awqos(s00_couplers_to_xbar_AWQOS),
        .M_AXI_awready(s00_couplers_to_xbar_AWREADY),
        .M_AXI_awsize(s00_couplers_to_xbar_AWSIZE),
        .M_AXI_awvalid(s00_couplers_to_xbar_AWVALID),
        .M_AXI_bid(s00_couplers_to_xbar_BID),
        .M_AXI_bready(s00_couplers_to_xbar_BREADY),
        .M_AXI_bresp(s00_couplers_to_xbar_BRESP),
        .M_AXI_bvalid(s00_couplers_to_xbar_BVALID),
        .M_AXI_rdata(s00_couplers_to_xbar_RDATA),
        .M_AXI_rid(s00_couplers_to_xbar_RID),
        .M_AXI_rlast(s00_couplers_to_xbar_RLAST),
        .M_AXI_rready(s00_couplers_to_xbar_RREADY),
        .M_AXI_rresp(s00_couplers_to_xbar_RRESP),
        .M_AXI_rvalid(s00_couplers_to_xbar_RVALID),
        .M_AXI_wdata(s00_couplers_to_xbar_WDATA),
        .M_AXI_wlast(s00_couplers_to_xbar_WLAST),
        .M_AXI_wready(s00_couplers_to_xbar_WREADY),
        .M_AXI_wstrb(s00_couplers_to_xbar_WSTRB),
        .M_AXI_wvalid(s00_couplers_to_xbar_WVALID),
        .S_ACLK(ACLK),
        .S_ARESETN(ARESETN),
        .S_AXI_araddr(S00_AXI_araddr),
        .S_AXI_arburst(S00_AXI_arburst),
        .S_AXI_arcache(S00_AXI_arcache),
        .S_AXI_arid(S00_AXI_arid),
        .S_AXI_arlen(S00_AXI_arlen),
        .S_AXI_arlock(S00_AXI_arlock),
        .S_AXI_arprot(S00_AXI_arprot),
        .S_AXI_arqos(S00_AXI_arqos),
        .S_AXI_arready(S00_AXI_arready),
        .S_AXI_arsize(S00_AXI_arsize),
        .S_AXI_arvalid(S00_AXI_arvalid),
        .S_AXI_awaddr(S00_AXI_awaddr),
        .S_AXI_awburst(S00_AXI_awburst),
        .S_AXI_awcache(S00_AXI_awcache),
        .S_AXI_awid(S00_AXI_awid),
        .S_AXI_awlen(S00_AXI_awlen),
        .S_AXI_awlock(S00_AXI_awlock),
        .S_AXI_awprot(S00_AXI_awprot),
        .S_AXI_awqos(S00_AXI_awqos),
        .S_AXI_awready(S00_AXI_awready),
        .S_AXI_awsize(S00_AXI_awsize),
        .S_AXI_awvalid(S00_AXI_awvalid),
        .S_AXI_bid(S00_AXI_bid),
        .S_AXI_bready(S00_AXI_bready),
        .S_AXI_bresp(S00_AXI_bresp),
        .S_AXI_bvalid(S00_AXI_bvalid),
        .S_AXI_rdata(S00_AXI_rdata),
        .S_AXI_rid(S00_AXI_rid),
        .S_AXI_rlast(S00_AXI_rlast),
        .S_AXI_rready(S00_AXI_rready),
        .S_AXI_rresp(S00_AXI_rresp),
        .S_AXI_rvalid(S00_AXI_rvalid),
        .S_AXI_wdata(S00_AXI_wdata),
        .S_AXI_wid(S00_AXI_wid),
        .S_AXI_wlast(S00_AXI_wlast),
        .S_AXI_wready(S00_AXI_wready),
        .S_AXI_wstrb(S00_AXI_wstrb),
        .S_AXI_wvalid(S00_AXI_wvalid));
  system_axi_ic_ctrl_imp_xbar_0 xbar
       (.aclk(ACLK),
        .aresetn(ARESETN),
        .m_axi_araddr({xbar_to_m02_couplers_ARADDR,xbar_to_m01_couplers_ARADDR,xbar_to_m00_couplers_ARADDR}),
        .m_axi_arburst({xbar_to_m02_couplers_ARBURST,xbar_to_m01_couplers_ARBURST,xbar_to_m00_couplers_ARBURST}),
        .m_axi_arcache({xbar_to_m02_couplers_ARCACHE,xbar_to_m01_couplers_ARCACHE,xbar_to_m00_couplers_ARCACHE}),
        .m_axi_arid({xbar_to_m02_couplers_ARID,xbar_to_m01_couplers_ARID,xbar_to_m00_couplers_ARID}),
        .m_axi_arlen({xbar_to_m02_couplers_ARLEN,xbar_to_m01_couplers_ARLEN,xbar_to_m00_couplers_ARLEN}),
        .m_axi_arlock({xbar_to_m02_couplers_ARLOCK,xbar_to_m01_couplers_ARLOCK,xbar_to_m00_couplers_ARLOCK}),
        .m_axi_arprot({xbar_to_m02_couplers_ARPROT,xbar_to_m01_couplers_ARPROT,xbar_to_m00_couplers_ARPROT}),
        .m_axi_arqos({xbar_to_m02_couplers_ARQOS,xbar_to_m01_couplers_ARQOS,xbar_to_m00_couplers_ARQOS}),
        .m_axi_arready({xbar_to_m02_couplers_ARREADY,xbar_to_m01_couplers_ARREADY,xbar_to_m00_couplers_ARREADY}),
        .m_axi_arregion({xbar_to_m02_couplers_ARREGION,xbar_to_m01_couplers_ARREGION,xbar_to_m00_couplers_ARREGION}),
        .m_axi_arsize({xbar_to_m02_couplers_ARSIZE,xbar_to_m01_couplers_ARSIZE,xbar_to_m00_couplers_ARSIZE}),
        .m_axi_arvalid({xbar_to_m02_couplers_ARVALID,xbar_to_m01_couplers_ARVALID,xbar_to_m00_couplers_ARVALID}),
        .m_axi_awaddr({xbar_to_m02_couplers_AWADDR,xbar_to_m01_couplers_AWADDR,xbar_to_m00_couplers_AWADDR}),
        .m_axi_awburst({xbar_to_m02_couplers_AWBURST,xbar_to_m01_couplers_AWBURST,xbar_to_m00_couplers_AWBURST}),
        .m_axi_awcache({xbar_to_m02_couplers_AWCACHE,xbar_to_m01_couplers_AWCACHE,xbar_to_m00_couplers_AWCACHE}),
        .m_axi_awid({xbar_to_m02_couplers_AWID,xbar_to_m01_couplers_AWID,xbar_to_m00_couplers_AWID}),
        .m_axi_awlen({xbar_to_m02_couplers_AWLEN,xbar_to_m01_couplers_AWLEN,xbar_to_m00_couplers_AWLEN}),
        .m_axi_awlock({xbar_to_m02_couplers_AWLOCK,xbar_to_m01_couplers_AWLOCK,xbar_to_m00_couplers_AWLOCK}),
        .m_axi_awprot({xbar_to_m02_couplers_AWPROT,xbar_to_m01_couplers_AWPROT,xbar_to_m00_couplers_AWPROT}),
        .m_axi_awqos({xbar_to_m02_couplers_AWQOS,xbar_to_m01_couplers_AWQOS,xbar_to_m00_couplers_AWQOS}),
        .m_axi_awready({xbar_to_m02_couplers_AWREADY,xbar_to_m01_couplers_AWREADY,xbar_to_m00_couplers_AWREADY}),
        .m_axi_awregion({xbar_to_m02_couplers_AWREGION,xbar_to_m01_couplers_AWREGION,xbar_to_m00_couplers_AWREGION}),
        .m_axi_awsize({xbar_to_m02_couplers_AWSIZE,xbar_to_m01_couplers_AWSIZE,xbar_to_m00_couplers_AWSIZE}),
        .m_axi_awvalid({xbar_to_m02_couplers_AWVALID,xbar_to_m01_couplers_AWVALID,xbar_to_m00_couplers_AWVALID}),
        .m_axi_bid({xbar_to_m02_couplers_BID,xbar_to_m01_couplers_BID,xbar_to_m00_couplers_BID}),
        .m_axi_bready({xbar_to_m02_couplers_BREADY,xbar_to_m01_couplers_BREADY,xbar_to_m00_couplers_BREADY}),
        .m_axi_bresp({xbar_to_m02_couplers_BRESP,xbar_to_m01_couplers_BRESP,xbar_to_m00_couplers_BRESP}),
        .m_axi_bvalid({xbar_to_m02_couplers_BVALID,xbar_to_m01_couplers_BVALID,xbar_to_m00_couplers_BVALID}),
        .m_axi_rdata({xbar_to_m02_couplers_RDATA,xbar_to_m01_couplers_RDATA,xbar_to_m00_couplers_RDATA}),
        .m_axi_rid({xbar_to_m02_couplers_RID,xbar_to_m01_couplers_RID,xbar_to_m00_couplers_RID}),
        .m_axi_rlast({xbar_to_m02_couplers_RLAST,xbar_to_m01_couplers_RLAST,xbar_to_m00_couplers_RLAST}),
        .m_axi_rready({xbar_to_m02_couplers_RREADY,xbar_to_m01_couplers_RREADY,xbar_to_m00_couplers_RREADY}),
        .m_axi_rresp({xbar_to_m02_couplers_RRESP,xbar_to_m01_couplers_RRESP,xbar_to_m00_couplers_RRESP}),
        .m_axi_rvalid({xbar_to_m02_couplers_RVALID,xbar_to_m01_couplers_RVALID,xbar_to_m00_couplers_RVALID}),
        .m_axi_wdata({xbar_to_m02_couplers_WDATA,xbar_to_m01_couplers_WDATA,xbar_to_m00_couplers_WDATA}),
        .m_axi_wlast({xbar_to_m02_couplers_WLAST,xbar_to_m01_couplers_WLAST,xbar_to_m00_couplers_WLAST}),
        .m_axi_wready({xbar_to_m02_couplers_WREADY,xbar_to_m01_couplers_WREADY,xbar_to_m00_couplers_WREADY}),
        .m_axi_wstrb({xbar_to_m02_couplers_WSTRB,xbar_to_m01_couplers_WSTRB,xbar_to_m00_couplers_WSTRB}),
        .m_axi_wvalid({xbar_to_m02_couplers_WVALID,xbar_to_m01_couplers_WVALID,xbar_to_m00_couplers_WVALID}),
        .s_axi_araddr(s00_couplers_to_xbar_ARADDR),
        .s_axi_arburst(s00_couplers_to_xbar_ARBURST),
        .s_axi_arcache(s00_couplers_to_xbar_ARCACHE),
        .s_axi_arid(s00_couplers_to_xbar_ARID),
        .s_axi_arlen(s00_couplers_to_xbar_ARLEN),
        .s_axi_arlock(s00_couplers_to_xbar_ARLOCK),
        .s_axi_arprot(s00_couplers_to_xbar_ARPROT),
        .s_axi_arqos(s00_couplers_to_xbar_ARQOS),
        .s_axi_arready(s00_couplers_to_xbar_ARREADY),
        .s_axi_arsize(s00_couplers_to_xbar_ARSIZE),
        .s_axi_arvalid(s00_couplers_to_xbar_ARVALID),
        .s_axi_awaddr(s00_couplers_to_xbar_AWADDR),
        .s_axi_awburst(s00_couplers_to_xbar_AWBURST),
        .s_axi_awcache(s00_couplers_to_xbar_AWCACHE),
        .s_axi_awid(s00_couplers_to_xbar_AWID),
        .s_axi_awlen(s00_couplers_to_xbar_AWLEN),
        .s_axi_awlock(s00_couplers_to_xbar_AWLOCK),
        .s_axi_awprot(s00_couplers_to_xbar_AWPROT),
        .s_axi_awqos(s00_couplers_to_xbar_AWQOS),
        .s_axi_awready(s00_couplers_to_xbar_AWREADY),
        .s_axi_awsize(s00_couplers_to_xbar_AWSIZE),
        .s_axi_awvalid(s00_couplers_to_xbar_AWVALID),
        .s_axi_bid(s00_couplers_to_xbar_BID),
        .s_axi_bready(s00_couplers_to_xbar_BREADY),
        .s_axi_bresp(s00_couplers_to_xbar_BRESP),
        .s_axi_bvalid(s00_couplers_to_xbar_BVALID),
        .s_axi_rdata(s00_couplers_to_xbar_RDATA),
        .s_axi_rid(s00_couplers_to_xbar_RID),
        .s_axi_rlast(s00_couplers_to_xbar_RLAST),
        .s_axi_rready(s00_couplers_to_xbar_RREADY),
        .s_axi_rresp(s00_couplers_to_xbar_RRESP),
        .s_axi_rvalid(s00_couplers_to_xbar_RVALID),
        .s_axi_wdata(s00_couplers_to_xbar_WDATA),
        .s_axi_wlast(s00_couplers_to_xbar_WLAST),
        .s_axi_wready(s00_couplers_to_xbar_WREADY),
        .s_axi_wstrb(s00_couplers_to_xbar_WSTRB),
        .s_axi_wvalid(s00_couplers_to_xbar_WVALID));
endmodule

module system_axi_ic_mem_0
   (ACLK,
    ARESETN,
    M00_ACLK,
    M00_ARESETN,
    M00_AXI_araddr,
    M00_AXI_arburst,
    M00_AXI_arcache,
    M00_AXI_arid,
    M00_AXI_arlen,
    M00_AXI_arlock,
    M00_AXI_arprot,
    M00_AXI_arqos,
    M00_AXI_arready,
    M00_AXI_arsize,
    M00_AXI_arvalid,
    M00_AXI_awaddr,
    M00_AXI_awburst,
    M00_AXI_awcache,
    M00_AXI_awid,
    M00_AXI_awlen,
    M00_AXI_awlock,
    M00_AXI_awprot,
    M00_AXI_awqos,
    M00_AXI_awready,
    M00_AXI_awsize,
    M00_AXI_awvalid,
    M00_AXI_bid,
    M00_AXI_bready,
    M00_AXI_bresp,
    M00_AXI_bvalid,
    M00_AXI_rdata,
    M00_AXI_rid,
    M00_AXI_rlast,
    M00_AXI_rready,
    M00_AXI_rresp,
    M00_AXI_rvalid,
    M00_AXI_wdata,
    M00_AXI_wid,
    M00_AXI_wlast,
    M00_AXI_wready,
    M00_AXI_wstrb,
    M00_AXI_wvalid,
    S00_ACLK,
    S00_ARESETN,
    S00_AXI_araddr,
    S00_AXI_arburst,
    S00_AXI_arcache,
    S00_AXI_arid,
    S00_AXI_arlen,
    S00_AXI_arlock,
    S00_AXI_arprot,
    S00_AXI_arqos,
    S00_AXI_arready,
    S00_AXI_arsize,
    S00_AXI_arvalid,
    S00_AXI_awaddr,
    S00_AXI_awburst,
    S00_AXI_awcache,
    S00_AXI_awid,
    S00_AXI_awlen,
    S00_AXI_awlock,
    S00_AXI_awprot,
    S00_AXI_awqos,
    S00_AXI_awready,
    S00_AXI_awsize,
    S00_AXI_awvalid,
    S00_AXI_bid,
    S00_AXI_bready,
    S00_AXI_bresp,
    S00_AXI_bvalid,
    S00_AXI_rdata,
    S00_AXI_rid,
    S00_AXI_rlast,
    S00_AXI_rready,
    S00_AXI_rresp,
    S00_AXI_rvalid,
    S00_AXI_wdata,
    S00_AXI_wlast,
    S00_AXI_wready,
    S00_AXI_wstrb,
    S00_AXI_wvalid);
  input ACLK;
  input ARESETN;
  input M00_ACLK;
  input M00_ARESETN;
  output [31:0]M00_AXI_araddr;
  output [1:0]M00_AXI_arburst;
  output [3:0]M00_AXI_arcache;
  output [5:0]M00_AXI_arid;
  output [3:0]M00_AXI_arlen;
  output [1:0]M00_AXI_arlock;
  output [2:0]M00_AXI_arprot;
  output [3:0]M00_AXI_arqos;
  input M00_AXI_arready;
  output [2:0]M00_AXI_arsize;
  output M00_AXI_arvalid;
  output [31:0]M00_AXI_awaddr;
  output [1:0]M00_AXI_awburst;
  output [3:0]M00_AXI_awcache;
  output [5:0]M00_AXI_awid;
  output [3:0]M00_AXI_awlen;
  output [1:0]M00_AXI_awlock;
  output [2:0]M00_AXI_awprot;
  output [3:0]M00_AXI_awqos;
  input M00_AXI_awready;
  output [2:0]M00_AXI_awsize;
  output M00_AXI_awvalid;
  input [5:0]M00_AXI_bid;
  output M00_AXI_bready;
  input [1:0]M00_AXI_bresp;
  input M00_AXI_bvalid;
  input [31:0]M00_AXI_rdata;
  input [5:0]M00_AXI_rid;
  input M00_AXI_rlast;
  output M00_AXI_rready;
  input [1:0]M00_AXI_rresp;
  input M00_AXI_rvalid;
  output [31:0]M00_AXI_wdata;
  output [5:0]M00_AXI_wid;
  output M00_AXI_wlast;
  input M00_AXI_wready;
  output [3:0]M00_AXI_wstrb;
  output M00_AXI_wvalid;
  input S00_ACLK;
  input S00_ARESETN;
  input [31:0]S00_AXI_araddr;
  input [1:0]S00_AXI_arburst;
  input [3:0]S00_AXI_arcache;
  input [5:0]S00_AXI_arid;
  input [7:0]S00_AXI_arlen;
  input [1:0]S00_AXI_arlock;
  input [2:0]S00_AXI_arprot;
  input [3:0]S00_AXI_arqos;
  output S00_AXI_arready;
  input [2:0]S00_AXI_arsize;
  input S00_AXI_arvalid;
  input [31:0]S00_AXI_awaddr;
  input [1:0]S00_AXI_awburst;
  input [3:0]S00_AXI_awcache;
  input [5:0]S00_AXI_awid;
  input [7:0]S00_AXI_awlen;
  input [1:0]S00_AXI_awlock;
  input [2:0]S00_AXI_awprot;
  input [3:0]S00_AXI_awqos;
  output S00_AXI_awready;
  input [2:0]S00_AXI_awsize;
  input S00_AXI_awvalid;
  output [5:0]S00_AXI_bid;
  input S00_AXI_bready;
  output [1:0]S00_AXI_bresp;
  output S00_AXI_bvalid;
  output [31:0]S00_AXI_rdata;
  output [5:0]S00_AXI_rid;
  output S00_AXI_rlast;
  input S00_AXI_rready;
  output [1:0]S00_AXI_rresp;
  output S00_AXI_rvalid;
  input [31:0]S00_AXI_wdata;
  input S00_AXI_wlast;
  output S00_AXI_wready;
  input [3:0]S00_AXI_wstrb;
  input S00_AXI_wvalid;

  wire M00_ACLK;
  wire M00_ARESETN;
  wire [31:0]M00_AXI_araddr;
  wire [1:0]M00_AXI_arburst;
  wire [3:0]M00_AXI_arcache;
  wire [5:0]M00_AXI_arid;
  wire [3:0]M00_AXI_arlen;
  wire [1:0]M00_AXI_arlock;
  wire [2:0]M00_AXI_arprot;
  wire [3:0]M00_AXI_arqos;
  wire M00_AXI_arready;
  wire [2:0]M00_AXI_arsize;
  wire M00_AXI_arvalid;
  wire [31:0]M00_AXI_awaddr;
  wire [1:0]M00_AXI_awburst;
  wire [3:0]M00_AXI_awcache;
  wire [5:0]M00_AXI_awid;
  wire [3:0]M00_AXI_awlen;
  wire [1:0]M00_AXI_awlock;
  wire [2:0]M00_AXI_awprot;
  wire [3:0]M00_AXI_awqos;
  wire M00_AXI_awready;
  wire [2:0]M00_AXI_awsize;
  wire M00_AXI_awvalid;
  wire [5:0]M00_AXI_bid;
  wire M00_AXI_bready;
  wire [1:0]M00_AXI_bresp;
  wire M00_AXI_bvalid;
  wire [31:0]M00_AXI_rdata;
  wire [5:0]M00_AXI_rid;
  wire M00_AXI_rlast;
  wire M00_AXI_rready;
  wire [1:0]M00_AXI_rresp;
  wire M00_AXI_rvalid;
  wire [31:0]M00_AXI_wdata;
  wire [5:0]M00_AXI_wid;
  wire M00_AXI_wlast;
  wire M00_AXI_wready;
  wire [3:0]M00_AXI_wstrb;
  wire M00_AXI_wvalid;
  wire S00_ACLK;
  wire S00_ARESETN;
  wire [31:0]S00_AXI_araddr;
  wire [1:0]S00_AXI_arburst;
  wire [3:0]S00_AXI_arcache;
  wire [5:0]S00_AXI_arid;
  wire [7:0]S00_AXI_arlen;
  wire [1:0]S00_AXI_arlock;
  wire [2:0]S00_AXI_arprot;
  wire [3:0]S00_AXI_arqos;
  wire S00_AXI_arready;
  wire [2:0]S00_AXI_arsize;
  wire S00_AXI_arvalid;
  wire [31:0]S00_AXI_awaddr;
  wire [1:0]S00_AXI_awburst;
  wire [3:0]S00_AXI_awcache;
  wire [5:0]S00_AXI_awid;
  wire [7:0]S00_AXI_awlen;
  wire [1:0]S00_AXI_awlock;
  wire [2:0]S00_AXI_awprot;
  wire [3:0]S00_AXI_awqos;
  wire S00_AXI_awready;
  wire [2:0]S00_AXI_awsize;
  wire S00_AXI_awvalid;
  wire [5:0]S00_AXI_bid;
  wire S00_AXI_bready;
  wire [1:0]S00_AXI_bresp;
  wire S00_AXI_bvalid;
  wire [31:0]S00_AXI_rdata;
  wire [5:0]S00_AXI_rid;
  wire S00_AXI_rlast;
  wire S00_AXI_rready;
  wire [1:0]S00_AXI_rresp;
  wire S00_AXI_rvalid;
  wire [31:0]S00_AXI_wdata;
  wire S00_AXI_wlast;
  wire S00_AXI_wready;
  wire [3:0]S00_AXI_wstrb;
  wire S00_AXI_wvalid;

  s00_couplers_imp_PTFNND s00_couplers
       (.M_ACLK(M00_ACLK),
        .M_ARESETN(M00_ARESETN),
        .M_AXI_araddr(M00_AXI_araddr),
        .M_AXI_arburst(M00_AXI_arburst),
        .M_AXI_arcache(M00_AXI_arcache),
        .M_AXI_arid(M00_AXI_arid),
        .M_AXI_arlen(M00_AXI_arlen),
        .M_AXI_arlock(M00_AXI_arlock),
        .M_AXI_arprot(M00_AXI_arprot),
        .M_AXI_arqos(M00_AXI_arqos),
        .M_AXI_arready(M00_AXI_arready),
        .M_AXI_arsize(M00_AXI_arsize),
        .M_AXI_arvalid(M00_AXI_arvalid),
        .M_AXI_awaddr(M00_AXI_awaddr),
        .M_AXI_awburst(M00_AXI_awburst),
        .M_AXI_awcache(M00_AXI_awcache),
        .M_AXI_awid(M00_AXI_awid),
        .M_AXI_awlen(M00_AXI_awlen),
        .M_AXI_awlock(M00_AXI_awlock),
        .M_AXI_awprot(M00_AXI_awprot),
        .M_AXI_awqos(M00_AXI_awqos),
        .M_AXI_awready(M00_AXI_awready),
        .M_AXI_awsize(M00_AXI_awsize),
        .M_AXI_awvalid(M00_AXI_awvalid),
        .M_AXI_bid(M00_AXI_bid),
        .M_AXI_bready(M00_AXI_bready),
        .M_AXI_bresp(M00_AXI_bresp),
        .M_AXI_bvalid(M00_AXI_bvalid),
        .M_AXI_rdata(M00_AXI_rdata),
        .M_AXI_rid(M00_AXI_rid),
        .M_AXI_rlast(M00_AXI_rlast),
        .M_AXI_rready(M00_AXI_rready),
        .M_AXI_rresp(M00_AXI_rresp),
        .M_AXI_rvalid(M00_AXI_rvalid),
        .M_AXI_wdata(M00_AXI_wdata),
        .M_AXI_wid(M00_AXI_wid),
        .M_AXI_wlast(M00_AXI_wlast),
        .M_AXI_wready(M00_AXI_wready),
        .M_AXI_wstrb(M00_AXI_wstrb),
        .M_AXI_wvalid(M00_AXI_wvalid),
        .S_ACLK(S00_ACLK),
        .S_ARESETN(S00_ARESETN),
        .S_AXI_araddr(S00_AXI_araddr),
        .S_AXI_arburst(S00_AXI_arburst),
        .S_AXI_arcache(S00_AXI_arcache),
        .S_AXI_arid(S00_AXI_arid),
        .S_AXI_arlen(S00_AXI_arlen),
        .S_AXI_arlock(S00_AXI_arlock),
        .S_AXI_arprot(S00_AXI_arprot),
        .S_AXI_arqos(S00_AXI_arqos),
        .S_AXI_arready(S00_AXI_arready),
        .S_AXI_arsize(S00_AXI_arsize),
        .S_AXI_arvalid(S00_AXI_arvalid),
        .S_AXI_awaddr(S00_AXI_awaddr),
        .S_AXI_awburst(S00_AXI_awburst),
        .S_AXI_awcache(S00_AXI_awcache),
        .S_AXI_awid(S00_AXI_awid),
        .S_AXI_awlen(S00_AXI_awlen),
        .S_AXI_awlock(S00_AXI_awlock),
        .S_AXI_awprot(S00_AXI_awprot),
        .S_AXI_awqos(S00_AXI_awqos),
        .S_AXI_awready(S00_AXI_awready),
        .S_AXI_awsize(S00_AXI_awsize),
        .S_AXI_awvalid(S00_AXI_awvalid),
        .S_AXI_bid(S00_AXI_bid),
        .S_AXI_bready(S00_AXI_bready),
        .S_AXI_bresp(S00_AXI_bresp),
        .S_AXI_bvalid(S00_AXI_bvalid),
        .S_AXI_rdata(S00_AXI_rdata),
        .S_AXI_rid(S00_AXI_rid),
        .S_AXI_rlast(S00_AXI_rlast),
        .S_AXI_rready(S00_AXI_rready),
        .S_AXI_rresp(S00_AXI_rresp),
        .S_AXI_rvalid(S00_AXI_rvalid),
        .S_AXI_wdata(S00_AXI_wdata),
        .S_AXI_wlast(S00_AXI_wlast),
        .S_AXI_wready(S00_AXI_wready),
        .S_AXI_wstrb(S00_AXI_wstrb),
        .S_AXI_wvalid(S00_AXI_wvalid));
endmodule

module system_axi_ic_vid_0
   (ACLK,
    ARESETN,
    M00_ACLK,
    M00_ARESETN,
    M00_AXI_araddr,
    M00_AXI_arburst,
    M00_AXI_arcache,
    M00_AXI_arid,
    M00_AXI_arlen,
    M00_AXI_arlock,
    M00_AXI_arprot,
    M00_AXI_arqos,
    M00_AXI_arready,
    M00_AXI_arsize,
    M00_AXI_arvalid,
    M00_AXI_rdata,
    M00_AXI_rid,
    M00_AXI_rlast,
    M00_AXI_rready,
    M00_AXI_rresp,
    M00_AXI_rvalid,
    S00_ACLK,
    S00_ARESETN,
    S00_AXI_araddr,
    S00_AXI_arburst,
    S00_AXI_arcache,
    S00_AXI_arid,
    S00_AXI_arlen,
    S00_AXI_arlock,
    S00_AXI_arprot,
    S00_AXI_arqos,
    S00_AXI_arready,
    S00_AXI_arsize,
    S00_AXI_arvalid,
    S00_AXI_rdata,
    S00_AXI_rid,
    S00_AXI_rlast,
    S00_AXI_rready,
    S00_AXI_rresp,
    S00_AXI_rvalid);
  input ACLK;
  input ARESETN;
  input M00_ACLK;
  input M00_ARESETN;
  output [31:0]M00_AXI_araddr;
  output [1:0]M00_AXI_arburst;
  output [3:0]M00_AXI_arcache;
  output [5:0]M00_AXI_arid;
  output [3:0]M00_AXI_arlen;
  output [1:0]M00_AXI_arlock;
  output [2:0]M00_AXI_arprot;
  output [3:0]M00_AXI_arqos;
  input M00_AXI_arready;
  output [2:0]M00_AXI_arsize;
  output M00_AXI_arvalid;
  input [31:0]M00_AXI_rdata;
  input [5:0]M00_AXI_rid;
  input M00_AXI_rlast;
  output M00_AXI_rready;
  input [1:0]M00_AXI_rresp;
  input M00_AXI_rvalid;
  input S00_ACLK;
  input S00_ARESETN;
  input [31:0]S00_AXI_araddr;
  input [1:0]S00_AXI_arburst;
  input [3:0]S00_AXI_arcache;
  input [5:0]S00_AXI_arid;
  input [7:0]S00_AXI_arlen;
  input [1:0]S00_AXI_arlock;
  input [2:0]S00_AXI_arprot;
  input [3:0]S00_AXI_arqos;
  output S00_AXI_arready;
  input [2:0]S00_AXI_arsize;
  input S00_AXI_arvalid;
  output [31:0]S00_AXI_rdata;
  output [5:0]S00_AXI_rid;
  output S00_AXI_rlast;
  input S00_AXI_rready;
  output [1:0]S00_AXI_rresp;
  output S00_AXI_rvalid;

  wire M00_ACLK;
  wire M00_ARESETN;
  wire [31:0]M00_AXI_araddr;
  wire [1:0]M00_AXI_arburst;
  wire [3:0]M00_AXI_arcache;
  wire [5:0]M00_AXI_arid;
  wire [3:0]M00_AXI_arlen;
  wire [1:0]M00_AXI_arlock;
  wire [2:0]M00_AXI_arprot;
  wire [3:0]M00_AXI_arqos;
  wire M00_AXI_arready;
  wire [2:0]M00_AXI_arsize;
  wire M00_AXI_arvalid;
  wire [31:0]M00_AXI_rdata;
  wire [5:0]M00_AXI_rid;
  wire M00_AXI_rlast;
  wire M00_AXI_rready;
  wire [1:0]M00_AXI_rresp;
  wire M00_AXI_rvalid;
  wire S00_ACLK;
  wire S00_ARESETN;
  wire [31:0]S00_AXI_araddr;
  wire [1:0]S00_AXI_arburst;
  wire [3:0]S00_AXI_arcache;
  wire [5:0]S00_AXI_arid;
  wire [7:0]S00_AXI_arlen;
  wire [1:0]S00_AXI_arlock;
  wire [2:0]S00_AXI_arprot;
  wire [3:0]S00_AXI_arqos;
  wire S00_AXI_arready;
  wire [2:0]S00_AXI_arsize;
  wire S00_AXI_arvalid;
  wire [31:0]S00_AXI_rdata;
  wire [5:0]S00_AXI_rid;
  wire S00_AXI_rlast;
  wire S00_AXI_rready;
  wire [1:0]S00_AXI_rresp;
  wire S00_AXI_rvalid;

  s00_couplers_imp_1G0JM81 s00_couplers
       (.M_ACLK(M00_ACLK),
        .M_ARESETN(M00_ARESETN),
        .M_AXI_araddr(M00_AXI_araddr),
        .M_AXI_arburst(M00_AXI_arburst),
        .M_AXI_arcache(M00_AXI_arcache),
        .M_AXI_arid(M00_AXI_arid),
        .M_AXI_arlen(M00_AXI_arlen),
        .M_AXI_arlock(M00_AXI_arlock),
        .M_AXI_arprot(M00_AXI_arprot),
        .M_AXI_arqos(M00_AXI_arqos),
        .M_AXI_arready(M00_AXI_arready),
        .M_AXI_arsize(M00_AXI_arsize),
        .M_AXI_arvalid(M00_AXI_arvalid),
        .M_AXI_rdata(M00_AXI_rdata),
        .M_AXI_rid(M00_AXI_rid),
        .M_AXI_rlast(M00_AXI_rlast),
        .M_AXI_rready(M00_AXI_rready),
        .M_AXI_rresp(M00_AXI_rresp),
        .M_AXI_rvalid(M00_AXI_rvalid),
        .S_ACLK(S00_ACLK),
        .S_ARESETN(S00_ARESETN),
        .S_AXI_araddr(S00_AXI_araddr),
        .S_AXI_arburst(S00_AXI_arburst),
        .S_AXI_arcache(S00_AXI_arcache),
        .S_AXI_arid(S00_AXI_arid),
        .S_AXI_arlen(S00_AXI_arlen),
        .S_AXI_arlock(S00_AXI_arlock),
        .S_AXI_arprot(S00_AXI_arprot),
        .S_AXI_arqos(S00_AXI_arqos),
        .S_AXI_arready(S00_AXI_arready),
        .S_AXI_arsize(S00_AXI_arsize),
        .S_AXI_arvalid(S00_AXI_arvalid),
        .S_AXI_rdata(S00_AXI_rdata),
        .S_AXI_rid(S00_AXI_rid),
        .S_AXI_rlast(S00_AXI_rlast),
        .S_AXI_rready(S00_AXI_rready),
        .S_AXI_rresp(S00_AXI_rresp),
        .S_AXI_rvalid(S00_AXI_rvalid));
endmodule
