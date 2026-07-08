// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
// Date        : Wed Jul  8 19:52:53 2026
// Host        : chathupa-Nitro-AN515-55 running 64-bit Ubuntu 24.04.3 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/chathupa/Desktop/dnn_opt/build/dnn_zynq_hdmi/dnn_zynq_hdmi.gen/sources_1/bd/system/ip/system_accel_0/system_accel_0_stub.v
// Design      : system_accel_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "system_accel_0,dnn_accel_ps_top,{}" *) (* CORE_GENERATION_INFO = "system_accel_0,dnn_accel_ps_top,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=dnn_accel_ps_top,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,AXI_LITE_ADDR_W=16,ACCEL_ADDR_W=20,AXI_DATA_W=32,AXI_ID_W=6,DDR_BASE_ADDR=0x10000000}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) 
(* IP_DEFINITION_SOURCE = "module_ref" *) (* X_CORE_INFO = "dnn_accel_ps_top,Vivado 2025.2" *) 
module system_accel_0(aclk, aresetn, s_axi_lite_awaddr, 
  s_axi_lite_awprot, s_axi_lite_awvalid, s_axi_lite_awready, s_axi_lite_wdata, 
  s_axi_lite_wstrb, s_axi_lite_wvalid, s_axi_lite_wready, s_axi_lite_bresp, 
  s_axi_lite_bvalid, s_axi_lite_bready, s_axi_lite_araddr, s_axi_lite_arprot, 
  s_axi_lite_arvalid, s_axi_lite_arready, s_axi_lite_rdata, s_axi_lite_rresp, 
  s_axi_lite_rvalid, s_axi_lite_rready, m_axi_hp_arid, m_axi_hp_araddr, m_axi_hp_arlen, 
  m_axi_hp_arsize, m_axi_hp_arburst, m_axi_hp_arlock, m_axi_hp_arcache, m_axi_hp_arprot, 
  m_axi_hp_arqos, m_axi_hp_arvalid, m_axi_hp_arready, m_axi_hp_rid, m_axi_hp_rdata, 
  m_axi_hp_rresp, m_axi_hp_rlast, m_axi_hp_rvalid, m_axi_hp_rready, m_axi_hp_awid, 
  m_axi_hp_awaddr, m_axi_hp_awlen, m_axi_hp_awsize, m_axi_hp_awburst, m_axi_hp_awlock, 
  m_axi_hp_awcache, m_axi_hp_awprot, m_axi_hp_awqos, m_axi_hp_awvalid, m_axi_hp_awready, 
  m_axi_hp_wid, m_axi_hp_wdata, m_axi_hp_wstrb, m_axi_hp_wlast, m_axi_hp_wvalid, 
  m_axi_hp_wready, m_axi_hp_bid, m_axi_hp_bresp, m_axi_hp_bvalid, m_axi_hp_bready, 
  status_leds, irq_done)
