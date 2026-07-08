// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
// Date        : Wed Jul  8 16:38:57 2026
// Host        : chathupa-Nitro-AN515-55 running 64-bit Ubuntu 24.04.3 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/chathupa/Desktop/dnn_opt/build/dnn_zynq_hdmi/dnn_zynq_hdmi.gen/sources_1/bd/system/ip/system_hdmi_0/system_hdmi_0_stub.v
// Design      : system_hdmi_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "system_hdmi_0,hdmi_out,{}" *) (* CORE_GENERATION_INFO = "system_hdmi_0,hdmi_out,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=hdmi_out,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,AXI_LITE_ADDR_W=16,AXI_ID_W=6,FB_DEFAULT=0x10100000,H_ACT=640,H_FP=16,H_SYNC=96,H_BP=48,V_ACT=480,V_FP=10,V_SYNC=2,V_BP=33}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) 
(* IP_DEFINITION_SOURCE = "module_ref" *) (* X_CORE_INFO = "hdmi_out,Vivado 2025.2" *) 
module system_hdmi_0(aclk, aresetn, pixel_clk, s_axi_lite_awaddr, 
  s_axi_lite_awprot, s_axi_lite_awvalid, s_axi_lite_awready, s_axi_lite_wdata, 
  s_axi_lite_wstrb, s_axi_lite_wvalid, s_axi_lite_wready, s_axi_lite_bresp, 
  s_axi_lite_bvalid, s_axi_lite_bready, s_axi_lite_araddr, s_axi_lite_arprot, 
  s_axi_lite_arvalid, s_axi_lite_arready, s_axi_lite_rdata, s_axi_lite_rresp, 
  s_axi_lite_rvalid, s_axi_lite_rready, m_axi_hp_arid, m_axi_hp_araddr, m_axi_hp_arlen, 
  m_axi_hp_arsize, m_axi_hp_arburst, m_axi_hp_arlock, m_axi_hp_arcache, m_axi_hp_arprot, 
  m_axi_hp_arqos, m_axi_hp_arvalid, m_axi_hp_arready, m_axi_hp_rid, m_axi_hp_rdata, 
  m_axi_hp_rresp, m_axi_hp_rlast, m_axi_hp_rvalid, m_axi_hp_rready, hdmi_clk, hdmi_d, hdmi_de, 
  hdmi_hsync, hdmi_vsync, hdmi_scl, hdmi_sda, vga_r, vga_g, vga_b, vga_hsync, vga_vsync)
/* synthesis syn_black_box black_box_pad_pin="aresetn,s_axi_lite_awaddr[15:0],s_axi_lite_awprot[2:0],s_axi_lite_awvalid,s_axi_lite_awready,s_axi_lite_wdata[31:0],s_axi_lite_wstrb[3:0],s_axi_lite_wvalid,s_axi_lite_wready,s_axi_lite_bresp[1:0],s_axi_lite_bvalid,s_axi_lite_bready,s_axi_lite_araddr[15:0],s_axi_lite_arprot[2:0],s_axi_lite_arvalid,s_axi_lite_arready,s_axi_lite_rdata[31:0],s_axi_lite_rresp[1:0],s_axi_lite_rvalid,s_axi_lite_rready,m_axi_hp_arid[5:0],m_axi_hp_araddr[31:0],m_axi_hp_arlen[7:0],m_axi_hp_arsize[2:0],m_axi_hp_arburst[1:0],m_axi_hp_arlock[1:0],m_axi_hp_arcache[3:0],m_axi_hp_arprot[2:0],m_axi_hp_arqos[3:0],m_axi_hp_arvalid,m_axi_hp_arready,m_axi_hp_rid[5:0],m_axi_hp_rdata[31:0],m_axi_hp_rresp[1:0],m_axi_hp_rlast,m_axi_hp_rvalid,m_axi_hp_rready,hdmi_clk,hdmi_d[15:0],hdmi_de,hdmi_hsync,hdmi_vsync,hdmi_scl,hdmi_sda,vga_r[3:0],vga_g[3:0],vga_b[3:0],vga_hsync,vga_vsync" */
/* synthesis syn_force_seq_prim="aclk" */
/* synthesis syn_force_seq_prim="pixel_clk" */;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 aclk CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME aclk, ASSOCIATED_BUSIF m_axi_hp:s_axi_lite, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_ps7_0_FCLK_CLK0, INSERT_VIP 0" *) input aclk /* synthesis syn_isclock = 1 */;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 aresetn RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 pixel_clk CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME pixel_clk, FREQ_HZ 25000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_ps7_0_FCLK_CLK1, INSERT_VIP 0" *) input pixel_clk /* synthesis syn_isclock = 1 */;
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
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_hp ARID" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axi_hp, DATA_WIDTH 32, PROTOCOL AXI4, FREQ_HZ 100000000, ID_WIDTH 6, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_ONLY, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 0, HAS_WSTRB 0, HAS_BRESP 0, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 256, PHASE 0.0, CLK_DOMAIN system_ps7_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) output [5:0]m_axi_hp_arid;
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
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 hdmi_clk CLK" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME hdmi_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_hdmi_0_hdmi_clk, INSERT_VIP 0" *) output hdmi_clk;
  output [15:0]hdmi_d;
  output hdmi_de;
  output hdmi_hsync;
  output hdmi_vsync;
  inout hdmi_scl;
  inout hdmi_sda;
  output [3:0]vga_r;
  output [3:0]vga_g;
  output [3:0]vga_b;
  output vga_hsync;
  output vga_vsync;
endmodule