/* synthesis syn_black_box black_box_pad_pin="aresetn,s_axi_lite_awaddr[15:0],s_axi_lite_awprot[2:0],s_axi_lite_awvalid,s_axi_lite_awready,s_axi_lite_wdata[31:0],s_axi_lite_wstrb[3:0],s_axi_lite_wvalid,s_axi_lite_wready,s_axi_lite_bresp[1:0],s_axi_lite_bvalid,s_axi_lite_bready,s_axi_lite_araddr[15:0],s_axi_lite_arprot[2:0],s_axi_lite_arvalid,s_axi_lite_arready,s_axi_lite_rdata[31:0],s_axi_lite_rresp[1:0],s_axi_lite_rvalid,s_axi_lite_rready,m_axi_hp_arid[5:0],m_axi_hp_araddr[31:0],m_axi_hp_arlen[7:0],m_axi_hp_arsize[2:0],m_axi_hp_arburst[1:0],m_axi_hp_arlock[1:0],m_axi_hp_arcache[3:0],m_axi_hp_arprot[2:0],m_axi_hp_arqos[3:0],m_axi_hp_arvalid,m_axi_hp_arready,m_axi_hp_rid[5:0],m_axi_hp_rdata[31:0],m_axi_hp_rresp[1:0],m_axi_hp_rlast,m_axi_hp_rvalid,m_axi_hp_rready,m_axi_hp_awid[5:0],m_axi_hp_awaddr[31:0],m_axi_hp_awlen[7:0],m_axi_hp_awsize[2:0],m_axi_hp_awburst[1:0],m_axi_hp_awlock[1:0],m_axi_hp_awcache[3:0],m_axi_hp_awprot[2:0],m_axi_hp_awqos[3:0],m_axi_hp_awvalid,m_axi_hp_awready,m_axi_hp_wid[5:0],m_axi_hp_wdata[31:0],m_axi_hp_wstrb[3:0],m_axi_hp_wlast,m_axi_hp_wvalid,m_axi_hp_wready,m_axi_hp_bid[5:0],m_axi_hp_bresp[1:0],m_axi_hp_bvalid,m_axi_hp_bready,status_leds[3:0],irq_done" */
/* synthesis syn_force_seq_prim="aclk" */;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 aclk CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME aclk, ASSOCIATED_BUSIF m_axi_hp:s_axi_lite, ASSOCIATED_RESET aresetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_ps7_0_FCLK_CLK0, INSERT_VIP 0" *) input aclk /* synthesis syn_isclock = 1 */;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 aresetn RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite AWADDR" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axi_lite, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 16, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN system_ps7_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) input [15:0]s_axi_lite_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite AWPROT" *) input [2:0]s_axi_lite_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite AWVALID" *) input s_axi_lite_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite AWREADY" *) output s_axi_lite_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite WDATA" *) input [31:0]s_axi_lite_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite WSTRB" *) input [3:0]s_axi_lite_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite WVALID" *) input s_axi_lite_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite WREADY" *) output s_axi_lite_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite BRESP" *) output [1:0]s_axi_lite_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite BVALID" *) output s_axi_lite_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite BREADY" *) input s_axi_lite_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite ARADDR" *) input [15:0]s_axi_lite_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite ARPROT" *) input [2:0]s_axi_lite_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite ARVALID" *) input s_axi_lite_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite ARREADY" *) output s_axi_lite_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite RDATA" *) output [31:0]s_axi_lite_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite RRESP" *) output [1:0]s_axi_lite_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite RVALID" *) output s_axi_lite_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite RREADY" *) input s_axi_lite_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp ARID" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axi_hp, DATA_WIDTH 32, PROTOCOL AXI4, FREQ_HZ 100000000, ID_WIDTH 6, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 256, PHASE 0.0, CLK_DOMAIN system_ps7_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) output [5:0]m_axi_hp_arid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp ARADDR" *) output [31:0]m_axi_hp_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp ARLEN" *) output [7:0]m_axi_hp_arlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp ARSIZE" *) output [2:0]m_axi_hp_arsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp ARBURST" *) output [1:0]m_axi_hp_arburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp ARLOCK" *) output [1:0]m_axi_hp_arlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp ARCACHE" *) output [3:0]m_axi_hp_arcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp ARPROT" *) output [2:0]m_axi_hp_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp ARQOS" *) output [3:0]m_axi_hp_arqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp ARVALID" *) output m_axi_hp_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp ARREADY" *) input m_axi_hp_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp RID" *) input [5:0]m_axi_hp_rid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp RDATA" *) input [31:0]m_axi_hp_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp RRESP" *) input [1:0]m_axi_hp_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp RLAST" *) input m_axi_hp_rlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp RVALID" *) input m_axi_hp_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp RREADY" *) output m_axi_hp_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp AWID" *) output [5:0]m_axi_hp_awid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp AWADDR" *) output [31:0]m_axi_hp_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp AWLEN" *) output [7:0]m_axi_hp_awlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp AWSIZE" *) output [2:0]m_axi_hp_awsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp AWBURST" *) output [1:0]m_axi_hp_awburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp AWLOCK" *) output [1:0]m_axi_hp_awlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp AWCACHE" *) output [3:0]m_axi_hp_awcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp AWPROT" *) output [2:0]m_axi_hp_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp AWQOS" *) output [3:0]m_axi_hp_awqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp AWVALID" *) output m_axi_hp_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp AWREADY" *) input m_axi_hp_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp WID" *) output [5:0]m_axi_hp_wid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp WDATA" *) output [31:0]m_axi_hp_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp WSTRB" *) output [3:0]m_axi_hp_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp WLAST" *) output m_axi_hp_wlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp WVALID" *) output m_axi_hp_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp WREADY" *) input m_axi_hp_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp BID" *) input [5:0]m_axi_hp_bid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp BRESP" *) input [1:0]m_axi_hp_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp BVALID" *) input m_axi_hp_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp BREADY" *) output m_axi_hp_bready;
  output [3:0]status_leds;
  output irq_done;
endmodule
