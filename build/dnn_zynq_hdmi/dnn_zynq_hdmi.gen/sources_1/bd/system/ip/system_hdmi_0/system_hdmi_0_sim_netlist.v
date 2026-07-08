// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
// Date        : Wed Jul  8 16:38:57 2026
// Host        : chathupa-Nitro-AN515-55 running 64-bit Ubuntu 24.04.3 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/chathupa/Desktop/dnn_opt/build/dnn_zynq_hdmi/dnn_zynq_hdmi.gen/sources_1/bd/system/ip/system_hdmi_0/system_hdmi_0_sim_netlist.v
// Design      : system_hdmi_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "system_hdmi_0,hdmi_out,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "hdmi_out,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module system_hdmi_0
   (aclk,
    aresetn,
    pixel_clk,
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
    hdmi_clk,
    hdmi_d,
    hdmi_de,
    hdmi_hsync,
    hdmi_vsync,
    hdmi_scl,
    hdmi_sda,
    vga_r,
    vga_g,
    vga_b,
    vga_hsync,
    vga_vsync);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 aclk CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME aclk, ASSOCIATED_BUSIF m_axi_hp:s_axi_lite, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_ps7_0_FCLK_CLK0, INSERT_VIP 0" *) input aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 aresetn RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 pixel_clk CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME pixel_clk, FREQ_HZ 25000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_ps7_0_FCLK_CLK1, INSERT_VIP 0" *) input pixel_clk;
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

  wire \<const0> ;
  wire \<const1> ;
  wire aclk;
  wire aresetn;
  wire hdmi_clk;
  wire [15:0]hdmi_d;
  wire hdmi_de;
  (* DRIVE = "12" *) (* IBUF_LOW_PWR *) (* SLEW = "SLOW" *) wire hdmi_scl;
  (* DRIVE = "12" *) (* IBUF_LOW_PWR *) (* SLEW = "SLOW" *) wire hdmi_sda;
  wire [31:0]m_axi_hp_araddr;
  wire m_axi_hp_arready;
  wire m_axi_hp_arvalid;
  wire [31:0]m_axi_hp_rdata;
  wire m_axi_hp_rlast;
  wire m_axi_hp_rvalid;
  wire pixel_clk;
  wire [15:0]s_axi_lite_araddr;
  wire s_axi_lite_arready;
  wire s_axi_lite_arvalid;
  wire [15:0]s_axi_lite_awaddr;
  wire s_axi_lite_awready;
  wire s_axi_lite_awvalid;
  wire s_axi_lite_bready;
  wire s_axi_lite_bvalid;
  wire [31:0]s_axi_lite_rdata;
  wire s_axi_lite_rready;
  wire s_axi_lite_rvalid;
  wire [31:0]s_axi_lite_wdata;
  wire s_axi_lite_wready;
  wire s_axi_lite_wvalid;
  wire [3:0]vga_b;
  wire vga_hsync;
  wire vga_vsync;

  assign hdmi_hsync = vga_hsync;
  assign hdmi_vsync = vga_vsync;
  assign m_axi_hp_arburst[1] = \<const0> ;
  assign m_axi_hp_arburst[0] = \<const1> ;
  assign m_axi_hp_arcache[3] = \<const0> ;
  assign m_axi_hp_arcache[2] = \<const0> ;
  assign m_axi_hp_arcache[1] = \<const1> ;
  assign m_axi_hp_arcache[0] = \<const1> ;
  assign m_axi_hp_arid[5] = \<const0> ;
  assign m_axi_hp_arid[4] = \<const0> ;
  assign m_axi_hp_arid[3] = \<const0> ;
  assign m_axi_hp_arid[2] = \<const0> ;
  assign m_axi_hp_arid[1] = \<const0> ;
  assign m_axi_hp_arid[0] = \<const0> ;
  assign m_axi_hp_arlen[7] = \<const0> ;
  assign m_axi_hp_arlen[6] = \<const0> ;
  assign m_axi_hp_arlen[5] = \<const0> ;
  assign m_axi_hp_arlen[4] = \<const0> ;
  assign m_axi_hp_arlen[3] = \<const1> ;
  assign m_axi_hp_arlen[2] = \<const1> ;
  assign m_axi_hp_arlen[1] = \<const1> ;
  assign m_axi_hp_arlen[0] = \<const1> ;
  assign m_axi_hp_arlock[1] = \<const0> ;
  assign m_axi_hp_arlock[0] = \<const0> ;
  assign m_axi_hp_arprot[2] = \<const0> ;
  assign m_axi_hp_arprot[1] = \<const0> ;
  assign m_axi_hp_arprot[0] = \<const0> ;
  assign m_axi_hp_arqos[3] = \<const0> ;
  assign m_axi_hp_arqos[2] = \<const0> ;
  assign m_axi_hp_arqos[1] = \<const0> ;
  assign m_axi_hp_arqos[0] = \<const0> ;
  assign m_axi_hp_arsize[2] = \<const0> ;
  assign m_axi_hp_arsize[1] = \<const1> ;
  assign m_axi_hp_arsize[0] = \<const0> ;
  assign m_axi_hp_rready = \<const1> ;
  assign s_axi_lite_bresp[1] = \<const0> ;
  assign s_axi_lite_bresp[0] = \<const0> ;
  assign s_axi_lite_rresp[1] = \<const0> ;
  assign s_axi_lite_rresp[0] = \<const0> ;
  assign vga_g[3:0] = vga_b;
  assign vga_r[3:0] = vga_b;
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  system_hdmi_0_hdmi_out inst
       (.aclk(aclk),
        .aresetn(aresetn),
        .arready_q_reg_0(s_axi_lite_arready),
        .awready_q_reg_0(s_axi_lite_awready),
        .bvalid_q_reg_0(s_axi_lite_bvalid),
        .hdmi_clk(hdmi_clk),
        .hdmi_d(hdmi_d),
        .hdmi_de(hdmi_de),
        .hdmi_scl(hdmi_scl),
        .hdmi_sda(hdmi_sda),
        .m_axi_hp_araddr(m_axi_hp_araddr),
        .m_axi_hp_arready(m_axi_hp_arready),
        .m_axi_hp_arvalid(m_axi_hp_arvalid),
        .m_axi_hp_rdata(m_axi_hp_rdata),
        .m_axi_hp_rlast(m_axi_hp_rlast),
        .m_axi_hp_rvalid(m_axi_hp_rvalid),
        .pixel_clk(pixel_clk),
        .rvalid_q_reg_0(s_axi_lite_rvalid),
        .s_axi_lite_araddr(s_axi_lite_araddr[7:0]),
        .s_axi_lite_arvalid(s_axi_lite_arvalid),
        .s_axi_lite_awaddr(s_axi_lite_awaddr[7:0]),
        .s_axi_lite_awvalid(s_axi_lite_awvalid),
        .s_axi_lite_bready(s_axi_lite_bready),
        .s_axi_lite_rdata(s_axi_lite_rdata),
        .s_axi_lite_rready(s_axi_lite_rready),
        .s_axi_lite_wdata(s_axi_lite_wdata),
        .s_axi_lite_wvalid(s_axi_lite_wvalid),
        .vga_b(vga_b),
        .vga_hsync(vga_hsync),
        .vga_vsync(vga_vsync),
        .wready_q_reg_0(s_axi_lite_wready));
endmodule

(* ORIG_REF_NAME = "hdmi_out" *) 
module system_hdmi_0_hdmi_out
   (wready_q_reg_0,
    awready_q_reg_0,
    arready_q_reg_0,
    hdmi_clk,
    m_axi_hp_araddr,
    bvalid_q_reg_0,
    s_axi_lite_rdata,
    hdmi_d,
    hdmi_de,
    vga_hsync,
    vga_vsync,
    vga_b,
    rvalid_q_reg_0,
    m_axi_hp_arvalid,
    hdmi_scl,
    hdmi_sda,
    s_axi_lite_wvalid,
    s_axi_lite_awvalid,
    s_axi_lite_arvalid,
    pixel_clk,
    m_axi_hp_rlast,
    m_axi_hp_rvalid,
    aclk,
    m_axi_hp_rdata,
    s_axi_lite_awaddr,
    s_axi_lite_wdata,
    s_axi_lite_araddr,
    aresetn,
    m_axi_hp_arready,
    s_axi_lite_bready,
    s_axi_lite_rready);
  output wready_q_reg_0;
  output awready_q_reg_0;
  output arready_q_reg_0;
  output hdmi_clk;
  output [31:0]m_axi_hp_araddr;
  output bvalid_q_reg_0;
  output [31:0]s_axi_lite_rdata;
  output [15:0]hdmi_d;
  output hdmi_de;
  output vga_hsync;
  output vga_vsync;
  output [3:0]vga_b;
  output rvalid_q_reg_0;
  output m_axi_hp_arvalid;
  inout hdmi_scl;
  inout hdmi_sda;
  input s_axi_lite_wvalid;
  input s_axi_lite_awvalid;
  input s_axi_lite_arvalid;
  input pixel_clk;
  input m_axi_hp_rlast;
  input m_axi_hp_rvalid;
  input aclk;
  input [31:0]m_axi_hp_rdata;
  input [7:0]s_axi_lite_awaddr;
  input [31:0]s_axi_lite_wdata;
  input [7:0]s_axi_lite_araddr;
  input aresetn;
  input m_axi_hp_arready;
  input s_axi_lite_bready;
  input s_axi_lite_rready;

  wire \FSM_sequential_fstate[0]_i_1_n_0 ;
  wire \FSM_sequential_fstate[0]_i_2_n_0 ;
  wire \FSM_sequential_fstate[1]_i_1_n_0 ;
  wire T0;
  wire aclk;
  wire ar_done_i_1_n_0;
  wire ar_done_reg_n_0;
  wire [7:0]araddr_q;
  wire \araddr_q[7]_i_1_n_0 ;
  wire aresetn;
  wire arready_q_i_1_n_0;
  wire arready_q_reg_0;
  wire arvalid_q2_i_1_n_0;
  wire arvalid_q2_i_2_n_0;
  wire arvalid_q2_i_4_n_0;
  wire arvalid_q2_i_5_n_0;
  wire aw_done_i_1_n_0;
  wire aw_done_reg_n_0;
  wire \awaddr_q[7]_i_1_n_0 ;
  wire \awaddr_q_reg_n_0_[0] ;
  wire \awaddr_q_reg_n_0_[1] ;
  wire \awaddr_q_reg_n_0_[2] ;
  wire \awaddr_q_reg_n_0_[3] ;
  wire \awaddr_q_reg_n_0_[5] ;
  wire \awaddr_q_reg_n_0_[6] ;
  wire \awaddr_q_reg_n_0_[7] ;
  wire awready_q_i_1_n_0;
  wire awready_q_reg_0;
  wire bvalid_q_i_1_n_0;
  wire bvalid_q_reg_0;
  wire ccs_p1;
  wire ccs_p2;
  wire ctrl_cbcr_swap;
  wire ctrl_enable;
  wire ctrl_enable1;
  wire ctrl_enable_i_3_n_0;
  wire ctrl_mono;
  wire ctrl_yc_swap;
  wire [23:0]data2;
  wire en_p1;
  wire en_p2;
  wire [31:0]f_addr;
  wire f_addr0_carry__0_n_0;
  wire f_addr0_carry__0_n_1;
  wire f_addr0_carry__0_n_2;
  wire f_addr0_carry__0_n_3;
  wire f_addr0_carry__1_n_0;
  wire f_addr0_carry__1_n_1;
  wire f_addr0_carry__1_n_2;
  wire f_addr0_carry__1_n_3;
  wire f_addr0_carry__2_n_0;
  wire f_addr0_carry__2_n_1;
  wire f_addr0_carry__2_n_2;
  wire f_addr0_carry__2_n_3;
  wire f_addr0_carry__3_n_0;
  wire f_addr0_carry__3_n_1;
  wire f_addr0_carry__3_n_2;
  wire f_addr0_carry__3_n_3;
  wire f_addr0_carry__4_n_0;
  wire f_addr0_carry__4_n_1;
  wire f_addr0_carry__4_n_2;
  wire f_addr0_carry__4_n_3;
  wire f_addr0_carry__5_n_2;
  wire f_addr0_carry__5_n_3;
  wire f_addr0_carry_i_1_n_0;
  wire f_addr0_carry_n_0;
  wire f_addr0_carry_n_1;
  wire f_addr0_carry_n_2;
  wire f_addr0_carry_n_3;
  wire f_addr0_i_2_n_0;
  wire f_addr0_i_3_n_0;
  wire f_addr0_i_4_n_0;
  wire f_addr0_i_5_n_0;
  wire f_addr0_i_6_n_0;
  wire f_addr0_i_7_n_0;
  wire f_addr0_n_100;
  wire f_addr0_n_101;
  wire f_addr0_n_102;
  wire f_addr0_n_103;
  wire f_addr0_n_104;
  wire f_addr0_n_105;
  wire f_addr0_n_74;
  wire f_addr0_n_75;
  wire f_addr0_n_76;
  wire f_addr0_n_77;
  wire f_addr0_n_78;
  wire f_addr0_n_79;
  wire f_addr0_n_80;
  wire f_addr0_n_81;
  wire f_addr0_n_82;
  wire f_addr0_n_83;
  wire f_addr0_n_84;
  wire f_addr0_n_85;
  wire f_addr0_n_86;
  wire f_addr0_n_87;
  wire f_addr0_n_88;
  wire f_addr0_n_89;
  wire f_addr0_n_90;
  wire f_addr0_n_91;
  wire f_addr0_n_92;
  wire f_addr0_n_93;
  wire f_addr0_n_94;
  wire f_addr0_n_95;
  wire f_addr0_n_96;
  wire f_addr0_n_97;
  wire f_addr0_n_98;
  wire f_addr0_n_99;
  wire \f_addr[31]_i_3_n_0 ;
  wire \f_addr[31]_i_4_n_0 ;
  wire \f_addr[31]_i_5_n_0 ;
  wire [0:0]f_burst;
  wire \f_burst[0]_i_1_n_0 ;
  wire \f_burst[1]_i_1_n_0 ;
  wire \f_burst[2]_i_1_n_0 ;
  wire \f_burst[3]_i_1_n_0 ;
  wire \f_burst[4]_i_1_n_0 ;
  wire \f_burst_reg_n_0_[0] ;
  wire \f_burst_reg_n_0_[1] ;
  wire \f_burst_reg_n_0_[2] ;
  wire \f_burst_reg_n_0_[3] ;
  wire \f_burst_reg_n_0_[4] ;
  wire [0:0]f_line;
  wire \f_line[0]_i_1_n_0 ;
  wire \f_line_reg_n_0_[0] ;
  wire [8:0]f_word;
  wire \f_word[8]_i_3_n_0 ;
  wire [0:0]f_word_3;
  wire \f_word_reg_n_0_[0] ;
  wire \f_word_reg_n_0_[1] ;
  wire \f_word_reg_n_0_[2] ;
  wire \f_word_reg_n_0_[3] ;
  wire \f_word_reg_n_0_[4] ;
  wire \f_word_reg_n_0_[5] ;
  wire \f_word_reg_n_0_[6] ;
  wire \f_word_reg_n_0_[7] ;
  wire \f_word_reg_n_0_[8] ;
  wire [31:0]fb_base;
  wire [0:0]fb_base_0;
  wire fetch_overrun_set;
  wire fetch_overrun_set_4;
  wire \frame_cnt_pix[0]_i_1_n_0 ;
  wire \frame_cnt_pix[1]_i_1_n_0 ;
  wire \frame_cnt_pix[2]_i_1_n_0 ;
  wire \frame_cnt_pix[3]_i_1_n_0 ;
  wire \frame_cnt_pix[4]_i_1_n_0 ;
  wire \frame_cnt_pix[5]_i_1_n_0 ;
  wire \frame_cnt_pix[5]_i_2_n_0 ;
  wire \frame_cnt_pix[6]_i_1_n_0 ;
  wire \frame_cnt_pix[7]_i_1_n_0 ;
  wire \frame_cnt_pix[7]_i_2_n_0 ;
  wire \frame_cnt_pix[7]_i_3_n_0 ;
  wire \frame_cnt_pix[7]_i_4_n_0 ;
  wire \frame_cnt_pix[7]_i_5_n_0 ;
  wire \frame_cnt_pix[7]_i_6_n_0 ;
  wire [7:0]frame_cnt_pix_reg;
  wire [7:0]frame_cnt_s1;
  wire [1:0]fstate;
  wire \hcnt[0]_i_1_n_0 ;
  wire \hcnt[1]_i_1_n_0 ;
  wire \hcnt[2]_i_1_n_0 ;
  wire \hcnt[3]_i_1_n_0 ;
  wire \hcnt[4]_i_1_n_0 ;
  wire \hcnt[5]_i_1_n_0 ;
  wire \hcnt[6]_i_1_n_0 ;
  wire \hcnt[7]_i_1_n_0 ;
  wire \hcnt[7]_i_2_n_0 ;
  wire \hcnt[8]_i_1_n_0 ;
  wire \hcnt[9]_i_1_n_0 ;
  wire \hcnt[9]_i_2_n_0 ;
  wire \hcnt[9]_i_3_n_0 ;
  wire \hcnt_reg_n_0_[0] ;
  wire hdmi_clk;
  wire [15:0]hdmi_d;
  wire \hdmi_d_q[0]_i_1_n_0 ;
  wire \hdmi_d_q[10]_i_1_n_0 ;
  wire \hdmi_d_q[10]_i_2_n_0 ;
  wire \hdmi_d_q[10]_i_3_n_0 ;
  wire \hdmi_d_q[10]_i_4_n_0 ;
  wire \hdmi_d_q[11]_i_1_n_0 ;
  wire \hdmi_d_q[11]_i_2_n_0 ;
  wire \hdmi_d_q[11]_i_3_n_0 ;
  wire \hdmi_d_q[11]_i_4_n_0 ;
  wire \hdmi_d_q[12]_i_1_n_0 ;
  wire \hdmi_d_q[12]_i_2_n_0 ;
  wire \hdmi_d_q[12]_i_3_n_0 ;
  wire \hdmi_d_q[13]_i_1_n_0 ;
  wire \hdmi_d_q[13]_i_2_n_0 ;
  wire \hdmi_d_q[13]_i_3_n_0 ;
  wire \hdmi_d_q[13]_i_4_n_0 ;
  wire \hdmi_d_q[14]_i_1_n_0 ;
  wire \hdmi_d_q[14]_i_2_n_0 ;
  wire \hdmi_d_q[14]_i_3_n_0 ;
  wire \hdmi_d_q[14]_i_4_n_0 ;
  wire \hdmi_d_q[15]_i_1_n_0 ;
  wire \hdmi_d_q[15]_i_2_n_0 ;
  wire \hdmi_d_q[15]_i_3_n_0 ;
  wire \hdmi_d_q[15]_i_4_n_0 ;
  wire \hdmi_d_q[15]_i_5_n_0 ;
  wire \hdmi_d_q[15]_i_6_n_0 ;
  wire \hdmi_d_q[1]_i_1_n_0 ;
  wire \hdmi_d_q[2]_i_1_n_0 ;
  wire \hdmi_d_q[3]_i_1_n_0 ;
  wire \hdmi_d_q[4]_i_1_n_0 ;
  wire \hdmi_d_q[5]_i_1_n_0 ;
  wire \hdmi_d_q[6]_i_1_n_0 ;
  wire \hdmi_d_q[7]_i_1_n_0 ;
  wire \hdmi_d_q[8]_i_1_n_0 ;
  wire \hdmi_d_q[8]_i_2_n_0 ;
  wire \hdmi_d_q[8]_i_3_n_0 ;
  wire \hdmi_d_q[8]_i_4_n_0 ;
  wire \hdmi_d_q[8]_i_5_n_0 ;
  wire \hdmi_d_q[9]_i_1_n_0 ;
  wire \hdmi_d_q[9]_i_2_n_0 ;
  wire \hdmi_d_q[9]_i_3_n_0 ;
  wire \hdmi_d_q[9]_i_4_n_0 ;
  wire hdmi_de;
  wire hdmi_de_i_1_n_0;
  wire hdmi_hsync_i_1_n_0;
  wire hdmi_scl;
  wire hdmi_sda;
  wire hdmi_vsync_i_1_n_0;
  wire i2c_scl_low;
  wire i2c_scl_low_i_1_n_0;
  wire i2c_sda_low;
  wire i2c_sda_low_1;
  wire i2c_sda_low_i_1_n_0;
  wire [31:5]in10;
  wire [31:0]lb_rdata0;
  wire \lb_rdata[0]_i_1_n_0 ;
  wire \lb_rdata[0]_i_5_n_0 ;
  wire \lb_rdata[0]_i_6_n_0 ;
  wire \lb_rdata[0]_i_7_n_0 ;
  wire \lb_rdata[0]_i_8_n_0 ;
  wire \lb_rdata[10]_i_1_n_0 ;
  wire \lb_rdata[10]_i_5_n_0 ;
  wire \lb_rdata[10]_i_6_n_0 ;
  wire \lb_rdata[10]_i_7_n_0 ;
  wire \lb_rdata[10]_i_8_n_0 ;
  wire \lb_rdata[11]_i_1_n_0 ;
  wire \lb_rdata[11]_i_5_n_0 ;
  wire \lb_rdata[11]_i_6_n_0 ;
  wire \lb_rdata[11]_i_7_n_0 ;
  wire \lb_rdata[11]_i_8_n_0 ;
  wire \lb_rdata[12]_i_1_n_0 ;
  wire \lb_rdata[12]_i_5_n_0 ;
  wire \lb_rdata[12]_i_6_n_0 ;
  wire \lb_rdata[12]_i_7_n_0 ;
  wire \lb_rdata[12]_i_8_n_0 ;
  wire \lb_rdata[13]_i_1_n_0 ;
  wire \lb_rdata[13]_i_5_n_0 ;
  wire \lb_rdata[13]_i_6_n_0 ;
  wire \lb_rdata[13]_i_7_n_0 ;
  wire \lb_rdata[13]_i_8_n_0 ;
  wire \lb_rdata[14]_i_1_n_0 ;
  wire \lb_rdata[14]_i_5_n_0 ;
  wire \lb_rdata[14]_i_6_n_0 ;
  wire \lb_rdata[14]_i_7_n_0 ;
  wire \lb_rdata[14]_i_8_n_0 ;
  wire \lb_rdata[15]_i_1_n_0 ;
  wire \lb_rdata[15]_i_5_n_0 ;
  wire \lb_rdata[15]_i_6_n_0 ;
  wire \lb_rdata[15]_i_7_n_0 ;
  wire \lb_rdata[15]_i_8_n_0 ;
  wire \lb_rdata[16]_i_1_n_0 ;
  wire \lb_rdata[16]_i_5_n_0 ;
  wire \lb_rdata[16]_i_6_n_0 ;
  wire \lb_rdata[16]_i_7_n_0 ;
  wire \lb_rdata[16]_i_8_n_0 ;
  wire \lb_rdata[17]_i_1_n_0 ;
  wire \lb_rdata[17]_i_5_n_0 ;
  wire \lb_rdata[17]_i_6_n_0 ;
  wire \lb_rdata[17]_i_7_n_0 ;
  wire \lb_rdata[17]_i_8_n_0 ;
  wire \lb_rdata[18]_i_1_n_0 ;
  wire \lb_rdata[18]_i_5_n_0 ;
  wire \lb_rdata[18]_i_6_n_0 ;
  wire \lb_rdata[18]_i_7_n_0 ;
  wire \lb_rdata[18]_i_8_n_0 ;
  wire \lb_rdata[19]_i_1_n_0 ;
  wire \lb_rdata[19]_i_5_n_0 ;
  wire \lb_rdata[19]_i_6_n_0 ;
  wire \lb_rdata[19]_i_7_n_0 ;
  wire \lb_rdata[19]_i_8_n_0 ;
  wire \lb_rdata[1]_i_1_n_0 ;
  wire \lb_rdata[1]_i_5_n_0 ;
  wire \lb_rdata[1]_i_6_n_0 ;
  wire \lb_rdata[1]_i_7_n_0 ;
  wire \lb_rdata[1]_i_8_n_0 ;
  wire \lb_rdata[20]_i_1_n_0 ;
  wire \lb_rdata[20]_i_5_n_0 ;
  wire \lb_rdata[20]_i_6_n_0 ;
  wire \lb_rdata[20]_i_7_n_0 ;
  wire \lb_rdata[20]_i_8_n_0 ;
  wire \lb_rdata[21]_i_1_n_0 ;
  wire \lb_rdata[21]_i_5_n_0 ;
  wire \lb_rdata[21]_i_6_n_0 ;
  wire \lb_rdata[21]_i_7_n_0 ;
  wire \lb_rdata[21]_i_8_n_0 ;
  wire \lb_rdata[22]_i_1_n_0 ;
  wire \lb_rdata[22]_i_5_n_0 ;
  wire \lb_rdata[22]_i_6_n_0 ;
  wire \lb_rdata[22]_i_7_n_0 ;
  wire \lb_rdata[22]_i_8_n_0 ;
  wire \lb_rdata[23]_i_1_n_0 ;
  wire \lb_rdata[23]_i_5_n_0 ;
  wire \lb_rdata[23]_i_6_n_0 ;
  wire \lb_rdata[23]_i_7_n_0 ;
  wire \lb_rdata[23]_i_8_n_0 ;
  wire \lb_rdata[24]_i_1_n_0 ;
  wire \lb_rdata[24]_i_5_n_0 ;
  wire \lb_rdata[24]_i_6_n_0 ;
  wire \lb_rdata[24]_i_7_n_0 ;
  wire \lb_rdata[24]_i_8_n_0 ;
  wire \lb_rdata[25]_i_1_n_0 ;
  wire \lb_rdata[25]_i_5_n_0 ;
  wire \lb_rdata[25]_i_6_n_0 ;
  wire \lb_rdata[25]_i_7_n_0 ;
  wire \lb_rdata[25]_i_8_n_0 ;
  wire \lb_rdata[26]_i_1_n_0 ;
  wire \lb_rdata[26]_i_5_n_0 ;
  wire \lb_rdata[26]_i_6_n_0 ;
  wire \lb_rdata[26]_i_7_n_0 ;
  wire \lb_rdata[26]_i_8_n_0 ;
  wire \lb_rdata[27]_i_1_n_0 ;
  wire \lb_rdata[27]_i_5_n_0 ;
  wire \lb_rdata[27]_i_6_n_0 ;
  wire \lb_rdata[27]_i_7_n_0 ;
  wire \lb_rdata[27]_i_8_n_0 ;
  wire \lb_rdata[28]_i_1_n_0 ;
  wire \lb_rdata[28]_i_5_n_0 ;
  wire \lb_rdata[28]_i_6_n_0 ;
  wire \lb_rdata[28]_i_7_n_0 ;
  wire \lb_rdata[28]_i_8_n_0 ;
  wire \lb_rdata[29]_i_1_n_0 ;
  wire \lb_rdata[29]_i_5_n_0 ;
  wire \lb_rdata[29]_i_6_n_0 ;
  wire \lb_rdata[29]_i_7_n_0 ;
  wire \lb_rdata[29]_i_8_n_0 ;
  wire \lb_rdata[2]_i_1_n_0 ;
  wire \lb_rdata[2]_i_5_n_0 ;
  wire \lb_rdata[2]_i_6_n_0 ;
  wire \lb_rdata[2]_i_7_n_0 ;
  wire \lb_rdata[2]_i_8_n_0 ;
  wire \lb_rdata[30]_i_1_n_0 ;
  wire \lb_rdata[30]_i_5_n_0 ;
  wire \lb_rdata[30]_i_6_n_0 ;
  wire \lb_rdata[30]_i_7_n_0 ;
  wire \lb_rdata[30]_i_8_n_0 ;
  wire \lb_rdata[31]_i_10_n_0 ;
  wire \lb_rdata[31]_i_11_n_0 ;
  wire \lb_rdata[31]_i_1_n_0 ;
  wire \lb_rdata[31]_i_2_n_0 ;
  wire \lb_rdata[31]_i_4_n_0 ;
  wire \lb_rdata[31]_i_8_n_0 ;
  wire \lb_rdata[31]_i_9_n_0 ;
  wire \lb_rdata[3]_i_1_n_0 ;
  wire \lb_rdata[3]_i_5_n_0 ;
  wire \lb_rdata[3]_i_6_n_0 ;
  wire \lb_rdata[3]_i_7_n_0 ;
  wire \lb_rdata[3]_i_8_n_0 ;
  wire \lb_rdata[4]_i_1_n_0 ;
  wire \lb_rdata[4]_i_5_n_0 ;
  wire \lb_rdata[4]_i_6_n_0 ;
  wire \lb_rdata[4]_i_7_n_0 ;
  wire \lb_rdata[4]_i_8_n_0 ;
  wire \lb_rdata[5]_i_1_n_0 ;
  wire \lb_rdata[5]_i_5_n_0 ;
  wire \lb_rdata[5]_i_6_n_0 ;
  wire \lb_rdata[5]_i_7_n_0 ;
  wire \lb_rdata[5]_i_8_n_0 ;
  wire \lb_rdata[6]_i_1_n_0 ;
  wire \lb_rdata[6]_i_5_n_0 ;
  wire \lb_rdata[6]_i_6_n_0 ;
  wire \lb_rdata[6]_i_7_n_0 ;
  wire \lb_rdata[6]_i_8_n_0 ;
  wire \lb_rdata[7]_i_1_n_0 ;
  wire \lb_rdata[7]_i_5_n_0 ;
  wire \lb_rdata[7]_i_6_n_0 ;
  wire \lb_rdata[7]_i_7_n_0 ;
  wire \lb_rdata[7]_i_8_n_0 ;
  wire \lb_rdata[8]_i_1_n_0 ;
  wire \lb_rdata[8]_i_5_n_0 ;
  wire \lb_rdata[8]_i_6_n_0 ;
  wire \lb_rdata[8]_i_7_n_0 ;
  wire \lb_rdata[8]_i_8_n_0 ;
  wire \lb_rdata[9]_i_1_n_0 ;
  wire \lb_rdata[9]_i_5_n_0 ;
  wire \lb_rdata[9]_i_6_n_0 ;
  wire \lb_rdata[9]_i_7_n_0 ;
  wire \lb_rdata[9]_i_8_n_0 ;
  wire \lb_rdata_reg[0]_i_3_n_0 ;
  wire \lb_rdata_reg[0]_i_4_n_0 ;
  wire \lb_rdata_reg[10]_i_3_n_0 ;
  wire \lb_rdata_reg[10]_i_4_n_0 ;
  wire \lb_rdata_reg[11]_i_3_n_0 ;
  wire \lb_rdata_reg[11]_i_4_n_0 ;
  wire \lb_rdata_reg[12]_i_3_n_0 ;
  wire \lb_rdata_reg[12]_i_4_n_0 ;
  wire \lb_rdata_reg[13]_i_3_n_0 ;
  wire \lb_rdata_reg[13]_i_4_n_0 ;
  wire \lb_rdata_reg[14]_i_3_n_0 ;
  wire \lb_rdata_reg[14]_i_4_n_0 ;
  wire \lb_rdata_reg[15]_i_3_n_0 ;
  wire \lb_rdata_reg[15]_i_4_n_0 ;
  wire \lb_rdata_reg[16]_i_3_n_0 ;
  wire \lb_rdata_reg[16]_i_4_n_0 ;
  wire \lb_rdata_reg[17]_i_3_n_0 ;
  wire \lb_rdata_reg[17]_i_4_n_0 ;
  wire \lb_rdata_reg[18]_i_3_n_0 ;
  wire \lb_rdata_reg[18]_i_4_n_0 ;
  wire \lb_rdata_reg[19]_i_3_n_0 ;
  wire \lb_rdata_reg[19]_i_4_n_0 ;
  wire \lb_rdata_reg[1]_i_3_n_0 ;
  wire \lb_rdata_reg[1]_i_4_n_0 ;
  wire \lb_rdata_reg[20]_i_3_n_0 ;
  wire \lb_rdata_reg[20]_i_4_n_0 ;
  wire \lb_rdata_reg[21]_i_3_n_0 ;
  wire \lb_rdata_reg[21]_i_4_n_0 ;
  wire \lb_rdata_reg[22]_i_3_n_0 ;
  wire \lb_rdata_reg[22]_i_4_n_0 ;
  wire \lb_rdata_reg[23]_i_3_n_0 ;
  wire \lb_rdata_reg[23]_i_4_n_0 ;
  wire \lb_rdata_reg[24]_i_3_n_0 ;
  wire \lb_rdata_reg[24]_i_4_n_0 ;
  wire \lb_rdata_reg[25]_i_3_n_0 ;
  wire \lb_rdata_reg[25]_i_4_n_0 ;
  wire \lb_rdata_reg[26]_i_3_n_0 ;
  wire \lb_rdata_reg[26]_i_4_n_0 ;
  wire \lb_rdata_reg[27]_i_3_n_0 ;
  wire \lb_rdata_reg[27]_i_4_n_0 ;
  wire \lb_rdata_reg[28]_i_3_n_0 ;
  wire \lb_rdata_reg[28]_i_4_n_0 ;
  wire \lb_rdata_reg[29]_i_3_n_0 ;
  wire \lb_rdata_reg[29]_i_4_n_0 ;
  wire \lb_rdata_reg[2]_i_3_n_0 ;
  wire \lb_rdata_reg[2]_i_4_n_0 ;
  wire \lb_rdata_reg[30]_i_3_n_0 ;
  wire \lb_rdata_reg[30]_i_4_n_0 ;
  wire \lb_rdata_reg[31]_i_5_n_0 ;
  wire \lb_rdata_reg[31]_i_6_n_0 ;
  wire \lb_rdata_reg[3]_i_3_n_0 ;
  wire \lb_rdata_reg[3]_i_4_n_0 ;
  wire \lb_rdata_reg[4]_i_3_n_0 ;
  wire \lb_rdata_reg[4]_i_4_n_0 ;
  wire \lb_rdata_reg[5]_i_3_n_0 ;
  wire \lb_rdata_reg[5]_i_4_n_0 ;
  wire \lb_rdata_reg[6]_i_3_n_0 ;
  wire \lb_rdata_reg[6]_i_4_n_0 ;
  wire \lb_rdata_reg[7]_i_3_n_0 ;
  wire \lb_rdata_reg[7]_i_4_n_0 ;
  wire \lb_rdata_reg[8]_i_3_n_0 ;
  wire \lb_rdata_reg[8]_i_4_n_0 ;
  wire \lb_rdata_reg[9]_i_3_n_0 ;
  wire \lb_rdata_reg[9]_i_4_n_0 ;
  wire \lb_rdata_reg_n_0_[0] ;
  wire \lb_rdata_reg_n_0_[10] ;
  wire \lb_rdata_reg_n_0_[11] ;
  wire \lb_rdata_reg_n_0_[12] ;
  wire \lb_rdata_reg_n_0_[13] ;
  wire \lb_rdata_reg_n_0_[14] ;
  wire \lb_rdata_reg_n_0_[15] ;
  wire \lb_rdata_reg_n_0_[16] ;
  wire \lb_rdata_reg_n_0_[17] ;
  wire \lb_rdata_reg_n_0_[18] ;
  wire \lb_rdata_reg_n_0_[19] ;
  wire \lb_rdata_reg_n_0_[1] ;
  wire \lb_rdata_reg_n_0_[20] ;
  wire \lb_rdata_reg_n_0_[21] ;
  wire \lb_rdata_reg_n_0_[22] ;
  wire \lb_rdata_reg_n_0_[23] ;
  wire \lb_rdata_reg_n_0_[24] ;
  wire \lb_rdata_reg_n_0_[25] ;
  wire \lb_rdata_reg_n_0_[26] ;
  wire \lb_rdata_reg_n_0_[27] ;
  wire \lb_rdata_reg_n_0_[28] ;
  wire \lb_rdata_reg_n_0_[29] ;
  wire \lb_rdata_reg_n_0_[2] ;
  wire \lb_rdata_reg_n_0_[30] ;
  wire \lb_rdata_reg_n_0_[31] ;
  wire \lb_rdata_reg_n_0_[3] ;
  wire \lb_rdata_reg_n_0_[4] ;
  wire \lb_rdata_reg_n_0_[5] ;
  wire \lb_rdata_reg_n_0_[6] ;
  wire \lb_rdata_reg_n_0_[7] ;
  wire \lb_rdata_reg_n_0_[8] ;
  wire \lb_rdata_reg_n_0_[9] ;
  wire [0:0]lb_waddr;
  wire [9:0]lb_waddr__0;
  wire [31:0]lb_wdata;
  wire lb_we;
  wire [0:0]line_req_num;
  wire \line_req_num[0]_i_1_n_0 ;
  wire line_req_tgl;
  wire line_req_tgl0;
  wire line_req_tgl_i_1_n_0;
  wire linebuf_reg_r1_0_63_0_2_i_1_n_0;
  wire linebuf_reg_r1_0_63_0_2_n_0;
  wire linebuf_reg_r1_0_63_0_2_n_1;
  wire linebuf_reg_r1_0_63_0_2_n_2;
  wire linebuf_reg_r1_0_63_12_14_n_0;
  wire linebuf_reg_r1_0_63_12_14_n_1;
  wire linebuf_reg_r1_0_63_12_14_n_2;
  wire linebuf_reg_r1_0_63_15_17_n_0;
  wire linebuf_reg_r1_0_63_15_17_n_1;
  wire linebuf_reg_r1_0_63_15_17_n_2;
  wire linebuf_reg_r1_0_63_18_20_n_0;
  wire linebuf_reg_r1_0_63_18_20_n_1;
  wire linebuf_reg_r1_0_63_18_20_n_2;
  wire linebuf_reg_r1_0_63_21_23_n_0;
  wire linebuf_reg_r1_0_63_21_23_n_1;
  wire linebuf_reg_r1_0_63_21_23_n_2;
  wire linebuf_reg_r1_0_63_24_26_n_0;
  wire linebuf_reg_r1_0_63_24_26_n_1;
  wire linebuf_reg_r1_0_63_24_26_n_2;
  wire linebuf_reg_r1_0_63_27_29_n_0;
  wire linebuf_reg_r1_0_63_27_29_n_1;
  wire linebuf_reg_r1_0_63_27_29_n_2;
  wire linebuf_reg_r1_0_63_30_31_n_0;
  wire linebuf_reg_r1_0_63_30_31_n_1;
  wire linebuf_reg_r1_0_63_3_5_n_0;
  wire linebuf_reg_r1_0_63_3_5_n_1;
  wire linebuf_reg_r1_0_63_3_5_n_2;
  wire linebuf_reg_r1_0_63_6_8_n_0;
  wire linebuf_reg_r1_0_63_6_8_n_1;
  wire linebuf_reg_r1_0_63_6_8_n_2;
  wire linebuf_reg_r1_0_63_9_11_n_0;
  wire linebuf_reg_r1_0_63_9_11_n_1;
  wire linebuf_reg_r1_0_63_9_11_n_2;
  wire linebuf_reg_r1_512_575_0_2_i_1_n_0;
  wire linebuf_reg_r1_512_575_0_2_n_0;
  wire linebuf_reg_r1_512_575_0_2_n_1;
  wire linebuf_reg_r1_512_575_0_2_n_2;
  wire linebuf_reg_r1_512_575_12_14_n_0;
  wire linebuf_reg_r1_512_575_12_14_n_1;
  wire linebuf_reg_r1_512_575_12_14_n_2;
  wire linebuf_reg_r1_512_575_15_17_n_0;
  wire linebuf_reg_r1_512_575_15_17_n_1;
  wire linebuf_reg_r1_512_575_15_17_n_2;
  wire linebuf_reg_r1_512_575_18_20_n_0;
  wire linebuf_reg_r1_512_575_18_20_n_1;
  wire linebuf_reg_r1_512_575_18_20_n_2;
  wire linebuf_reg_r1_512_575_21_23_n_0;
  wire linebuf_reg_r1_512_575_21_23_n_1;
  wire linebuf_reg_r1_512_575_21_23_n_2;
  wire linebuf_reg_r1_512_575_24_26_n_0;
  wire linebuf_reg_r1_512_575_24_26_n_1;
  wire linebuf_reg_r1_512_575_24_26_n_2;
  wire linebuf_reg_r1_512_575_27_29_n_0;
  wire linebuf_reg_r1_512_575_27_29_n_1;
  wire linebuf_reg_r1_512_575_27_29_n_2;
  wire linebuf_reg_r1_512_575_30_31_n_0;
  wire linebuf_reg_r1_512_575_30_31_n_1;
  wire linebuf_reg_r1_512_575_3_5_n_0;
  wire linebuf_reg_r1_512_575_3_5_n_1;
  wire linebuf_reg_r1_512_575_3_5_n_2;
  wire linebuf_reg_r1_512_575_6_8_n_0;
  wire linebuf_reg_r1_512_575_6_8_n_1;
  wire linebuf_reg_r1_512_575_6_8_n_2;
  wire linebuf_reg_r1_512_575_9_11_n_0;
  wire linebuf_reg_r1_512_575_9_11_n_1;
  wire linebuf_reg_r1_512_575_9_11_n_2;
  wire linebuf_reg_r2_0_63_0_2_i_3_n_0;
  wire linebuf_reg_r2_0_63_0_2_n_0;
  wire linebuf_reg_r2_0_63_0_2_n_1;
  wire linebuf_reg_r2_0_63_0_2_n_2;
  wire linebuf_reg_r2_0_63_12_14_n_0;
  wire linebuf_reg_r2_0_63_12_14_n_1;
  wire linebuf_reg_r2_0_63_12_14_n_2;
  wire linebuf_reg_r2_0_63_15_17_i_1_n_0;
  wire linebuf_reg_r2_0_63_15_17_n_0;
  wire linebuf_reg_r2_0_63_15_17_n_1;
  wire linebuf_reg_r2_0_63_15_17_n_2;
  wire linebuf_reg_r2_0_63_18_20_i_1_n_0;
  wire linebuf_reg_r2_0_63_18_20_i_2_n_0;
  wire linebuf_reg_r2_0_63_18_20_i_3_n_0;
  wire linebuf_reg_r2_0_63_18_20_i_4_n_0;
  wire linebuf_reg_r2_0_63_18_20_i_5_n_0;
  wire linebuf_reg_r2_0_63_18_20_n_0;
  wire linebuf_reg_r2_0_63_18_20_n_1;
  wire linebuf_reg_r2_0_63_18_20_n_2;
  wire linebuf_reg_r2_0_63_21_23_n_0;
  wire linebuf_reg_r2_0_63_21_23_n_1;
  wire linebuf_reg_r2_0_63_21_23_n_2;
  wire linebuf_reg_r2_0_63_24_26_i_1_n_0;
  wire linebuf_reg_r2_0_63_24_26_n_0;
  wire linebuf_reg_r2_0_63_24_26_n_1;
  wire linebuf_reg_r2_0_63_24_26_n_2;
  wire linebuf_reg_r2_0_63_27_29_i_1_n_0;
  wire linebuf_reg_r2_0_63_27_29_i_2_n_0;
  wire linebuf_reg_r2_0_63_27_29_i_3_n_0;
  wire linebuf_reg_r2_0_63_27_29_i_4_n_0;
  wire linebuf_reg_r2_0_63_27_29_i_5_n_0;
  wire linebuf_reg_r2_0_63_27_29_n_0;
  wire linebuf_reg_r2_0_63_27_29_n_1;
  wire linebuf_reg_r2_0_63_27_29_n_2;
  wire linebuf_reg_r2_0_63_30_31_n_0;
  wire linebuf_reg_r2_0_63_30_31_n_1;
  wire linebuf_reg_r2_0_63_3_5_n_0;
  wire linebuf_reg_r2_0_63_3_5_n_1;
  wire linebuf_reg_r2_0_63_3_5_n_2;
  wire linebuf_reg_r2_0_63_6_8_i_1_n_0;
  wire linebuf_reg_r2_0_63_6_8_n_0;
  wire linebuf_reg_r2_0_63_6_8_n_1;
  wire linebuf_reg_r2_0_63_6_8_n_2;
  wire linebuf_reg_r2_0_63_9_11_i_1_n_0;
  wire linebuf_reg_r2_0_63_9_11_i_2_n_0;
  wire linebuf_reg_r2_0_63_9_11_i_3_n_0;
  wire linebuf_reg_r2_0_63_9_11_i_4_n_0;
  wire linebuf_reg_r2_0_63_9_11_i_5_n_0;
  wire linebuf_reg_r2_0_63_9_11_n_0;
  wire linebuf_reg_r2_0_63_9_11_n_1;
  wire linebuf_reg_r2_0_63_9_11_n_2;
  wire linebuf_reg_r2_128_191_0_2_i_1_n_0;
  wire linebuf_reg_r2_128_191_0_2_n_0;
  wire linebuf_reg_r2_128_191_0_2_n_1;
  wire linebuf_reg_r2_128_191_0_2_n_2;
  wire linebuf_reg_r2_128_191_12_14_n_0;
  wire linebuf_reg_r2_128_191_12_14_n_1;
  wire linebuf_reg_r2_128_191_12_14_n_2;
  wire linebuf_reg_r2_128_191_15_17_n_0;
  wire linebuf_reg_r2_128_191_15_17_n_1;
  wire linebuf_reg_r2_128_191_15_17_n_2;
  wire linebuf_reg_r2_128_191_18_20_n_0;
  wire linebuf_reg_r2_128_191_18_20_n_1;
  wire linebuf_reg_r2_128_191_18_20_n_2;
  wire linebuf_reg_r2_128_191_21_23_n_0;
  wire linebuf_reg_r2_128_191_21_23_n_1;
  wire linebuf_reg_r2_128_191_21_23_n_2;
  wire linebuf_reg_r2_128_191_24_26_n_0;
  wire linebuf_reg_r2_128_191_24_26_n_1;
  wire linebuf_reg_r2_128_191_24_26_n_2;
  wire linebuf_reg_r2_128_191_27_29_n_0;
  wire linebuf_reg_r2_128_191_27_29_n_1;
  wire linebuf_reg_r2_128_191_27_29_n_2;
  wire linebuf_reg_r2_128_191_30_31_n_0;
  wire linebuf_reg_r2_128_191_30_31_n_1;
  wire linebuf_reg_r2_128_191_3_5_n_0;
  wire linebuf_reg_r2_128_191_3_5_n_1;
  wire linebuf_reg_r2_128_191_3_5_n_2;
  wire linebuf_reg_r2_128_191_6_8_n_0;
  wire linebuf_reg_r2_128_191_6_8_n_1;
  wire linebuf_reg_r2_128_191_6_8_n_2;
  wire linebuf_reg_r2_128_191_9_11_n_0;
  wire linebuf_reg_r2_128_191_9_11_n_1;
  wire linebuf_reg_r2_128_191_9_11_n_2;
  wire linebuf_reg_r2_192_255_0_2_i_1_n_0;
  wire linebuf_reg_r2_192_255_0_2_n_0;
  wire linebuf_reg_r2_192_255_0_2_n_1;
  wire linebuf_reg_r2_192_255_0_2_n_2;
  wire linebuf_reg_r2_192_255_12_14_n_0;
  wire linebuf_reg_r2_192_255_12_14_n_1;
  wire linebuf_reg_r2_192_255_12_14_n_2;
  wire linebuf_reg_r2_192_255_15_17_n_0;
  wire linebuf_reg_r2_192_255_15_17_n_1;
  wire linebuf_reg_r2_192_255_15_17_n_2;
  wire linebuf_reg_r2_192_255_18_20_n_0;
  wire linebuf_reg_r2_192_255_18_20_n_1;
  wire linebuf_reg_r2_192_255_18_20_n_2;
  wire linebuf_reg_r2_192_255_21_23_n_0;
  wire linebuf_reg_r2_192_255_21_23_n_1;
  wire linebuf_reg_r2_192_255_21_23_n_2;
  wire linebuf_reg_r2_192_255_24_26_n_0;
  wire linebuf_reg_r2_192_255_24_26_n_1;
  wire linebuf_reg_r2_192_255_24_26_n_2;
  wire linebuf_reg_r2_192_255_27_29_n_0;
  wire linebuf_reg_r2_192_255_27_29_n_1;
  wire linebuf_reg_r2_192_255_27_29_n_2;
  wire linebuf_reg_r2_192_255_30_31_n_0;
  wire linebuf_reg_r2_192_255_30_31_n_1;
  wire linebuf_reg_r2_192_255_3_5_n_0;
  wire linebuf_reg_r2_192_255_3_5_n_1;
  wire linebuf_reg_r2_192_255_3_5_n_2;
  wire linebuf_reg_r2_192_255_6_8_n_0;
  wire linebuf_reg_r2_192_255_6_8_n_1;
  wire linebuf_reg_r2_192_255_6_8_n_2;
  wire linebuf_reg_r2_192_255_9_11_n_0;
  wire linebuf_reg_r2_192_255_9_11_n_1;
  wire linebuf_reg_r2_192_255_9_11_n_2;
  wire linebuf_reg_r2_256_319_0_2_i_1_n_0;
  wire linebuf_reg_r2_256_319_0_2_n_0;
  wire linebuf_reg_r2_256_319_0_2_n_1;
  wire linebuf_reg_r2_256_319_0_2_n_2;
  wire linebuf_reg_r2_256_319_12_14_n_0;
  wire linebuf_reg_r2_256_319_12_14_n_1;
  wire linebuf_reg_r2_256_319_12_14_n_2;
  wire linebuf_reg_r2_256_319_15_17_n_0;
  wire linebuf_reg_r2_256_319_15_17_n_1;
  wire linebuf_reg_r2_256_319_15_17_n_2;
  wire linebuf_reg_r2_256_319_18_20_n_0;
  wire linebuf_reg_r2_256_319_18_20_n_1;
  wire linebuf_reg_r2_256_319_18_20_n_2;
  wire linebuf_reg_r2_256_319_21_23_n_0;
  wire linebuf_reg_r2_256_319_21_23_n_1;
  wire linebuf_reg_r2_256_319_21_23_n_2;
  wire linebuf_reg_r2_256_319_24_26_n_0;
  wire linebuf_reg_r2_256_319_24_26_n_1;
  wire linebuf_reg_r2_256_319_24_26_n_2;
  wire linebuf_reg_r2_256_319_27_29_n_0;
  wire linebuf_reg_r2_256_319_27_29_n_1;
  wire linebuf_reg_r2_256_319_27_29_n_2;
  wire linebuf_reg_r2_256_319_30_31_n_0;
  wire linebuf_reg_r2_256_319_30_31_n_1;
  wire linebuf_reg_r2_256_319_3_5_n_0;
  wire linebuf_reg_r2_256_319_3_5_n_1;
  wire linebuf_reg_r2_256_319_3_5_n_2;
  wire linebuf_reg_r2_256_319_6_8_n_0;
  wire linebuf_reg_r2_256_319_6_8_n_1;
  wire linebuf_reg_r2_256_319_6_8_n_2;
  wire linebuf_reg_r2_256_319_9_11_n_0;
  wire linebuf_reg_r2_256_319_9_11_n_1;
  wire linebuf_reg_r2_256_319_9_11_n_2;
  wire linebuf_reg_r2_320_383_0_2_i_1_n_0;
  wire linebuf_reg_r2_320_383_0_2_n_0;
  wire linebuf_reg_r2_320_383_0_2_n_1;
  wire linebuf_reg_r2_320_383_0_2_n_2;
  wire linebuf_reg_r2_320_383_12_14_n_0;
  wire linebuf_reg_r2_320_383_12_14_n_1;
  wire linebuf_reg_r2_320_383_12_14_n_2;
  wire linebuf_reg_r2_320_383_15_17_n_0;
  wire linebuf_reg_r2_320_383_15_17_n_1;
  wire linebuf_reg_r2_320_383_15_17_n_2;
  wire linebuf_reg_r2_320_383_18_20_n_0;
  wire linebuf_reg_r2_320_383_18_20_n_1;
  wire linebuf_reg_r2_320_383_18_20_n_2;
  wire linebuf_reg_r2_320_383_21_23_n_0;
  wire linebuf_reg_r2_320_383_21_23_n_1;
  wire linebuf_reg_r2_320_383_21_23_n_2;
  wire linebuf_reg_r2_320_383_24_26_n_0;
  wire linebuf_reg_r2_320_383_24_26_n_1;
  wire linebuf_reg_r2_320_383_24_26_n_2;
  wire linebuf_reg_r2_320_383_27_29_n_0;
  wire linebuf_reg_r2_320_383_27_29_n_1;
  wire linebuf_reg_r2_320_383_27_29_n_2;
  wire linebuf_reg_r2_320_383_30_31_n_0;
  wire linebuf_reg_r2_320_383_30_31_n_1;
  wire linebuf_reg_r2_320_383_3_5_n_0;
  wire linebuf_reg_r2_320_383_3_5_n_1;
  wire linebuf_reg_r2_320_383_3_5_n_2;
  wire linebuf_reg_r2_320_383_6_8_n_0;
  wire linebuf_reg_r2_320_383_6_8_n_1;
  wire linebuf_reg_r2_320_383_6_8_n_2;
  wire linebuf_reg_r2_320_383_9_11_n_0;
  wire linebuf_reg_r2_320_383_9_11_n_1;
  wire linebuf_reg_r2_320_383_9_11_n_2;
  wire linebuf_reg_r2_384_447_0_2_i_1_n_0;
  wire linebuf_reg_r2_384_447_0_2_n_0;
  wire linebuf_reg_r2_384_447_0_2_n_1;
  wire linebuf_reg_r2_384_447_0_2_n_2;
  wire linebuf_reg_r2_384_447_12_14_n_0;
  wire linebuf_reg_r2_384_447_12_14_n_1;
  wire linebuf_reg_r2_384_447_12_14_n_2;
  wire linebuf_reg_r2_384_447_15_17_n_0;
  wire linebuf_reg_r2_384_447_15_17_n_1;
  wire linebuf_reg_r2_384_447_15_17_n_2;
  wire linebuf_reg_r2_384_447_18_20_n_0;
  wire linebuf_reg_r2_384_447_18_20_n_1;
  wire linebuf_reg_r2_384_447_18_20_n_2;
  wire linebuf_reg_r2_384_447_21_23_n_0;
  wire linebuf_reg_r2_384_447_21_23_n_1;
  wire linebuf_reg_r2_384_447_21_23_n_2;
  wire linebuf_reg_r2_384_447_24_26_n_0;
  wire linebuf_reg_r2_384_447_24_26_n_1;
  wire linebuf_reg_r2_384_447_24_26_n_2;
  wire linebuf_reg_r2_384_447_27_29_n_0;
  wire linebuf_reg_r2_384_447_27_29_n_1;
  wire linebuf_reg_r2_384_447_27_29_n_2;
  wire linebuf_reg_r2_384_447_30_31_n_0;
  wire linebuf_reg_r2_384_447_30_31_n_1;
  wire linebuf_reg_r2_384_447_3_5_n_0;
  wire linebuf_reg_r2_384_447_3_5_n_1;
  wire linebuf_reg_r2_384_447_3_5_n_2;
  wire linebuf_reg_r2_384_447_6_8_n_0;
  wire linebuf_reg_r2_384_447_6_8_n_1;
  wire linebuf_reg_r2_384_447_6_8_n_2;
  wire linebuf_reg_r2_384_447_9_11_n_0;
  wire linebuf_reg_r2_384_447_9_11_n_1;
  wire linebuf_reg_r2_384_447_9_11_n_2;
  wire linebuf_reg_r2_448_511_0_2_i_1_n_0;
  wire linebuf_reg_r2_448_511_0_2_n_0;
  wire linebuf_reg_r2_448_511_0_2_n_1;
  wire linebuf_reg_r2_448_511_0_2_n_2;
  wire linebuf_reg_r2_448_511_12_14_n_0;
  wire linebuf_reg_r2_448_511_12_14_n_1;
  wire linebuf_reg_r2_448_511_12_14_n_2;
  wire linebuf_reg_r2_448_511_15_17_n_0;
  wire linebuf_reg_r2_448_511_15_17_n_1;
  wire linebuf_reg_r2_448_511_15_17_n_2;
  wire linebuf_reg_r2_448_511_18_20_n_0;
  wire linebuf_reg_r2_448_511_18_20_n_1;
  wire linebuf_reg_r2_448_511_18_20_n_2;
  wire linebuf_reg_r2_448_511_21_23_n_0;
  wire linebuf_reg_r2_448_511_21_23_n_1;
  wire linebuf_reg_r2_448_511_21_23_n_2;
  wire linebuf_reg_r2_448_511_24_26_n_0;
  wire linebuf_reg_r2_448_511_24_26_n_1;
  wire linebuf_reg_r2_448_511_24_26_n_2;
  wire linebuf_reg_r2_448_511_27_29_n_0;
  wire linebuf_reg_r2_448_511_27_29_n_1;
  wire linebuf_reg_r2_448_511_27_29_n_2;
  wire linebuf_reg_r2_448_511_30_31_n_0;
  wire linebuf_reg_r2_448_511_30_31_n_1;
  wire linebuf_reg_r2_448_511_3_5_n_0;
  wire linebuf_reg_r2_448_511_3_5_n_1;
  wire linebuf_reg_r2_448_511_3_5_n_2;
  wire linebuf_reg_r2_448_511_6_8_n_0;
  wire linebuf_reg_r2_448_511_6_8_n_1;
  wire linebuf_reg_r2_448_511_6_8_n_2;
  wire linebuf_reg_r2_448_511_9_11_n_0;
  wire linebuf_reg_r2_448_511_9_11_n_1;
  wire linebuf_reg_r2_448_511_9_11_n_2;
  wire linebuf_reg_r2_512_575_0_2_n_0;
  wire linebuf_reg_r2_512_575_0_2_n_1;
  wire linebuf_reg_r2_512_575_0_2_n_2;
  wire linebuf_reg_r2_512_575_12_14_n_0;
  wire linebuf_reg_r2_512_575_12_14_n_1;
  wire linebuf_reg_r2_512_575_12_14_n_2;
  wire linebuf_reg_r2_512_575_15_17_n_0;
  wire linebuf_reg_r2_512_575_15_17_n_1;
  wire linebuf_reg_r2_512_575_15_17_n_2;
  wire linebuf_reg_r2_512_575_18_20_n_0;
  wire linebuf_reg_r2_512_575_18_20_n_1;
  wire linebuf_reg_r2_512_575_18_20_n_2;
  wire linebuf_reg_r2_512_575_21_23_n_0;
  wire linebuf_reg_r2_512_575_21_23_n_1;
  wire linebuf_reg_r2_512_575_21_23_n_2;
  wire linebuf_reg_r2_512_575_24_26_n_0;
  wire linebuf_reg_r2_512_575_24_26_n_1;
  wire linebuf_reg_r2_512_575_24_26_n_2;
  wire linebuf_reg_r2_512_575_27_29_n_0;
  wire linebuf_reg_r2_512_575_27_29_n_1;
  wire linebuf_reg_r2_512_575_27_29_n_2;
  wire linebuf_reg_r2_512_575_30_31_n_0;
  wire linebuf_reg_r2_512_575_30_31_n_1;
  wire linebuf_reg_r2_512_575_3_5_n_0;
  wire linebuf_reg_r2_512_575_3_5_n_1;
  wire linebuf_reg_r2_512_575_3_5_n_2;
  wire linebuf_reg_r2_512_575_6_8_n_0;
  wire linebuf_reg_r2_512_575_6_8_n_1;
  wire linebuf_reg_r2_512_575_6_8_n_2;
  wire linebuf_reg_r2_512_575_9_11_n_0;
  wire linebuf_reg_r2_512_575_9_11_n_1;
  wire linebuf_reg_r2_512_575_9_11_n_2;
  wire linebuf_reg_r2_576_639_0_2_i_1_n_0;
  wire linebuf_reg_r2_576_639_0_2_n_0;
  wire linebuf_reg_r2_576_639_0_2_n_1;
  wire linebuf_reg_r2_576_639_0_2_n_2;
  wire linebuf_reg_r2_576_639_12_14_n_0;
  wire linebuf_reg_r2_576_639_12_14_n_1;
  wire linebuf_reg_r2_576_639_12_14_n_2;
  wire linebuf_reg_r2_576_639_15_17_n_0;
  wire linebuf_reg_r2_576_639_15_17_n_1;
  wire linebuf_reg_r2_576_639_15_17_n_2;
  wire linebuf_reg_r2_576_639_18_20_n_0;
  wire linebuf_reg_r2_576_639_18_20_n_1;
  wire linebuf_reg_r2_576_639_18_20_n_2;
  wire linebuf_reg_r2_576_639_21_23_n_0;
  wire linebuf_reg_r2_576_639_21_23_n_1;
  wire linebuf_reg_r2_576_639_21_23_n_2;
  wire linebuf_reg_r2_576_639_24_26_n_0;
  wire linebuf_reg_r2_576_639_24_26_n_1;
  wire linebuf_reg_r2_576_639_24_26_n_2;
  wire linebuf_reg_r2_576_639_27_29_n_0;
  wire linebuf_reg_r2_576_639_27_29_n_1;
  wire linebuf_reg_r2_576_639_27_29_n_2;
  wire linebuf_reg_r2_576_639_30_31_n_0;
  wire linebuf_reg_r2_576_639_30_31_n_1;
  wire linebuf_reg_r2_576_639_3_5_n_0;
  wire linebuf_reg_r2_576_639_3_5_n_1;
  wire linebuf_reg_r2_576_639_3_5_n_2;
  wire linebuf_reg_r2_576_639_6_8_n_0;
  wire linebuf_reg_r2_576_639_6_8_n_1;
  wire linebuf_reg_r2_576_639_6_8_n_2;
  wire linebuf_reg_r2_576_639_9_11_n_0;
  wire linebuf_reg_r2_576_639_9_11_n_1;
  wire linebuf_reg_r2_576_639_9_11_n_2;
  wire linebuf_reg_r2_640_703_0_2_i_1_n_0;
  wire linebuf_reg_r2_640_703_0_2_n_0;
  wire linebuf_reg_r2_640_703_0_2_n_1;
  wire linebuf_reg_r2_640_703_0_2_n_2;
  wire linebuf_reg_r2_640_703_12_14_n_0;
  wire linebuf_reg_r2_640_703_12_14_n_1;
  wire linebuf_reg_r2_640_703_12_14_n_2;
  wire linebuf_reg_r2_640_703_15_17_n_0;
  wire linebuf_reg_r2_640_703_15_17_n_1;
  wire linebuf_reg_r2_640_703_15_17_n_2;
  wire linebuf_reg_r2_640_703_18_20_n_0;
  wire linebuf_reg_r2_640_703_18_20_n_1;
  wire linebuf_reg_r2_640_703_18_20_n_2;
  wire linebuf_reg_r2_640_703_21_23_n_0;
  wire linebuf_reg_r2_640_703_21_23_n_1;
  wire linebuf_reg_r2_640_703_21_23_n_2;
  wire linebuf_reg_r2_640_703_24_26_n_0;
  wire linebuf_reg_r2_640_703_24_26_n_1;
  wire linebuf_reg_r2_640_703_24_26_n_2;
  wire linebuf_reg_r2_640_703_27_29_n_0;
  wire linebuf_reg_r2_640_703_27_29_n_1;
  wire linebuf_reg_r2_640_703_27_29_n_2;
  wire linebuf_reg_r2_640_703_30_31_n_0;
  wire linebuf_reg_r2_640_703_30_31_n_1;
  wire linebuf_reg_r2_640_703_3_5_n_0;
  wire linebuf_reg_r2_640_703_3_5_n_1;
  wire linebuf_reg_r2_640_703_3_5_n_2;
  wire linebuf_reg_r2_640_703_6_8_n_0;
  wire linebuf_reg_r2_640_703_6_8_n_1;
  wire linebuf_reg_r2_640_703_6_8_n_2;
  wire linebuf_reg_r2_640_703_9_11_n_0;
  wire linebuf_reg_r2_640_703_9_11_n_1;
  wire linebuf_reg_r2_640_703_9_11_n_2;
  wire linebuf_reg_r2_64_127_0_2_i_1_n_0;
  wire linebuf_reg_r2_64_127_0_2_n_0;
  wire linebuf_reg_r2_64_127_0_2_n_1;
  wire linebuf_reg_r2_64_127_0_2_n_2;
  wire linebuf_reg_r2_64_127_12_14_n_0;
  wire linebuf_reg_r2_64_127_12_14_n_1;
  wire linebuf_reg_r2_64_127_12_14_n_2;
  wire linebuf_reg_r2_64_127_15_17_n_0;
  wire linebuf_reg_r2_64_127_15_17_n_1;
  wire linebuf_reg_r2_64_127_15_17_n_2;
  wire linebuf_reg_r2_64_127_18_20_n_0;
  wire linebuf_reg_r2_64_127_18_20_n_1;
  wire linebuf_reg_r2_64_127_18_20_n_2;
  wire linebuf_reg_r2_64_127_21_23_n_0;
  wire linebuf_reg_r2_64_127_21_23_n_1;
  wire linebuf_reg_r2_64_127_21_23_n_2;
  wire linebuf_reg_r2_64_127_24_26_n_0;
  wire linebuf_reg_r2_64_127_24_26_n_1;
  wire linebuf_reg_r2_64_127_24_26_n_2;
  wire linebuf_reg_r2_64_127_27_29_n_0;
  wire linebuf_reg_r2_64_127_27_29_n_1;
  wire linebuf_reg_r2_64_127_27_29_n_2;
  wire linebuf_reg_r2_64_127_30_31_n_0;
  wire linebuf_reg_r2_64_127_30_31_n_1;
  wire linebuf_reg_r2_64_127_3_5_n_0;
  wire linebuf_reg_r2_64_127_3_5_n_1;
  wire linebuf_reg_r2_64_127_3_5_n_2;
  wire linebuf_reg_r2_64_127_6_8_n_0;
  wire linebuf_reg_r2_64_127_6_8_n_1;
  wire linebuf_reg_r2_64_127_6_8_n_2;
  wire linebuf_reg_r2_64_127_9_11_n_0;
  wire linebuf_reg_r2_64_127_9_11_n_1;
  wire linebuf_reg_r2_64_127_9_11_n_2;
  wire linebuf_reg_r2_704_767_0_2_i_1_n_0;
  wire linebuf_reg_r2_704_767_0_2_n_0;
  wire linebuf_reg_r2_704_767_0_2_n_1;
  wire linebuf_reg_r2_704_767_0_2_n_2;
  wire linebuf_reg_r2_704_767_12_14_n_0;
  wire linebuf_reg_r2_704_767_12_14_n_1;
  wire linebuf_reg_r2_704_767_12_14_n_2;
  wire linebuf_reg_r2_704_767_15_17_n_0;
  wire linebuf_reg_r2_704_767_15_17_n_1;
  wire linebuf_reg_r2_704_767_15_17_n_2;
  wire linebuf_reg_r2_704_767_18_20_n_0;
  wire linebuf_reg_r2_704_767_18_20_n_1;
  wire linebuf_reg_r2_704_767_18_20_n_2;
  wire linebuf_reg_r2_704_767_21_23_n_0;
  wire linebuf_reg_r2_704_767_21_23_n_1;
  wire linebuf_reg_r2_704_767_21_23_n_2;
  wire linebuf_reg_r2_704_767_24_26_n_0;
  wire linebuf_reg_r2_704_767_24_26_n_1;
  wire linebuf_reg_r2_704_767_24_26_n_2;
  wire linebuf_reg_r2_704_767_27_29_n_0;
  wire linebuf_reg_r2_704_767_27_29_n_1;
  wire linebuf_reg_r2_704_767_27_29_n_2;
  wire linebuf_reg_r2_704_767_30_31_n_0;
  wire linebuf_reg_r2_704_767_30_31_n_1;
  wire linebuf_reg_r2_704_767_3_5_n_0;
  wire linebuf_reg_r2_704_767_3_5_n_1;
  wire linebuf_reg_r2_704_767_3_5_n_2;
  wire linebuf_reg_r2_704_767_6_8_n_0;
  wire linebuf_reg_r2_704_767_6_8_n_1;
  wire linebuf_reg_r2_704_767_6_8_n_2;
  wire linebuf_reg_r2_704_767_9_11_n_0;
  wire linebuf_reg_r2_704_767_9_11_n_1;
  wire linebuf_reg_r2_704_767_9_11_n_2;
  wire linebuf_reg_r2_768_831_0_2_i_1_n_0;
  wire linebuf_reg_r2_768_831_0_2_n_0;
  wire linebuf_reg_r2_768_831_0_2_n_1;
  wire linebuf_reg_r2_768_831_0_2_n_2;
  wire linebuf_reg_r2_768_831_12_14_n_0;
  wire linebuf_reg_r2_768_831_12_14_n_1;
  wire linebuf_reg_r2_768_831_12_14_n_2;
  wire linebuf_reg_r2_768_831_15_17_n_0;
  wire linebuf_reg_r2_768_831_15_17_n_1;
  wire linebuf_reg_r2_768_831_15_17_n_2;
  wire linebuf_reg_r2_768_831_18_20_n_0;
  wire linebuf_reg_r2_768_831_18_20_n_1;
  wire linebuf_reg_r2_768_831_18_20_n_2;
  wire linebuf_reg_r2_768_831_21_23_n_0;
  wire linebuf_reg_r2_768_831_21_23_n_1;
  wire linebuf_reg_r2_768_831_21_23_n_2;
  wire linebuf_reg_r2_768_831_24_26_n_0;
  wire linebuf_reg_r2_768_831_24_26_n_1;
  wire linebuf_reg_r2_768_831_24_26_n_2;
  wire linebuf_reg_r2_768_831_27_29_n_0;
  wire linebuf_reg_r2_768_831_27_29_n_1;
  wire linebuf_reg_r2_768_831_27_29_n_2;
  wire linebuf_reg_r2_768_831_30_31_n_0;
  wire linebuf_reg_r2_768_831_30_31_n_1;
  wire linebuf_reg_r2_768_831_3_5_n_0;
  wire linebuf_reg_r2_768_831_3_5_n_1;
  wire linebuf_reg_r2_768_831_3_5_n_2;
  wire linebuf_reg_r2_768_831_6_8_n_0;
  wire linebuf_reg_r2_768_831_6_8_n_1;
  wire linebuf_reg_r2_768_831_6_8_n_2;
  wire linebuf_reg_r2_768_831_9_11_n_0;
  wire linebuf_reg_r2_768_831_9_11_n_1;
  wire linebuf_reg_r2_768_831_9_11_n_2;
  wire linebuf_reg_r2_832_895_0_2_i_1_n_0;
  wire linebuf_reg_r2_832_895_0_2_n_0;
  wire linebuf_reg_r2_832_895_0_2_n_1;
  wire linebuf_reg_r2_832_895_0_2_n_2;
  wire linebuf_reg_r2_832_895_12_14_n_0;
  wire linebuf_reg_r2_832_895_12_14_n_1;
  wire linebuf_reg_r2_832_895_12_14_n_2;
  wire linebuf_reg_r2_832_895_15_17_n_0;
  wire linebuf_reg_r2_832_895_15_17_n_1;
  wire linebuf_reg_r2_832_895_15_17_n_2;
  wire linebuf_reg_r2_832_895_18_20_n_0;
  wire linebuf_reg_r2_832_895_18_20_n_1;
  wire linebuf_reg_r2_832_895_18_20_n_2;
  wire linebuf_reg_r2_832_895_21_23_n_0;
  wire linebuf_reg_r2_832_895_21_23_n_1;
  wire linebuf_reg_r2_832_895_21_23_n_2;
  wire linebuf_reg_r2_832_895_24_26_n_0;
  wire linebuf_reg_r2_832_895_24_26_n_1;
  wire linebuf_reg_r2_832_895_24_26_n_2;
  wire linebuf_reg_r2_832_895_27_29_n_0;
  wire linebuf_reg_r2_832_895_27_29_n_1;
  wire linebuf_reg_r2_832_895_27_29_n_2;
  wire linebuf_reg_r2_832_895_30_31_n_0;
  wire linebuf_reg_r2_832_895_30_31_n_1;
  wire linebuf_reg_r2_832_895_3_5_n_0;
  wire linebuf_reg_r2_832_895_3_5_n_1;
  wire linebuf_reg_r2_832_895_3_5_n_2;
  wire linebuf_reg_r2_832_895_6_8_n_0;
  wire linebuf_reg_r2_832_895_6_8_n_1;
  wire linebuf_reg_r2_832_895_6_8_n_2;
  wire linebuf_reg_r2_832_895_9_11_n_0;
  wire linebuf_reg_r2_832_895_9_11_n_1;
  wire linebuf_reg_r2_832_895_9_11_n_2;
  wire linebuf_reg_r2_896_959_0_2_i_1_n_0;
  wire linebuf_reg_r2_896_959_0_2_n_0;
  wire linebuf_reg_r2_896_959_0_2_n_1;
  wire linebuf_reg_r2_896_959_0_2_n_2;
  wire linebuf_reg_r2_896_959_12_14_n_0;
  wire linebuf_reg_r2_896_959_12_14_n_1;
  wire linebuf_reg_r2_896_959_12_14_n_2;
  wire linebuf_reg_r2_896_959_15_17_n_0;
  wire linebuf_reg_r2_896_959_15_17_n_1;
  wire linebuf_reg_r2_896_959_15_17_n_2;
  wire linebuf_reg_r2_896_959_18_20_n_0;
  wire linebuf_reg_r2_896_959_18_20_n_1;
  wire linebuf_reg_r2_896_959_18_20_n_2;
  wire linebuf_reg_r2_896_959_21_23_n_0;
  wire linebuf_reg_r2_896_959_21_23_n_1;
  wire linebuf_reg_r2_896_959_21_23_n_2;
  wire linebuf_reg_r2_896_959_24_26_n_0;
  wire linebuf_reg_r2_896_959_24_26_n_1;
  wire linebuf_reg_r2_896_959_24_26_n_2;
  wire linebuf_reg_r2_896_959_27_29_n_0;
  wire linebuf_reg_r2_896_959_27_29_n_1;
  wire linebuf_reg_r2_896_959_27_29_n_2;
  wire linebuf_reg_r2_896_959_30_31_n_0;
  wire linebuf_reg_r2_896_959_30_31_n_1;
  wire linebuf_reg_r2_896_959_3_5_n_0;
  wire linebuf_reg_r2_896_959_3_5_n_1;
  wire linebuf_reg_r2_896_959_3_5_n_2;
  wire linebuf_reg_r2_896_959_6_8_n_0;
  wire linebuf_reg_r2_896_959_6_8_n_1;
  wire linebuf_reg_r2_896_959_6_8_n_2;
  wire linebuf_reg_r2_896_959_9_11_n_0;
  wire linebuf_reg_r2_896_959_9_11_n_1;
  wire linebuf_reg_r2_896_959_9_11_n_2;
  wire linebuf_reg_r2_960_1023_0_2_i_1_n_0;
  wire linebuf_reg_r2_960_1023_0_2_n_0;
  wire linebuf_reg_r2_960_1023_0_2_n_1;
  wire linebuf_reg_r2_960_1023_0_2_n_2;
  wire linebuf_reg_r2_960_1023_12_14_n_0;
  wire linebuf_reg_r2_960_1023_12_14_n_1;
  wire linebuf_reg_r2_960_1023_12_14_n_2;
  wire linebuf_reg_r2_960_1023_15_17_n_0;
  wire linebuf_reg_r2_960_1023_15_17_n_1;
  wire linebuf_reg_r2_960_1023_15_17_n_2;
  wire linebuf_reg_r2_960_1023_18_20_n_0;
  wire linebuf_reg_r2_960_1023_18_20_n_1;
  wire linebuf_reg_r2_960_1023_18_20_n_2;
  wire linebuf_reg_r2_960_1023_21_23_n_0;
  wire linebuf_reg_r2_960_1023_21_23_n_1;
  wire linebuf_reg_r2_960_1023_21_23_n_2;
  wire linebuf_reg_r2_960_1023_24_26_n_0;
  wire linebuf_reg_r2_960_1023_24_26_n_1;
  wire linebuf_reg_r2_960_1023_24_26_n_2;
  wire linebuf_reg_r2_960_1023_27_29_n_0;
  wire linebuf_reg_r2_960_1023_27_29_n_1;
  wire linebuf_reg_r2_960_1023_27_29_n_2;
  wire linebuf_reg_r2_960_1023_30_31_n_0;
  wire linebuf_reg_r2_960_1023_30_31_n_1;
  wire linebuf_reg_r2_960_1023_3_5_n_0;
  wire linebuf_reg_r2_960_1023_3_5_n_1;
  wire linebuf_reg_r2_960_1023_3_5_n_2;
  wire linebuf_reg_r2_960_1023_6_8_n_0;
  wire linebuf_reg_r2_960_1023_6_8_n_1;
  wire linebuf_reg_r2_960_1023_6_8_n_2;
  wire linebuf_reg_r2_960_1023_9_11_n_0;
  wire linebuf_reg_r2_960_1023_9_11_n_1;
  wire linebuf_reg_r2_960_1023_9_11_n_2;
  wire [31:0]m_axi_hp_araddr;
  wire m_axi_hp_arready;
  wire m_axi_hp_arvalid;
  wire [31:0]m_axi_hp_rdata;
  wire m_axi_hp_rlast;
  wire m_axi_hp_rvalid;
  wire mono_p1;
  wire mono_p2;
  wire [7:0]p_0_in;
  wire p_0_in0;
  wire [8:0]p_0_in_2;
  wire p_1_in;
  wire [3:0]p_3_in;
  wire \pix_alive[0]_i_2_n_0 ;
  wire \pix_alive_reg[0]_i_1_n_0 ;
  wire \pix_alive_reg[0]_i_1_n_1 ;
  wire \pix_alive_reg[0]_i_1_n_2 ;
  wire \pix_alive_reg[0]_i_1_n_3 ;
  wire \pix_alive_reg[0]_i_1_n_4 ;
  wire \pix_alive_reg[0]_i_1_n_5 ;
  wire \pix_alive_reg[0]_i_1_n_6 ;
  wire \pix_alive_reg[0]_i_1_n_7 ;
  wire \pix_alive_reg[12]_i_1_n_0 ;
  wire \pix_alive_reg[12]_i_1_n_1 ;
  wire \pix_alive_reg[12]_i_1_n_2 ;
  wire \pix_alive_reg[12]_i_1_n_3 ;
  wire \pix_alive_reg[12]_i_1_n_4 ;
  wire \pix_alive_reg[12]_i_1_n_5 ;
  wire \pix_alive_reg[12]_i_1_n_6 ;
  wire \pix_alive_reg[12]_i_1_n_7 ;
  wire \pix_alive_reg[16]_i_1_n_0 ;
  wire \pix_alive_reg[16]_i_1_n_1 ;
  wire \pix_alive_reg[16]_i_1_n_2 ;
  wire \pix_alive_reg[16]_i_1_n_3 ;
  wire \pix_alive_reg[16]_i_1_n_4 ;
  wire \pix_alive_reg[16]_i_1_n_5 ;
  wire \pix_alive_reg[16]_i_1_n_6 ;
  wire \pix_alive_reg[16]_i_1_n_7 ;
  wire \pix_alive_reg[20]_i_1_n_1 ;
  wire \pix_alive_reg[20]_i_1_n_2 ;
  wire \pix_alive_reg[20]_i_1_n_3 ;
  wire \pix_alive_reg[20]_i_1_n_4 ;
  wire \pix_alive_reg[20]_i_1_n_5 ;
  wire \pix_alive_reg[20]_i_1_n_6 ;
  wire \pix_alive_reg[20]_i_1_n_7 ;
  wire \pix_alive_reg[4]_i_1_n_0 ;
  wire \pix_alive_reg[4]_i_1_n_1 ;
  wire \pix_alive_reg[4]_i_1_n_2 ;
  wire \pix_alive_reg[4]_i_1_n_3 ;
  wire \pix_alive_reg[4]_i_1_n_4 ;
  wire \pix_alive_reg[4]_i_1_n_5 ;
  wire \pix_alive_reg[4]_i_1_n_6 ;
  wire \pix_alive_reg[4]_i_1_n_7 ;
  wire \pix_alive_reg[8]_i_1_n_0 ;
  wire \pix_alive_reg[8]_i_1_n_1 ;
  wire \pix_alive_reg[8]_i_1_n_2 ;
  wire \pix_alive_reg[8]_i_1_n_3 ;
  wire \pix_alive_reg[8]_i_1_n_4 ;
  wire \pix_alive_reg[8]_i_1_n_5 ;
  wire \pix_alive_reg[8]_i_1_n_6 ;
  wire \pix_alive_reg[8]_i_1_n_7 ;
  wire \pix_alive_reg_n_0_[0] ;
  wire \pix_alive_reg_n_0_[10] ;
  wire \pix_alive_reg_n_0_[11] ;
  wire \pix_alive_reg_n_0_[12] ;
  wire \pix_alive_reg_n_0_[13] ;
  wire \pix_alive_reg_n_0_[14] ;
  wire \pix_alive_reg_n_0_[15] ;
  wire \pix_alive_reg_n_0_[1] ;
  wire \pix_alive_reg_n_0_[2] ;
  wire \pix_alive_reg_n_0_[3] ;
  wire \pix_alive_reg_n_0_[4] ;
  wire \pix_alive_reg_n_0_[5] ;
  wire \pix_alive_reg_n_0_[6] ;
  wire \pix_alive_reg_n_0_[7] ;
  wire \pix_alive_reg_n_0_[8] ;
  wire \pix_alive_reg_n_0_[9] ;
  wire [7:0]pix_alive_s1;
  wire pixel_clk;
  wire [9:9]rd_addr_next;
  wire [8:0]rd_addr_next0;
  wire \rdata_q[0]_i_1_n_0 ;
  wire \rdata_q[0]_i_2_n_0 ;
  wire \rdata_q[10]_i_1_n_0 ;
  wire \rdata_q[11]_i_1_n_0 ;
  wire \rdata_q[12]_i_1_n_0 ;
  wire \rdata_q[13]_i_1_n_0 ;
  wire \rdata_q[14]_i_1_n_0 ;
  wire \rdata_q[15]_i_1_n_0 ;
  wire \rdata_q[16]_i_1_n_0 ;
  wire \rdata_q[17]_i_1_n_0 ;
  wire \rdata_q[18]_i_1_n_0 ;
  wire \rdata_q[19]_i_1_n_0 ;
  wire \rdata_q[1]_i_1_n_0 ;
  wire \rdata_q[20]_i_1_n_0 ;
  wire \rdata_q[21]_i_1_n_0 ;
  wire \rdata_q[22]_i_1_n_0 ;
  wire \rdata_q[23]_i_1_n_0 ;
  wire \rdata_q[24]_i_1_n_0 ;
  wire \rdata_q[25]_i_1_n_0 ;
  wire \rdata_q[26]_i_1_n_0 ;
  wire \rdata_q[27]_i_1_n_0 ;
  wire \rdata_q[28]_i_1_n_0 ;
  wire \rdata_q[29]_i_1_n_0 ;
  wire \rdata_q[2]_i_1_n_0 ;
  wire \rdata_q[30]_i_1_n_0 ;
  wire \rdata_q[31]_i_1_n_0 ;
  wire \rdata_q[31]_i_3_n_0 ;
  wire \rdata_q[31]_i_4_n_0 ;
  wire \rdata_q[3]_i_1_n_0 ;
  wire \rdata_q[4]_i_1_n_0 ;
  wire \rdata_q[5]_i_1_n_0 ;
  wire \rdata_q[6]_i_1_n_0 ;
  wire \rdata_q[7]_i_1_n_0 ;
  wire \rdata_q[8]_i_1_n_0 ;
  wire \rdata_q[9]_i_1_n_0 ;
  wire rvalid_q0;
  wire rvalid_q_i_1_n_0;
  wire rvalid_q_reg_0;
  wire [7:0]s_axi_lite_araddr;
  wire s_axi_lite_arvalid;
  wire [7:0]s_axi_lite_awaddr;
  wire s_axi_lite_awvalid;
  wire s_axi_lite_bready;
  wire [31:0]s_axi_lite_rdata;
  wire s_axi_lite_rready;
  wire [31:0]s_axi_lite_wdata;
  wire s_axi_lite_wvalid;
  wire scl_in;
  wire sda_in;
  wire st_overrun_i_1_n_0;
  wire st_overrun_i_2_n_0;
  wire t_s1;
  wire t_s2;
  wire t_s3;
  wire tp_p1;
  wire tp_p2;
  wire u_iobuf_sda_i_1_n_0;
  wire [0:0]vcnt;
  wire \vcnt[3]_i_2_n_0 ;
  wire \vcnt[8]_i_2_n_0 ;
  wire \vcnt[9]_i_1_n_0 ;
  wire \vcnt[9]_i_4_n_0 ;
  wire \vcnt[9]_i_5_n_0 ;
  wire \vcnt[9]_i_6_n_0 ;
  wire \vcnt[9]_i_7_n_0 ;
  wire \vcnt[9]_i_8_n_0 ;
  wire [9:0]vcnt__0;
  wire \vcnt_reg_n_0_[1] ;
  wire \vcnt_reg_n_0_[2] ;
  wire \vcnt_reg_n_0_[3] ;
  wire \vcnt_reg_n_0_[4] ;
  wire \vcnt_reg_n_0_[5] ;
  wire \vcnt_reg_n_0_[6] ;
  wire \vcnt_reg_n_0_[7] ;
  wire \vcnt_reg_n_0_[8] ;
  wire \vcnt_reg_n_0_[9] ;
  wire [3:0]vga_b;
  wire vga_hsync;
  wire \vga_q[0]_i_1_n_0 ;
  wire \vga_q[1]_i_1_n_0 ;
  wire \vga_q[1]_i_2_n_0 ;
  wire \vga_q[2]_i_1_n_0 ;
  wire \vga_q[2]_i_2_n_0 ;
  wire \vga_q[3]_i_1_n_0 ;
  wire \vga_q[3]_i_2_n_0 ;
  wire vga_vsync;
  wire w_done_i_1_n_0;
  wire w_done_reg_n_0;
  wire \wdata_q[31]_i_1_n_0 ;
  wire \wdata_q_reg_n_0_[0] ;
  wire \wdata_q_reg_n_0_[10] ;
  wire \wdata_q_reg_n_0_[11] ;
  wire \wdata_q_reg_n_0_[12] ;
  wire \wdata_q_reg_n_0_[13] ;
  wire \wdata_q_reg_n_0_[14] ;
  wire \wdata_q_reg_n_0_[15] ;
  wire \wdata_q_reg_n_0_[16] ;
  wire \wdata_q_reg_n_0_[17] ;
  wire \wdata_q_reg_n_0_[18] ;
  wire \wdata_q_reg_n_0_[19] ;
  wire \wdata_q_reg_n_0_[1] ;
  wire \wdata_q_reg_n_0_[20] ;
  wire \wdata_q_reg_n_0_[21] ;
  wire \wdata_q_reg_n_0_[22] ;
  wire \wdata_q_reg_n_0_[23] ;
  wire \wdata_q_reg_n_0_[24] ;
  wire \wdata_q_reg_n_0_[25] ;
  wire \wdata_q_reg_n_0_[26] ;
  wire \wdata_q_reg_n_0_[27] ;
  wire \wdata_q_reg_n_0_[28] ;
  wire \wdata_q_reg_n_0_[29] ;
  wire \wdata_q_reg_n_0_[2] ;
  wire \wdata_q_reg_n_0_[30] ;
  wire \wdata_q_reg_n_0_[31] ;
  wire \wdata_q_reg_n_0_[3] ;
  wire \wdata_q_reg_n_0_[4] ;
  wire \wdata_q_reg_n_0_[6] ;
  wire \wdata_q_reg_n_0_[7] ;
  wire \wdata_q_reg_n_0_[8] ;
  wire \wdata_q_reg_n_0_[9] ;
  wire wready_q_i_1_n_0;
  wire wready_q_reg_0;
  wire ycs_p1;
  wire ycs_p2;
  wire NLW_f_addr0_CARRYCASCOUT_UNCONNECTED;
  wire NLW_f_addr0_MULTSIGNOUT_UNCONNECTED;
  wire NLW_f_addr0_OVERFLOW_UNCONNECTED;
  wire NLW_f_addr0_PATTERNBDETECT_UNCONNECTED;
  wire NLW_f_addr0_PATTERNDETECT_UNCONNECTED;
  wire NLW_f_addr0_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_f_addr0_ACOUT_UNCONNECTED;
  wire [17:0]NLW_f_addr0_BCOUT_UNCONNECTED;
  wire [3:0]NLW_f_addr0_CARRYOUT_UNCONNECTED;
  wire [47:32]NLW_f_addr0_P_UNCONNECTED;
  wire [47:0]NLW_f_addr0_PCOUT_UNCONNECTED;
  wire [3:2]NLW_f_addr0_carry__5_CO_UNCONNECTED;
  wire [3:3]NLW_f_addr0_carry__5_O_UNCONNECTED;
  wire NLW_linebuf_reg_r1_0_63_0_2_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r1_0_63_12_14_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r1_0_63_15_17_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r1_0_63_18_20_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r1_0_63_21_23_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r1_0_63_24_26_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r1_0_63_27_29_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r1_0_63_30_31_DOC_UNCONNECTED;
  wire NLW_linebuf_reg_r1_0_63_30_31_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r1_0_63_3_5_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r1_0_63_6_8_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r1_0_63_9_11_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r1_512_575_0_2_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r1_512_575_12_14_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r1_512_575_15_17_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r1_512_575_18_20_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r1_512_575_21_23_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r1_512_575_24_26_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r1_512_575_27_29_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r1_512_575_30_31_DOC_UNCONNECTED;
  wire NLW_linebuf_reg_r1_512_575_30_31_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r1_512_575_3_5_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r1_512_575_6_8_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r1_512_575_9_11_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_0_63_0_2_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_0_63_12_14_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_0_63_15_17_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_0_63_18_20_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_0_63_21_23_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_0_63_24_26_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_0_63_27_29_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_0_63_30_31_DOC_UNCONNECTED;
  wire NLW_linebuf_reg_r2_0_63_30_31_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_0_63_3_5_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_0_63_6_8_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_0_63_9_11_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_128_191_0_2_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_128_191_12_14_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_128_191_15_17_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_128_191_18_20_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_128_191_21_23_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_128_191_24_26_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_128_191_27_29_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_128_191_30_31_DOC_UNCONNECTED;
  wire NLW_linebuf_reg_r2_128_191_30_31_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_128_191_3_5_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_128_191_6_8_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_128_191_9_11_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_192_255_0_2_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_192_255_12_14_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_192_255_15_17_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_192_255_18_20_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_192_255_21_23_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_192_255_24_26_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_192_255_27_29_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_192_255_30_31_DOC_UNCONNECTED;
  wire NLW_linebuf_reg_r2_192_255_30_31_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_192_255_3_5_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_192_255_6_8_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_192_255_9_11_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_256_319_0_2_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_256_319_12_14_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_256_319_15_17_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_256_319_18_20_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_256_319_21_23_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_256_319_24_26_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_256_319_27_29_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_256_319_30_31_DOC_UNCONNECTED;
  wire NLW_linebuf_reg_r2_256_319_30_31_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_256_319_3_5_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_256_319_6_8_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_256_319_9_11_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_320_383_0_2_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_320_383_12_14_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_320_383_15_17_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_320_383_18_20_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_320_383_21_23_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_320_383_24_26_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_320_383_27_29_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_320_383_30_31_DOC_UNCONNECTED;
  wire NLW_linebuf_reg_r2_320_383_30_31_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_320_383_3_5_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_320_383_6_8_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_320_383_9_11_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_384_447_0_2_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_384_447_12_14_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_384_447_15_17_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_384_447_18_20_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_384_447_21_23_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_384_447_24_26_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_384_447_27_29_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_384_447_30_31_DOC_UNCONNECTED;
  wire NLW_linebuf_reg_r2_384_447_30_31_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_384_447_3_5_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_384_447_6_8_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_384_447_9_11_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_448_511_0_2_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_448_511_12_14_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_448_511_15_17_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_448_511_18_20_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_448_511_21_23_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_448_511_24_26_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_448_511_27_29_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_448_511_30_31_DOC_UNCONNECTED;
  wire NLW_linebuf_reg_r2_448_511_30_31_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_448_511_3_5_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_448_511_6_8_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_448_511_9_11_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_512_575_0_2_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_512_575_12_14_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_512_575_15_17_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_512_575_18_20_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_512_575_21_23_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_512_575_24_26_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_512_575_27_29_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_512_575_30_31_DOC_UNCONNECTED;
  wire NLW_linebuf_reg_r2_512_575_30_31_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_512_575_3_5_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_512_575_6_8_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_512_575_9_11_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_576_639_0_2_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_576_639_12_14_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_576_639_15_17_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_576_639_18_20_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_576_639_21_23_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_576_639_24_26_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_576_639_27_29_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_576_639_30_31_DOC_UNCONNECTED;
  wire NLW_linebuf_reg_r2_576_639_30_31_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_576_639_3_5_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_576_639_6_8_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_576_639_9_11_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_640_703_0_2_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_640_703_12_14_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_640_703_15_17_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_640_703_18_20_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_640_703_21_23_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_640_703_24_26_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_640_703_27_29_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_640_703_30_31_DOC_UNCONNECTED;
  wire NLW_linebuf_reg_r2_640_703_30_31_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_640_703_3_5_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_640_703_6_8_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_640_703_9_11_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_64_127_0_2_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_64_127_12_14_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_64_127_15_17_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_64_127_18_20_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_64_127_21_23_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_64_127_24_26_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_64_127_27_29_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_64_127_30_31_DOC_UNCONNECTED;
  wire NLW_linebuf_reg_r2_64_127_30_31_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_64_127_3_5_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_64_127_6_8_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_64_127_9_11_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_704_767_0_2_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_704_767_12_14_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_704_767_15_17_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_704_767_18_20_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_704_767_21_23_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_704_767_24_26_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_704_767_27_29_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_704_767_30_31_DOC_UNCONNECTED;
  wire NLW_linebuf_reg_r2_704_767_30_31_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_704_767_3_5_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_704_767_6_8_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_704_767_9_11_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_768_831_0_2_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_768_831_12_14_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_768_831_15_17_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_768_831_18_20_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_768_831_21_23_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_768_831_24_26_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_768_831_27_29_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_768_831_30_31_DOC_UNCONNECTED;
  wire NLW_linebuf_reg_r2_768_831_30_31_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_768_831_3_5_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_768_831_6_8_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_768_831_9_11_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_832_895_0_2_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_832_895_12_14_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_832_895_15_17_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_832_895_18_20_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_832_895_21_23_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_832_895_24_26_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_832_895_27_29_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_832_895_30_31_DOC_UNCONNECTED;
  wire NLW_linebuf_reg_r2_832_895_30_31_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_832_895_3_5_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_832_895_6_8_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_832_895_9_11_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_896_959_0_2_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_896_959_12_14_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_896_959_15_17_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_896_959_18_20_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_896_959_21_23_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_896_959_24_26_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_896_959_27_29_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_896_959_30_31_DOC_UNCONNECTED;
  wire NLW_linebuf_reg_r2_896_959_30_31_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_896_959_3_5_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_896_959_6_8_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_896_959_9_11_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_960_1023_0_2_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_960_1023_12_14_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_960_1023_15_17_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_960_1023_18_20_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_960_1023_21_23_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_960_1023_24_26_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_960_1023_27_29_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_960_1023_30_31_DOC_UNCONNECTED;
  wire NLW_linebuf_reg_r2_960_1023_30_31_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_960_1023_3_5_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_960_1023_6_8_DOD_UNCONNECTED;
  wire NLW_linebuf_reg_r2_960_1023_9_11_DOD_UNCONNECTED;
  wire [3:3]\NLW_pix_alive_reg[20]_i_1_CO_UNCONNECTED ;
  wire NLW_u_clk_fwd_R_UNCONNECTED;
  wire NLW_u_clk_fwd_S_UNCONNECTED;

  LUT6 #(
    .INIT(64'h33A833CC338833CC)) 
    \FSM_sequential_fstate[0]_i_1 
       (.I0(\FSM_sequential_fstate[0]_i_2_n_0 ),
        .I1(arvalid_q2_i_4_n_0),
        .I2(m_axi_hp_rlast),
        .I3(fstate[0]),
        .I4(fstate[1]),
        .I5(m_axi_hp_rvalid),
        .O(\FSM_sequential_fstate[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT5 #(
    .INIT(32'hFFFFBFFF)) 
    \FSM_sequential_fstate[0]_i_2 
       (.I0(\f_burst_reg_n_0_[2] ),
        .I1(\f_burst_reg_n_0_[0] ),
        .I2(\f_burst_reg_n_0_[1] ),
        .I3(\f_burst_reg_n_0_[4] ),
        .I4(\f_burst_reg_n_0_[3] ),
        .O(\FSM_sequential_fstate[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h51A055A0)) 
    \FSM_sequential_fstate[1]_i_1 
       (.I0(arvalid_q2_i_4_n_0),
        .I1(m_axi_hp_rlast),
        .I2(fstate[0]),
        .I3(fstate[1]),
        .I4(m_axi_hp_rvalid),
        .O(\FSM_sequential_fstate[1]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "F_DATA:10,F_AR:01,F_IDLE:00" *) 
  FDRE \FSM_sequential_fstate_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(\FSM_sequential_fstate[0]_i_1_n_0 ),
        .Q(fstate[0]),
        .R(\rdata_q[31]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "F_DATA:10,F_AR:01,F_IDLE:00" *) 
  FDRE \FSM_sequential_fstate_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(\FSM_sequential_fstate[1]_i_1_n_0 ),
        .Q(fstate[1]),
        .R(\rdata_q[31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000EA00EA00EA00)) 
    ar_done_i_1
       (.I0(ar_done_reg_n_0),
        .I1(s_axi_lite_arvalid),
        .I2(arready_q_reg_0),
        .I3(aresetn),
        .I4(rvalid_q_reg_0),
        .I5(s_axi_lite_rready),
        .O(ar_done_i_1_n_0));
  FDRE ar_done_reg
       (.C(aclk),
        .CE(1'b1),
        .D(ar_done_i_1_n_0),
        .Q(ar_done_reg_n_0),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h08)) 
    \araddr_q[7]_i_1 
       (.I0(arready_q_reg_0),
        .I1(s_axi_lite_arvalid),
        .I2(ar_done_reg_n_0),
        .O(\araddr_q[7]_i_1_n_0 ));
  FDRE \araddr_q_reg[0] 
       (.C(aclk),
        .CE(\araddr_q[7]_i_1_n_0 ),
        .D(s_axi_lite_araddr[0]),
        .Q(araddr_q[0]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \araddr_q_reg[1] 
       (.C(aclk),
        .CE(\araddr_q[7]_i_1_n_0 ),
        .D(s_axi_lite_araddr[1]),
        .Q(araddr_q[1]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \araddr_q_reg[2] 
       (.C(aclk),
        .CE(\araddr_q[7]_i_1_n_0 ),
        .D(s_axi_lite_araddr[2]),
        .Q(araddr_q[2]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \araddr_q_reg[3] 
       (.C(aclk),
        .CE(\araddr_q[7]_i_1_n_0 ),
        .D(s_axi_lite_araddr[3]),
        .Q(araddr_q[3]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \araddr_q_reg[4] 
       (.C(aclk),
        .CE(\araddr_q[7]_i_1_n_0 ),
        .D(s_axi_lite_araddr[4]),
        .Q(araddr_q[4]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \araddr_q_reg[5] 
       (.C(aclk),
        .CE(\araddr_q[7]_i_1_n_0 ),
        .D(s_axi_lite_araddr[5]),
        .Q(araddr_q[5]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \araddr_q_reg[6] 
       (.C(aclk),
        .CE(\araddr_q[7]_i_1_n_0 ),
        .D(s_axi_lite_araddr[6]),
        .Q(araddr_q[6]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \araddr_q_reg[7] 
       (.C(aclk),
        .CE(\araddr_q[7]_i_1_n_0 ),
        .D(s_axi_lite_araddr[7]),
        .Q(araddr_q[7]),
        .R(\rdata_q[31]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h882A)) 
    arready_q_i_1
       (.I0(aresetn),
        .I1(arready_q_reg_0),
        .I2(s_axi_lite_arvalid),
        .I3(ar_done_reg_n_0),
        .O(arready_q_i_1_n_0));
  FDRE arready_q_reg
       (.C(aclk),
        .CE(1'b1),
        .D(arready_q_i_1_n_0),
        .Q(arready_q_reg_0),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hF8F8F8FFF8F8F800)) 
    arvalid_q2_i_1
       (.I0(m_axi_hp_rlast),
        .I1(arvalid_q2_i_2_n_0),
        .I2(f_line),
        .I3(\f_addr[31]_i_3_n_0 ),
        .I4(arvalid_q2_i_4_n_0),
        .I5(m_axi_hp_arvalid),
        .O(arvalid_q2_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h2)) 
    arvalid_q2_i_2
       (.I0(fstate[1]),
        .I1(fstate[0]),
        .O(arvalid_q2_i_2_n_0));
  LUT6 #(
    .INIT(64'h0000000600000000)) 
    arvalid_q2_i_3
       (.I0(t_s3),
        .I1(t_s2),
        .I2(fstate[0]),
        .I3(fstate[1]),
        .I4(p_3_in[3]),
        .I5(p_3_in[0]),
        .O(f_line));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT5 #(
    .INIT(32'hAAAAEAAA)) 
    arvalid_q2_i_4
       (.I0(arvalid_q2_i_5_n_0),
        .I1(m_axi_hp_arvalid),
        .I2(m_axi_hp_arready),
        .I3(fstate[0]),
        .I4(fstate[1]),
        .O(arvalid_q2_i_4_n_0));
  LUT6 #(
    .INIT(64'h0000000000000028)) 
    arvalid_q2_i_5
       (.I0(p_3_in[0]),
        .I1(t_s2),
        .I2(t_s3),
        .I3(p_3_in[3]),
        .I4(fstate[1]),
        .I5(fstate[0]),
        .O(arvalid_q2_i_5_n_0));
  FDRE arvalid_q2_reg
       (.C(aclk),
        .CE(1'b1),
        .D(arvalid_q2_i_1_n_0),
        .Q(m_axi_hp_arvalid),
        .R(\rdata_q[31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000EA00EA00EA00)) 
    aw_done_i_1
       (.I0(aw_done_reg_n_0),
        .I1(s_axi_lite_awvalid),
        .I2(awready_q_reg_0),
        .I3(aresetn),
        .I4(bvalid_q_reg_0),
        .I5(s_axi_lite_bready),
        .O(aw_done_i_1_n_0));
  FDRE aw_done_reg
       (.C(aclk),
        .CE(1'b1),
        .D(aw_done_i_1_n_0),
        .Q(aw_done_reg_n_0),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h08)) 
    \awaddr_q[7]_i_1 
       (.I0(awready_q_reg_0),
        .I1(s_axi_lite_awvalid),
        .I2(aw_done_reg_n_0),
        .O(\awaddr_q[7]_i_1_n_0 ));
  FDRE \awaddr_q_reg[0] 
       (.C(aclk),
        .CE(\awaddr_q[7]_i_1_n_0 ),
        .D(s_axi_lite_awaddr[0]),
        .Q(\awaddr_q_reg_n_0_[0] ),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \awaddr_q_reg[1] 
       (.C(aclk),
        .CE(\awaddr_q[7]_i_1_n_0 ),
        .D(s_axi_lite_awaddr[1]),
        .Q(\awaddr_q_reg_n_0_[1] ),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \awaddr_q_reg[2] 
       (.C(aclk),
        .CE(\awaddr_q[7]_i_1_n_0 ),
        .D(s_axi_lite_awaddr[2]),
        .Q(\awaddr_q_reg_n_0_[2] ),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \awaddr_q_reg[3] 
       (.C(aclk),
        .CE(\awaddr_q[7]_i_1_n_0 ),
        .D(s_axi_lite_awaddr[3]),
        .Q(\awaddr_q_reg_n_0_[3] ),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \awaddr_q_reg[4] 
       (.C(aclk),
        .CE(\awaddr_q[7]_i_1_n_0 ),
        .D(s_axi_lite_awaddr[4]),
        .Q(p_0_in0),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \awaddr_q_reg[5] 
       (.C(aclk),
        .CE(\awaddr_q[7]_i_1_n_0 ),
        .D(s_axi_lite_awaddr[5]),
        .Q(\awaddr_q_reg_n_0_[5] ),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \awaddr_q_reg[6] 
       (.C(aclk),
        .CE(\awaddr_q[7]_i_1_n_0 ),
        .D(s_axi_lite_awaddr[6]),
        .Q(\awaddr_q_reg_n_0_[6] ),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \awaddr_q_reg[7] 
       (.C(aclk),
        .CE(\awaddr_q[7]_i_1_n_0 ),
        .D(s_axi_lite_awaddr[7]),
        .Q(\awaddr_q_reg_n_0_[7] ),
        .R(\rdata_q[31]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h882A)) 
    awready_q_i_1
       (.I0(aresetn),
        .I1(awready_q_reg_0),
        .I2(s_axi_lite_awvalid),
        .I3(aw_done_reg_n_0),
        .O(awready_q_i_1_n_0));
  FDRE awready_q_reg
       (.C(aclk),
        .CE(1'b1),
        .D(awready_q_i_1_n_0),
        .Q(awready_q_reg_0),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT5 #(
    .INIT(32'h0080F080)) 
    bvalid_q_i_1
       (.I0(aw_done_reg_n_0),
        .I1(w_done_reg_n_0),
        .I2(aresetn),
        .I3(bvalid_q_reg_0),
        .I4(s_axi_lite_bready),
        .O(bvalid_q_i_1_n_0));
  FDRE bvalid_q_reg
       (.C(aclk),
        .CE(1'b1),
        .D(bvalid_q_i_1_n_0),
        .Q(bvalid_q_reg_0),
        .R(1'b0));
  FDRE ccs_p1_reg
       (.C(pixel_clk),
        .CE(1'b1),
        .D(ctrl_cbcr_swap),
        .Q(ccs_p1),
        .R(1'b0));
  FDRE ccs_p2_reg
       (.C(pixel_clk),
        .CE(1'b1),
        .D(ccs_p1),
        .Q(ccs_p2),
        .R(1'b0));
  FDRE ctrl_cbcr_swap_reg
       (.C(aclk),
        .CE(ctrl_enable),
        .D(\wdata_q_reg_n_0_[2] ),
        .Q(ctrl_cbcr_swap),
        .R(\rdata_q[31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    ctrl_enable_i_1
       (.I0(ctrl_enable1),
        .I1(ctrl_enable_i_3_n_0),
        .I2(\awaddr_q_reg_n_0_[3] ),
        .I3(\awaddr_q_reg_n_0_[2] ),
        .I4(\awaddr_q_reg_n_0_[0] ),
        .I5(\awaddr_q_reg_n_0_[1] ),
        .O(ctrl_enable));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'h20)) 
    ctrl_enable_i_2
       (.I0(aw_done_reg_n_0),
        .I1(bvalid_q_reg_0),
        .I2(w_done_reg_n_0),
        .O(ctrl_enable1));
  LUT4 #(
    .INIT(16'hFFFE)) 
    ctrl_enable_i_3
       (.I0(\awaddr_q_reg_n_0_[6] ),
        .I1(\awaddr_q_reg_n_0_[7] ),
        .I2(p_0_in0),
        .I3(\awaddr_q_reg_n_0_[5] ),
        .O(ctrl_enable_i_3_n_0));
  FDRE ctrl_enable_reg
       (.C(aclk),
        .CE(ctrl_enable),
        .D(\wdata_q_reg_n_0_[0] ),
        .Q(p_3_in[0]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE ctrl_mono_reg
       (.C(aclk),
        .CE(ctrl_enable),
        .D(p_1_in),
        .Q(ctrl_mono),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE ctrl_testpat_reg
       (.C(aclk),
        .CE(ctrl_enable),
        .D(\wdata_q_reg_n_0_[3] ),
        .Q(p_3_in[3]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE ctrl_yc_swap_reg
       (.C(aclk),
        .CE(ctrl_enable),
        .D(\wdata_q_reg_n_0_[1] ),
        .Q(ctrl_yc_swap),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE en_p1_reg
       (.C(pixel_clk),
        .CE(1'b1),
        .D(p_3_in[0]),
        .Q(en_p1),
        .R(1'b0));
  FDRE en_p2_reg
       (.C(pixel_clk),
        .CE(1'b1),
        .D(en_p1),
        .Q(en_p2),
        .R(1'b0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-11 {cell *THIS*}}" *) 
  DSP48E1 #(
    .ACASCREG(1),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(1),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(0),
    .BREG(0),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(0),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(0),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    f_addr0
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,vcnt__0}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_f_addr0_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b1,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_f_addr0_BCOUT_UNCONNECTED[17:0]),
        .C({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,fb_base}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_f_addr0_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_f_addr0_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(line_req_tgl0),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(1'b0),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b0),
        .CEP(1'b0),
        .CLK(pixel_clk),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_f_addr0_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b1,1'b1,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_f_addr0_OVERFLOW_UNCONNECTED),
        .P({NLW_f_addr0_P_UNCONNECTED[47:32],f_addr0_n_74,f_addr0_n_75,f_addr0_n_76,f_addr0_n_77,f_addr0_n_78,f_addr0_n_79,f_addr0_n_80,f_addr0_n_81,f_addr0_n_82,f_addr0_n_83,f_addr0_n_84,f_addr0_n_85,f_addr0_n_86,f_addr0_n_87,f_addr0_n_88,f_addr0_n_89,f_addr0_n_90,f_addr0_n_91,f_addr0_n_92,f_addr0_n_93,f_addr0_n_94,f_addr0_n_95,f_addr0_n_96,f_addr0_n_97,f_addr0_n_98,f_addr0_n_99,f_addr0_n_100,f_addr0_n_101,f_addr0_n_102,f_addr0_n_103,f_addr0_n_104,f_addr0_n_105}),
        .PATTERNBDETECT(NLW_f_addr0_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_f_addr0_PATTERNDETECT_UNCONNECTED),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(NLW_f_addr0_PCOUT_UNCONNECTED[47:0]),
        .RSTA(\vcnt[9]_i_1_n_0 ),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(1'b0),
        .UNDERFLOW(NLW_f_addr0_UNDERFLOW_UNCONNECTED));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 f_addr0_carry
       (.CI(1'b0),
        .CO({f_addr0_carry_n_0,f_addr0_carry_n_1,f_addr0_carry_n_2,f_addr0_carry_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,m_axi_hp_araddr[6],1'b0}),
        .O(in10[8:5]),
        .S({m_axi_hp_araddr[8:7],f_addr0_carry_i_1_n_0,m_axi_hp_araddr[5]}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 f_addr0_carry__0
       (.CI(f_addr0_carry_n_0),
        .CO({f_addr0_carry__0_n_0,f_addr0_carry__0_n_1,f_addr0_carry__0_n_2,f_addr0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(in10[12:9]),
        .S(m_axi_hp_araddr[12:9]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 f_addr0_carry__1
       (.CI(f_addr0_carry__0_n_0),
        .CO({f_addr0_carry__1_n_0,f_addr0_carry__1_n_1,f_addr0_carry__1_n_2,f_addr0_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(in10[16:13]),
        .S(m_axi_hp_araddr[16:13]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 f_addr0_carry__2
       (.CI(f_addr0_carry__1_n_0),
        .CO({f_addr0_carry__2_n_0,f_addr0_carry__2_n_1,f_addr0_carry__2_n_2,f_addr0_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(in10[20:17]),
        .S(m_axi_hp_araddr[20:17]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 f_addr0_carry__3
       (.CI(f_addr0_carry__2_n_0),
        .CO({f_addr0_carry__3_n_0,f_addr0_carry__3_n_1,f_addr0_carry__3_n_2,f_addr0_carry__3_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(in10[24:21]),
        .S(m_axi_hp_araddr[24:21]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 f_addr0_carry__4
       (.CI(f_addr0_carry__3_n_0),
        .CO({f_addr0_carry__4_n_0,f_addr0_carry__4_n_1,f_addr0_carry__4_n_2,f_addr0_carry__4_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(in10[28:25]),
        .S(m_axi_hp_araddr[28:25]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 f_addr0_carry__5
       (.CI(f_addr0_carry__4_n_0),
        .CO({NLW_f_addr0_carry__5_CO_UNCONNECTED[3:2],f_addr0_carry__5_n_2,f_addr0_carry__5_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_f_addr0_carry__5_O_UNCONNECTED[3],in10[31:29]}),
        .S({1'b0,m_axi_hp_araddr[31:29]}));
  LUT1 #(
    .INIT(2'h1)) 
    f_addr0_carry_i_1
       (.I0(m_axi_hp_araddr[6]),
        .O(f_addr0_carry_i_1_n_0));
  LUT6 #(
    .INIT(64'h0080808080800080)) 
    f_addr0_i_1
       (.I0(f_addr0_i_2_n_0),
        .I1(f_addr0_i_3_n_0),
        .I2(f_addr0_i_4_n_0),
        .I3(f_addr0_i_5_n_0),
        .I4(\vcnt_reg_n_0_[9] ),
        .I5(\vcnt[9]_i_6_n_0 ),
        .O(line_req_tgl0));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'hF77FFFFF)) 
    f_addr0_i_2
       (.I0(\vcnt_reg_n_0_[8] ),
        .I1(\vcnt_reg_n_0_[6] ),
        .I2(\vcnt[8]_i_2_n_0 ),
        .I3(\vcnt_reg_n_0_[5] ),
        .I4(\vcnt_reg_n_0_[7] ),
        .O(f_addr0_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'h01)) 
    f_addr0_i_3
       (.I0(p_0_in_2[5]),
        .I1(p_0_in_2[4]),
        .I2(p_0_in_2[3]),
        .O(f_addr0_i_3_n_0));
  LUT6 #(
    .INIT(64'h0000000000000100)) 
    f_addr0_i_4
       (.I0(p_0_in_2[1]),
        .I1(p_0_in_2[8]),
        .I2(p_0_in_2[2]),
        .I3(\vga_q[1]_i_2_n_0 ),
        .I4(p_0_in_2[0]),
        .I5(\hcnt_reg_n_0_[0] ),
        .O(f_addr0_i_4_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFEFF)) 
    f_addr0_i_5
       (.I0(rd_addr_next),
        .I1(\vcnt[9]_i_8_n_0 ),
        .I2(\vcnt_reg_n_0_[1] ),
        .I3(\vcnt_reg_n_0_[2] ),
        .I4(f_addr0_i_6_n_0),
        .I5(f_addr0_i_7_n_0),
        .O(f_addr0_i_5_n_0));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'h2)) 
    f_addr0_i_6
       (.I0(\vcnt_reg_n_0_[6] ),
        .I1(\vcnt_reg_n_0_[7] ),
        .O(f_addr0_i_6_n_0));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT3 #(
    .INIT(8'hEF)) 
    f_addr0_i_7
       (.I0(\vcnt_reg_n_0_[7] ),
        .I1(\vcnt_reg_n_0_[8] ),
        .I2(\vcnt_reg_n_0_[9] ),
        .O(f_addr0_i_7_n_0));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT4 #(
    .INIT(16'h00CA)) 
    \f_addr[0]_i_1 
       (.I0(f_addr0_n_105),
        .I1(m_axi_hp_araddr[0]),
        .I2(fstate[1]),
        .I3(fstate[0]),
        .O(f_addr[0]));
  LUT4 #(
    .INIT(16'h0A0C)) 
    \f_addr[10]_i_1 
       (.I0(in10[10]),
        .I1(f_addr0_n_95),
        .I2(fstate[0]),
        .I3(fstate[1]),
        .O(f_addr[10]));
  LUT4 #(
    .INIT(16'h0A0C)) 
    \f_addr[11]_i_1 
       (.I0(in10[11]),
        .I1(f_addr0_n_94),
        .I2(fstate[0]),
        .I3(fstate[1]),
        .O(f_addr[11]));
  LUT4 #(
    .INIT(16'h0A0C)) 
    \f_addr[12]_i_1 
       (.I0(in10[12]),
        .I1(f_addr0_n_93),
        .I2(fstate[0]),
        .I3(fstate[1]),
        .O(f_addr[12]));
  LUT4 #(
    .INIT(16'h0A0C)) 
    \f_addr[13]_i_1 
       (.I0(in10[13]),
        .I1(f_addr0_n_92),
        .I2(fstate[0]),
        .I3(fstate[1]),
        .O(f_addr[13]));
  LUT4 #(
    .INIT(16'h0A0C)) 
    \f_addr[14]_i_1 
       (.I0(in10[14]),
        .I1(f_addr0_n_91),
        .I2(fstate[0]),
        .I3(fstate[1]),
        .O(f_addr[14]));
  LUT4 #(
    .INIT(16'h0A0C)) 
    \f_addr[15]_i_1 
       (.I0(in10[15]),
        .I1(f_addr0_n_90),
        .I2(fstate[0]),
        .I3(fstate[1]),
        .O(f_addr[15]));
  LUT4 #(
    .INIT(16'h0A0C)) 
    \f_addr[16]_i_1 
       (.I0(in10[16]),
        .I1(f_addr0_n_89),
        .I2(fstate[0]),
        .I3(fstate[1]),
        .O(f_addr[16]));
  LUT4 #(
    .INIT(16'h0A0C)) 
    \f_addr[17]_i_1 
       (.I0(in10[17]),
        .I1(f_addr0_n_88),
        .I2(fstate[0]),
        .I3(fstate[1]),
        .O(f_addr[17]));
  LUT4 #(
    .INIT(16'h0A0C)) 
    \f_addr[18]_i_1 
       (.I0(in10[18]),
        .I1(f_addr0_n_87),
        .I2(fstate[0]),
        .I3(fstate[1]),
        .O(f_addr[18]));
  LUT4 #(
    .INIT(16'h0A0C)) 
    \f_addr[19]_i_1 
       (.I0(in10[19]),
        .I1(f_addr0_n_86),
        .I2(fstate[0]),
        .I3(fstate[1]),
        .O(f_addr[19]));
  LUT4 #(
    .INIT(16'h00CA)) 
    \f_addr[1]_i_1 
       (.I0(f_addr0_n_104),
        .I1(m_axi_hp_araddr[1]),
        .I2(fstate[1]),
        .I3(fstate[0]),
        .O(f_addr[1]));
  LUT4 #(
    .INIT(16'h0A0C)) 
    \f_addr[20]_i_1 
       (.I0(in10[20]),
        .I1(f_addr0_n_85),
        .I2(fstate[0]),
        .I3(fstate[1]),
        .O(f_addr[20]));
  LUT4 #(
    .INIT(16'h0A0C)) 
    \f_addr[21]_i_1 
       (.I0(in10[21]),
        .I1(f_addr0_n_84),
        .I2(fstate[0]),
        .I3(fstate[1]),
        .O(f_addr[21]));
  LUT4 #(
    .INIT(16'h0A0C)) 
    \f_addr[22]_i_1 
       (.I0(in10[22]),
        .I1(f_addr0_n_83),
        .I2(fstate[0]),
        .I3(fstate[1]),
        .O(f_addr[22]));
  LUT4 #(
    .INIT(16'h0A0C)) 
    \f_addr[23]_i_1 
       (.I0(in10[23]),
        .I1(f_addr0_n_82),
        .I2(fstate[0]),
        .I3(fstate[1]),
        .O(f_addr[23]));
  LUT4 #(
    .INIT(16'h0A0C)) 
    \f_addr[24]_i_1 
       (.I0(in10[24]),
        .I1(f_addr0_n_81),
        .I2(fstate[0]),
        .I3(fstate[1]),
        .O(f_addr[24]));
  LUT4 #(
    .INIT(16'h0A0C)) 
    \f_addr[25]_i_1 
       (.I0(in10[25]),
        .I1(f_addr0_n_80),
        .I2(fstate[0]),
        .I3(fstate[1]),
        .O(f_addr[25]));
  LUT4 #(
    .INIT(16'h0A0C)) 
    \f_addr[26]_i_1 
       (.I0(in10[26]),
        .I1(f_addr0_n_79),
        .I2(fstate[0]),
        .I3(fstate[1]),
        .O(f_addr[26]));
  LUT4 #(
    .INIT(16'h0A0C)) 
    \f_addr[27]_i_1 
       (.I0(in10[27]),
        .I1(f_addr0_n_78),
        .I2(fstate[0]),
        .I3(fstate[1]),
        .O(f_addr[27]));
  LUT4 #(
    .INIT(16'h0A0C)) 
    \f_addr[28]_i_1 
       (.I0(in10[28]),
        .I1(f_addr0_n_77),
        .I2(fstate[0]),
        .I3(fstate[1]),
        .O(f_addr[28]));
  LUT4 #(
    .INIT(16'h0A0C)) 
    \f_addr[29]_i_1 
       (.I0(in10[29]),
        .I1(f_addr0_n_76),
        .I2(fstate[0]),
        .I3(fstate[1]),
        .O(f_addr[29]));
  LUT4 #(
    .INIT(16'h00CA)) 
    \f_addr[2]_i_1 
       (.I0(f_addr0_n_103),
        .I1(m_axi_hp_araddr[2]),
        .I2(fstate[1]),
        .I3(fstate[0]),
        .O(f_addr[2]));
  LUT4 #(
    .INIT(16'h0A0C)) 
    \f_addr[30]_i_1 
       (.I0(in10[30]),
        .I1(f_addr0_n_75),
        .I2(fstate[0]),
        .I3(fstate[1]),
        .O(f_addr[30]));
  LUT6 #(
    .INIT(64'hAAAAAEAAAEAAAAAA)) 
    \f_addr[31]_i_1 
       (.I0(\f_addr[31]_i_3_n_0 ),
        .I1(p_3_in[0]),
        .I2(p_3_in[3]),
        .I3(\f_addr[31]_i_4_n_0 ),
        .I4(t_s2),
        .I5(t_s3),
        .O(f_burst));
  LUT4 #(
    .INIT(16'h0A0C)) 
    \f_addr[31]_i_2 
       (.I0(in10[31]),
        .I1(f_addr0_n_74),
        .I2(fstate[0]),
        .I3(fstate[1]),
        .O(f_addr[31]));
  LUT6 #(
    .INIT(64'hFFFB000000000000)) 
    \f_addr[31]_i_3 
       (.I0(\f_burst_reg_n_0_[3] ),
        .I1(\f_burst_reg_n_0_[4] ),
        .I2(\f_addr[31]_i_5_n_0 ),
        .I3(\f_burst_reg_n_0_[2] ),
        .I4(m_axi_hp_rlast),
        .I5(lb_waddr),
        .O(\f_addr[31]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \f_addr[31]_i_4 
       (.I0(fstate[0]),
        .I1(fstate[1]),
        .O(\f_addr[31]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \f_addr[31]_i_5 
       (.I0(\f_burst_reg_n_0_[0] ),
        .I1(\f_burst_reg_n_0_[1] ),
        .O(\f_addr[31]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h00CA)) 
    \f_addr[3]_i_1 
       (.I0(f_addr0_n_102),
        .I1(m_axi_hp_araddr[3]),
        .I2(fstate[1]),
        .I3(fstate[0]),
        .O(f_addr[3]));
  LUT4 #(
    .INIT(16'h00CA)) 
    \f_addr[4]_i_1 
       (.I0(f_addr0_n_101),
        .I1(m_axi_hp_araddr[4]),
        .I2(fstate[1]),
        .I3(fstate[0]),
        .O(f_addr[4]));
  LUT4 #(
    .INIT(16'h0A0C)) 
    \f_addr[5]_i_1 
       (.I0(in10[5]),
        .I1(f_addr0_n_100),
        .I2(fstate[0]),
        .I3(fstate[1]),
        .O(f_addr[5]));
  LUT4 #(
    .INIT(16'h0A0C)) 
    \f_addr[6]_i_1 
       (.I0(in10[6]),
        .I1(f_addr0_n_99),
        .I2(fstate[0]),
        .I3(fstate[1]),
        .O(f_addr[6]));
  LUT4 #(
    .INIT(16'h0A0C)) 
    \f_addr[7]_i_1 
       (.I0(in10[7]),
        .I1(f_addr0_n_98),
        .I2(fstate[0]),
        .I3(fstate[1]),
        .O(f_addr[7]));
  LUT4 #(
    .INIT(16'h0A0C)) 
    \f_addr[8]_i_1 
       (.I0(in10[8]),
        .I1(f_addr0_n_97),
        .I2(fstate[0]),
        .I3(fstate[1]),
        .O(f_addr[8]));
  LUT4 #(
    .INIT(16'h0A0C)) 
    \f_addr[9]_i_1 
       (.I0(in10[9]),
        .I1(f_addr0_n_96),
        .I2(fstate[0]),
        .I3(fstate[1]),
        .O(f_addr[9]));
  FDRE \f_addr_reg[0] 
       (.C(aclk),
        .CE(f_burst),
        .D(f_addr[0]),
        .Q(m_axi_hp_araddr[0]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \f_addr_reg[10] 
       (.C(aclk),
        .CE(f_burst),
        .D(f_addr[10]),
        .Q(m_axi_hp_araddr[10]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \f_addr_reg[11] 
       (.C(aclk),
        .CE(f_burst),
        .D(f_addr[11]),
        .Q(m_axi_hp_araddr[11]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \f_addr_reg[12] 
       (.C(aclk),
        .CE(f_burst),
        .D(f_addr[12]),
        .Q(m_axi_hp_araddr[12]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \f_addr_reg[13] 
       (.C(aclk),
        .CE(f_burst),
        .D(f_addr[13]),
        .Q(m_axi_hp_araddr[13]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \f_addr_reg[14] 
       (.C(aclk),
        .CE(f_burst),
        .D(f_addr[14]),
        .Q(m_axi_hp_araddr[14]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \f_addr_reg[15] 
       (.C(aclk),
        .CE(f_burst),
        .D(f_addr[15]),
        .Q(m_axi_hp_araddr[15]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \f_addr_reg[16] 
       (.C(aclk),
        .CE(f_burst),
        .D(f_addr[16]),
        .Q(m_axi_hp_araddr[16]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \f_addr_reg[17] 
       (.C(aclk),
        .CE(f_burst),
        .D(f_addr[17]),
        .Q(m_axi_hp_araddr[17]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \f_addr_reg[18] 
       (.C(aclk),
        .CE(f_burst),
        .D(f_addr[18]),
        .Q(m_axi_hp_araddr[18]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \f_addr_reg[19] 
       (.C(aclk),
        .CE(f_burst),
        .D(f_addr[19]),
        .Q(m_axi_hp_araddr[19]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \f_addr_reg[1] 
       (.C(aclk),
        .CE(f_burst),
        .D(f_addr[1]),
        .Q(m_axi_hp_araddr[1]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \f_addr_reg[20] 
       (.C(aclk),
        .CE(f_burst),
        .D(f_addr[20]),
        .Q(m_axi_hp_araddr[20]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \f_addr_reg[21] 
       (.C(aclk),
        .CE(f_burst),
        .D(f_addr[21]),
        .Q(m_axi_hp_araddr[21]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \f_addr_reg[22] 
       (.C(aclk),
        .CE(f_burst),
        .D(f_addr[22]),
        .Q(m_axi_hp_araddr[22]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \f_addr_reg[23] 
       (.C(aclk),
        .CE(f_burst),
        .D(f_addr[23]),
        .Q(m_axi_hp_araddr[23]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \f_addr_reg[24] 
       (.C(aclk),
        .CE(f_burst),
        .D(f_addr[24]),
        .Q(m_axi_hp_araddr[24]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \f_addr_reg[25] 
       (.C(aclk),
        .CE(f_burst),
        .D(f_addr[25]),
        .Q(m_axi_hp_araddr[25]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \f_addr_reg[26] 
       (.C(aclk),
        .CE(f_burst),
        .D(f_addr[26]),
        .Q(m_axi_hp_araddr[26]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \f_addr_reg[27] 
       (.C(aclk),
        .CE(f_burst),
        .D(f_addr[27]),
        .Q(m_axi_hp_araddr[27]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \f_addr_reg[28] 
       (.C(aclk),
        .CE(f_burst),
        .D(f_addr[28]),
        .Q(m_axi_hp_araddr[28]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \f_addr_reg[29] 
       (.C(aclk),
        .CE(f_burst),
        .D(f_addr[29]),
        .Q(m_axi_hp_araddr[29]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \f_addr_reg[2] 
       (.C(aclk),
        .CE(f_burst),
        .D(f_addr[2]),
        .Q(m_axi_hp_araddr[2]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \f_addr_reg[30] 
       (.C(aclk),
        .CE(f_burst),
        .D(f_addr[30]),
        .Q(m_axi_hp_araddr[30]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \f_addr_reg[31] 
       (.C(aclk),
        .CE(f_burst),
        .D(f_addr[31]),
        .Q(m_axi_hp_araddr[31]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \f_addr_reg[3] 
       (.C(aclk),
        .CE(f_burst),
        .D(f_addr[3]),
        .Q(m_axi_hp_araddr[3]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \f_addr_reg[4] 
       (.C(aclk),
        .CE(f_burst),
        .D(f_addr[4]),
        .Q(m_axi_hp_araddr[4]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \f_addr_reg[5] 
       (.C(aclk),
        .CE(f_burst),
        .D(f_addr[5]),
        .Q(m_axi_hp_araddr[5]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \f_addr_reg[6] 
       (.C(aclk),
        .CE(f_burst),
        .D(f_addr[6]),
        .Q(m_axi_hp_araddr[6]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \f_addr_reg[7] 
       (.C(aclk),
        .CE(f_burst),
        .D(f_addr[7]),
        .Q(m_axi_hp_araddr[7]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \f_addr_reg[8] 
       (.C(aclk),
        .CE(f_burst),
        .D(f_addr[8]),
        .Q(m_axi_hp_araddr[8]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \f_addr_reg[9] 
       (.C(aclk),
        .CE(f_burst),
        .D(f_addr[9]),
        .Q(m_axi_hp_araddr[9]),
        .R(\rdata_q[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \f_burst[0]_i_1 
       (.I0(fstate[0]),
        .I1(fstate[1]),
        .I2(\f_burst_reg_n_0_[0] ),
        .O(\f_burst[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'h0440)) 
    \f_burst[1]_i_1 
       (.I0(fstate[0]),
        .I1(fstate[1]),
        .I2(\f_burst_reg_n_0_[1] ),
        .I3(\f_burst_reg_n_0_[0] ),
        .O(\f_burst[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT5 #(
    .INIT(32'h04404040)) 
    \f_burst[2]_i_1 
       (.I0(fstate[0]),
        .I1(fstate[1]),
        .I2(\f_burst_reg_n_0_[2] ),
        .I3(\f_burst_reg_n_0_[0] ),
        .I4(\f_burst_reg_n_0_[1] ),
        .O(\f_burst[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0440404040404040)) 
    \f_burst[3]_i_1 
       (.I0(fstate[0]),
        .I1(fstate[1]),
        .I2(\f_burst_reg_n_0_[3] ),
        .I3(\f_burst_reg_n_0_[2] ),
        .I4(\f_burst_reg_n_0_[1] ),
        .I5(\f_burst_reg_n_0_[0] ),
        .O(\f_burst[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2888888888888888)) 
    \f_burst[4]_i_1 
       (.I0(arvalid_q2_i_2_n_0),
        .I1(\f_burst_reg_n_0_[4] ),
        .I2(\f_burst_reg_n_0_[3] ),
        .I3(\f_burst_reg_n_0_[2] ),
        .I4(\f_burst_reg_n_0_[1] ),
        .I5(\f_burst_reg_n_0_[0] ),
        .O(\f_burst[4]_i_1_n_0 ));
  FDRE \f_burst_reg[0] 
       (.C(aclk),
        .CE(f_burst),
        .D(\f_burst[0]_i_1_n_0 ),
        .Q(\f_burst_reg_n_0_[0] ),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \f_burst_reg[1] 
       (.C(aclk),
        .CE(f_burst),
        .D(\f_burst[1]_i_1_n_0 ),
        .Q(\f_burst_reg_n_0_[1] ),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \f_burst_reg[2] 
       (.C(aclk),
        .CE(f_burst),
        .D(\f_burst[2]_i_1_n_0 ),
        .Q(\f_burst_reg_n_0_[2] ),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \f_burst_reg[3] 
       (.C(aclk),
        .CE(f_burst),
        .D(\f_burst[3]_i_1_n_0 ),
        .Q(\f_burst_reg_n_0_[3] ),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \f_burst_reg[4] 
       (.C(aclk),
        .CE(f_burst),
        .D(\f_burst[4]_i_1_n_0 ),
        .Q(\f_burst_reg_n_0_[4] ),
        .R(\rdata_q[31]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \f_line[0]_i_1 
       (.I0(line_req_num),
        .I1(f_line),
        .I2(\f_line_reg_n_0_[0] ),
        .O(\f_line[0]_i_1_n_0 ));
  FDRE \f_line_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(\f_line[0]_i_1_n_0 ),
        .Q(\f_line_reg_n_0_[0] ),
        .R(\rdata_q[31]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h04)) 
    \f_word[0]_i_1 
       (.I0(fstate[0]),
        .I1(fstate[1]),
        .I2(\f_word_reg_n_0_[0] ),
        .O(f_word[0]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'h0440)) 
    \f_word[1]_i_1 
       (.I0(fstate[0]),
        .I1(fstate[1]),
        .I2(\f_word_reg_n_0_[1] ),
        .I3(\f_word_reg_n_0_[0] ),
        .O(f_word[1]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT5 #(
    .INIT(32'h04404040)) 
    \f_word[2]_i_1 
       (.I0(fstate[0]),
        .I1(fstate[1]),
        .I2(\f_word_reg_n_0_[2] ),
        .I3(\f_word_reg_n_0_[0] ),
        .I4(\f_word_reg_n_0_[1] ),
        .O(f_word[2]));
  LUT6 #(
    .INIT(64'h0440404040404040)) 
    \f_word[3]_i_1 
       (.I0(fstate[0]),
        .I1(fstate[1]),
        .I2(\f_word_reg_n_0_[3] ),
        .I3(\f_word_reg_n_0_[1] ),
        .I4(\f_word_reg_n_0_[0] ),
        .I5(\f_word_reg_n_0_[2] ),
        .O(f_word[3]));
  LUT6 #(
    .INIT(64'h2888888888888888)) 
    \f_word[4]_i_1 
       (.I0(arvalid_q2_i_2_n_0),
        .I1(\f_word_reg_n_0_[4] ),
        .I2(\f_word_reg_n_0_[2] ),
        .I3(\f_word_reg_n_0_[0] ),
        .I4(\f_word_reg_n_0_[1] ),
        .I5(\f_word_reg_n_0_[3] ),
        .O(f_word[4]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'h0440)) 
    \f_word[5]_i_1 
       (.I0(fstate[0]),
        .I1(fstate[1]),
        .I2(\f_word_reg_n_0_[5] ),
        .I3(\f_word[8]_i_3_n_0 ),
        .O(f_word[5]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT5 #(
    .INIT(32'h04404040)) 
    \f_word[6]_i_1 
       (.I0(fstate[0]),
        .I1(fstate[1]),
        .I2(\f_word_reg_n_0_[6] ),
        .I3(\f_word[8]_i_3_n_0 ),
        .I4(\f_word_reg_n_0_[5] ),
        .O(f_word[6]));
  LUT6 #(
    .INIT(64'h0440404040404040)) 
    \f_word[7]_i_1 
       (.I0(fstate[0]),
        .I1(fstate[1]),
        .I2(\f_word_reg_n_0_[7] ),
        .I3(\f_word_reg_n_0_[6] ),
        .I4(\f_word_reg_n_0_[5] ),
        .I5(\f_word[8]_i_3_n_0 ),
        .O(f_word[7]));
  LUT6 #(
    .INIT(64'hFFFFFFFF00202000)) 
    \f_word[8]_i_1 
       (.I0(p_3_in[0]),
        .I1(p_3_in[3]),
        .I2(\f_addr[31]_i_4_n_0 ),
        .I3(t_s2),
        .I4(t_s3),
        .I5(lb_waddr),
        .O(f_word_3));
  LUT6 #(
    .INIT(64'h2888888888888888)) 
    \f_word[8]_i_2 
       (.I0(arvalid_q2_i_2_n_0),
        .I1(\f_word_reg_n_0_[8] ),
        .I2(\f_word_reg_n_0_[5] ),
        .I3(\f_word_reg_n_0_[6] ),
        .I4(\f_word_reg_n_0_[7] ),
        .I5(\f_word[8]_i_3_n_0 ),
        .O(f_word[8]));
  LUT5 #(
    .INIT(32'h80000000)) 
    \f_word[8]_i_3 
       (.I0(\f_word_reg_n_0_[3] ),
        .I1(\f_word_reg_n_0_[1] ),
        .I2(\f_word_reg_n_0_[0] ),
        .I3(\f_word_reg_n_0_[2] ),
        .I4(\f_word_reg_n_0_[4] ),
        .O(\f_word[8]_i_3_n_0 ));
  FDRE \f_word_reg[0] 
       (.C(aclk),
        .CE(f_word_3),
        .D(f_word[0]),
        .Q(\f_word_reg_n_0_[0] ),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \f_word_reg[1] 
       (.C(aclk),
        .CE(f_word_3),
        .D(f_word[1]),
        .Q(\f_word_reg_n_0_[1] ),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \f_word_reg[2] 
       (.C(aclk),
        .CE(f_word_3),
        .D(f_word[2]),
        .Q(\f_word_reg_n_0_[2] ),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \f_word_reg[3] 
       (.C(aclk),
        .CE(f_word_3),
        .D(f_word[3]),
        .Q(\f_word_reg_n_0_[3] ),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \f_word_reg[4] 
       (.C(aclk),
        .CE(f_word_3),
        .D(f_word[4]),
        .Q(\f_word_reg_n_0_[4] ),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \f_word_reg[5] 
       (.C(aclk),
        .CE(f_word_3),
        .D(f_word[5]),
        .Q(\f_word_reg_n_0_[5] ),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \f_word_reg[6] 
       (.C(aclk),
        .CE(f_word_3),
        .D(f_word[6]),
        .Q(\f_word_reg_n_0_[6] ),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \f_word_reg[7] 
       (.C(aclk),
        .CE(f_word_3),
        .D(f_word[7]),
        .Q(\f_word_reg_n_0_[7] ),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \f_word_reg[8] 
       (.C(aclk),
        .CE(f_word_3),
        .D(f_word[8]),
        .Q(\f_word_reg_n_0_[8] ),
        .R(\rdata_q[31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000020000)) 
    \fb_base[31]_i_1 
       (.I0(ctrl_enable1),
        .I1(ctrl_enable_i_3_n_0),
        .I2(\awaddr_q_reg_n_0_[3] ),
        .I3(\awaddr_q_reg_n_0_[0] ),
        .I4(\awaddr_q_reg_n_0_[2] ),
        .I5(\awaddr_q_reg_n_0_[1] ),
        .O(fb_base_0));
  FDRE \fb_base_reg[0] 
       (.C(aclk),
        .CE(fb_base_0),
        .D(\wdata_q_reg_n_0_[0] ),
        .Q(fb_base[0]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \fb_base_reg[10] 
       (.C(aclk),
        .CE(fb_base_0),
        .D(\wdata_q_reg_n_0_[10] ),
        .Q(fb_base[10]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \fb_base_reg[11] 
       (.C(aclk),
        .CE(fb_base_0),
        .D(\wdata_q_reg_n_0_[11] ),
        .Q(fb_base[11]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \fb_base_reg[12] 
       (.C(aclk),
        .CE(fb_base_0),
        .D(\wdata_q_reg_n_0_[12] ),
        .Q(fb_base[12]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \fb_base_reg[13] 
       (.C(aclk),
        .CE(fb_base_0),
        .D(\wdata_q_reg_n_0_[13] ),
        .Q(fb_base[13]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \fb_base_reg[14] 
       (.C(aclk),
        .CE(fb_base_0),
        .D(\wdata_q_reg_n_0_[14] ),
        .Q(fb_base[14]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \fb_base_reg[15] 
       (.C(aclk),
        .CE(fb_base_0),
        .D(\wdata_q_reg_n_0_[15] ),
        .Q(fb_base[15]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \fb_base_reg[16] 
       (.C(aclk),
        .CE(fb_base_0),
        .D(\wdata_q_reg_n_0_[16] ),
        .Q(fb_base[16]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \fb_base_reg[17] 
       (.C(aclk),
        .CE(fb_base_0),
        .D(\wdata_q_reg_n_0_[17] ),
        .Q(fb_base[17]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \fb_base_reg[18] 
       (.C(aclk),
        .CE(fb_base_0),
        .D(\wdata_q_reg_n_0_[18] ),
        .Q(fb_base[18]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \fb_base_reg[19] 
       (.C(aclk),
        .CE(fb_base_0),
        .D(\wdata_q_reg_n_0_[19] ),
        .Q(fb_base[19]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \fb_base_reg[1] 
       (.C(aclk),
        .CE(fb_base_0),
        .D(\wdata_q_reg_n_0_[1] ),
        .Q(fb_base[1]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDSE \fb_base_reg[20] 
       (.C(aclk),
        .CE(fb_base_0),
        .D(\wdata_q_reg_n_0_[20] ),
        .Q(fb_base[20]),
        .S(\rdata_q[31]_i_1_n_0 ));
  FDRE \fb_base_reg[21] 
       (.C(aclk),
        .CE(fb_base_0),
        .D(\wdata_q_reg_n_0_[21] ),
        .Q(fb_base[21]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \fb_base_reg[22] 
       (.C(aclk),
        .CE(fb_base_0),
        .D(\wdata_q_reg_n_0_[22] ),
        .Q(fb_base[22]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \fb_base_reg[23] 
       (.C(aclk),
        .CE(fb_base_0),
        .D(\wdata_q_reg_n_0_[23] ),
        .Q(fb_base[23]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \fb_base_reg[24] 
       (.C(aclk),
        .CE(fb_base_0),
        .D(\wdata_q_reg_n_0_[24] ),
        .Q(fb_base[24]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \fb_base_reg[25] 
       (.C(aclk),
        .CE(fb_base_0),
        .D(\wdata_q_reg_n_0_[25] ),
        .Q(fb_base[25]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \fb_base_reg[26] 
       (.C(aclk),
        .CE(fb_base_0),
        .D(\wdata_q_reg_n_0_[26] ),
        .Q(fb_base[26]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \fb_base_reg[27] 
       (.C(aclk),
        .CE(fb_base_0),
        .D(\wdata_q_reg_n_0_[27] ),
        .Q(fb_base[27]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDSE \fb_base_reg[28] 
       (.C(aclk),
        .CE(fb_base_0),
        .D(\wdata_q_reg_n_0_[28] ),
        .Q(fb_base[28]),
        .S(\rdata_q[31]_i_1_n_0 ));
  FDRE \fb_base_reg[29] 
       (.C(aclk),
        .CE(fb_base_0),
        .D(\wdata_q_reg_n_0_[29] ),
        .Q(fb_base[29]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \fb_base_reg[2] 
       (.C(aclk),
        .CE(fb_base_0),
        .D(\wdata_q_reg_n_0_[2] ),
        .Q(fb_base[2]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \fb_base_reg[30] 
       (.C(aclk),
        .CE(fb_base_0),
        .D(\wdata_q_reg_n_0_[30] ),
        .Q(fb_base[30]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \fb_base_reg[31] 
       (.C(aclk),
        .CE(fb_base_0),
        .D(\wdata_q_reg_n_0_[31] ),
        .Q(fb_base[31]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \fb_base_reg[3] 
       (.C(aclk),
        .CE(fb_base_0),
        .D(\wdata_q_reg_n_0_[3] ),
        .Q(fb_base[3]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \fb_base_reg[4] 
       (.C(aclk),
        .CE(fb_base_0),
        .D(\wdata_q_reg_n_0_[4] ),
        .Q(fb_base[4]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \fb_base_reg[5] 
       (.C(aclk),
        .CE(fb_base_0),
        .D(p_1_in),
        .Q(fb_base[5]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \fb_base_reg[6] 
       (.C(aclk),
        .CE(fb_base_0),
        .D(\wdata_q_reg_n_0_[6] ),
        .Q(fb_base[6]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \fb_base_reg[7] 
       (.C(aclk),
        .CE(fb_base_0),
        .D(\wdata_q_reg_n_0_[7] ),
        .Q(fb_base[7]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \fb_base_reg[8] 
       (.C(aclk),
        .CE(fb_base_0),
        .D(\wdata_q_reg_n_0_[8] ),
        .Q(fb_base[8]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \fb_base_reg[9] 
       (.C(aclk),
        .CE(fb_base_0),
        .D(\wdata_q_reg_n_0_[9] ),
        .Q(fb_base[9]),
        .R(\rdata_q[31]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0660)) 
    fetch_overrun_set_i_1
       (.I0(fstate[1]),
        .I1(fstate[0]),
        .I2(t_s2),
        .I3(t_s3),
        .O(fetch_overrun_set_4));
  FDRE fetch_overrun_set_reg
       (.C(aclk),
        .CE(1'b1),
        .D(fetch_overrun_set_4),
        .Q(fetch_overrun_set),
        .R(\rdata_q[31]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h82)) 
    \frame_cnt_pix[0]_i_1 
       (.I0(en_p2),
        .I1(\frame_cnt_pix[5]_i_2_n_0 ),
        .I2(frame_cnt_pix_reg[0]),
        .O(\frame_cnt_pix[0]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hA6)) 
    \frame_cnt_pix[1]_i_1 
       (.I0(frame_cnt_pix_reg[1]),
        .I1(frame_cnt_pix_reg[0]),
        .I2(\frame_cnt_pix[7]_i_3_n_0 ),
        .O(\frame_cnt_pix[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h9AAA)) 
    \frame_cnt_pix[2]_i_1 
       (.I0(frame_cnt_pix_reg[2]),
        .I1(\frame_cnt_pix[7]_i_3_n_0 ),
        .I2(frame_cnt_pix_reg[1]),
        .I3(frame_cnt_pix_reg[0]),
        .O(\frame_cnt_pix[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h9AAAAAAA)) 
    \frame_cnt_pix[3]_i_1 
       (.I0(frame_cnt_pix_reg[3]),
        .I1(\frame_cnt_pix[7]_i_3_n_0 ),
        .I2(frame_cnt_pix_reg[0]),
        .I3(frame_cnt_pix_reg[1]),
        .I4(frame_cnt_pix_reg[2]),
        .O(\frame_cnt_pix[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAA6AAAAAAA)) 
    \frame_cnt_pix[4]_i_1 
       (.I0(frame_cnt_pix_reg[4]),
        .I1(frame_cnt_pix_reg[3]),
        .I2(frame_cnt_pix_reg[2]),
        .I3(frame_cnt_pix_reg[1]),
        .I4(frame_cnt_pix_reg[0]),
        .I5(\frame_cnt_pix[7]_i_3_n_0 ),
        .O(\frame_cnt_pix[4]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hCCC00404)) 
    \frame_cnt_pix[5]_i_1 
       (.I0(\frame_cnt_pix[7]_i_3_n_0 ),
        .I1(en_p2),
        .I2(\frame_cnt_pix[7]_i_2_n_0 ),
        .I3(\frame_cnt_pix[5]_i_2_n_0 ),
        .I4(frame_cnt_pix_reg[5]),
        .O(\frame_cnt_pix[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'hBAFFFFFF)) 
    \frame_cnt_pix[5]_i_2 
       (.I0(\vcnt[9]_i_5_n_0 ),
        .I1(\vcnt_reg_n_0_[1] ),
        .I2(rd_addr_next),
        .I3(\vcnt_reg_n_0_[2] ),
        .I4(vcnt),
        .O(\frame_cnt_pix[5]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hA9AA)) 
    \frame_cnt_pix[6]_i_1 
       (.I0(frame_cnt_pix_reg[6]),
        .I1(\frame_cnt_pix[7]_i_2_n_0 ),
        .I2(\frame_cnt_pix[7]_i_3_n_0 ),
        .I3(frame_cnt_pix_reg[5]),
        .O(\frame_cnt_pix[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEFFF100000000000)) 
    \frame_cnt_pix[7]_i_1 
       (.I0(\frame_cnt_pix[7]_i_2_n_0 ),
        .I1(\frame_cnt_pix[7]_i_3_n_0 ),
        .I2(frame_cnt_pix_reg[5]),
        .I3(frame_cnt_pix_reg[6]),
        .I4(frame_cnt_pix_reg[7]),
        .I5(en_p2),
        .O(\frame_cnt_pix[7]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    \frame_cnt_pix[7]_i_2 
       (.I0(frame_cnt_pix_reg[4]),
        .I1(frame_cnt_pix_reg[0]),
        .I2(frame_cnt_pix_reg[1]),
        .I3(frame_cnt_pix_reg[2]),
        .I4(frame_cnt_pix_reg[3]),
        .O(\frame_cnt_pix[7]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT3 #(
    .INIT(8'hDF)) 
    \frame_cnt_pix[7]_i_3 
       (.I0(\vcnt_reg_n_0_[9] ),
        .I1(\frame_cnt_pix[7]_i_4_n_0 ),
        .I2(vcnt),
        .O(\frame_cnt_pix[7]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFEFFFF)) 
    \frame_cnt_pix[7]_i_4 
       (.I0(\frame_cnt_pix[7]_i_5_n_0 ),
        .I1(\vcnt_reg_n_0_[6] ),
        .I2(\vcnt_reg_n_0_[7] ),
        .I3(\vcnt_reg_n_0_[8] ),
        .I4(\vcnt_reg_n_0_[2] ),
        .I5(\frame_cnt_pix[7]_i_6_n_0 ),
        .O(\frame_cnt_pix[7]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'hFEFFFFFF)) 
    \frame_cnt_pix[7]_i_5 
       (.I0(\vcnt_reg_n_0_[5] ),
        .I1(\vcnt_reg_n_0_[4] ),
        .I2(\vcnt_reg_n_0_[1] ),
        .I3(\vcnt_reg_n_0_[2] ),
        .I4(\vcnt_reg_n_0_[3] ),
        .O(\frame_cnt_pix[7]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \frame_cnt_pix[7]_i_6 
       (.I0(rd_addr_next),
        .I1(\vcnt_reg_n_0_[1] ),
        .O(\frame_cnt_pix[7]_i_6_n_0 ));
  FDRE \frame_cnt_pix_reg[0] 
       (.C(pixel_clk),
        .CE(1'b1),
        .D(\frame_cnt_pix[0]_i_1_n_0 ),
        .Q(frame_cnt_pix_reg[0]),
        .R(1'b0));
  FDRE \frame_cnt_pix_reg[1] 
       (.C(pixel_clk),
        .CE(1'b1),
        .D(\frame_cnt_pix[1]_i_1_n_0 ),
        .Q(frame_cnt_pix_reg[1]),
        .R(\vcnt[9]_i_1_n_0 ));
  FDRE \frame_cnt_pix_reg[2] 
       (.C(pixel_clk),
        .CE(1'b1),
        .D(\frame_cnt_pix[2]_i_1_n_0 ),
        .Q(frame_cnt_pix_reg[2]),
        .R(\vcnt[9]_i_1_n_0 ));
  FDRE \frame_cnt_pix_reg[3] 
       (.C(pixel_clk),
        .CE(1'b1),
        .D(\frame_cnt_pix[3]_i_1_n_0 ),
        .Q(frame_cnt_pix_reg[3]),
        .R(\vcnt[9]_i_1_n_0 ));
  FDRE \frame_cnt_pix_reg[4] 
       (.C(pixel_clk),
        .CE(1'b1),
        .D(\frame_cnt_pix[4]_i_1_n_0 ),
        .Q(frame_cnt_pix_reg[4]),
        .R(\vcnt[9]_i_1_n_0 ));
  FDRE \frame_cnt_pix_reg[5] 
       (.C(pixel_clk),
        .CE(1'b1),
        .D(\frame_cnt_pix[5]_i_1_n_0 ),
        .Q(frame_cnt_pix_reg[5]),
        .R(1'b0));
  FDRE \frame_cnt_pix_reg[6] 
       (.C(pixel_clk),
        .CE(1'b1),
        .D(\frame_cnt_pix[6]_i_1_n_0 ),
        .Q(frame_cnt_pix_reg[6]),
        .R(\vcnt[9]_i_1_n_0 ));
  FDRE \frame_cnt_pix_reg[7] 
       (.C(pixel_clk),
        .CE(1'b1),
        .D(\frame_cnt_pix[7]_i_1_n_0 ),
        .Q(frame_cnt_pix_reg[7]),
        .R(1'b0));
  FDRE \frame_cnt_s1_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(frame_cnt_pix_reg[0]),
        .Q(frame_cnt_s1[0]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \frame_cnt_s1_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(frame_cnt_pix_reg[1]),
        .Q(frame_cnt_s1[1]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \frame_cnt_s1_reg[2] 
       (.C(aclk),
        .CE(1'b1),
        .D(frame_cnt_pix_reg[2]),
        .Q(frame_cnt_s1[2]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \frame_cnt_s1_reg[3] 
       (.C(aclk),
        .CE(1'b1),
        .D(frame_cnt_pix_reg[3]),
        .Q(frame_cnt_s1[3]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \frame_cnt_s1_reg[4] 
       (.C(aclk),
        .CE(1'b1),
        .D(frame_cnt_pix_reg[4]),
        .Q(frame_cnt_s1[4]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \frame_cnt_s1_reg[5] 
       (.C(aclk),
        .CE(1'b1),
        .D(frame_cnt_pix_reg[5]),
        .Q(frame_cnt_s1[5]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \frame_cnt_s1_reg[6] 
       (.C(aclk),
        .CE(1'b1),
        .D(frame_cnt_pix_reg[6]),
        .Q(frame_cnt_s1[6]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \frame_cnt_s1_reg[7] 
       (.C(aclk),
        .CE(1'b1),
        .D(frame_cnt_pix_reg[7]),
        .Q(frame_cnt_s1[7]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \frame_cnt_s2_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(frame_cnt_s1[0]),
        .Q(data2[8]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \frame_cnt_s2_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(frame_cnt_s1[1]),
        .Q(data2[9]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \frame_cnt_s2_reg[2] 
       (.C(aclk),
        .CE(1'b1),
        .D(frame_cnt_s1[2]),
        .Q(data2[10]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \frame_cnt_s2_reg[3] 
       (.C(aclk),
        .CE(1'b1),
        .D(frame_cnt_s1[3]),
        .Q(data2[11]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \frame_cnt_s2_reg[4] 
       (.C(aclk),
        .CE(1'b1),
        .D(frame_cnt_s1[4]),
        .Q(data2[12]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \frame_cnt_s2_reg[5] 
       (.C(aclk),
        .CE(1'b1),
        .D(frame_cnt_s1[5]),
        .Q(data2[13]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \frame_cnt_s2_reg[6] 
       (.C(aclk),
        .CE(1'b1),
        .D(frame_cnt_s1[6]),
        .Q(data2[14]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \frame_cnt_s2_reg[7] 
       (.C(aclk),
        .CE(1'b1),
        .D(frame_cnt_s1[7]),
        .Q(data2[15]),
        .R(\rdata_q[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \hcnt[0]_i_1 
       (.I0(\hcnt_reg_n_0_[0] ),
        .O(\hcnt[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \hcnt[1]_i_1 
       (.I0(p_0_in_2[0]),
        .I1(\hcnt_reg_n_0_[0] ),
        .O(\hcnt[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \hcnt[2]_i_1 
       (.I0(p_0_in_2[1]),
        .I1(\hcnt_reg_n_0_[0] ),
        .I2(p_0_in_2[0]),
        .O(\hcnt[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \hcnt[3]_i_1 
       (.I0(p_0_in_2[2]),
        .I1(p_0_in_2[0]),
        .I2(\hcnt_reg_n_0_[0] ),
        .I3(p_0_in_2[1]),
        .O(\hcnt[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \hcnt[4]_i_1 
       (.I0(p_0_in_2[3]),
        .I1(\hcnt_reg_n_0_[0] ),
        .I2(p_0_in_2[1]),
        .I3(p_0_in_2[0]),
        .I4(p_0_in_2[2]),
        .O(\hcnt[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \hcnt[5]_i_1 
       (.I0(\hcnt_reg_n_0_[0] ),
        .I1(p_0_in_2[1]),
        .I2(p_0_in_2[0]),
        .I3(p_0_in_2[2]),
        .I4(p_0_in_2[3]),
        .I5(p_0_in_2[4]),
        .O(\hcnt[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'h9AAAAAAA)) 
    \hcnt[6]_i_1 
       (.I0(p_0_in_2[5]),
        .I1(\hcnt[7]_i_2_n_0 ),
        .I2(\hcnt_reg_n_0_[0] ),
        .I3(p_0_in_2[3]),
        .I4(p_0_in_2[4]),
        .O(\hcnt[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAA6AAAAAAA)) 
    \hcnt[7]_i_1 
       (.I0(p_0_in_2[6]),
        .I1(\hcnt_reg_n_0_[0] ),
        .I2(p_0_in_2[3]),
        .I3(p_0_in_2[4]),
        .I4(p_0_in_2[5]),
        .I5(\hcnt[7]_i_2_n_0 ),
        .O(\hcnt[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    \hcnt[7]_i_2 
       (.I0(p_0_in_2[1]),
        .I1(p_0_in_2[0]),
        .I2(p_0_in_2[2]),
        .O(\hcnt[7]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \hcnt[8]_i_1 
       (.I0(p_0_in_2[7]),
        .I1(\hcnt_reg_n_0_[0] ),
        .I2(p_0_in_2[6]),
        .I3(\hcnt[9]_i_3_n_0 ),
        .O(\hcnt[8]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \hcnt[9]_i_1 
       (.I0(vcnt),
        .I1(en_p2),
        .O(\hcnt[9]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \hcnt[9]_i_2 
       (.I0(p_0_in_2[8]),
        .I1(p_0_in_2[6]),
        .I2(p_0_in_2[7]),
        .I3(\hcnt[9]_i_3_n_0 ),
        .I4(\hcnt_reg_n_0_[0] ),
        .O(\hcnt[9]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \hcnt[9]_i_3 
       (.I0(p_0_in_2[3]),
        .I1(p_0_in_2[4]),
        .I2(p_0_in_2[5]),
        .I3(p_0_in_2[2]),
        .I4(p_0_in_2[0]),
        .I5(p_0_in_2[1]),
        .O(\hcnt[9]_i_3_n_0 ));
  FDRE \hcnt_reg[0] 
       (.C(pixel_clk),
        .CE(1'b1),
        .D(\hcnt[0]_i_1_n_0 ),
        .Q(\hcnt_reg_n_0_[0] ),
        .R(\hcnt[9]_i_1_n_0 ));
  FDRE \hcnt_reg[1] 
       (.C(pixel_clk),
        .CE(1'b1),
        .D(\hcnt[1]_i_1_n_0 ),
        .Q(p_0_in_2[0]),
        .R(\hcnt[9]_i_1_n_0 ));
  FDRE \hcnt_reg[2] 
       (.C(pixel_clk),
        .CE(1'b1),
        .D(\hcnt[2]_i_1_n_0 ),
        .Q(p_0_in_2[1]),
        .R(\hcnt[9]_i_1_n_0 ));
  FDRE \hcnt_reg[3] 
       (.C(pixel_clk),
        .CE(1'b1),
        .D(\hcnt[3]_i_1_n_0 ),
        .Q(p_0_in_2[2]),
        .R(\hcnt[9]_i_1_n_0 ));
  FDRE \hcnt_reg[4] 
       (.C(pixel_clk),
        .CE(1'b1),
        .D(\hcnt[4]_i_1_n_0 ),
        .Q(p_0_in_2[3]),
        .R(\hcnt[9]_i_1_n_0 ));
  FDRE \hcnt_reg[5] 
       (.C(pixel_clk),
        .CE(1'b1),
        .D(\hcnt[5]_i_1_n_0 ),
        .Q(p_0_in_2[4]),
        .R(\hcnt[9]_i_1_n_0 ));
  FDRE \hcnt_reg[6] 
       (.C(pixel_clk),
        .CE(1'b1),
        .D(\hcnt[6]_i_1_n_0 ),
        .Q(p_0_in_2[5]),
        .R(\hcnt[9]_i_1_n_0 ));
  FDRE \hcnt_reg[7] 
       (.C(pixel_clk),
        .CE(1'b1),
        .D(\hcnt[7]_i_1_n_0 ),
        .Q(p_0_in_2[6]),
        .R(\hcnt[9]_i_1_n_0 ));
  FDRE \hcnt_reg[8] 
       (.C(pixel_clk),
        .CE(1'b1),
        .D(\hcnt[8]_i_1_n_0 ),
        .Q(p_0_in_2[7]),
        .R(\hcnt[9]_i_1_n_0 ));
  FDRE \hcnt_reg[9] 
       (.C(pixel_clk),
        .CE(1'b1),
        .D(\hcnt[9]_i_2_n_0 ),
        .Q(p_0_in_2[8]),
        .R(\hcnt[9]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \hdmi_d_q[0]_i_1 
       (.I0(\hdmi_d_q[8]_i_3_n_0 ),
        .I1(ycs_p2),
        .I2(\hdmi_d_q[8]_i_2_n_0 ),
        .O(\hdmi_d_q[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h88888888BBB888B8)) 
    \hdmi_d_q[10]_i_1 
       (.I0(\hdmi_d_q[10]_i_2_n_0 ),
        .I1(ycs_p2),
        .I2(\lb_rdata_reg_n_0_[2] ),
        .I3(\hcnt_reg_n_0_[0] ),
        .I4(\lb_rdata_reg_n_0_[18] ),
        .I5(tp_p2),
        .O(\hdmi_d_q[10]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00E2FFFF00E20000)) 
    \hdmi_d_q[10]_i_2 
       (.I0(\lb_rdata_reg_n_0_[2] ),
        .I1(\hcnt_reg_n_0_[0] ),
        .I2(\lb_rdata_reg_n_0_[18] ),
        .I3(tp_p2),
        .I4(mono_p2),
        .I5(\hdmi_d_q[10]_i_3_n_0 ),
        .O(\hdmi_d_q[10]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hCC10FFFFCC100000)) 
    \hdmi_d_q[10]_i_3 
       (.I0(p_0_in_2[6]),
        .I1(p_0_in_2[8]),
        .I2(p_0_in_2[7]),
        .I3(\hcnt_reg_n_0_[0] ),
        .I4(tp_p2),
        .I5(\hdmi_d_q[10]_i_4_n_0 ),
        .O(\hdmi_d_q[10]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT4 #(
    .INIT(16'hEB28)) 
    \hdmi_d_q[10]_i_4 
       (.I0(\lb_rdata_reg_n_0_[26] ),
        .I1(\hcnt_reg_n_0_[0] ),
        .I2(ccs_p2),
        .I3(\lb_rdata_reg_n_0_[10] ),
        .O(\hdmi_d_q[10]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'hB8AA)) 
    \hdmi_d_q[11]_i_1 
       (.I0(\hdmi_d_q[11]_i_2_n_0 ),
        .I1(mono_p2),
        .I2(\hdmi_d_q[11]_i_3_n_0 ),
        .I3(ycs_p2),
        .O(\hdmi_d_q[11]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEEEEEEEEF0FFF000)) 
    \hdmi_d_q[11]_i_2 
       (.I0(\vga_q[1]_i_2_n_0 ),
        .I1(p_0_in_2[8]),
        .I2(\lb_rdata_reg_n_0_[19] ),
        .I3(\hcnt_reg_n_0_[0] ),
        .I4(\lb_rdata_reg_n_0_[3] ),
        .I5(tp_p2),
        .O(\hdmi_d_q[11]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAA40FFFFAA400000)) 
    \hdmi_d_q[11]_i_3 
       (.I0(p_0_in_2[8]),
        .I1(p_0_in_2[7]),
        .I2(p_0_in_2[6]),
        .I3(\hcnt_reg_n_0_[0] ),
        .I4(tp_p2),
        .I5(\hdmi_d_q[11]_i_4_n_0 ),
        .O(\hdmi_d_q[11]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hEB28)) 
    \hdmi_d_q[11]_i_4 
       (.I0(\lb_rdata_reg_n_0_[27] ),
        .I1(\hcnt_reg_n_0_[0] ),
        .I2(ccs_p2),
        .I3(\lb_rdata_reg_n_0_[11] ),
        .O(\hdmi_d_q[11]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT4 #(
    .INIT(16'hB8AA)) 
    \hdmi_d_q[12]_i_1 
       (.I0(\vga_q[0]_i_1_n_0 ),
        .I1(mono_p2),
        .I2(\hdmi_d_q[12]_i_2_n_0 ),
        .I3(ycs_p2),
        .O(\hdmi_d_q[12]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF54450440)) 
    \hdmi_d_q[12]_i_2 
       (.I0(tp_p2),
        .I1(\lb_rdata_reg_n_0_[28] ),
        .I2(\hcnt_reg_n_0_[0] ),
        .I3(ccs_p2),
        .I4(\lb_rdata_reg_n_0_[12] ),
        .I5(\hdmi_d_q[12]_i_3_n_0 ),
        .O(\hdmi_d_q[12]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT5 #(
    .INIT(32'h0808AAA8)) 
    \hdmi_d_q[12]_i_3 
       (.I0(tp_p2),
        .I1(p_0_in_2[6]),
        .I2(p_0_in_2[8]),
        .I3(p_0_in_2[7]),
        .I4(\hcnt_reg_n_0_[0] ),
        .O(\hdmi_d_q[12]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \hdmi_d_q[13]_i_1 
       (.I0(\hdmi_d_q[13]_i_2_n_0 ),
        .I1(ycs_p2),
        .I2(\vga_q[1]_i_1_n_0 ),
        .O(\hdmi_d_q[13]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h88888888BBBB88B8)) 
    \hdmi_d_q[13]_i_2 
       (.I0(\vga_q[1]_i_1_n_0 ),
        .I1(mono_p2),
        .I2(p_0_in_2[7]),
        .I3(\hdmi_d_q[13]_i_3_n_0 ),
        .I4(\hdmi_d_q[14]_i_4_n_0 ),
        .I5(\hdmi_d_q[13]_i_4_n_0 ),
        .O(\hdmi_d_q[13]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \hdmi_d_q[13]_i_3 
       (.I0(p_0_in_2[6]),
        .I1(\hcnt_reg_n_0_[0] ),
        .O(\hdmi_d_q[13]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h10011551)) 
    \hdmi_d_q[13]_i_4 
       (.I0(tp_p2),
        .I1(\lb_rdata_reg_n_0_[13] ),
        .I2(ccs_p2),
        .I3(\hcnt_reg_n_0_[0] ),
        .I4(\lb_rdata_reg_n_0_[29] ),
        .O(\hdmi_d_q[13]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \hdmi_d_q[14]_i_1 
       (.I0(\hdmi_d_q[14]_i_2_n_0 ),
        .I1(ycs_p2),
        .I2(\vga_q[2]_i_1_n_0 ),
        .O(\hdmi_d_q[14]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hB8B8B888B888B888)) 
    \hdmi_d_q[14]_i_2 
       (.I0(\vga_q[2]_i_1_n_0 ),
        .I1(mono_p2),
        .I2(\hdmi_d_q[14]_i_3_n_0 ),
        .I3(\hdmi_d_q[14]_i_4_n_0 ),
        .I4(p_0_in_2[6]),
        .I5(p_0_in_2[7]),
        .O(\hdmi_d_q[14]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT5 #(
    .INIT(32'hEFFEEAAE)) 
    \hdmi_d_q[14]_i_3 
       (.I0(tp_p2),
        .I1(\lb_rdata_reg_n_0_[14] ),
        .I2(ccs_p2),
        .I3(\hcnt_reg_n_0_[0] ),
        .I4(\lb_rdata_reg_n_0_[30] ),
        .O(\hdmi_d_q[14]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \hdmi_d_q[14]_i_4 
       (.I0(p_0_in_2[8]),
        .I1(tp_p2),
        .O(\hdmi_d_q[14]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFDFFFDFFFDFDFDF)) 
    \hdmi_d_q[15]_i_1 
       (.I0(\hdmi_d_q[15]_i_3_n_0 ),
        .I1(\vcnt_reg_n_0_[9] ),
        .I2(en_p2),
        .I3(p_0_in_2[8]),
        .I4(p_0_in_2[7]),
        .I5(p_0_in_2[6]),
        .O(\hdmi_d_q[15]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h4755)) 
    \hdmi_d_q[15]_i_2 
       (.I0(\hdmi_d_q[15]_i_4_n_0 ),
        .I1(mono_p2),
        .I2(\hdmi_d_q[15]_i_5_n_0 ),
        .I3(ycs_p2),
        .O(\hdmi_d_q[15]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    \hdmi_d_q[15]_i_3 
       (.I0(\vcnt_reg_n_0_[5] ),
        .I1(\vcnt_reg_n_0_[7] ),
        .I2(\vcnt_reg_n_0_[6] ),
        .I3(\vcnt_reg_n_0_[8] ),
        .O(\hdmi_d_q[15]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF4747FF004747)) 
    \hdmi_d_q[15]_i_4 
       (.I0(\lb_rdata_reg_n_0_[23] ),
        .I1(\hcnt_reg_n_0_[0] ),
        .I2(\lb_rdata_reg_n_0_[7] ),
        .I3(p_0_in_2[8]),
        .I4(tp_p2),
        .I5(\vga_q[3]_i_2_n_0 ),
        .O(\hdmi_d_q[15]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h00000000AA74FFFF)) 
    \hdmi_d_q[15]_i_5 
       (.I0(\hcnt_reg_n_0_[0] ),
        .I1(p_0_in_2[6]),
        .I2(p_0_in_2[7]),
        .I3(p_0_in_2[8]),
        .I4(tp_p2),
        .I5(\hdmi_d_q[15]_i_6_n_0 ),
        .O(\hdmi_d_q[15]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h0000BE82)) 
    \hdmi_d_q[15]_i_6 
       (.I0(\lb_rdata_reg_n_0_[15] ),
        .I1(ccs_p2),
        .I2(\hcnt_reg_n_0_[0] ),
        .I3(\lb_rdata_reg_n_0_[31] ),
        .I4(tp_p2),
        .O(\hdmi_d_q[15]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAB8BBB888)) 
    \hdmi_d_q[1]_i_1 
       (.I0(\hdmi_d_q[9]_i_2_n_0 ),
        .I1(mono_p2),
        .I2(\hdmi_d_q[9]_i_3_n_0 ),
        .I3(tp_p2),
        .I4(\hdmi_d_q[9]_i_4_n_0 ),
        .I5(ycs_p2),
        .O(\hdmi_d_q[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00E2FFFF00E20000)) 
    \hdmi_d_q[2]_i_1 
       (.I0(\lb_rdata_reg_n_0_[2] ),
        .I1(\hcnt_reg_n_0_[0] ),
        .I2(\lb_rdata_reg_n_0_[18] ),
        .I3(tp_p2),
        .I4(ycs_p2),
        .I5(\hdmi_d_q[10]_i_2_n_0 ),
        .O(\hdmi_d_q[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'hAAB8)) 
    \hdmi_d_q[3]_i_1 
       (.I0(\hdmi_d_q[11]_i_2_n_0 ),
        .I1(mono_p2),
        .I2(\hdmi_d_q[11]_i_3_n_0 ),
        .I3(ycs_p2),
        .O(\hdmi_d_q[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT4 #(
    .INIT(16'hAAB8)) 
    \hdmi_d_q[4]_i_1 
       (.I0(\vga_q[0]_i_1_n_0 ),
        .I1(mono_p2),
        .I2(\hdmi_d_q[12]_i_2_n_0 ),
        .I3(ycs_p2),
        .O(\hdmi_d_q[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \hdmi_d_q[5]_i_1 
       (.I0(\vga_q[1]_i_1_n_0 ),
        .I1(ycs_p2),
        .I2(\hdmi_d_q[13]_i_2_n_0 ),
        .O(\hdmi_d_q[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \hdmi_d_q[6]_i_1 
       (.I0(\vga_q[2]_i_1_n_0 ),
        .I1(ycs_p2),
        .I2(\hdmi_d_q[14]_i_2_n_0 ),
        .O(\hdmi_d_q[6]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h5547FFFF)) 
    \hdmi_d_q[7]_i_1 
       (.I0(\hdmi_d_q[15]_i_4_n_0 ),
        .I1(mono_p2),
        .I2(\hdmi_d_q[15]_i_5_n_0 ),
        .I3(ycs_p2),
        .I4(hdmi_de_i_1_n_0),
        .O(\hdmi_d_q[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \hdmi_d_q[8]_i_1 
       (.I0(\hdmi_d_q[8]_i_2_n_0 ),
        .I1(ycs_p2),
        .I2(\hdmi_d_q[8]_i_3_n_0 ),
        .O(\hdmi_d_q[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h88888888BBB888B8)) 
    \hdmi_d_q[8]_i_2 
       (.I0(\hdmi_d_q[8]_i_3_n_0 ),
        .I1(mono_p2),
        .I2(\lb_rdata_reg_n_0_[8] ),
        .I3(\hdmi_d_q[8]_i_4_n_0 ),
        .I4(\lb_rdata_reg_n_0_[24] ),
        .I5(tp_p2),
        .O(\hdmi_d_q[8]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hDDDDDDDDD0DDD000)) 
    \hdmi_d_q[8]_i_3 
       (.I0(p_0_in_2[6]),
        .I1(\hdmi_d_q[8]_i_5_n_0 ),
        .I2(\lb_rdata_reg_n_0_[16] ),
        .I3(\hcnt_reg_n_0_[0] ),
        .I4(\lb_rdata_reg_n_0_[0] ),
        .I5(tp_p2),
        .O(\hdmi_d_q[8]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \hdmi_d_q[8]_i_4 
       (.I0(\hcnt_reg_n_0_[0] ),
        .I1(ccs_p2),
        .O(\hdmi_d_q[8]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT3 #(
    .INIT(8'hFB)) 
    \hdmi_d_q[8]_i_5 
       (.I0(p_0_in_2[7]),
        .I1(tp_p2),
        .I2(p_0_in_2[8]),
        .O(\hdmi_d_q[8]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hB8BBB888AAAAAAAA)) 
    \hdmi_d_q[9]_i_1 
       (.I0(\hdmi_d_q[9]_i_2_n_0 ),
        .I1(mono_p2),
        .I2(\hdmi_d_q[9]_i_3_n_0 ),
        .I3(tp_p2),
        .I4(\hdmi_d_q[9]_i_4_n_0 ),
        .I5(ycs_p2),
        .O(\hdmi_d_q[9]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h11111111F0FFF000)) 
    \hdmi_d_q[9]_i_2 
       (.I0(p_0_in_2[8]),
        .I1(p_0_in_2[7]),
        .I2(\lb_rdata_reg_n_0_[17] ),
        .I3(\hcnt_reg_n_0_[0] ),
        .I4(\lb_rdata_reg_n_0_[1] ),
        .I5(tp_p2),
        .O(\hdmi_d_q[9]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'hB5E0)) 
    \hdmi_d_q[9]_i_3 
       (.I0(p_0_in_2[8]),
        .I1(p_0_in_2[6]),
        .I2(\hcnt_reg_n_0_[0] ),
        .I3(p_0_in_2[7]),
        .O(\hdmi_d_q[9]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT4 #(
    .INIT(16'hEB28)) 
    \hdmi_d_q[9]_i_4 
       (.I0(\lb_rdata_reg_n_0_[25] ),
        .I1(\hcnt_reg_n_0_[0] ),
        .I2(ccs_p2),
        .I3(\lb_rdata_reg_n_0_[9] ),
        .O(\hdmi_d_q[9]_i_4_n_0 ));
  FDRE \hdmi_d_q_reg[0] 
       (.C(pixel_clk),
        .CE(1'b1),
        .D(\hdmi_d_q[0]_i_1_n_0 ),
        .Q(hdmi_d[0]),
        .R(\hdmi_d_q[15]_i_1_n_0 ));
  FDRE \hdmi_d_q_reg[10] 
       (.C(pixel_clk),
        .CE(1'b1),
        .D(\hdmi_d_q[10]_i_1_n_0 ),
        .Q(hdmi_d[10]),
        .R(\hdmi_d_q[15]_i_1_n_0 ));
  FDRE \hdmi_d_q_reg[11] 
       (.C(pixel_clk),
        .CE(1'b1),
        .D(\hdmi_d_q[11]_i_1_n_0 ),
        .Q(hdmi_d[11]),
        .R(\hdmi_d_q[15]_i_1_n_0 ));
  FDRE \hdmi_d_q_reg[12] 
       (.C(pixel_clk),
        .CE(1'b1),
        .D(\hdmi_d_q[12]_i_1_n_0 ),
        .Q(hdmi_d[12]),
        .R(\hdmi_d_q[15]_i_1_n_0 ));
  FDRE \hdmi_d_q_reg[13] 
       (.C(pixel_clk),
        .CE(1'b1),
        .D(\hdmi_d_q[13]_i_1_n_0 ),
        .Q(hdmi_d[13]),
        .R(\hdmi_d_q[15]_i_1_n_0 ));
  FDRE \hdmi_d_q_reg[14] 
       (.C(pixel_clk),
        .CE(1'b1),
        .D(\hdmi_d_q[14]_i_1_n_0 ),
        .Q(hdmi_d[14]),
        .R(\hdmi_d_q[15]_i_1_n_0 ));
  FDRE \hdmi_d_q_reg[15] 
       (.C(pixel_clk),
        .CE(1'b1),
        .D(\hdmi_d_q[15]_i_2_n_0 ),
        .Q(hdmi_d[15]),
        .R(\hdmi_d_q[15]_i_1_n_0 ));
  FDRE \hdmi_d_q_reg[1] 
       (.C(pixel_clk),
        .CE(1'b1),
        .D(\hdmi_d_q[1]_i_1_n_0 ),
        .Q(hdmi_d[1]),
        .R(\hdmi_d_q[15]_i_1_n_0 ));
  FDRE \hdmi_d_q_reg[2] 
       (.C(pixel_clk),
        .CE(1'b1),
        .D(\hdmi_d_q[2]_i_1_n_0 ),
        .Q(hdmi_d[2]),
        .R(\hdmi_d_q[15]_i_1_n_0 ));
  FDRE \hdmi_d_q_reg[3] 
       (.C(pixel_clk),
        .CE(1'b1),
        .D(\hdmi_d_q[3]_i_1_n_0 ),
        .Q(hdmi_d[3]),
        .R(\hdmi_d_q[15]_i_1_n_0 ));
  FDRE \hdmi_d_q_reg[4] 
       (.C(pixel_clk),
        .CE(1'b1),
        .D(\hdmi_d_q[4]_i_1_n_0 ),
        .Q(hdmi_d[4]),
        .R(\hdmi_d_q[15]_i_1_n_0 ));
  FDRE \hdmi_d_q_reg[5] 
       (.C(pixel_clk),
        .CE(1'b1),
        .D(\hdmi_d_q[5]_i_1_n_0 ),
        .Q(hdmi_d[5]),
        .R(\hdmi_d_q[15]_i_1_n_0 ));
  FDRE \hdmi_d_q_reg[6] 
       (.C(pixel_clk),
        .CE(1'b1),
        .D(\hdmi_d_q[6]_i_1_n_0 ),
        .Q(hdmi_d[6]),
        .R(\hdmi_d_q[15]_i_1_n_0 ));
  FDRE \hdmi_d_q_reg[7] 
       (.C(pixel_clk),
        .CE(1'b1),
        .D(\hdmi_d_q[7]_i_1_n_0 ),
        .Q(hdmi_d[7]),
        .R(1'b0));
  FDRE \hdmi_d_q_reg[8] 
       (.C(pixel_clk),
        .CE(1'b1),
        .D(\hdmi_d_q[8]_i_1_n_0 ),
        .Q(hdmi_d[8]),
        .R(\hdmi_d_q[15]_i_1_n_0 ));
  FDRE \hdmi_d_q_reg[9] 
       (.C(pixel_clk),
        .CE(1'b1),
        .D(\hdmi_d_q[9]_i_1_n_0 ),
        .Q(hdmi_d[9]),
        .R(\hdmi_d_q[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00001F0000000000)) 
    hdmi_de_i_1
       (.I0(p_0_in_2[6]),
        .I1(p_0_in_2[7]),
        .I2(p_0_in_2[8]),
        .I3(en_p2),
        .I4(\vcnt_reg_n_0_[9] ),
        .I5(\hdmi_d_q[15]_i_3_n_0 ),
        .O(hdmi_de_i_1_n_0));
  FDRE hdmi_de_reg
       (.C(pixel_clk),
        .CE(1'b1),
        .D(hdmi_de_i_1_n_0),
        .Q(hdmi_de),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFDFDFDFDFDFDFFF)) 
    hdmi_hsync_i_1
       (.I0(p_0_in_2[6]),
        .I1(p_0_in_2[7]),
        .I2(p_0_in_2[8]),
        .I3(p_0_in_2[5]),
        .I4(p_0_in_2[4]),
        .I5(p_0_in_2[3]),
        .O(hdmi_hsync_i_1_n_0));
  FDRE hdmi_hsync_reg
       (.C(pixel_clk),
        .CE(1'b1),
        .D(hdmi_hsync_i_1_n_0),
        .Q(vga_hsync),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFFFFFEFFFFFFFFF)) 
    hdmi_vsync_i_1
       (.I0(\hdmi_d_q[15]_i_3_n_0 ),
        .I1(\vcnt_reg_n_0_[2] ),
        .I2(\vcnt_reg_n_0_[1] ),
        .I3(\vcnt_reg_n_0_[9] ),
        .I4(\vcnt_reg_n_0_[4] ),
        .I5(\vcnt_reg_n_0_[3] ),
        .O(hdmi_vsync_i_1_n_0));
  FDRE hdmi_vsync_reg
       (.C(pixel_clk),
        .CE(1'b1),
        .D(hdmi_vsync_i_1_n_0),
        .Q(vga_vsync),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    i2c_scl_low_i_1
       (.I0(\wdata_q_reg_n_0_[1] ),
        .I1(i2c_sda_low_1),
        .I2(i2c_scl_low),
        .O(i2c_scl_low_i_1_n_0));
  FDRE i2c_scl_low_reg
       (.C(aclk),
        .CE(1'b1),
        .D(i2c_scl_low_i_1_n_0),
        .Q(i2c_scl_low),
        .R(\rdata_q[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    i2c_sda_low_i_1
       (.I0(\wdata_q_reg_n_0_[0] ),
        .I1(i2c_sda_low_1),
        .I2(i2c_sda_low),
        .O(i2c_sda_low_i_1_n_0));
  LUT6 #(
    .INIT(64'h0002000000000000)) 
    i2c_sda_low_i_2
       (.I0(ctrl_enable1),
        .I1(ctrl_enable_i_3_n_0),
        .I2(\awaddr_q_reg_n_0_[0] ),
        .I3(\awaddr_q_reg_n_0_[1] ),
        .I4(\awaddr_q_reg_n_0_[3] ),
        .I5(\awaddr_q_reg_n_0_[2] ),
        .O(i2c_sda_low_1));
  FDRE i2c_sda_low_reg
       (.C(aclk),
        .CE(1'b1),
        .D(i2c_sda_low_i_1_n_0),
        .Q(i2c_sda_low),
        .R(\rdata_q[31]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \lb_rdata[0]_i_1 
       (.I0(lb_rdata0[0]),
        .I1(\lb_rdata[31]_i_4_n_0 ),
        .I2(\lb_rdata_reg[0]_i_3_n_0 ),
        .I3(rd_addr_next),
        .I4(\lb_rdata_reg[0]_i_4_n_0 ),
        .O(\lb_rdata[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \lb_rdata[0]_i_2 
       (.I0(linebuf_reg_r1_512_575_0_2_n_0),
        .I1(\vcnt[9]_i_5_n_0 ),
        .I2(rd_addr_next),
        .I3(linebuf_reg_r1_0_63_0_2_n_0),
        .O(lb_rdata0[0]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[0]_i_5 
       (.I0(linebuf_reg_r2_704_767_0_2_n_0),
        .I1(linebuf_reg_r2_640_703_0_2_n_0),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_576_639_0_2_n_0),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_512_575_0_2_n_0),
        .O(\lb_rdata[0]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[0]_i_6 
       (.I0(linebuf_reg_r2_960_1023_0_2_n_0),
        .I1(linebuf_reg_r2_896_959_0_2_n_0),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_832_895_0_2_n_0),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_768_831_0_2_n_0),
        .O(\lb_rdata[0]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[0]_i_7 
       (.I0(linebuf_reg_r2_192_255_0_2_n_0),
        .I1(linebuf_reg_r2_128_191_0_2_n_0),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_64_127_0_2_n_0),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_0_63_0_2_n_0),
        .O(\lb_rdata[0]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[0]_i_8 
       (.I0(linebuf_reg_r2_448_511_0_2_n_0),
        .I1(linebuf_reg_r2_384_447_0_2_n_0),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_320_383_0_2_n_0),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_256_319_0_2_n_0),
        .O(\lb_rdata[0]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \lb_rdata[10]_i_1 
       (.I0(lb_rdata0[10]),
        .I1(\lb_rdata[31]_i_4_n_0 ),
        .I2(\lb_rdata_reg[10]_i_3_n_0 ),
        .I3(rd_addr_next),
        .I4(\lb_rdata_reg[10]_i_4_n_0 ),
        .O(\lb_rdata[10]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \lb_rdata[10]_i_2 
       (.I0(linebuf_reg_r1_512_575_9_11_n_1),
        .I1(\vcnt[9]_i_5_n_0 ),
        .I2(rd_addr_next),
        .I3(linebuf_reg_r1_0_63_9_11_n_1),
        .O(lb_rdata0[10]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[10]_i_5 
       (.I0(linebuf_reg_r2_704_767_9_11_n_1),
        .I1(linebuf_reg_r2_640_703_9_11_n_1),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_576_639_9_11_n_1),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_512_575_9_11_n_1),
        .O(\lb_rdata[10]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[10]_i_6 
       (.I0(linebuf_reg_r2_960_1023_9_11_n_1),
        .I1(linebuf_reg_r2_896_959_9_11_n_1),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_832_895_9_11_n_1),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_768_831_9_11_n_1),
        .O(\lb_rdata[10]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[10]_i_7 
       (.I0(linebuf_reg_r2_192_255_9_11_n_1),
        .I1(linebuf_reg_r2_128_191_9_11_n_1),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_64_127_9_11_n_1),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_0_63_9_11_n_1),
        .O(\lb_rdata[10]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[10]_i_8 
       (.I0(linebuf_reg_r2_448_511_9_11_n_1),
        .I1(linebuf_reg_r2_384_447_9_11_n_1),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_320_383_9_11_n_1),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_256_319_9_11_n_1),
        .O(\lb_rdata[10]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \lb_rdata[11]_i_1 
       (.I0(lb_rdata0[11]),
        .I1(\lb_rdata[31]_i_4_n_0 ),
        .I2(\lb_rdata_reg[11]_i_3_n_0 ),
        .I3(rd_addr_next),
        .I4(\lb_rdata_reg[11]_i_4_n_0 ),
        .O(\lb_rdata[11]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \lb_rdata[11]_i_2 
       (.I0(linebuf_reg_r1_512_575_9_11_n_2),
        .I1(\vcnt[9]_i_5_n_0 ),
        .I2(rd_addr_next),
        .I3(linebuf_reg_r1_0_63_9_11_n_2),
        .O(lb_rdata0[11]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[11]_i_5 
       (.I0(linebuf_reg_r2_704_767_9_11_n_2),
        .I1(linebuf_reg_r2_640_703_9_11_n_2),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_576_639_9_11_n_2),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_512_575_9_11_n_2),
        .O(\lb_rdata[11]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[11]_i_6 
       (.I0(linebuf_reg_r2_960_1023_9_11_n_2),
        .I1(linebuf_reg_r2_896_959_9_11_n_2),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_832_895_9_11_n_2),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_768_831_9_11_n_2),
        .O(\lb_rdata[11]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[11]_i_7 
       (.I0(linebuf_reg_r2_192_255_9_11_n_2),
        .I1(linebuf_reg_r2_128_191_9_11_n_2),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_64_127_9_11_n_2),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_0_63_9_11_n_2),
        .O(\lb_rdata[11]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[11]_i_8 
       (.I0(linebuf_reg_r2_448_511_9_11_n_2),
        .I1(linebuf_reg_r2_384_447_9_11_n_2),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_320_383_9_11_n_2),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_256_319_9_11_n_2),
        .O(\lb_rdata[11]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \lb_rdata[12]_i_1 
       (.I0(lb_rdata0[12]),
        .I1(\lb_rdata[31]_i_4_n_0 ),
        .I2(\lb_rdata_reg[12]_i_3_n_0 ),
        .I3(rd_addr_next),
        .I4(\lb_rdata_reg[12]_i_4_n_0 ),
        .O(\lb_rdata[12]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \lb_rdata[12]_i_2 
       (.I0(linebuf_reg_r1_512_575_12_14_n_0),
        .I1(\vcnt[9]_i_5_n_0 ),
        .I2(rd_addr_next),
        .I3(linebuf_reg_r1_0_63_12_14_n_0),
        .O(lb_rdata0[12]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[12]_i_5 
       (.I0(linebuf_reg_r2_704_767_12_14_n_0),
        .I1(linebuf_reg_r2_640_703_12_14_n_0),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_576_639_12_14_n_0),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_512_575_12_14_n_0),
        .O(\lb_rdata[12]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[12]_i_6 
       (.I0(linebuf_reg_r2_960_1023_12_14_n_0),
        .I1(linebuf_reg_r2_896_959_12_14_n_0),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_832_895_12_14_n_0),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_768_831_12_14_n_0),
        .O(\lb_rdata[12]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[12]_i_7 
       (.I0(linebuf_reg_r2_192_255_12_14_n_0),
        .I1(linebuf_reg_r2_128_191_12_14_n_0),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_64_127_12_14_n_0),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_0_63_12_14_n_0),
        .O(\lb_rdata[12]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[12]_i_8 
       (.I0(linebuf_reg_r2_448_511_12_14_n_0),
        .I1(linebuf_reg_r2_384_447_12_14_n_0),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_320_383_12_14_n_0),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_256_319_12_14_n_0),
        .O(\lb_rdata[12]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \lb_rdata[13]_i_1 
       (.I0(lb_rdata0[13]),
        .I1(\lb_rdata[31]_i_4_n_0 ),
        .I2(\lb_rdata_reg[13]_i_3_n_0 ),
        .I3(rd_addr_next),
        .I4(\lb_rdata_reg[13]_i_4_n_0 ),
        .O(\lb_rdata[13]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \lb_rdata[13]_i_2 
       (.I0(linebuf_reg_r1_512_575_12_14_n_1),
        .I1(\vcnt[9]_i_5_n_0 ),
        .I2(rd_addr_next),
        .I3(linebuf_reg_r1_0_63_12_14_n_1),
        .O(lb_rdata0[13]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[13]_i_5 
       (.I0(linebuf_reg_r2_704_767_12_14_n_1),
        .I1(linebuf_reg_r2_640_703_12_14_n_1),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_576_639_12_14_n_1),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_512_575_12_14_n_1),
        .O(\lb_rdata[13]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[13]_i_6 
       (.I0(linebuf_reg_r2_960_1023_12_14_n_1),
        .I1(linebuf_reg_r2_896_959_12_14_n_1),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_832_895_12_14_n_1),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_768_831_12_14_n_1),
        .O(\lb_rdata[13]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[13]_i_7 
       (.I0(linebuf_reg_r2_192_255_12_14_n_1),
        .I1(linebuf_reg_r2_128_191_12_14_n_1),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_64_127_12_14_n_1),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_0_63_12_14_n_1),
        .O(\lb_rdata[13]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[13]_i_8 
       (.I0(linebuf_reg_r2_448_511_12_14_n_1),
        .I1(linebuf_reg_r2_384_447_12_14_n_1),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_320_383_12_14_n_1),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_256_319_12_14_n_1),
        .O(\lb_rdata[13]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \lb_rdata[14]_i_1 
       (.I0(lb_rdata0[14]),
        .I1(\lb_rdata[31]_i_4_n_0 ),
        .I2(\lb_rdata_reg[14]_i_3_n_0 ),
        .I3(rd_addr_next),
        .I4(\lb_rdata_reg[14]_i_4_n_0 ),
        .O(\lb_rdata[14]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \lb_rdata[14]_i_2 
       (.I0(linebuf_reg_r1_512_575_12_14_n_2),
        .I1(\vcnt[9]_i_5_n_0 ),
        .I2(rd_addr_next),
        .I3(linebuf_reg_r1_0_63_12_14_n_2),
        .O(lb_rdata0[14]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[14]_i_5 
       (.I0(linebuf_reg_r2_704_767_12_14_n_2),
        .I1(linebuf_reg_r2_640_703_12_14_n_2),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_576_639_12_14_n_2),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_512_575_12_14_n_2),
        .O(\lb_rdata[14]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[14]_i_6 
       (.I0(linebuf_reg_r2_960_1023_12_14_n_2),
        .I1(linebuf_reg_r2_896_959_12_14_n_2),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_832_895_12_14_n_2),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_768_831_12_14_n_2),
        .O(\lb_rdata[14]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[14]_i_7 
       (.I0(linebuf_reg_r2_192_255_12_14_n_2),
        .I1(linebuf_reg_r2_128_191_12_14_n_2),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_64_127_12_14_n_2),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_0_63_12_14_n_2),
        .O(\lb_rdata[14]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[14]_i_8 
       (.I0(linebuf_reg_r2_448_511_12_14_n_2),
        .I1(linebuf_reg_r2_384_447_12_14_n_2),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_320_383_12_14_n_2),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_256_319_12_14_n_2),
        .O(\lb_rdata[14]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \lb_rdata[15]_i_1 
       (.I0(lb_rdata0[15]),
        .I1(\lb_rdata[31]_i_4_n_0 ),
        .I2(\lb_rdata_reg[15]_i_3_n_0 ),
        .I3(rd_addr_next),
        .I4(\lb_rdata_reg[15]_i_4_n_0 ),
        .O(\lb_rdata[15]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \lb_rdata[15]_i_2 
       (.I0(linebuf_reg_r1_512_575_15_17_n_0),
        .I1(\vcnt[9]_i_5_n_0 ),
        .I2(rd_addr_next),
        .I3(linebuf_reg_r1_0_63_15_17_n_0),
        .O(lb_rdata0[15]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[15]_i_5 
       (.I0(linebuf_reg_r2_704_767_15_17_n_0),
        .I1(linebuf_reg_r2_640_703_15_17_n_0),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_576_639_15_17_n_0),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_512_575_15_17_n_0),
        .O(\lb_rdata[15]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[15]_i_6 
       (.I0(linebuf_reg_r2_960_1023_15_17_n_0),
        .I1(linebuf_reg_r2_896_959_15_17_n_0),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_832_895_15_17_n_0),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_768_831_15_17_n_0),
        .O(\lb_rdata[15]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[15]_i_7 
       (.I0(linebuf_reg_r2_192_255_15_17_n_0),
        .I1(linebuf_reg_r2_128_191_15_17_n_0),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_64_127_15_17_n_0),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_0_63_15_17_n_0),
        .O(\lb_rdata[15]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[15]_i_8 
       (.I0(linebuf_reg_r2_448_511_15_17_n_0),
        .I1(linebuf_reg_r2_384_447_15_17_n_0),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_320_383_15_17_n_0),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_256_319_15_17_n_0),
        .O(\lb_rdata[15]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \lb_rdata[16]_i_1 
       (.I0(lb_rdata0[16]),
        .I1(\lb_rdata[31]_i_4_n_0 ),
        .I2(\lb_rdata_reg[16]_i_3_n_0 ),
        .I3(rd_addr_next),
        .I4(\lb_rdata_reg[16]_i_4_n_0 ),
        .O(\lb_rdata[16]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \lb_rdata[16]_i_2 
       (.I0(linebuf_reg_r1_512_575_15_17_n_1),
        .I1(\vcnt[9]_i_5_n_0 ),
        .I2(rd_addr_next),
        .I3(linebuf_reg_r1_0_63_15_17_n_1),
        .O(lb_rdata0[16]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[16]_i_5 
       (.I0(linebuf_reg_r2_704_767_15_17_n_1),
        .I1(linebuf_reg_r2_640_703_15_17_n_1),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_576_639_15_17_n_1),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_512_575_15_17_n_1),
        .O(\lb_rdata[16]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[16]_i_6 
       (.I0(linebuf_reg_r2_960_1023_15_17_n_1),
        .I1(linebuf_reg_r2_896_959_15_17_n_1),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_832_895_15_17_n_1),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_768_831_15_17_n_1),
        .O(\lb_rdata[16]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[16]_i_7 
       (.I0(linebuf_reg_r2_192_255_15_17_n_1),
        .I1(linebuf_reg_r2_128_191_15_17_n_1),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_64_127_15_17_n_1),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_0_63_15_17_n_1),
        .O(\lb_rdata[16]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[16]_i_8 
       (.I0(linebuf_reg_r2_448_511_15_17_n_1),
        .I1(linebuf_reg_r2_384_447_15_17_n_1),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_320_383_15_17_n_1),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_256_319_15_17_n_1),
        .O(\lb_rdata[16]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \lb_rdata[17]_i_1 
       (.I0(lb_rdata0[17]),
        .I1(\lb_rdata[31]_i_4_n_0 ),
        .I2(\lb_rdata_reg[17]_i_3_n_0 ),
        .I3(rd_addr_next),
        .I4(\lb_rdata_reg[17]_i_4_n_0 ),
        .O(\lb_rdata[17]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \lb_rdata[17]_i_2 
       (.I0(linebuf_reg_r1_512_575_15_17_n_2),
        .I1(\vcnt[9]_i_5_n_0 ),
        .I2(rd_addr_next),
        .I3(linebuf_reg_r1_0_63_15_17_n_2),
        .O(lb_rdata0[17]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[17]_i_5 
       (.I0(linebuf_reg_r2_704_767_15_17_n_2),
        .I1(linebuf_reg_r2_640_703_15_17_n_2),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_576_639_15_17_n_2),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_512_575_15_17_n_2),
        .O(\lb_rdata[17]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[17]_i_6 
       (.I0(linebuf_reg_r2_960_1023_15_17_n_2),
        .I1(linebuf_reg_r2_896_959_15_17_n_2),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_832_895_15_17_n_2),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_768_831_15_17_n_2),
        .O(\lb_rdata[17]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[17]_i_7 
       (.I0(linebuf_reg_r2_192_255_15_17_n_2),
        .I1(linebuf_reg_r2_128_191_15_17_n_2),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_64_127_15_17_n_2),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_0_63_15_17_n_2),
        .O(\lb_rdata[17]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[17]_i_8 
       (.I0(linebuf_reg_r2_448_511_15_17_n_2),
        .I1(linebuf_reg_r2_384_447_15_17_n_2),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_320_383_15_17_n_2),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_256_319_15_17_n_2),
        .O(\lb_rdata[17]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \lb_rdata[18]_i_1 
       (.I0(lb_rdata0[18]),
        .I1(\lb_rdata[31]_i_4_n_0 ),
        .I2(\lb_rdata_reg[18]_i_3_n_0 ),
        .I3(rd_addr_next),
        .I4(\lb_rdata_reg[18]_i_4_n_0 ),
        .O(\lb_rdata[18]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \lb_rdata[18]_i_2 
       (.I0(linebuf_reg_r1_512_575_18_20_n_0),
        .I1(\vcnt[9]_i_5_n_0 ),
        .I2(rd_addr_next),
        .I3(linebuf_reg_r1_0_63_18_20_n_0),
        .O(lb_rdata0[18]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[18]_i_5 
       (.I0(linebuf_reg_r2_704_767_18_20_n_0),
        .I1(linebuf_reg_r2_640_703_18_20_n_0),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_576_639_18_20_n_0),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_512_575_18_20_n_0),
        .O(\lb_rdata[18]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[18]_i_6 
       (.I0(linebuf_reg_r2_960_1023_18_20_n_0),
        .I1(linebuf_reg_r2_896_959_18_20_n_0),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_832_895_18_20_n_0),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_768_831_18_20_n_0),
        .O(\lb_rdata[18]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[18]_i_7 
       (.I0(linebuf_reg_r2_192_255_18_20_n_0),
        .I1(linebuf_reg_r2_128_191_18_20_n_0),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_64_127_18_20_n_0),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_0_63_18_20_n_0),
        .O(\lb_rdata[18]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[18]_i_8 
       (.I0(linebuf_reg_r2_448_511_18_20_n_0),
        .I1(linebuf_reg_r2_384_447_18_20_n_0),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_320_383_18_20_n_0),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_256_319_18_20_n_0),
        .O(\lb_rdata[18]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \lb_rdata[19]_i_1 
       (.I0(lb_rdata0[19]),
        .I1(\lb_rdata[31]_i_4_n_0 ),
        .I2(\lb_rdata_reg[19]_i_3_n_0 ),
        .I3(rd_addr_next),
        .I4(\lb_rdata_reg[19]_i_4_n_0 ),
        .O(\lb_rdata[19]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \lb_rdata[19]_i_2 
       (.I0(linebuf_reg_r1_512_575_18_20_n_1),
        .I1(\vcnt[9]_i_5_n_0 ),
        .I2(rd_addr_next),
        .I3(linebuf_reg_r1_0_63_18_20_n_1),
        .O(lb_rdata0[19]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[19]_i_5 
       (.I0(linebuf_reg_r2_704_767_18_20_n_1),
        .I1(linebuf_reg_r2_640_703_18_20_n_1),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_576_639_18_20_n_1),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_512_575_18_20_n_1),
        .O(\lb_rdata[19]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[19]_i_6 
       (.I0(linebuf_reg_r2_960_1023_18_20_n_1),
        .I1(linebuf_reg_r2_896_959_18_20_n_1),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_832_895_18_20_n_1),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_768_831_18_20_n_1),
        .O(\lb_rdata[19]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[19]_i_7 
       (.I0(linebuf_reg_r2_192_255_18_20_n_1),
        .I1(linebuf_reg_r2_128_191_18_20_n_1),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_64_127_18_20_n_1),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_0_63_18_20_n_1),
        .O(\lb_rdata[19]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[19]_i_8 
       (.I0(linebuf_reg_r2_448_511_18_20_n_1),
        .I1(linebuf_reg_r2_384_447_18_20_n_1),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_320_383_18_20_n_1),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_256_319_18_20_n_1),
        .O(\lb_rdata[19]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \lb_rdata[1]_i_1 
       (.I0(lb_rdata0[1]),
        .I1(\lb_rdata[31]_i_4_n_0 ),
        .I2(\lb_rdata_reg[1]_i_3_n_0 ),
        .I3(rd_addr_next),
        .I4(\lb_rdata_reg[1]_i_4_n_0 ),
        .O(\lb_rdata[1]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \lb_rdata[1]_i_2 
       (.I0(linebuf_reg_r1_512_575_0_2_n_1),
        .I1(\vcnt[9]_i_5_n_0 ),
        .I2(rd_addr_next),
        .I3(linebuf_reg_r1_0_63_0_2_n_1),
        .O(lb_rdata0[1]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[1]_i_5 
       (.I0(linebuf_reg_r2_704_767_0_2_n_1),
        .I1(linebuf_reg_r2_640_703_0_2_n_1),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_576_639_0_2_n_1),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_512_575_0_2_n_1),
        .O(\lb_rdata[1]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[1]_i_6 
       (.I0(linebuf_reg_r2_960_1023_0_2_n_1),
        .I1(linebuf_reg_r2_896_959_0_2_n_1),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_832_895_0_2_n_1),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_768_831_0_2_n_1),
        .O(\lb_rdata[1]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[1]_i_7 
       (.I0(linebuf_reg_r2_192_255_0_2_n_1),
        .I1(linebuf_reg_r2_128_191_0_2_n_1),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_64_127_0_2_n_1),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_0_63_0_2_n_1),
        .O(\lb_rdata[1]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[1]_i_8 
       (.I0(linebuf_reg_r2_448_511_0_2_n_1),
        .I1(linebuf_reg_r2_384_447_0_2_n_1),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_320_383_0_2_n_1),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_256_319_0_2_n_1),
        .O(\lb_rdata[1]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \lb_rdata[20]_i_1 
       (.I0(lb_rdata0[20]),
        .I1(\lb_rdata[31]_i_4_n_0 ),
        .I2(\lb_rdata_reg[20]_i_3_n_0 ),
        .I3(rd_addr_next),
        .I4(\lb_rdata_reg[20]_i_4_n_0 ),
        .O(\lb_rdata[20]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \lb_rdata[20]_i_2 
       (.I0(linebuf_reg_r1_512_575_18_20_n_2),
        .I1(\vcnt[9]_i_5_n_0 ),
        .I2(rd_addr_next),
        .I3(linebuf_reg_r1_0_63_18_20_n_2),
        .O(lb_rdata0[20]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[20]_i_5 
       (.I0(linebuf_reg_r2_704_767_18_20_n_2),
        .I1(linebuf_reg_r2_640_703_18_20_n_2),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_576_639_18_20_n_2),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_512_575_18_20_n_2),
        .O(\lb_rdata[20]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[20]_i_6 
       (.I0(linebuf_reg_r2_960_1023_18_20_n_2),
        .I1(linebuf_reg_r2_896_959_18_20_n_2),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_832_895_18_20_n_2),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_768_831_18_20_n_2),
        .O(\lb_rdata[20]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[20]_i_7 
       (.I0(linebuf_reg_r2_192_255_18_20_n_2),
        .I1(linebuf_reg_r2_128_191_18_20_n_2),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_64_127_18_20_n_2),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_0_63_18_20_n_2),
        .O(\lb_rdata[20]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[20]_i_8 
       (.I0(linebuf_reg_r2_448_511_18_20_n_2),
        .I1(linebuf_reg_r2_384_447_18_20_n_2),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_320_383_18_20_n_2),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_256_319_18_20_n_2),
        .O(\lb_rdata[20]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \lb_rdata[21]_i_1 
       (.I0(lb_rdata0[21]),
        .I1(\lb_rdata[31]_i_4_n_0 ),
        .I2(\lb_rdata_reg[21]_i_3_n_0 ),
        .I3(rd_addr_next),
        .I4(\lb_rdata_reg[21]_i_4_n_0 ),
        .O(\lb_rdata[21]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \lb_rdata[21]_i_2 
       (.I0(linebuf_reg_r1_512_575_21_23_n_0),
        .I1(\vcnt[9]_i_5_n_0 ),
        .I2(rd_addr_next),
        .I3(linebuf_reg_r1_0_63_21_23_n_0),
        .O(lb_rdata0[21]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[21]_i_5 
       (.I0(linebuf_reg_r2_704_767_21_23_n_0),
        .I1(linebuf_reg_r2_640_703_21_23_n_0),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_576_639_21_23_n_0),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_512_575_21_23_n_0),
        .O(\lb_rdata[21]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[21]_i_6 
       (.I0(linebuf_reg_r2_960_1023_21_23_n_0),
        .I1(linebuf_reg_r2_896_959_21_23_n_0),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_832_895_21_23_n_0),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_768_831_21_23_n_0),
        .O(\lb_rdata[21]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[21]_i_7 
       (.I0(linebuf_reg_r2_192_255_21_23_n_0),
        .I1(linebuf_reg_r2_128_191_21_23_n_0),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_64_127_21_23_n_0),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_0_63_21_23_n_0),
        .O(\lb_rdata[21]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[21]_i_8 
       (.I0(linebuf_reg_r2_448_511_21_23_n_0),
        .I1(linebuf_reg_r2_384_447_21_23_n_0),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_320_383_21_23_n_0),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_256_319_21_23_n_0),
        .O(\lb_rdata[21]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \lb_rdata[22]_i_1 
       (.I0(lb_rdata0[22]),
        .I1(\lb_rdata[31]_i_4_n_0 ),
        .I2(\lb_rdata_reg[22]_i_3_n_0 ),
        .I3(rd_addr_next),
        .I4(\lb_rdata_reg[22]_i_4_n_0 ),
        .O(\lb_rdata[22]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \lb_rdata[22]_i_2 
       (.I0(linebuf_reg_r1_512_575_21_23_n_1),
        .I1(\vcnt[9]_i_5_n_0 ),
        .I2(rd_addr_next),
        .I3(linebuf_reg_r1_0_63_21_23_n_1),
        .O(lb_rdata0[22]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[22]_i_5 
       (.I0(linebuf_reg_r2_704_767_21_23_n_1),
        .I1(linebuf_reg_r2_640_703_21_23_n_1),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_576_639_21_23_n_1),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_512_575_21_23_n_1),
        .O(\lb_rdata[22]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[22]_i_6 
       (.I0(linebuf_reg_r2_960_1023_21_23_n_1),
        .I1(linebuf_reg_r2_896_959_21_23_n_1),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_832_895_21_23_n_1),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_768_831_21_23_n_1),
        .O(\lb_rdata[22]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[22]_i_7 
       (.I0(linebuf_reg_r2_192_255_21_23_n_1),
        .I1(linebuf_reg_r2_128_191_21_23_n_1),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_64_127_21_23_n_1),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_0_63_21_23_n_1),
        .O(\lb_rdata[22]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[22]_i_8 
       (.I0(linebuf_reg_r2_448_511_21_23_n_1),
        .I1(linebuf_reg_r2_384_447_21_23_n_1),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_320_383_21_23_n_1),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_256_319_21_23_n_1),
        .O(\lb_rdata[22]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \lb_rdata[23]_i_1 
       (.I0(lb_rdata0[23]),
        .I1(\lb_rdata[31]_i_4_n_0 ),
        .I2(\lb_rdata_reg[23]_i_3_n_0 ),
        .I3(rd_addr_next),
        .I4(\lb_rdata_reg[23]_i_4_n_0 ),
        .O(\lb_rdata[23]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \lb_rdata[23]_i_2 
       (.I0(linebuf_reg_r1_512_575_21_23_n_2),
        .I1(\vcnt[9]_i_5_n_0 ),
        .I2(rd_addr_next),
        .I3(linebuf_reg_r1_0_63_21_23_n_2),
        .O(lb_rdata0[23]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[23]_i_5 
       (.I0(linebuf_reg_r2_704_767_21_23_n_2),
        .I1(linebuf_reg_r2_640_703_21_23_n_2),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_576_639_21_23_n_2),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_512_575_21_23_n_2),
        .O(\lb_rdata[23]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[23]_i_6 
       (.I0(linebuf_reg_r2_960_1023_21_23_n_2),
        .I1(linebuf_reg_r2_896_959_21_23_n_2),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_832_895_21_23_n_2),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_768_831_21_23_n_2),
        .O(\lb_rdata[23]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[23]_i_7 
       (.I0(linebuf_reg_r2_192_255_21_23_n_2),
        .I1(linebuf_reg_r2_128_191_21_23_n_2),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_64_127_21_23_n_2),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_0_63_21_23_n_2),
        .O(\lb_rdata[23]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[23]_i_8 
       (.I0(linebuf_reg_r2_448_511_21_23_n_2),
        .I1(linebuf_reg_r2_384_447_21_23_n_2),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_320_383_21_23_n_2),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_256_319_21_23_n_2),
        .O(\lb_rdata[23]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \lb_rdata[24]_i_1 
       (.I0(lb_rdata0[24]),
        .I1(\lb_rdata[31]_i_4_n_0 ),
        .I2(\lb_rdata_reg[24]_i_3_n_0 ),
        .I3(rd_addr_next),
        .I4(\lb_rdata_reg[24]_i_4_n_0 ),
        .O(\lb_rdata[24]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \lb_rdata[24]_i_2 
       (.I0(linebuf_reg_r1_512_575_24_26_n_0),
        .I1(\vcnt[9]_i_5_n_0 ),
        .I2(rd_addr_next),
        .I3(linebuf_reg_r1_0_63_24_26_n_0),
        .O(lb_rdata0[24]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[24]_i_5 
       (.I0(linebuf_reg_r2_704_767_24_26_n_0),
        .I1(linebuf_reg_r2_640_703_24_26_n_0),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_576_639_24_26_n_0),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_512_575_24_26_n_0),
        .O(\lb_rdata[24]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[24]_i_6 
       (.I0(linebuf_reg_r2_960_1023_24_26_n_0),
        .I1(linebuf_reg_r2_896_959_24_26_n_0),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_832_895_24_26_n_0),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_768_831_24_26_n_0),
        .O(\lb_rdata[24]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[24]_i_7 
       (.I0(linebuf_reg_r2_192_255_24_26_n_0),
        .I1(linebuf_reg_r2_128_191_24_26_n_0),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_64_127_24_26_n_0),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_0_63_24_26_n_0),
        .O(\lb_rdata[24]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[24]_i_8 
       (.I0(linebuf_reg_r2_448_511_24_26_n_0),
        .I1(linebuf_reg_r2_384_447_24_26_n_0),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_320_383_24_26_n_0),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_256_319_24_26_n_0),
        .O(\lb_rdata[24]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \lb_rdata[25]_i_1 
       (.I0(lb_rdata0[25]),
        .I1(\lb_rdata[31]_i_4_n_0 ),
        .I2(\lb_rdata_reg[25]_i_3_n_0 ),
        .I3(rd_addr_next),
        .I4(\lb_rdata_reg[25]_i_4_n_0 ),
        .O(\lb_rdata[25]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \lb_rdata[25]_i_2 
       (.I0(linebuf_reg_r1_512_575_24_26_n_1),
        .I1(\vcnt[9]_i_5_n_0 ),
        .I2(rd_addr_next),
        .I3(linebuf_reg_r1_0_63_24_26_n_1),
        .O(lb_rdata0[25]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[25]_i_5 
       (.I0(linebuf_reg_r2_704_767_24_26_n_1),
        .I1(linebuf_reg_r2_640_703_24_26_n_1),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_576_639_24_26_n_1),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_512_575_24_26_n_1),
        .O(\lb_rdata[25]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[25]_i_6 
       (.I0(linebuf_reg_r2_960_1023_24_26_n_1),
        .I1(linebuf_reg_r2_896_959_24_26_n_1),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_832_895_24_26_n_1),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_768_831_24_26_n_1),
        .O(\lb_rdata[25]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[25]_i_7 
       (.I0(linebuf_reg_r2_192_255_24_26_n_1),
        .I1(linebuf_reg_r2_128_191_24_26_n_1),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_64_127_24_26_n_1),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_0_63_24_26_n_1),
        .O(\lb_rdata[25]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[25]_i_8 
       (.I0(linebuf_reg_r2_448_511_24_26_n_1),
        .I1(linebuf_reg_r2_384_447_24_26_n_1),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_320_383_24_26_n_1),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_256_319_24_26_n_1),
        .O(\lb_rdata[25]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \lb_rdata[26]_i_1 
       (.I0(lb_rdata0[26]),
        .I1(\lb_rdata[31]_i_4_n_0 ),
        .I2(\lb_rdata_reg[26]_i_3_n_0 ),
        .I3(rd_addr_next),
        .I4(\lb_rdata_reg[26]_i_4_n_0 ),
        .O(\lb_rdata[26]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \lb_rdata[26]_i_2 
       (.I0(linebuf_reg_r1_512_575_24_26_n_2),
        .I1(\vcnt[9]_i_5_n_0 ),
        .I2(rd_addr_next),
        .I3(linebuf_reg_r1_0_63_24_26_n_2),
        .O(lb_rdata0[26]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[26]_i_5 
       (.I0(linebuf_reg_r2_704_767_24_26_n_2),
        .I1(linebuf_reg_r2_640_703_24_26_n_2),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_576_639_24_26_n_2),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_512_575_24_26_n_2),
        .O(\lb_rdata[26]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[26]_i_6 
       (.I0(linebuf_reg_r2_960_1023_24_26_n_2),
        .I1(linebuf_reg_r2_896_959_24_26_n_2),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_832_895_24_26_n_2),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_768_831_24_26_n_2),
        .O(\lb_rdata[26]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[26]_i_7 
       (.I0(linebuf_reg_r2_192_255_24_26_n_2),
        .I1(linebuf_reg_r2_128_191_24_26_n_2),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_64_127_24_26_n_2),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_0_63_24_26_n_2),
        .O(\lb_rdata[26]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[26]_i_8 
       (.I0(linebuf_reg_r2_448_511_24_26_n_2),
        .I1(linebuf_reg_r2_384_447_24_26_n_2),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_320_383_24_26_n_2),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_256_319_24_26_n_2),
        .O(\lb_rdata[26]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \lb_rdata[27]_i_1 
       (.I0(lb_rdata0[27]),
        .I1(\lb_rdata[31]_i_4_n_0 ),
        .I2(\lb_rdata_reg[27]_i_3_n_0 ),
        .I3(rd_addr_next),
        .I4(\lb_rdata_reg[27]_i_4_n_0 ),
        .O(\lb_rdata[27]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \lb_rdata[27]_i_2 
       (.I0(linebuf_reg_r1_512_575_27_29_n_0),
        .I1(\vcnt[9]_i_5_n_0 ),
        .I2(rd_addr_next),
        .I3(linebuf_reg_r1_0_63_27_29_n_0),
        .O(lb_rdata0[27]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[27]_i_5 
       (.I0(linebuf_reg_r2_704_767_27_29_n_0),
        .I1(linebuf_reg_r2_640_703_27_29_n_0),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_576_639_27_29_n_0),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_512_575_27_29_n_0),
        .O(\lb_rdata[27]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[27]_i_6 
       (.I0(linebuf_reg_r2_960_1023_27_29_n_0),
        .I1(linebuf_reg_r2_896_959_27_29_n_0),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_832_895_27_29_n_0),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_768_831_27_29_n_0),
        .O(\lb_rdata[27]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[27]_i_7 
       (.I0(linebuf_reg_r2_192_255_27_29_n_0),
        .I1(linebuf_reg_r2_128_191_27_29_n_0),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_64_127_27_29_n_0),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_0_63_27_29_n_0),
        .O(\lb_rdata[27]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[27]_i_8 
       (.I0(linebuf_reg_r2_448_511_27_29_n_0),
        .I1(linebuf_reg_r2_384_447_27_29_n_0),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_320_383_27_29_n_0),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_256_319_27_29_n_0),
        .O(\lb_rdata[27]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \lb_rdata[28]_i_1 
       (.I0(lb_rdata0[28]),
        .I1(\lb_rdata[31]_i_4_n_0 ),
        .I2(\lb_rdata_reg[28]_i_3_n_0 ),
        .I3(rd_addr_next),
        .I4(\lb_rdata_reg[28]_i_4_n_0 ),
        .O(\lb_rdata[28]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \lb_rdata[28]_i_2 
       (.I0(linebuf_reg_r1_512_575_27_29_n_1),
        .I1(\vcnt[9]_i_5_n_0 ),
        .I2(rd_addr_next),
        .I3(linebuf_reg_r1_0_63_27_29_n_1),
        .O(lb_rdata0[28]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[28]_i_5 
       (.I0(linebuf_reg_r2_704_767_27_29_n_1),
        .I1(linebuf_reg_r2_640_703_27_29_n_1),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_576_639_27_29_n_1),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_512_575_27_29_n_1),
        .O(\lb_rdata[28]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[28]_i_6 
       (.I0(linebuf_reg_r2_960_1023_27_29_n_1),
        .I1(linebuf_reg_r2_896_959_27_29_n_1),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_832_895_27_29_n_1),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_768_831_27_29_n_1),
        .O(\lb_rdata[28]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[28]_i_7 
       (.I0(linebuf_reg_r2_192_255_27_29_n_1),
        .I1(linebuf_reg_r2_128_191_27_29_n_1),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_64_127_27_29_n_1),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_0_63_27_29_n_1),
        .O(\lb_rdata[28]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[28]_i_8 
       (.I0(linebuf_reg_r2_448_511_27_29_n_1),
        .I1(linebuf_reg_r2_384_447_27_29_n_1),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_320_383_27_29_n_1),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_256_319_27_29_n_1),
        .O(\lb_rdata[28]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \lb_rdata[29]_i_1 
       (.I0(lb_rdata0[29]),
        .I1(\lb_rdata[31]_i_4_n_0 ),
        .I2(\lb_rdata_reg[29]_i_3_n_0 ),
        .I3(rd_addr_next),
        .I4(\lb_rdata_reg[29]_i_4_n_0 ),
        .O(\lb_rdata[29]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \lb_rdata[29]_i_2 
       (.I0(linebuf_reg_r1_512_575_27_29_n_2),
        .I1(\vcnt[9]_i_5_n_0 ),
        .I2(rd_addr_next),
        .I3(linebuf_reg_r1_0_63_27_29_n_2),
        .O(lb_rdata0[29]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[29]_i_5 
       (.I0(linebuf_reg_r2_704_767_27_29_n_2),
        .I1(linebuf_reg_r2_640_703_27_29_n_2),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_576_639_27_29_n_2),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_512_575_27_29_n_2),
        .O(\lb_rdata[29]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[29]_i_6 
       (.I0(linebuf_reg_r2_960_1023_27_29_n_2),
        .I1(linebuf_reg_r2_896_959_27_29_n_2),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_832_895_27_29_n_2),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_768_831_27_29_n_2),
        .O(\lb_rdata[29]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[29]_i_7 
       (.I0(linebuf_reg_r2_192_255_27_29_n_2),
        .I1(linebuf_reg_r2_128_191_27_29_n_2),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_64_127_27_29_n_2),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_0_63_27_29_n_2),
        .O(\lb_rdata[29]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[29]_i_8 
       (.I0(linebuf_reg_r2_448_511_27_29_n_2),
        .I1(linebuf_reg_r2_384_447_27_29_n_2),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_320_383_27_29_n_2),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_256_319_27_29_n_2),
        .O(\lb_rdata[29]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \lb_rdata[2]_i_1 
       (.I0(lb_rdata0[2]),
        .I1(\lb_rdata[31]_i_4_n_0 ),
        .I2(\lb_rdata_reg[2]_i_3_n_0 ),
        .I3(rd_addr_next),
        .I4(\lb_rdata_reg[2]_i_4_n_0 ),
        .O(\lb_rdata[2]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \lb_rdata[2]_i_2 
       (.I0(linebuf_reg_r1_512_575_0_2_n_2),
        .I1(\vcnt[9]_i_5_n_0 ),
        .I2(rd_addr_next),
        .I3(linebuf_reg_r1_0_63_0_2_n_2),
        .O(lb_rdata0[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[2]_i_5 
       (.I0(linebuf_reg_r2_704_767_0_2_n_2),
        .I1(linebuf_reg_r2_640_703_0_2_n_2),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_576_639_0_2_n_2),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_512_575_0_2_n_2),
        .O(\lb_rdata[2]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[2]_i_6 
       (.I0(linebuf_reg_r2_960_1023_0_2_n_2),
        .I1(linebuf_reg_r2_896_959_0_2_n_2),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_832_895_0_2_n_2),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_768_831_0_2_n_2),
        .O(\lb_rdata[2]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[2]_i_7 
       (.I0(linebuf_reg_r2_192_255_0_2_n_2),
        .I1(linebuf_reg_r2_128_191_0_2_n_2),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_64_127_0_2_n_2),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_0_63_0_2_n_2),
        .O(\lb_rdata[2]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[2]_i_8 
       (.I0(linebuf_reg_r2_448_511_0_2_n_2),
        .I1(linebuf_reg_r2_384_447_0_2_n_2),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_320_383_0_2_n_2),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_256_319_0_2_n_2),
        .O(\lb_rdata[2]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \lb_rdata[30]_i_1 
       (.I0(lb_rdata0[30]),
        .I1(\lb_rdata[31]_i_4_n_0 ),
        .I2(\lb_rdata_reg[30]_i_3_n_0 ),
        .I3(rd_addr_next),
        .I4(\lb_rdata_reg[30]_i_4_n_0 ),
        .O(\lb_rdata[30]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \lb_rdata[30]_i_2 
       (.I0(linebuf_reg_r1_512_575_30_31_n_0),
        .I1(\vcnt[9]_i_5_n_0 ),
        .I2(rd_addr_next),
        .I3(linebuf_reg_r1_0_63_30_31_n_0),
        .O(lb_rdata0[30]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[30]_i_5 
       (.I0(linebuf_reg_r2_704_767_30_31_n_0),
        .I1(linebuf_reg_r2_640_703_30_31_n_0),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_576_639_30_31_n_0),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_512_575_30_31_n_0),
        .O(\lb_rdata[30]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[30]_i_6 
       (.I0(linebuf_reg_r2_960_1023_30_31_n_0),
        .I1(linebuf_reg_r2_896_959_30_31_n_0),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_832_895_30_31_n_0),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_768_831_30_31_n_0),
        .O(\lb_rdata[30]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[30]_i_7 
       (.I0(linebuf_reg_r2_192_255_30_31_n_0),
        .I1(linebuf_reg_r2_128_191_30_31_n_0),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_64_127_30_31_n_0),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_0_63_30_31_n_0),
        .O(\lb_rdata[30]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[30]_i_8 
       (.I0(linebuf_reg_r2_448_511_30_31_n_0),
        .I1(linebuf_reg_r2_384_447_30_31_n_0),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_320_383_30_31_n_0),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_256_319_30_31_n_0),
        .O(\lb_rdata[30]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'hFEAA)) 
    \lb_rdata[31]_i_1 
       (.I0(\hcnt_reg_n_0_[0] ),
        .I1(p_0_in_2[6]),
        .I2(p_0_in_2[7]),
        .I3(p_0_in_2[8]),
        .O(\lb_rdata[31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[31]_i_10 
       (.I0(linebuf_reg_r2_192_255_30_31_n_1),
        .I1(linebuf_reg_r2_128_191_30_31_n_1),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_64_127_30_31_n_1),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_0_63_30_31_n_1),
        .O(\lb_rdata[31]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[31]_i_11 
       (.I0(linebuf_reg_r2_448_511_30_31_n_1),
        .I1(linebuf_reg_r2_384_447_30_31_n_1),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_320_383_30_31_n_1),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_256_319_30_31_n_1),
        .O(\lb_rdata[31]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAA6AAAAAAA)) 
    \lb_rdata[31]_i_12 
       (.I0(p_0_in_2[7]),
        .I1(p_0_in_2[6]),
        .I2(p_0_in_2[3]),
        .I3(p_0_in_2[4]),
        .I4(p_0_in_2[5]),
        .I5(\hcnt[7]_i_2_n_0 ),
        .O(rd_addr_next0[7]));
  LUT5 #(
    .INIT(32'h9AAAAAAA)) 
    \lb_rdata[31]_i_13 
       (.I0(p_0_in_2[6]),
        .I1(\hcnt[7]_i_2_n_0 ),
        .I2(p_0_in_2[5]),
        .I3(p_0_in_2[4]),
        .I4(p_0_in_2[3]),
        .O(rd_addr_next0[6]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \lb_rdata[31]_i_2 
       (.I0(lb_rdata0[31]),
        .I1(\lb_rdata[31]_i_4_n_0 ),
        .I2(\lb_rdata_reg[31]_i_5_n_0 ),
        .I3(rd_addr_next),
        .I4(\lb_rdata_reg[31]_i_6_n_0 ),
        .O(\lb_rdata[31]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \lb_rdata[31]_i_3 
       (.I0(linebuf_reg_r1_512_575_30_31_n_1),
        .I1(\vcnt[9]_i_5_n_0 ),
        .I2(rd_addr_next),
        .I3(linebuf_reg_r1_0_63_30_31_n_1),
        .O(lb_rdata0[31]));
  LUT3 #(
    .INIT(8'hA8)) 
    \lb_rdata[31]_i_4 
       (.I0(p_0_in_2[8]),
        .I1(p_0_in_2[7]),
        .I2(p_0_in_2[6]),
        .O(\lb_rdata[31]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h6AAA)) 
    \lb_rdata[31]_i_7 
       (.I0(p_0_in_2[8]),
        .I1(p_0_in_2[6]),
        .I2(p_0_in_2[7]),
        .I3(\hcnt[9]_i_3_n_0 ),
        .O(rd_addr_next0[8]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[31]_i_8 
       (.I0(linebuf_reg_r2_704_767_30_31_n_1),
        .I1(linebuf_reg_r2_640_703_30_31_n_1),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_576_639_30_31_n_1),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_512_575_30_31_n_1),
        .O(\lb_rdata[31]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[31]_i_9 
       (.I0(linebuf_reg_r2_960_1023_30_31_n_1),
        .I1(linebuf_reg_r2_896_959_30_31_n_1),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_832_895_30_31_n_1),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_768_831_30_31_n_1),
        .O(\lb_rdata[31]_i_9_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \lb_rdata[3]_i_1 
       (.I0(lb_rdata0[3]),
        .I1(\lb_rdata[31]_i_4_n_0 ),
        .I2(\lb_rdata_reg[3]_i_3_n_0 ),
        .I3(rd_addr_next),
        .I4(\lb_rdata_reg[3]_i_4_n_0 ),
        .O(\lb_rdata[3]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \lb_rdata[3]_i_2 
       (.I0(linebuf_reg_r1_512_575_3_5_n_0),
        .I1(\vcnt[9]_i_5_n_0 ),
        .I2(rd_addr_next),
        .I3(linebuf_reg_r1_0_63_3_5_n_0),
        .O(lb_rdata0[3]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[3]_i_5 
       (.I0(linebuf_reg_r2_704_767_3_5_n_0),
        .I1(linebuf_reg_r2_640_703_3_5_n_0),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_576_639_3_5_n_0),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_512_575_3_5_n_0),
        .O(\lb_rdata[3]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[3]_i_6 
       (.I0(linebuf_reg_r2_960_1023_3_5_n_0),
        .I1(linebuf_reg_r2_896_959_3_5_n_0),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_832_895_3_5_n_0),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_768_831_3_5_n_0),
        .O(\lb_rdata[3]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[3]_i_7 
       (.I0(linebuf_reg_r2_192_255_3_5_n_0),
        .I1(linebuf_reg_r2_128_191_3_5_n_0),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_64_127_3_5_n_0),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_0_63_3_5_n_0),
        .O(\lb_rdata[3]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[3]_i_8 
       (.I0(linebuf_reg_r2_448_511_3_5_n_0),
        .I1(linebuf_reg_r2_384_447_3_5_n_0),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_320_383_3_5_n_0),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_256_319_3_5_n_0),
        .O(\lb_rdata[3]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \lb_rdata[4]_i_1 
       (.I0(lb_rdata0[4]),
        .I1(\lb_rdata[31]_i_4_n_0 ),
        .I2(\lb_rdata_reg[4]_i_3_n_0 ),
        .I3(rd_addr_next),
        .I4(\lb_rdata_reg[4]_i_4_n_0 ),
        .O(\lb_rdata[4]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \lb_rdata[4]_i_2 
       (.I0(linebuf_reg_r1_512_575_3_5_n_1),
        .I1(\vcnt[9]_i_5_n_0 ),
        .I2(rd_addr_next),
        .I3(linebuf_reg_r1_0_63_3_5_n_1),
        .O(lb_rdata0[4]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[4]_i_5 
       (.I0(linebuf_reg_r2_704_767_3_5_n_1),
        .I1(linebuf_reg_r2_640_703_3_5_n_1),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_576_639_3_5_n_1),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_512_575_3_5_n_1),
        .O(\lb_rdata[4]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[4]_i_6 
       (.I0(linebuf_reg_r2_960_1023_3_5_n_1),
        .I1(linebuf_reg_r2_896_959_3_5_n_1),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_832_895_3_5_n_1),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_768_831_3_5_n_1),
        .O(\lb_rdata[4]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[4]_i_7 
       (.I0(linebuf_reg_r2_192_255_3_5_n_1),
        .I1(linebuf_reg_r2_128_191_3_5_n_1),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_64_127_3_5_n_1),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_0_63_3_5_n_1),
        .O(\lb_rdata[4]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[4]_i_8 
       (.I0(linebuf_reg_r2_448_511_3_5_n_1),
        .I1(linebuf_reg_r2_384_447_3_5_n_1),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_320_383_3_5_n_1),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_256_319_3_5_n_1),
        .O(\lb_rdata[4]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \lb_rdata[5]_i_1 
       (.I0(lb_rdata0[5]),
        .I1(\lb_rdata[31]_i_4_n_0 ),
        .I2(\lb_rdata_reg[5]_i_3_n_0 ),
        .I3(rd_addr_next),
        .I4(\lb_rdata_reg[5]_i_4_n_0 ),
        .O(\lb_rdata[5]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \lb_rdata[5]_i_2 
       (.I0(linebuf_reg_r1_512_575_3_5_n_2),
        .I1(\vcnt[9]_i_5_n_0 ),
        .I2(rd_addr_next),
        .I3(linebuf_reg_r1_0_63_3_5_n_2),
        .O(lb_rdata0[5]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[5]_i_5 
       (.I0(linebuf_reg_r2_704_767_3_5_n_2),
        .I1(linebuf_reg_r2_640_703_3_5_n_2),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_576_639_3_5_n_2),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_512_575_3_5_n_2),
        .O(\lb_rdata[5]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[5]_i_6 
       (.I0(linebuf_reg_r2_960_1023_3_5_n_2),
        .I1(linebuf_reg_r2_896_959_3_5_n_2),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_832_895_3_5_n_2),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_768_831_3_5_n_2),
        .O(\lb_rdata[5]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[5]_i_7 
       (.I0(linebuf_reg_r2_192_255_3_5_n_2),
        .I1(linebuf_reg_r2_128_191_3_5_n_2),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_64_127_3_5_n_2),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_0_63_3_5_n_2),
        .O(\lb_rdata[5]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[5]_i_8 
       (.I0(linebuf_reg_r2_448_511_3_5_n_2),
        .I1(linebuf_reg_r2_384_447_3_5_n_2),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_320_383_3_5_n_2),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_256_319_3_5_n_2),
        .O(\lb_rdata[5]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \lb_rdata[6]_i_1 
       (.I0(lb_rdata0[6]),
        .I1(\lb_rdata[31]_i_4_n_0 ),
        .I2(\lb_rdata_reg[6]_i_3_n_0 ),
        .I3(rd_addr_next),
        .I4(\lb_rdata_reg[6]_i_4_n_0 ),
        .O(\lb_rdata[6]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \lb_rdata[6]_i_2 
       (.I0(linebuf_reg_r1_512_575_6_8_n_0),
        .I1(\vcnt[9]_i_5_n_0 ),
        .I2(rd_addr_next),
        .I3(linebuf_reg_r1_0_63_6_8_n_0),
        .O(lb_rdata0[6]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[6]_i_5 
       (.I0(linebuf_reg_r2_704_767_6_8_n_0),
        .I1(linebuf_reg_r2_640_703_6_8_n_0),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_576_639_6_8_n_0),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_512_575_6_8_n_0),
        .O(\lb_rdata[6]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[6]_i_6 
       (.I0(linebuf_reg_r2_960_1023_6_8_n_0),
        .I1(linebuf_reg_r2_896_959_6_8_n_0),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_832_895_6_8_n_0),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_768_831_6_8_n_0),
        .O(\lb_rdata[6]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[6]_i_7 
       (.I0(linebuf_reg_r2_192_255_6_8_n_0),
        .I1(linebuf_reg_r2_128_191_6_8_n_0),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_64_127_6_8_n_0),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_0_63_6_8_n_0),
        .O(\lb_rdata[6]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[6]_i_8 
       (.I0(linebuf_reg_r2_448_511_6_8_n_0),
        .I1(linebuf_reg_r2_384_447_6_8_n_0),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_320_383_6_8_n_0),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_256_319_6_8_n_0),
        .O(\lb_rdata[6]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \lb_rdata[7]_i_1 
       (.I0(lb_rdata0[7]),
        .I1(\lb_rdata[31]_i_4_n_0 ),
        .I2(\lb_rdata_reg[7]_i_3_n_0 ),
        .I3(rd_addr_next),
        .I4(\lb_rdata_reg[7]_i_4_n_0 ),
        .O(\lb_rdata[7]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \lb_rdata[7]_i_2 
       (.I0(linebuf_reg_r1_512_575_6_8_n_1),
        .I1(\vcnt[9]_i_5_n_0 ),
        .I2(rd_addr_next),
        .I3(linebuf_reg_r1_0_63_6_8_n_1),
        .O(lb_rdata0[7]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[7]_i_5 
       (.I0(linebuf_reg_r2_704_767_6_8_n_1),
        .I1(linebuf_reg_r2_640_703_6_8_n_1),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_576_639_6_8_n_1),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_512_575_6_8_n_1),
        .O(\lb_rdata[7]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[7]_i_6 
       (.I0(linebuf_reg_r2_960_1023_6_8_n_1),
        .I1(linebuf_reg_r2_896_959_6_8_n_1),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_832_895_6_8_n_1),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_768_831_6_8_n_1),
        .O(\lb_rdata[7]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[7]_i_7 
       (.I0(linebuf_reg_r2_192_255_6_8_n_1),
        .I1(linebuf_reg_r2_128_191_6_8_n_1),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_64_127_6_8_n_1),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_0_63_6_8_n_1),
        .O(\lb_rdata[7]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[7]_i_8 
       (.I0(linebuf_reg_r2_448_511_6_8_n_1),
        .I1(linebuf_reg_r2_384_447_6_8_n_1),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_320_383_6_8_n_1),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_256_319_6_8_n_1),
        .O(\lb_rdata[7]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \lb_rdata[8]_i_1 
       (.I0(lb_rdata0[8]),
        .I1(\lb_rdata[31]_i_4_n_0 ),
        .I2(\lb_rdata_reg[8]_i_3_n_0 ),
        .I3(rd_addr_next),
        .I4(\lb_rdata_reg[8]_i_4_n_0 ),
        .O(\lb_rdata[8]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \lb_rdata[8]_i_2 
       (.I0(linebuf_reg_r1_512_575_6_8_n_2),
        .I1(\vcnt[9]_i_5_n_0 ),
        .I2(rd_addr_next),
        .I3(linebuf_reg_r1_0_63_6_8_n_2),
        .O(lb_rdata0[8]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[8]_i_5 
       (.I0(linebuf_reg_r2_704_767_6_8_n_2),
        .I1(linebuf_reg_r2_640_703_6_8_n_2),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_576_639_6_8_n_2),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_512_575_6_8_n_2),
        .O(\lb_rdata[8]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[8]_i_6 
       (.I0(linebuf_reg_r2_960_1023_6_8_n_2),
        .I1(linebuf_reg_r2_896_959_6_8_n_2),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_832_895_6_8_n_2),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_768_831_6_8_n_2),
        .O(\lb_rdata[8]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[8]_i_7 
       (.I0(linebuf_reg_r2_192_255_6_8_n_2),
        .I1(linebuf_reg_r2_128_191_6_8_n_2),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_64_127_6_8_n_2),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_0_63_6_8_n_2),
        .O(\lb_rdata[8]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[8]_i_8 
       (.I0(linebuf_reg_r2_448_511_6_8_n_2),
        .I1(linebuf_reg_r2_384_447_6_8_n_2),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_320_383_6_8_n_2),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_256_319_6_8_n_2),
        .O(\lb_rdata[8]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \lb_rdata[9]_i_1 
       (.I0(lb_rdata0[9]),
        .I1(\lb_rdata[31]_i_4_n_0 ),
        .I2(\lb_rdata_reg[9]_i_3_n_0 ),
        .I3(rd_addr_next),
        .I4(\lb_rdata_reg[9]_i_4_n_0 ),
        .O(\lb_rdata[9]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \lb_rdata[9]_i_2 
       (.I0(linebuf_reg_r1_512_575_9_11_n_0),
        .I1(\vcnt[9]_i_5_n_0 ),
        .I2(rd_addr_next),
        .I3(linebuf_reg_r1_0_63_9_11_n_0),
        .O(lb_rdata0[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[9]_i_5 
       (.I0(linebuf_reg_r2_704_767_9_11_n_0),
        .I1(linebuf_reg_r2_640_703_9_11_n_0),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_576_639_9_11_n_0),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_512_575_9_11_n_0),
        .O(\lb_rdata[9]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[9]_i_6 
       (.I0(linebuf_reg_r2_960_1023_9_11_n_0),
        .I1(linebuf_reg_r2_896_959_9_11_n_0),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_832_895_9_11_n_0),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_768_831_9_11_n_0),
        .O(\lb_rdata[9]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[9]_i_7 
       (.I0(linebuf_reg_r2_192_255_9_11_n_0),
        .I1(linebuf_reg_r2_128_191_9_11_n_0),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_64_127_9_11_n_0),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_0_63_9_11_n_0),
        .O(\lb_rdata[9]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \lb_rdata[9]_i_8 
       (.I0(linebuf_reg_r2_448_511_9_11_n_0),
        .I1(linebuf_reg_r2_384_447_9_11_n_0),
        .I2(rd_addr_next0[7]),
        .I3(linebuf_reg_r2_320_383_9_11_n_0),
        .I4(rd_addr_next0[6]),
        .I5(linebuf_reg_r2_256_319_9_11_n_0),
        .O(\lb_rdata[9]_i_8_n_0 ));
  FDRE \lb_rdata_reg[0] 
       (.C(pixel_clk),
        .CE(\lb_rdata[31]_i_1_n_0 ),
        .D(\lb_rdata[0]_i_1_n_0 ),
        .Q(\lb_rdata_reg_n_0_[0] ),
        .R(1'b0));
  MUXF7 \lb_rdata_reg[0]_i_3 
       (.I0(\lb_rdata[0]_i_5_n_0 ),
        .I1(\lb_rdata[0]_i_6_n_0 ),
        .O(\lb_rdata_reg[0]_i_3_n_0 ),
        .S(rd_addr_next0[8]));
  MUXF7 \lb_rdata_reg[0]_i_4 
       (.I0(\lb_rdata[0]_i_7_n_0 ),
        .I1(\lb_rdata[0]_i_8_n_0 ),
        .O(\lb_rdata_reg[0]_i_4_n_0 ),
        .S(rd_addr_next0[8]));
  FDRE \lb_rdata_reg[10] 
       (.C(pixel_clk),
        .CE(\lb_rdata[31]_i_1_n_0 ),
        .D(\lb_rdata[10]_i_1_n_0 ),
        .Q(\lb_rdata_reg_n_0_[10] ),
        .R(1'b0));
  MUXF7 \lb_rdata_reg[10]_i_3 
       (.I0(\lb_rdata[10]_i_5_n_0 ),
        .I1(\lb_rdata[10]_i_6_n_0 ),
        .O(\lb_rdata_reg[10]_i_3_n_0 ),
        .S(rd_addr_next0[8]));
  MUXF7 \lb_rdata_reg[10]_i_4 
       (.I0(\lb_rdata[10]_i_7_n_0 ),
        .I1(\lb_rdata[10]_i_8_n_0 ),
        .O(\lb_rdata_reg[10]_i_4_n_0 ),
        .S(rd_addr_next0[8]));
  FDRE \lb_rdata_reg[11] 
       (.C(pixel_clk),
        .CE(\lb_rdata[31]_i_1_n_0 ),
        .D(\lb_rdata[11]_i_1_n_0 ),
        .Q(\lb_rdata_reg_n_0_[11] ),
        .R(1'b0));
  MUXF7 \lb_rdata_reg[11]_i_3 
       (.I0(\lb_rdata[11]_i_5_n_0 ),
        .I1(\lb_rdata[11]_i_6_n_0 ),
        .O(\lb_rdata_reg[11]_i_3_n_0 ),
        .S(rd_addr_next0[8]));
  MUXF7 \lb_rdata_reg[11]_i_4 
       (.I0(\lb_rdata[11]_i_7_n_0 ),
        .I1(\lb_rdata[11]_i_8_n_0 ),
        .O(\lb_rdata_reg[11]_i_4_n_0 ),
        .S(rd_addr_next0[8]));
  FDRE \lb_rdata_reg[12] 
       (.C(pixel_clk),
        .CE(\lb_rdata[31]_i_1_n_0 ),
        .D(\lb_rdata[12]_i_1_n_0 ),
        .Q(\lb_rdata_reg_n_0_[12] ),
        .R(1'b0));
  MUXF7 \lb_rdata_reg[12]_i_3 
       (.I0(\lb_rdata[12]_i_5_n_0 ),
        .I1(\lb_rdata[12]_i_6_n_0 ),
        .O(\lb_rdata_reg[12]_i_3_n_0 ),
        .S(rd_addr_next0[8]));
  MUXF7 \lb_rdata_reg[12]_i_4 
       (.I0(\lb_rdata[12]_i_7_n_0 ),
        .I1(\lb_rdata[12]_i_8_n_0 ),
        .O(\lb_rdata_reg[12]_i_4_n_0 ),
        .S(rd_addr_next0[8]));
  FDRE \lb_rdata_reg[13] 
       (.C(pixel_clk),
        .CE(\lb_rdata[31]_i_1_n_0 ),
        .D(\lb_rdata[13]_i_1_n_0 ),
        .Q(\lb_rdata_reg_n_0_[13] ),
        .R(1'b0));
  MUXF7 \lb_rdata_reg[13]_i_3 
       (.I0(\lb_rdata[13]_i_5_n_0 ),
        .I1(\lb_rdata[13]_i_6_n_0 ),
        .O(\lb_rdata_reg[13]_i_3_n_0 ),
        .S(rd_addr_next0[8]));
  MUXF7 \lb_rdata_reg[13]_i_4 
       (.I0(\lb_rdata[13]_i_7_n_0 ),
        .I1(\lb_rdata[13]_i_8_n_0 ),
        .O(\lb_rdata_reg[13]_i_4_n_0 ),
        .S(rd_addr_next0[8]));
  FDRE \lb_rdata_reg[14] 
       (.C(pixel_clk),
        .CE(\lb_rdata[31]_i_1_n_0 ),
        .D(\lb_rdata[14]_i_1_n_0 ),
        .Q(\lb_rdata_reg_n_0_[14] ),
        .R(1'b0));
  MUXF7 \lb_rdata_reg[14]_i_3 
       (.I0(\lb_rdata[14]_i_5_n_0 ),
        .I1(\lb_rdata[14]_i_6_n_0 ),
        .O(\lb_rdata_reg[14]_i_3_n_0 ),
        .S(rd_addr_next0[8]));
  MUXF7 \lb_rdata_reg[14]_i_4 
       (.I0(\lb_rdata[14]_i_7_n_0 ),
        .I1(\lb_rdata[14]_i_8_n_0 ),
        .O(\lb_rdata_reg[14]_i_4_n_0 ),
        .S(rd_addr_next0[8]));
  FDRE \lb_rdata_reg[15] 
       (.C(pixel_clk),
        .CE(\lb_rdata[31]_i_1_n_0 ),
        .D(\lb_rdata[15]_i_1_n_0 ),
        .Q(\lb_rdata_reg_n_0_[15] ),
        .R(1'b0));
  MUXF7 \lb_rdata_reg[15]_i_3 
       (.I0(\lb_rdata[15]_i_5_n_0 ),
        .I1(\lb_rdata[15]_i_6_n_0 ),
        .O(\lb_rdata_reg[15]_i_3_n_0 ),
        .S(rd_addr_next0[8]));
  MUXF7 \lb_rdata_reg[15]_i_4 
       (.I0(\lb_rdata[15]_i_7_n_0 ),
        .I1(\lb_rdata[15]_i_8_n_0 ),
        .O(\lb_rdata_reg[15]_i_4_n_0 ),
        .S(rd_addr_next0[8]));
  FDRE \lb_rdata_reg[16] 
       (.C(pixel_clk),
        .CE(\lb_rdata[31]_i_1_n_0 ),
        .D(\lb_rdata[16]_i_1_n_0 ),
        .Q(\lb_rdata_reg_n_0_[16] ),
        .R(1'b0));
  MUXF7 \lb_rdata_reg[16]_i_3 
       (.I0(\lb_rdata[16]_i_5_n_0 ),
        .I1(\lb_rdata[16]_i_6_n_0 ),
        .O(\lb_rdata_reg[16]_i_3_n_0 ),
        .S(rd_addr_next0[8]));
  MUXF7 \lb_rdata_reg[16]_i_4 
       (.I0(\lb_rdata[16]_i_7_n_0 ),
        .I1(\lb_rdata[16]_i_8_n_0 ),
        .O(\lb_rdata_reg[16]_i_4_n_0 ),
        .S(rd_addr_next0[8]));
  FDRE \lb_rdata_reg[17] 
       (.C(pixel_clk),
        .CE(\lb_rdata[31]_i_1_n_0 ),
        .D(\lb_rdata[17]_i_1_n_0 ),
        .Q(\lb_rdata_reg_n_0_[17] ),
        .R(1'b0));
  MUXF7 \lb_rdata_reg[17]_i_3 
       (.I0(\lb_rdata[17]_i_5_n_0 ),
        .I1(\lb_rdata[17]_i_6_n_0 ),
        .O(\lb_rdata_reg[17]_i_3_n_0 ),
        .S(rd_addr_next0[8]));
  MUXF7 \lb_rdata_reg[17]_i_4 
       (.I0(\lb_rdata[17]_i_7_n_0 ),
        .I1(\lb_rdata[17]_i_8_n_0 ),
        .O(\lb_rdata_reg[17]_i_4_n_0 ),
        .S(rd_addr_next0[8]));
  FDRE \lb_rdata_reg[18] 
       (.C(pixel_clk),
        .CE(\lb_rdata[31]_i_1_n_0 ),
        .D(\lb_rdata[18]_i_1_n_0 ),
        .Q(\lb_rdata_reg_n_0_[18] ),
        .R(1'b0));
  MUXF7 \lb_rdata_reg[18]_i_3 
       (.I0(\lb_rdata[18]_i_5_n_0 ),
        .I1(\lb_rdata[18]_i_6_n_0 ),
        .O(\lb_rdata_reg[18]_i_3_n_0 ),
        .S(rd_addr_next0[8]));
  MUXF7 \lb_rdata_reg[18]_i_4 
       (.I0(\lb_rdata[18]_i_7_n_0 ),
        .I1(\lb_rdata[18]_i_8_n_0 ),
        .O(\lb_rdata_reg[18]_i_4_n_0 ),
        .S(rd_addr_next0[8]));
  FDRE \lb_rdata_reg[19] 
       (.C(pixel_clk),
        .CE(\lb_rdata[31]_i_1_n_0 ),
        .D(\lb_rdata[19]_i_1_n_0 ),
        .Q(\lb_rdata_reg_n_0_[19] ),
        .R(1'b0));
  MUXF7 \lb_rdata_reg[19]_i_3 
       (.I0(\lb_rdata[19]_i_5_n_0 ),
        .I1(\lb_rdata[19]_i_6_n_0 ),
        .O(\lb_rdata_reg[19]_i_3_n_0 ),
        .S(rd_addr_next0[8]));
  MUXF7 \lb_rdata_reg[19]_i_4 
       (.I0(\lb_rdata[19]_i_7_n_0 ),
        .I1(\lb_rdata[19]_i_8_n_0 ),
        .O(\lb_rdata_reg[19]_i_4_n_0 ),
        .S(rd_addr_next0[8]));
  FDRE \lb_rdata_reg[1] 
       (.C(pixel_clk),
        .CE(\lb_rdata[31]_i_1_n_0 ),
        .D(\lb_rdata[1]_i_1_n_0 ),
        .Q(\lb_rdata_reg_n_0_[1] ),
        .R(1'b0));
  MUXF7 \lb_rdata_reg[1]_i_3 
       (.I0(\lb_rdata[1]_i_5_n_0 ),
        .I1(\lb_rdata[1]_i_6_n_0 ),
        .O(\lb_rdata_reg[1]_i_3_n_0 ),
        .S(rd_addr_next0[8]));
  MUXF7 \lb_rdata_reg[1]_i_4 
       (.I0(\lb_rdata[1]_i_7_n_0 ),
        .I1(\lb_rdata[1]_i_8_n_0 ),
        .O(\lb_rdata_reg[1]_i_4_n_0 ),
        .S(rd_addr_next0[8]));
  FDRE \lb_rdata_reg[20] 
       (.C(pixel_clk),
        .CE(\lb_rdata[31]_i_1_n_0 ),
        .D(\lb_rdata[20]_i_1_n_0 ),
        .Q(\lb_rdata_reg_n_0_[20] ),
        .R(1'b0));
  MUXF7 \lb_rdata_reg[20]_i_3 
       (.I0(\lb_rdata[20]_i_5_n_0 ),
        .I1(\lb_rdata[20]_i_6_n_0 ),
        .O(\lb_rdata_reg[20]_i_3_n_0 ),
        .S(rd_addr_next0[8]));
  MUXF7 \lb_rdata_reg[20]_i_4 
       (.I0(\lb_rdata[20]_i_7_n_0 ),
        .I1(\lb_rdata[20]_i_8_n_0 ),
        .O(\lb_rdata_reg[20]_i_4_n_0 ),
        .S(rd_addr_next0[8]));
  FDRE \lb_rdata_reg[21] 
       (.C(pixel_clk),
        .CE(\lb_rdata[31]_i_1_n_0 ),
        .D(\lb_rdata[21]_i_1_n_0 ),
        .Q(\lb_rdata_reg_n_0_[21] ),
        .R(1'b0));
  MUXF7 \lb_rdata_reg[21]_i_3 
       (.I0(\lb_rdata[21]_i_5_n_0 ),
        .I1(\lb_rdata[21]_i_6_n_0 ),
        .O(\lb_rdata_reg[21]_i_3_n_0 ),
        .S(rd_addr_next0[8]));
  MUXF7 \lb_rdata_reg[21]_i_4 
       (.I0(\lb_rdata[21]_i_7_n_0 ),
        .I1(\lb_rdata[21]_i_8_n_0 ),
        .O(\lb_rdata_reg[21]_i_4_n_0 ),
        .S(rd_addr_next0[8]));
  FDRE \lb_rdata_reg[22] 
       (.C(pixel_clk),
        .CE(\lb_rdata[31]_i_1_n_0 ),
        .D(\lb_rdata[22]_i_1_n_0 ),
        .Q(\lb_rdata_reg_n_0_[22] ),
        .R(1'b0));
  MUXF7 \lb_rdata_reg[22]_i_3 
       (.I0(\lb_rdata[22]_i_5_n_0 ),
        .I1(\lb_rdata[22]_i_6_n_0 ),
        .O(\lb_rdata_reg[22]_i_3_n_0 ),
        .S(rd_addr_next0[8]));
  MUXF7 \lb_rdata_reg[22]_i_4 
       (.I0(\lb_rdata[22]_i_7_n_0 ),
        .I1(\lb_rdata[22]_i_8_n_0 ),
        .O(\lb_rdata_reg[22]_i_4_n_0 ),
        .S(rd_addr_next0[8]));
  FDRE \lb_rdata_reg[23] 
       (.C(pixel_clk),
        .CE(\lb_rdata[31]_i_1_n_0 ),
        .D(\lb_rdata[23]_i_1_n_0 ),
        .Q(\lb_rdata_reg_n_0_[23] ),
        .R(1'b0));
  MUXF7 \lb_rdata_reg[23]_i_3 
       (.I0(\lb_rdata[23]_i_5_n_0 ),
        .I1(\lb_rdata[23]_i_6_n_0 ),
        .O(\lb_rdata_reg[23]_i_3_n_0 ),
        .S(rd_addr_next0[8]));
  MUXF7 \lb_rdata_reg[23]_i_4 
       (.I0(\lb_rdata[23]_i_7_n_0 ),
        .I1(\lb_rdata[23]_i_8_n_0 ),
        .O(\lb_rdata_reg[23]_i_4_n_0 ),
        .S(rd_addr_next0[8]));
  FDRE \lb_rdata_reg[24] 
       (.C(pixel_clk),
        .CE(\lb_rdata[31]_i_1_n_0 ),
        .D(\lb_rdata[24]_i_1_n_0 ),
        .Q(\lb_rdata_reg_n_0_[24] ),
        .R(1'b0));
  MUXF7 \lb_rdata_reg[24]_i_3 
       (.I0(\lb_rdata[24]_i_5_n_0 ),
        .I1(\lb_rdata[24]_i_6_n_0 ),
        .O(\lb_rdata_reg[24]_i_3_n_0 ),
        .S(rd_addr_next0[8]));
  MUXF7 \lb_rdata_reg[24]_i_4 
       (.I0(\lb_rdata[24]_i_7_n_0 ),
        .I1(\lb_rdata[24]_i_8_n_0 ),
        .O(\lb_rdata_reg[24]_i_4_n_0 ),
        .S(rd_addr_next0[8]));
  FDRE \lb_rdata_reg[25] 
       (.C(pixel_clk),
        .CE(\lb_rdata[31]_i_1_n_0 ),
        .D(\lb_rdata[25]_i_1_n_0 ),
        .Q(\lb_rdata_reg_n_0_[25] ),
        .R(1'b0));
  MUXF7 \lb_rdata_reg[25]_i_3 
       (.I0(\lb_rdata[25]_i_5_n_0 ),
        .I1(\lb_rdata[25]_i_6_n_0 ),
        .O(\lb_rdata_reg[25]_i_3_n_0 ),
        .S(rd_addr_next0[8]));
  MUXF7 \lb_rdata_reg[25]_i_4 
       (.I0(\lb_rdata[25]_i_7_n_0 ),
        .I1(\lb_rdata[25]_i_8_n_0 ),
        .O(\lb_rdata_reg[25]_i_4_n_0 ),
        .S(rd_addr_next0[8]));
  FDRE \lb_rdata_reg[26] 
       (.C(pixel_clk),
        .CE(\lb_rdata[31]_i_1_n_0 ),
        .D(\lb_rdata[26]_i_1_n_0 ),
        .Q(\lb_rdata_reg_n_0_[26] ),
        .R(1'b0));
  MUXF7 \lb_rdata_reg[26]_i_3 
       (.I0(\lb_rdata[26]_i_5_n_0 ),
        .I1(\lb_rdata[26]_i_6_n_0 ),
        .O(\lb_rdata_reg[26]_i_3_n_0 ),
        .S(rd_addr_next0[8]));
  MUXF7 \lb_rdata_reg[26]_i_4 
       (.I0(\lb_rdata[26]_i_7_n_0 ),
        .I1(\lb_rdata[26]_i_8_n_0 ),
        .O(\lb_rdata_reg[26]_i_4_n_0 ),
        .S(rd_addr_next0[8]));
  FDRE \lb_rdata_reg[27] 
       (.C(pixel_clk),
        .CE(\lb_rdata[31]_i_1_n_0 ),
        .D(\lb_rdata[27]_i_1_n_0 ),
        .Q(\lb_rdata_reg_n_0_[27] ),
        .R(1'b0));
  MUXF7 \lb_rdata_reg[27]_i_3 
       (.I0(\lb_rdata[27]_i_5_n_0 ),
        .I1(\lb_rdata[27]_i_6_n_0 ),
        .O(\lb_rdata_reg[27]_i_3_n_0 ),
        .S(rd_addr_next0[8]));
  MUXF7 \lb_rdata_reg[27]_i_4 
       (.I0(\lb_rdata[27]_i_7_n_0 ),
        .I1(\lb_rdata[27]_i_8_n_0 ),
        .O(\lb_rdata_reg[27]_i_4_n_0 ),
        .S(rd_addr_next0[8]));
  FDRE \lb_rdata_reg[28] 
       (.C(pixel_clk),
        .CE(\lb_rdata[31]_i_1_n_0 ),
        .D(\lb_rdata[28]_i_1_n_0 ),
        .Q(\lb_rdata_reg_n_0_[28] ),
        .R(1'b0));
  MUXF7 \lb_rdata_reg[28]_i_3 
       (.I0(\lb_rdata[28]_i_5_n_0 ),
        .I1(\lb_rdata[28]_i_6_n_0 ),
        .O(\lb_rdata_reg[28]_i_3_n_0 ),
        .S(rd_addr_next0[8]));
  MUXF7 \lb_rdata_reg[28]_i_4 
       (.I0(\lb_rdata[28]_i_7_n_0 ),
        .I1(\lb_rdata[28]_i_8_n_0 ),
        .O(\lb_rdata_reg[28]_i_4_n_0 ),
        .S(rd_addr_next0[8]));
  FDRE \lb_rdata_reg[29] 
       (.C(pixel_clk),
        .CE(\lb_rdata[31]_i_1_n_0 ),
        .D(\lb_rdata[29]_i_1_n_0 ),
        .Q(\lb_rdata_reg_n_0_[29] ),
        .R(1'b0));
  MUXF7 \lb_rdata_reg[29]_i_3 
       (.I0(\lb_rdata[29]_i_5_n_0 ),
        .I1(\lb_rdata[29]_i_6_n_0 ),
        .O(\lb_rdata_reg[29]_i_3_n_0 ),
        .S(rd_addr_next0[8]));
  MUXF7 \lb_rdata_reg[29]_i_4 
       (.I0(\lb_rdata[29]_i_7_n_0 ),
        .I1(\lb_rdata[29]_i_8_n_0 ),
        .O(\lb_rdata_reg[29]_i_4_n_0 ),
        .S(rd_addr_next0[8]));
  FDRE \lb_rdata_reg[2] 
       (.C(pixel_clk),
        .CE(\lb_rdata[31]_i_1_n_0 ),
        .D(\lb_rdata[2]_i_1_n_0 ),
        .Q(\lb_rdata_reg_n_0_[2] ),
        .R(1'b0));
  MUXF7 \lb_rdata_reg[2]_i_3 
       (.I0(\lb_rdata[2]_i_5_n_0 ),
        .I1(\lb_rdata[2]_i_6_n_0 ),
        .O(\lb_rdata_reg[2]_i_3_n_0 ),
        .S(rd_addr_next0[8]));
  MUXF7 \lb_rdata_reg[2]_i_4 
       (.I0(\lb_rdata[2]_i_7_n_0 ),
        .I1(\lb_rdata[2]_i_8_n_0 ),
        .O(\lb_rdata_reg[2]_i_4_n_0 ),
        .S(rd_addr_next0[8]));
  FDRE \lb_rdata_reg[30] 
       (.C(pixel_clk),
        .CE(\lb_rdata[31]_i_1_n_0 ),
        .D(\lb_rdata[30]_i_1_n_0 ),
        .Q(\lb_rdata_reg_n_0_[30] ),
        .R(1'b0));
  MUXF7 \lb_rdata_reg[30]_i_3 
       (.I0(\lb_rdata[30]_i_5_n_0 ),
        .I1(\lb_rdata[30]_i_6_n_0 ),
        .O(\lb_rdata_reg[30]_i_3_n_0 ),
        .S(rd_addr_next0[8]));
  MUXF7 \lb_rdata_reg[30]_i_4 
       (.I0(\lb_rdata[30]_i_7_n_0 ),
        .I1(\lb_rdata[30]_i_8_n_0 ),
        .O(\lb_rdata_reg[30]_i_4_n_0 ),
        .S(rd_addr_next0[8]));
  FDRE \lb_rdata_reg[31] 
       (.C(pixel_clk),
        .CE(\lb_rdata[31]_i_1_n_0 ),
        .D(\lb_rdata[31]_i_2_n_0 ),
        .Q(\lb_rdata_reg_n_0_[31] ),
        .R(1'b0));
  MUXF7 \lb_rdata_reg[31]_i_5 
       (.I0(\lb_rdata[31]_i_8_n_0 ),
        .I1(\lb_rdata[31]_i_9_n_0 ),
        .O(\lb_rdata_reg[31]_i_5_n_0 ),
        .S(rd_addr_next0[8]));
  MUXF7 \lb_rdata_reg[31]_i_6 
       (.I0(\lb_rdata[31]_i_10_n_0 ),
        .I1(\lb_rdata[31]_i_11_n_0 ),
        .O(\lb_rdata_reg[31]_i_6_n_0 ),
        .S(rd_addr_next0[8]));
  FDRE \lb_rdata_reg[3] 
       (.C(pixel_clk),
        .CE(\lb_rdata[31]_i_1_n_0 ),
        .D(\lb_rdata[3]_i_1_n_0 ),
        .Q(\lb_rdata_reg_n_0_[3] ),
        .R(1'b0));
  MUXF7 \lb_rdata_reg[3]_i_3 
       (.I0(\lb_rdata[3]_i_5_n_0 ),
        .I1(\lb_rdata[3]_i_6_n_0 ),
        .O(\lb_rdata_reg[3]_i_3_n_0 ),
        .S(rd_addr_next0[8]));
  MUXF7 \lb_rdata_reg[3]_i_4 
       (.I0(\lb_rdata[3]_i_7_n_0 ),
        .I1(\lb_rdata[3]_i_8_n_0 ),
        .O(\lb_rdata_reg[3]_i_4_n_0 ),
        .S(rd_addr_next0[8]));
  FDRE \lb_rdata_reg[4] 
       (.C(pixel_clk),
        .CE(\lb_rdata[31]_i_1_n_0 ),
        .D(\lb_rdata[4]_i_1_n_0 ),
        .Q(\lb_rdata_reg_n_0_[4] ),
        .R(1'b0));
  MUXF7 \lb_rdata_reg[4]_i_3 
       (.I0(\lb_rdata[4]_i_5_n_0 ),
        .I1(\lb_rdata[4]_i_6_n_0 ),
        .O(\lb_rdata_reg[4]_i_3_n_0 ),
        .S(rd_addr_next0[8]));
  MUXF7 \lb_rdata_reg[4]_i_4 
       (.I0(\lb_rdata[4]_i_7_n_0 ),
        .I1(\lb_rdata[4]_i_8_n_0 ),
        .O(\lb_rdata_reg[4]_i_4_n_0 ),
        .S(rd_addr_next0[8]));
  FDRE \lb_rdata_reg[5] 
       (.C(pixel_clk),
        .CE(\lb_rdata[31]_i_1_n_0 ),
        .D(\lb_rdata[5]_i_1_n_0 ),
        .Q(\lb_rdata_reg_n_0_[5] ),
        .R(1'b0));
  MUXF7 \lb_rdata_reg[5]_i_3 
       (.I0(\lb_rdata[5]_i_5_n_0 ),
        .I1(\lb_rdata[5]_i_6_n_0 ),
        .O(\lb_rdata_reg[5]_i_3_n_0 ),
        .S(rd_addr_next0[8]));
  MUXF7 \lb_rdata_reg[5]_i_4 
       (.I0(\lb_rdata[5]_i_7_n_0 ),
        .I1(\lb_rdata[5]_i_8_n_0 ),
        .O(\lb_rdata_reg[5]_i_4_n_0 ),
        .S(rd_addr_next0[8]));
  FDRE \lb_rdata_reg[6] 
       (.C(pixel_clk),
        .CE(\lb_rdata[31]_i_1_n_0 ),
        .D(\lb_rdata[6]_i_1_n_0 ),
        .Q(\lb_rdata_reg_n_0_[6] ),
        .R(1'b0));
  MUXF7 \lb_rdata_reg[6]_i_3 
       (.I0(\lb_rdata[6]_i_5_n_0 ),
        .I1(\lb_rdata[6]_i_6_n_0 ),
        .O(\lb_rdata_reg[6]_i_3_n_0 ),
        .S(rd_addr_next0[8]));
  MUXF7 \lb_rdata_reg[6]_i_4 
       (.I0(\lb_rdata[6]_i_7_n_0 ),
        .I1(\lb_rdata[6]_i_8_n_0 ),
        .O(\lb_rdata_reg[6]_i_4_n_0 ),
        .S(rd_addr_next0[8]));
  FDRE \lb_rdata_reg[7] 
       (.C(pixel_clk),
        .CE(\lb_rdata[31]_i_1_n_0 ),
        .D(\lb_rdata[7]_i_1_n_0 ),
        .Q(\lb_rdata_reg_n_0_[7] ),
        .R(1'b0));
  MUXF7 \lb_rdata_reg[7]_i_3 
       (.I0(\lb_rdata[7]_i_5_n_0 ),
        .I1(\lb_rdata[7]_i_6_n_0 ),
        .O(\lb_rdata_reg[7]_i_3_n_0 ),
        .S(rd_addr_next0[8]));
  MUXF7 \lb_rdata_reg[7]_i_4 
       (.I0(\lb_rdata[7]_i_7_n_0 ),
        .I1(\lb_rdata[7]_i_8_n_0 ),
        .O(\lb_rdata_reg[7]_i_4_n_0 ),
        .S(rd_addr_next0[8]));
  FDRE \lb_rdata_reg[8] 
       (.C(pixel_clk),
        .CE(\lb_rdata[31]_i_1_n_0 ),
        .D(\lb_rdata[8]_i_1_n_0 ),
        .Q(\lb_rdata_reg_n_0_[8] ),
        .R(1'b0));
  MUXF7 \lb_rdata_reg[8]_i_3 
       (.I0(\lb_rdata[8]_i_5_n_0 ),
        .I1(\lb_rdata[8]_i_6_n_0 ),
        .O(\lb_rdata_reg[8]_i_3_n_0 ),
        .S(rd_addr_next0[8]));
  MUXF7 \lb_rdata_reg[8]_i_4 
       (.I0(\lb_rdata[8]_i_7_n_0 ),
        .I1(\lb_rdata[8]_i_8_n_0 ),
        .O(\lb_rdata_reg[8]_i_4_n_0 ),
        .S(rd_addr_next0[8]));
  FDRE \lb_rdata_reg[9] 
       (.C(pixel_clk),
        .CE(\lb_rdata[31]_i_1_n_0 ),
        .D(\lb_rdata[9]_i_1_n_0 ),
        .Q(\lb_rdata_reg_n_0_[9] ),
        .R(1'b0));
  MUXF7 \lb_rdata_reg[9]_i_3 
       (.I0(\lb_rdata[9]_i_5_n_0 ),
        .I1(\lb_rdata[9]_i_6_n_0 ),
        .O(\lb_rdata_reg[9]_i_3_n_0 ),
        .S(rd_addr_next0[8]));
  MUXF7 \lb_rdata_reg[9]_i_4 
       (.I0(\lb_rdata[9]_i_7_n_0 ),
        .I1(\lb_rdata[9]_i_8_n_0 ),
        .O(\lb_rdata_reg[9]_i_4_n_0 ),
        .S(rd_addr_next0[8]));
  FDRE \lb_waddr_reg[0] 
       (.C(aclk),
        .CE(lb_waddr),
        .D(\f_word_reg_n_0_[0] ),
        .Q(lb_waddr__0[0]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \lb_waddr_reg[1] 
       (.C(aclk),
        .CE(lb_waddr),
        .D(\f_word_reg_n_0_[1] ),
        .Q(lb_waddr__0[1]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \lb_waddr_reg[2] 
       (.C(aclk),
        .CE(lb_waddr),
        .D(\f_word_reg_n_0_[2] ),
        .Q(lb_waddr__0[2]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \lb_waddr_reg[3] 
       (.C(aclk),
        .CE(lb_waddr),
        .D(\f_word_reg_n_0_[3] ),
        .Q(lb_waddr__0[3]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \lb_waddr_reg[4] 
       (.C(aclk),
        .CE(lb_waddr),
        .D(\f_word_reg_n_0_[4] ),
        .Q(lb_waddr__0[4]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \lb_waddr_reg[5] 
       (.C(aclk),
        .CE(lb_waddr),
        .D(\f_word_reg_n_0_[5] ),
        .Q(lb_waddr__0[5]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \lb_waddr_reg[6] 
       (.C(aclk),
        .CE(lb_waddr),
        .D(\f_word_reg_n_0_[6] ),
        .Q(lb_waddr__0[6]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \lb_waddr_reg[7] 
       (.C(aclk),
        .CE(lb_waddr),
        .D(\f_word_reg_n_0_[7] ),
        .Q(lb_waddr__0[7]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \lb_waddr_reg[8] 
       (.C(aclk),
        .CE(lb_waddr),
        .D(\f_word_reg_n_0_[8] ),
        .Q(lb_waddr__0[8]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \lb_waddr_reg[9] 
       (.C(aclk),
        .CE(lb_waddr),
        .D(\f_line_reg_n_0_[0] ),
        .Q(lb_waddr__0[9]),
        .R(\rdata_q[31]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h40)) 
    \lb_wdata[31]_i_1 
       (.I0(fstate[0]),
        .I1(fstate[1]),
        .I2(m_axi_hp_rvalid),
        .O(lb_waddr));
  FDRE \lb_wdata_reg[0] 
       (.C(aclk),
        .CE(lb_waddr),
        .D(m_axi_hp_rdata[0]),
        .Q(lb_wdata[0]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \lb_wdata_reg[10] 
       (.C(aclk),
        .CE(lb_waddr),
        .D(m_axi_hp_rdata[10]),
        .Q(lb_wdata[10]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \lb_wdata_reg[11] 
       (.C(aclk),
        .CE(lb_waddr),
        .D(m_axi_hp_rdata[11]),
        .Q(lb_wdata[11]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \lb_wdata_reg[12] 
       (.C(aclk),
        .CE(lb_waddr),
        .D(m_axi_hp_rdata[12]),
        .Q(lb_wdata[12]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \lb_wdata_reg[13] 
       (.C(aclk),
        .CE(lb_waddr),
        .D(m_axi_hp_rdata[13]),
        .Q(lb_wdata[13]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \lb_wdata_reg[14] 
       (.C(aclk),
        .CE(lb_waddr),
        .D(m_axi_hp_rdata[14]),
        .Q(lb_wdata[14]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \lb_wdata_reg[15] 
       (.C(aclk),
        .CE(lb_waddr),
        .D(m_axi_hp_rdata[15]),
        .Q(lb_wdata[15]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \lb_wdata_reg[16] 
       (.C(aclk),
        .CE(lb_waddr),
        .D(m_axi_hp_rdata[16]),
        .Q(lb_wdata[16]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \lb_wdata_reg[17] 
       (.C(aclk),
        .CE(lb_waddr),
        .D(m_axi_hp_rdata[17]),
        .Q(lb_wdata[17]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \lb_wdata_reg[18] 
       (.C(aclk),
        .CE(lb_waddr),
        .D(m_axi_hp_rdata[18]),
        .Q(lb_wdata[18]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \lb_wdata_reg[19] 
       (.C(aclk),
        .CE(lb_waddr),
        .D(m_axi_hp_rdata[19]),
        .Q(lb_wdata[19]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \lb_wdata_reg[1] 
       (.C(aclk),
        .CE(lb_waddr),
        .D(m_axi_hp_rdata[1]),
        .Q(lb_wdata[1]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \lb_wdata_reg[20] 
       (.C(aclk),
        .CE(lb_waddr),
        .D(m_axi_hp_rdata[20]),
        .Q(lb_wdata[20]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \lb_wdata_reg[21] 
       (.C(aclk),
        .CE(lb_waddr),
        .D(m_axi_hp_rdata[21]),
        .Q(lb_wdata[21]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \lb_wdata_reg[22] 
       (.C(aclk),
        .CE(lb_waddr),
        .D(m_axi_hp_rdata[22]),
        .Q(lb_wdata[22]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \lb_wdata_reg[23] 
       (.C(aclk),
        .CE(lb_waddr),
        .D(m_axi_hp_rdata[23]),
        .Q(lb_wdata[23]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \lb_wdata_reg[24] 
       (.C(aclk),
        .CE(lb_waddr),
        .D(m_axi_hp_rdata[24]),
        .Q(lb_wdata[24]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \lb_wdata_reg[25] 
       (.C(aclk),
        .CE(lb_waddr),
        .D(m_axi_hp_rdata[25]),
        .Q(lb_wdata[25]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \lb_wdata_reg[26] 
       (.C(aclk),
        .CE(lb_waddr),
        .D(m_axi_hp_rdata[26]),
        .Q(lb_wdata[26]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \lb_wdata_reg[27] 
       (.C(aclk),
        .CE(lb_waddr),
        .D(m_axi_hp_rdata[27]),
        .Q(lb_wdata[27]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \lb_wdata_reg[28] 
       (.C(aclk),
        .CE(lb_waddr),
        .D(m_axi_hp_rdata[28]),
        .Q(lb_wdata[28]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \lb_wdata_reg[29] 
       (.C(aclk),
        .CE(lb_waddr),
        .D(m_axi_hp_rdata[29]),
        .Q(lb_wdata[29]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \lb_wdata_reg[2] 
       (.C(aclk),
        .CE(lb_waddr),
        .D(m_axi_hp_rdata[2]),
        .Q(lb_wdata[2]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \lb_wdata_reg[30] 
       (.C(aclk),
        .CE(lb_waddr),
        .D(m_axi_hp_rdata[30]),
        .Q(lb_wdata[30]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \lb_wdata_reg[31] 
       (.C(aclk),
        .CE(lb_waddr),
        .D(m_axi_hp_rdata[31]),
        .Q(lb_wdata[31]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \lb_wdata_reg[3] 
       (.C(aclk),
        .CE(lb_waddr),
        .D(m_axi_hp_rdata[3]),
        .Q(lb_wdata[3]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \lb_wdata_reg[4] 
       (.C(aclk),
        .CE(lb_waddr),
        .D(m_axi_hp_rdata[4]),
        .Q(lb_wdata[4]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \lb_wdata_reg[5] 
       (.C(aclk),
        .CE(lb_waddr),
        .D(m_axi_hp_rdata[5]),
        .Q(lb_wdata[5]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \lb_wdata_reg[6] 
       (.C(aclk),
        .CE(lb_waddr),
        .D(m_axi_hp_rdata[6]),
        .Q(lb_wdata[6]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \lb_wdata_reg[7] 
       (.C(aclk),
        .CE(lb_waddr),
        .D(m_axi_hp_rdata[7]),
        .Q(lb_wdata[7]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \lb_wdata_reg[8] 
       (.C(aclk),
        .CE(lb_waddr),
        .D(m_axi_hp_rdata[8]),
        .Q(lb_wdata[8]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \lb_wdata_reg[9] 
       (.C(aclk),
        .CE(lb_waddr),
        .D(m_axi_hp_rdata[9]),
        .Q(lb_wdata[9]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE lb_we_reg
       (.C(aclk),
        .CE(1'b1),
        .D(lb_waddr),
        .Q(lb_we),
        .R(\rdata_q[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT4 #(
    .INIT(16'h2F20)) 
    \line_req_num[0]_i_1 
       (.I0(\vcnt[9]_i_5_n_0 ),
        .I1(rd_addr_next),
        .I2(line_req_tgl0),
        .I3(line_req_num),
        .O(\line_req_num[0]_i_1_n_0 ));
  FDRE \line_req_num_reg[0] 
       (.C(pixel_clk),
        .CE(1'b1),
        .D(\line_req_num[0]_i_1_n_0 ),
        .Q(line_req_num),
        .R(\vcnt[9]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT2 #(
    .INIT(4'h6)) 
    line_req_tgl_i_1
       (.I0(line_req_tgl0),
        .I1(line_req_tgl),
        .O(line_req_tgl_i_1_n_0));
  FDRE line_req_tgl_reg
       (.C(pixel_clk),
        .CE(1'b1),
        .D(line_req_tgl_i_1_n_0),
        .Q(line_req_tgl),
        .R(\vcnt[9]_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "63" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "2" *) 
  RAM64M linebuf_reg_r1_0_63_0_2
       (.ADDRA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRC({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[0]),
        .DIB(lb_wdata[1]),
        .DIC(lb_wdata[2]),
        .DID(1'b0),
        .DOA(linebuf_reg_r1_0_63_0_2_n_0),
        .DOB(linebuf_reg_r1_0_63_0_2_n_1),
        .DOC(linebuf_reg_r1_0_63_0_2_n_2),
        .DOD(NLW_linebuf_reg_r1_0_63_0_2_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r1_0_63_0_2_i_1_n_0));
  LUT5 #(
    .INIT(32'h00000002)) 
    linebuf_reg_r1_0_63_0_2_i_1
       (.I0(lb_we),
        .I1(lb_waddr__0[7]),
        .I2(lb_waddr__0[6]),
        .I3(lb_waddr__0[9]),
        .I4(lb_waddr__0[8]),
        .O(linebuf_reg_r1_0_63_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "63" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "12" *) 
  (* ram_slice_end = "14" *) 
  RAM64M linebuf_reg_r1_0_63_12_14
       (.ADDRA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRC({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[12]),
        .DIB(lb_wdata[13]),
        .DIC(lb_wdata[14]),
        .DID(1'b0),
        .DOA(linebuf_reg_r1_0_63_12_14_n_0),
        .DOB(linebuf_reg_r1_0_63_12_14_n_1),
        .DOC(linebuf_reg_r1_0_63_12_14_n_2),
        .DOD(NLW_linebuf_reg_r1_0_63_12_14_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r1_0_63_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "63" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "15" *) 
  (* ram_slice_end = "17" *) 
  RAM64M linebuf_reg_r1_0_63_15_17
       (.ADDRA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRC({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[15]),
        .DIB(lb_wdata[16]),
        .DIC(lb_wdata[17]),
        .DID(1'b0),
        .DOA(linebuf_reg_r1_0_63_15_17_n_0),
        .DOB(linebuf_reg_r1_0_63_15_17_n_1),
        .DOC(linebuf_reg_r1_0_63_15_17_n_2),
        .DOD(NLW_linebuf_reg_r1_0_63_15_17_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r1_0_63_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "63" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "18" *) 
  (* ram_slice_end = "20" *) 
  RAM64M linebuf_reg_r1_0_63_18_20
       (.ADDRA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRC({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[18]),
        .DIB(lb_wdata[19]),
        .DIC(lb_wdata[20]),
        .DID(1'b0),
        .DOA(linebuf_reg_r1_0_63_18_20_n_0),
        .DOB(linebuf_reg_r1_0_63_18_20_n_1),
        .DOC(linebuf_reg_r1_0_63_18_20_n_2),
        .DOD(NLW_linebuf_reg_r1_0_63_18_20_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r1_0_63_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "63" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "21" *) 
  (* ram_slice_end = "23" *) 
  RAM64M linebuf_reg_r1_0_63_21_23
       (.ADDRA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRC({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[21]),
        .DIB(lb_wdata[22]),
        .DIC(lb_wdata[23]),
        .DID(1'b0),
        .DOA(linebuf_reg_r1_0_63_21_23_n_0),
        .DOB(linebuf_reg_r1_0_63_21_23_n_1),
        .DOC(linebuf_reg_r1_0_63_21_23_n_2),
        .DOD(NLW_linebuf_reg_r1_0_63_21_23_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r1_0_63_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "63" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "24" *) 
  (* ram_slice_end = "26" *) 
  RAM64M linebuf_reg_r1_0_63_24_26
       (.ADDRA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRC({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[24]),
        .DIB(lb_wdata[25]),
        .DIC(lb_wdata[26]),
        .DID(1'b0),
        .DOA(linebuf_reg_r1_0_63_24_26_n_0),
        .DOB(linebuf_reg_r1_0_63_24_26_n_1),
        .DOC(linebuf_reg_r1_0_63_24_26_n_2),
        .DOD(NLW_linebuf_reg_r1_0_63_24_26_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r1_0_63_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "63" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "27" *) 
  (* ram_slice_end = "29" *) 
  RAM64M linebuf_reg_r1_0_63_27_29
       (.ADDRA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRC({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[27]),
        .DIB(lb_wdata[28]),
        .DIC(lb_wdata[29]),
        .DID(1'b0),
        .DOA(linebuf_reg_r1_0_63_27_29_n_0),
        .DOB(linebuf_reg_r1_0_63_27_29_n_1),
        .DOC(linebuf_reg_r1_0_63_27_29_n_2),
        .DOD(NLW_linebuf_reg_r1_0_63_27_29_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r1_0_63_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "63" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "30" *) 
  (* ram_slice_end = "31" *) 
  RAM64M linebuf_reg_r1_0_63_30_31
       (.ADDRA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRC({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[30]),
        .DIB(lb_wdata[31]),
        .DIC(1'b0),
        .DID(1'b0),
        .DOA(linebuf_reg_r1_0_63_30_31_n_0),
        .DOB(linebuf_reg_r1_0_63_30_31_n_1),
        .DOC(NLW_linebuf_reg_r1_0_63_30_31_DOC_UNCONNECTED),
        .DOD(NLW_linebuf_reg_r1_0_63_30_31_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r1_0_63_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "63" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "3" *) 
  (* ram_slice_end = "5" *) 
  RAM64M linebuf_reg_r1_0_63_3_5
       (.ADDRA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRC({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[3]),
        .DIB(lb_wdata[4]),
        .DIC(lb_wdata[5]),
        .DID(1'b0),
        .DOA(linebuf_reg_r1_0_63_3_5_n_0),
        .DOB(linebuf_reg_r1_0_63_3_5_n_1),
        .DOC(linebuf_reg_r1_0_63_3_5_n_2),
        .DOD(NLW_linebuf_reg_r1_0_63_3_5_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r1_0_63_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "63" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "8" *) 
  RAM64M linebuf_reg_r1_0_63_6_8
       (.ADDRA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRC({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[6]),
        .DIB(lb_wdata[7]),
        .DIC(lb_wdata[8]),
        .DID(1'b0),
        .DOA(linebuf_reg_r1_0_63_6_8_n_0),
        .DOB(linebuf_reg_r1_0_63_6_8_n_1),
        .DOC(linebuf_reg_r1_0_63_6_8_n_2),
        .DOD(NLW_linebuf_reg_r1_0_63_6_8_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r1_0_63_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "63" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "9" *) 
  (* ram_slice_end = "11" *) 
  RAM64M linebuf_reg_r1_0_63_9_11
       (.ADDRA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRC({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[9]),
        .DIB(lb_wdata[10]),
        .DIC(lb_wdata[11]),
        .DID(1'b0),
        .DOA(linebuf_reg_r1_0_63_9_11_n_0),
        .DOB(linebuf_reg_r1_0_63_9_11_n_1),
        .DOC(linebuf_reg_r1_0_63_9_11_n_2),
        .DOD(NLW_linebuf_reg_r1_0_63_9_11_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r1_0_63_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "512" *) 
  (* ram_addr_end = "575" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "2" *) 
  RAM64M linebuf_reg_r1_512_575_0_2
       (.ADDRA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRC({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[0]),
        .DIB(lb_wdata[1]),
        .DIC(lb_wdata[2]),
        .DID(1'b0),
        .DOA(linebuf_reg_r1_512_575_0_2_n_0),
        .DOB(linebuf_reg_r1_512_575_0_2_n_1),
        .DOC(linebuf_reg_r1_512_575_0_2_n_2),
        .DOD(NLW_linebuf_reg_r1_512_575_0_2_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r1_512_575_0_2_i_1_n_0));
  LUT5 #(
    .INIT(32'h00020000)) 
    linebuf_reg_r1_512_575_0_2_i_1
       (.I0(lb_we),
        .I1(lb_waddr__0[7]),
        .I2(lb_waddr__0[6]),
        .I3(lb_waddr__0[8]),
        .I4(lb_waddr__0[9]),
        .O(linebuf_reg_r1_512_575_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "512" *) 
  (* ram_addr_end = "575" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "12" *) 
  (* ram_slice_end = "14" *) 
  RAM64M linebuf_reg_r1_512_575_12_14
       (.ADDRA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRC({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[12]),
        .DIB(lb_wdata[13]),
        .DIC(lb_wdata[14]),
        .DID(1'b0),
        .DOA(linebuf_reg_r1_512_575_12_14_n_0),
        .DOB(linebuf_reg_r1_512_575_12_14_n_1),
        .DOC(linebuf_reg_r1_512_575_12_14_n_2),
        .DOD(NLW_linebuf_reg_r1_512_575_12_14_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r1_512_575_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "512" *) 
  (* ram_addr_end = "575" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "15" *) 
  (* ram_slice_end = "17" *) 
  RAM64M linebuf_reg_r1_512_575_15_17
       (.ADDRA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRC({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[15]),
        .DIB(lb_wdata[16]),
        .DIC(lb_wdata[17]),
        .DID(1'b0),
        .DOA(linebuf_reg_r1_512_575_15_17_n_0),
        .DOB(linebuf_reg_r1_512_575_15_17_n_1),
        .DOC(linebuf_reg_r1_512_575_15_17_n_2),
        .DOD(NLW_linebuf_reg_r1_512_575_15_17_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r1_512_575_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "512" *) 
  (* ram_addr_end = "575" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "18" *) 
  (* ram_slice_end = "20" *) 
  RAM64M linebuf_reg_r1_512_575_18_20
       (.ADDRA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRC({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[18]),
        .DIB(lb_wdata[19]),
        .DIC(lb_wdata[20]),
        .DID(1'b0),
        .DOA(linebuf_reg_r1_512_575_18_20_n_0),
        .DOB(linebuf_reg_r1_512_575_18_20_n_1),
        .DOC(linebuf_reg_r1_512_575_18_20_n_2),
        .DOD(NLW_linebuf_reg_r1_512_575_18_20_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r1_512_575_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "512" *) 
  (* ram_addr_end = "575" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "21" *) 
  (* ram_slice_end = "23" *) 
  RAM64M linebuf_reg_r1_512_575_21_23
       (.ADDRA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRC({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[21]),
        .DIB(lb_wdata[22]),
        .DIC(lb_wdata[23]),
        .DID(1'b0),
        .DOA(linebuf_reg_r1_512_575_21_23_n_0),
        .DOB(linebuf_reg_r1_512_575_21_23_n_1),
        .DOC(linebuf_reg_r1_512_575_21_23_n_2),
        .DOD(NLW_linebuf_reg_r1_512_575_21_23_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r1_512_575_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "512" *) 
  (* ram_addr_end = "575" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "24" *) 
  (* ram_slice_end = "26" *) 
  RAM64M linebuf_reg_r1_512_575_24_26
       (.ADDRA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRC({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[24]),
        .DIB(lb_wdata[25]),
        .DIC(lb_wdata[26]),
        .DID(1'b0),
        .DOA(linebuf_reg_r1_512_575_24_26_n_0),
        .DOB(linebuf_reg_r1_512_575_24_26_n_1),
        .DOC(linebuf_reg_r1_512_575_24_26_n_2),
        .DOD(NLW_linebuf_reg_r1_512_575_24_26_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r1_512_575_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "512" *) 
  (* ram_addr_end = "575" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "27" *) 
  (* ram_slice_end = "29" *) 
  RAM64M linebuf_reg_r1_512_575_27_29
       (.ADDRA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRC({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[27]),
        .DIB(lb_wdata[28]),
        .DIC(lb_wdata[29]),
        .DID(1'b0),
        .DOA(linebuf_reg_r1_512_575_27_29_n_0),
        .DOB(linebuf_reg_r1_512_575_27_29_n_1),
        .DOC(linebuf_reg_r1_512_575_27_29_n_2),
        .DOD(NLW_linebuf_reg_r1_512_575_27_29_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r1_512_575_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "512" *) 
  (* ram_addr_end = "575" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "30" *) 
  (* ram_slice_end = "31" *) 
  RAM64M linebuf_reg_r1_512_575_30_31
       (.ADDRA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRC({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[30]),
        .DIB(lb_wdata[31]),
        .DIC(1'b0),
        .DID(1'b0),
        .DOA(linebuf_reg_r1_512_575_30_31_n_0),
        .DOB(linebuf_reg_r1_512_575_30_31_n_1),
        .DOC(NLW_linebuf_reg_r1_512_575_30_31_DOC_UNCONNECTED),
        .DOD(NLW_linebuf_reg_r1_512_575_30_31_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r1_512_575_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "512" *) 
  (* ram_addr_end = "575" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "3" *) 
  (* ram_slice_end = "5" *) 
  RAM64M linebuf_reg_r1_512_575_3_5
       (.ADDRA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRC({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[3]),
        .DIB(lb_wdata[4]),
        .DIC(lb_wdata[5]),
        .DID(1'b0),
        .DOA(linebuf_reg_r1_512_575_3_5_n_0),
        .DOB(linebuf_reg_r1_512_575_3_5_n_1),
        .DOC(linebuf_reg_r1_512_575_3_5_n_2),
        .DOD(NLW_linebuf_reg_r1_512_575_3_5_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r1_512_575_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "512" *) 
  (* ram_addr_end = "575" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "8" *) 
  RAM64M linebuf_reg_r1_512_575_6_8
       (.ADDRA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRC({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[6]),
        .DIB(lb_wdata[7]),
        .DIC(lb_wdata[8]),
        .DID(1'b0),
        .DOA(linebuf_reg_r1_512_575_6_8_n_0),
        .DOB(linebuf_reg_r1_512_575_6_8_n_1),
        .DOC(linebuf_reg_r1_512_575_6_8_n_2),
        .DOD(NLW_linebuf_reg_r1_512_575_6_8_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r1_512_575_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "512" *) 
  (* ram_addr_end = "575" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "9" *) 
  (* ram_slice_end = "11" *) 
  RAM64M linebuf_reg_r1_512_575_9_11
       (.ADDRA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRC({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[9]),
        .DIB(lb_wdata[10]),
        .DIC(lb_wdata[11]),
        .DID(1'b0),
        .DOA(linebuf_reg_r1_512_575_9_11_n_0),
        .DOB(linebuf_reg_r1_512_575_9_11_n_1),
        .DOC(linebuf_reg_r1_512_575_9_11_n_2),
        .DOD(NLW_linebuf_reg_r1_512_575_9_11_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r1_512_575_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "63" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "2" *) 
  RAM64M linebuf_reg_r2_0_63_0_2
       (.ADDRA({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRB({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRC({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[0]),
        .DIB(lb_wdata[1]),
        .DIC(lb_wdata[2]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_0_63_0_2_n_0),
        .DOB(linebuf_reg_r2_0_63_0_2_n_1),
        .DOC(linebuf_reg_r2_0_63_0_2_n_2),
        .DOD(NLW_linebuf_reg_r2_0_63_0_2_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r1_0_63_0_2_i_1_n_0));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    linebuf_reg_r2_0_63_0_2_i_1
       (.I0(p_0_in_2[5]),
        .I1(p_0_in_2[3]),
        .I2(p_0_in_2[4]),
        .I3(p_0_in_2[1]),
        .I4(p_0_in_2[0]),
        .I5(p_0_in_2[2]),
        .O(rd_addr_next0[5]));
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    linebuf_reg_r2_0_63_0_2_i_2
       (.I0(p_0_in_2[4]),
        .I1(p_0_in_2[1]),
        .I2(p_0_in_2[0]),
        .I3(p_0_in_2[2]),
        .I4(p_0_in_2[3]),
        .O(rd_addr_next0[4]));
  LUT4 #(
    .INIT(16'h6AAA)) 
    linebuf_reg_r2_0_63_0_2_i_3
       (.I0(p_0_in_2[3]),
        .I1(p_0_in_2[2]),
        .I2(p_0_in_2[0]),
        .I3(p_0_in_2[1]),
        .O(linebuf_reg_r2_0_63_0_2_i_3_n_0));
  LUT3 #(
    .INIT(8'h6A)) 
    linebuf_reg_r2_0_63_0_2_i_4
       (.I0(p_0_in_2[2]),
        .I1(p_0_in_2[0]),
        .I2(p_0_in_2[1]),
        .O(rd_addr_next0[2]));
  LUT2 #(
    .INIT(4'h6)) 
    linebuf_reg_r2_0_63_0_2_i_5
       (.I0(p_0_in_2[0]),
        .I1(p_0_in_2[1]),
        .O(rd_addr_next0[1]));
  LUT1 #(
    .INIT(2'h1)) 
    linebuf_reg_r2_0_63_0_2_i_6
       (.I0(p_0_in_2[0]),
        .O(rd_addr_next0[0]));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "63" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "12" *) 
  (* ram_slice_end = "14" *) 
  RAM64M linebuf_reg_r2_0_63_12_14
       (.ADDRA({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[12]),
        .DIB(lb_wdata[13]),
        .DIC(lb_wdata[14]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_0_63_12_14_n_0),
        .DOB(linebuf_reg_r2_0_63_12_14_n_1),
        .DOC(linebuf_reg_r2_0_63_12_14_n_2),
        .DOD(NLW_linebuf_reg_r2_0_63_12_14_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r1_0_63_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "63" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "15" *) 
  (* ram_slice_end = "17" *) 
  RAM64M linebuf_reg_r2_0_63_15_17
       (.ADDRA({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[15]),
        .DIB(lb_wdata[16]),
        .DIC(lb_wdata[17]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_0_63_15_17_n_0),
        .DOB(linebuf_reg_r2_0_63_15_17_n_1),
        .DOC(linebuf_reg_r2_0_63_15_17_n_2),
        .DOD(NLW_linebuf_reg_r2_0_63_15_17_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r1_0_63_0_2_i_1_n_0));
  LUT4 #(
    .INIT(16'h6AAA)) 
    linebuf_reg_r2_0_63_15_17_i_1
       (.I0(p_0_in_2[3]),
        .I1(p_0_in_2[2]),
        .I2(p_0_in_2[0]),
        .I3(p_0_in_2[1]),
        .O(linebuf_reg_r2_0_63_15_17_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "63" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "18" *) 
  (* ram_slice_end = "20" *) 
  RAM64M linebuf_reg_r2_0_63_18_20
       (.ADDRA({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[18]),
        .DIB(lb_wdata[19]),
        .DIC(lb_wdata[20]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_0_63_18_20_n_0),
        .DOB(linebuf_reg_r2_0_63_18_20_n_1),
        .DOC(linebuf_reg_r2_0_63_18_20_n_2),
        .DOD(NLW_linebuf_reg_r2_0_63_18_20_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r1_0_63_0_2_i_1_n_0));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    linebuf_reg_r2_0_63_18_20_i_1
       (.I0(p_0_in_2[5]),
        .I1(p_0_in_2[3]),
        .I2(p_0_in_2[4]),
        .I3(p_0_in_2[1]),
        .I4(p_0_in_2[0]),
        .I5(p_0_in_2[2]),
        .O(linebuf_reg_r2_0_63_18_20_i_1_n_0));
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    linebuf_reg_r2_0_63_18_20_i_2
       (.I0(p_0_in_2[4]),
        .I1(p_0_in_2[1]),
        .I2(p_0_in_2[0]),
        .I3(p_0_in_2[2]),
        .I4(p_0_in_2[3]),
        .O(linebuf_reg_r2_0_63_18_20_i_2_n_0));
  LUT3 #(
    .INIT(8'h6A)) 
    linebuf_reg_r2_0_63_18_20_i_3
       (.I0(p_0_in_2[2]),
        .I1(p_0_in_2[0]),
        .I2(p_0_in_2[1]),
        .O(linebuf_reg_r2_0_63_18_20_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    linebuf_reg_r2_0_63_18_20_i_4
       (.I0(p_0_in_2[0]),
        .I1(p_0_in_2[1]),
        .O(linebuf_reg_r2_0_63_18_20_i_4_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    linebuf_reg_r2_0_63_18_20_i_5
       (.I0(p_0_in_2[0]),
        .O(linebuf_reg_r2_0_63_18_20_i_5_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "63" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "21" *) 
  (* ram_slice_end = "23" *) 
  RAM64M linebuf_reg_r2_0_63_21_23
       (.ADDRA({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[21]),
        .DIB(lb_wdata[22]),
        .DIC(lb_wdata[23]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_0_63_21_23_n_0),
        .DOB(linebuf_reg_r2_0_63_21_23_n_1),
        .DOC(linebuf_reg_r2_0_63_21_23_n_2),
        .DOD(NLW_linebuf_reg_r2_0_63_21_23_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r1_0_63_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "63" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "24" *) 
  (* ram_slice_end = "26" *) 
  RAM64M linebuf_reg_r2_0_63_24_26
       (.ADDRA({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[24]),
        .DIB(lb_wdata[25]),
        .DIC(lb_wdata[26]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_0_63_24_26_n_0),
        .DOB(linebuf_reg_r2_0_63_24_26_n_1),
        .DOC(linebuf_reg_r2_0_63_24_26_n_2),
        .DOD(NLW_linebuf_reg_r2_0_63_24_26_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r1_0_63_0_2_i_1_n_0));
  LUT4 #(
    .INIT(16'h6AAA)) 
    linebuf_reg_r2_0_63_24_26_i_1
       (.I0(p_0_in_2[3]),
        .I1(p_0_in_2[2]),
        .I2(p_0_in_2[0]),
        .I3(p_0_in_2[1]),
        .O(linebuf_reg_r2_0_63_24_26_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "63" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "27" *) 
  (* ram_slice_end = "29" *) 
  RAM64M linebuf_reg_r2_0_63_27_29
       (.ADDRA({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[27]),
        .DIB(lb_wdata[28]),
        .DIC(lb_wdata[29]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_0_63_27_29_n_0),
        .DOB(linebuf_reg_r2_0_63_27_29_n_1),
        .DOC(linebuf_reg_r2_0_63_27_29_n_2),
        .DOD(NLW_linebuf_reg_r2_0_63_27_29_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r1_0_63_0_2_i_1_n_0));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    linebuf_reg_r2_0_63_27_29_i_1
       (.I0(p_0_in_2[5]),
        .I1(p_0_in_2[3]),
        .I2(p_0_in_2[4]),
        .I3(p_0_in_2[1]),
        .I4(p_0_in_2[0]),
        .I5(p_0_in_2[2]),
        .O(linebuf_reg_r2_0_63_27_29_i_1_n_0));
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    linebuf_reg_r2_0_63_27_29_i_2
       (.I0(p_0_in_2[4]),
        .I1(p_0_in_2[1]),
        .I2(p_0_in_2[0]),
        .I3(p_0_in_2[2]),
        .I4(p_0_in_2[3]),
        .O(linebuf_reg_r2_0_63_27_29_i_2_n_0));
  LUT3 #(
    .INIT(8'h6A)) 
    linebuf_reg_r2_0_63_27_29_i_3
       (.I0(p_0_in_2[2]),
        .I1(p_0_in_2[0]),
        .I2(p_0_in_2[1]),
        .O(linebuf_reg_r2_0_63_27_29_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    linebuf_reg_r2_0_63_27_29_i_4
       (.I0(p_0_in_2[0]),
        .I1(p_0_in_2[1]),
        .O(linebuf_reg_r2_0_63_27_29_i_4_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    linebuf_reg_r2_0_63_27_29_i_5
       (.I0(p_0_in_2[0]),
        .O(linebuf_reg_r2_0_63_27_29_i_5_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "63" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "30" *) 
  (* ram_slice_end = "31" *) 
  RAM64M linebuf_reg_r2_0_63_30_31
       (.ADDRA({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[30]),
        .DIB(lb_wdata[31]),
        .DIC(1'b0),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_0_63_30_31_n_0),
        .DOB(linebuf_reg_r2_0_63_30_31_n_1),
        .DOC(NLW_linebuf_reg_r2_0_63_30_31_DOC_UNCONNECTED),
        .DOD(NLW_linebuf_reg_r2_0_63_30_31_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r1_0_63_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "63" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "3" *) 
  (* ram_slice_end = "5" *) 
  RAM64M linebuf_reg_r2_0_63_3_5
       (.ADDRA({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRB({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRC({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[3]),
        .DIB(lb_wdata[4]),
        .DIC(lb_wdata[5]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_0_63_3_5_n_0),
        .DOB(linebuf_reg_r2_0_63_3_5_n_1),
        .DOC(linebuf_reg_r2_0_63_3_5_n_2),
        .DOD(NLW_linebuf_reg_r2_0_63_3_5_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r1_0_63_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "63" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "8" *) 
  RAM64M linebuf_reg_r2_0_63_6_8
       (.ADDRA({rd_addr_next0[5:4],linebuf_reg_r2_0_63_6_8_i_1_n_0,rd_addr_next0[2:0]}),
        .ADDRB({rd_addr_next0[5:4],linebuf_reg_r2_0_63_6_8_i_1_n_0,rd_addr_next0[2:0]}),
        .ADDRC({rd_addr_next0[5:4],linebuf_reg_r2_0_63_6_8_i_1_n_0,rd_addr_next0[2:0]}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[6]),
        .DIB(lb_wdata[7]),
        .DIC(lb_wdata[8]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_0_63_6_8_n_0),
        .DOB(linebuf_reg_r2_0_63_6_8_n_1),
        .DOC(linebuf_reg_r2_0_63_6_8_n_2),
        .DOD(NLW_linebuf_reg_r2_0_63_6_8_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r1_0_63_0_2_i_1_n_0));
  LUT4 #(
    .INIT(16'h6AAA)) 
    linebuf_reg_r2_0_63_6_8_i_1
       (.I0(p_0_in_2[3]),
        .I1(p_0_in_2[2]),
        .I2(p_0_in_2[0]),
        .I3(p_0_in_2[1]),
        .O(linebuf_reg_r2_0_63_6_8_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "63" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "9" *) 
  (* ram_slice_end = "11" *) 
  RAM64M linebuf_reg_r2_0_63_9_11
       (.ADDRA({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[9]),
        .DIB(lb_wdata[10]),
        .DIC(lb_wdata[11]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_0_63_9_11_n_0),
        .DOB(linebuf_reg_r2_0_63_9_11_n_1),
        .DOC(linebuf_reg_r2_0_63_9_11_n_2),
        .DOD(NLW_linebuf_reg_r2_0_63_9_11_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r1_0_63_0_2_i_1_n_0));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    linebuf_reg_r2_0_63_9_11_i_1
       (.I0(p_0_in_2[5]),
        .I1(p_0_in_2[3]),
        .I2(p_0_in_2[4]),
        .I3(p_0_in_2[1]),
        .I4(p_0_in_2[0]),
        .I5(p_0_in_2[2]),
        .O(linebuf_reg_r2_0_63_9_11_i_1_n_0));
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    linebuf_reg_r2_0_63_9_11_i_2
       (.I0(p_0_in_2[4]),
        .I1(p_0_in_2[1]),
        .I2(p_0_in_2[0]),
        .I3(p_0_in_2[2]),
        .I4(p_0_in_2[3]),
        .O(linebuf_reg_r2_0_63_9_11_i_2_n_0));
  LUT3 #(
    .INIT(8'h6A)) 
    linebuf_reg_r2_0_63_9_11_i_3
       (.I0(p_0_in_2[2]),
        .I1(p_0_in_2[0]),
        .I2(p_0_in_2[1]),
        .O(linebuf_reg_r2_0_63_9_11_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    linebuf_reg_r2_0_63_9_11_i_4
       (.I0(p_0_in_2[0]),
        .I1(p_0_in_2[1]),
        .O(linebuf_reg_r2_0_63_9_11_i_4_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    linebuf_reg_r2_0_63_9_11_i_5
       (.I0(p_0_in_2[0]),
        .O(linebuf_reg_r2_0_63_9_11_i_5_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "128" *) 
  (* ram_addr_end = "191" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "2" *) 
  RAM64M linebuf_reg_r2_128_191_0_2
       (.ADDRA({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRB({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRC({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[0]),
        .DIB(lb_wdata[1]),
        .DIC(lb_wdata[2]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_128_191_0_2_n_0),
        .DOB(linebuf_reg_r2_128_191_0_2_n_1),
        .DOC(linebuf_reg_r2_128_191_0_2_n_2),
        .DOD(NLW_linebuf_reg_r2_128_191_0_2_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_128_191_0_2_i_1_n_0));
  LUT5 #(
    .INIT(32'h00020000)) 
    linebuf_reg_r2_128_191_0_2_i_1
       (.I0(lb_we),
        .I1(lb_waddr__0[8]),
        .I2(lb_waddr__0[6]),
        .I3(lb_waddr__0[9]),
        .I4(lb_waddr__0[7]),
        .O(linebuf_reg_r2_128_191_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "128" *) 
  (* ram_addr_end = "191" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "12" *) 
  (* ram_slice_end = "14" *) 
  RAM64M linebuf_reg_r2_128_191_12_14
       (.ADDRA({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[12]),
        .DIB(lb_wdata[13]),
        .DIC(lb_wdata[14]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_128_191_12_14_n_0),
        .DOB(linebuf_reg_r2_128_191_12_14_n_1),
        .DOC(linebuf_reg_r2_128_191_12_14_n_2),
        .DOD(NLW_linebuf_reg_r2_128_191_12_14_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_128_191_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "128" *) 
  (* ram_addr_end = "191" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "15" *) 
  (* ram_slice_end = "17" *) 
  RAM64M linebuf_reg_r2_128_191_15_17
       (.ADDRA({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[15]),
        .DIB(lb_wdata[16]),
        .DIC(lb_wdata[17]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_128_191_15_17_n_0),
        .DOB(linebuf_reg_r2_128_191_15_17_n_1),
        .DOC(linebuf_reg_r2_128_191_15_17_n_2),
        .DOD(NLW_linebuf_reg_r2_128_191_15_17_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_128_191_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "128" *) 
  (* ram_addr_end = "191" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "18" *) 
  (* ram_slice_end = "20" *) 
  RAM64M linebuf_reg_r2_128_191_18_20
       (.ADDRA({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[18]),
        .DIB(lb_wdata[19]),
        .DIC(lb_wdata[20]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_128_191_18_20_n_0),
        .DOB(linebuf_reg_r2_128_191_18_20_n_1),
        .DOC(linebuf_reg_r2_128_191_18_20_n_2),
        .DOD(NLW_linebuf_reg_r2_128_191_18_20_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_128_191_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "128" *) 
  (* ram_addr_end = "191" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "21" *) 
  (* ram_slice_end = "23" *) 
  RAM64M linebuf_reg_r2_128_191_21_23
       (.ADDRA({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[21]),
        .DIB(lb_wdata[22]),
        .DIC(lb_wdata[23]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_128_191_21_23_n_0),
        .DOB(linebuf_reg_r2_128_191_21_23_n_1),
        .DOC(linebuf_reg_r2_128_191_21_23_n_2),
        .DOD(NLW_linebuf_reg_r2_128_191_21_23_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_128_191_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "128" *) 
  (* ram_addr_end = "191" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "24" *) 
  (* ram_slice_end = "26" *) 
  RAM64M linebuf_reg_r2_128_191_24_26
       (.ADDRA({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[24]),
        .DIB(lb_wdata[25]),
        .DIC(lb_wdata[26]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_128_191_24_26_n_0),
        .DOB(linebuf_reg_r2_128_191_24_26_n_1),
        .DOC(linebuf_reg_r2_128_191_24_26_n_2),
        .DOD(NLW_linebuf_reg_r2_128_191_24_26_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_128_191_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "128" *) 
  (* ram_addr_end = "191" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "27" *) 
  (* ram_slice_end = "29" *) 
  RAM64M linebuf_reg_r2_128_191_27_29
       (.ADDRA({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[27]),
        .DIB(lb_wdata[28]),
        .DIC(lb_wdata[29]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_128_191_27_29_n_0),
        .DOB(linebuf_reg_r2_128_191_27_29_n_1),
        .DOC(linebuf_reg_r2_128_191_27_29_n_2),
        .DOD(NLW_linebuf_reg_r2_128_191_27_29_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_128_191_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "128" *) 
  (* ram_addr_end = "191" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "30" *) 
  (* ram_slice_end = "31" *) 
  RAM64M linebuf_reg_r2_128_191_30_31
       (.ADDRA({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[30]),
        .DIB(lb_wdata[31]),
        .DIC(1'b0),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_128_191_30_31_n_0),
        .DOB(linebuf_reg_r2_128_191_30_31_n_1),
        .DOC(NLW_linebuf_reg_r2_128_191_30_31_DOC_UNCONNECTED),
        .DOD(NLW_linebuf_reg_r2_128_191_30_31_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_128_191_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "128" *) 
  (* ram_addr_end = "191" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "3" *) 
  (* ram_slice_end = "5" *) 
  RAM64M linebuf_reg_r2_128_191_3_5
       (.ADDRA({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRB({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRC({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[3]),
        .DIB(lb_wdata[4]),
        .DIC(lb_wdata[5]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_128_191_3_5_n_0),
        .DOB(linebuf_reg_r2_128_191_3_5_n_1),
        .DOC(linebuf_reg_r2_128_191_3_5_n_2),
        .DOD(NLW_linebuf_reg_r2_128_191_3_5_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_128_191_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "128" *) 
  (* ram_addr_end = "191" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "8" *) 
  RAM64M linebuf_reg_r2_128_191_6_8
       (.ADDRA({rd_addr_next0[5:4],linebuf_reg_r2_0_63_6_8_i_1_n_0,rd_addr_next0[2:0]}),
        .ADDRB({rd_addr_next0[5:4],linebuf_reg_r2_0_63_6_8_i_1_n_0,rd_addr_next0[2:0]}),
        .ADDRC({rd_addr_next0[5:4],linebuf_reg_r2_0_63_6_8_i_1_n_0,rd_addr_next0[2:0]}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[6]),
        .DIB(lb_wdata[7]),
        .DIC(lb_wdata[8]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_128_191_6_8_n_0),
        .DOB(linebuf_reg_r2_128_191_6_8_n_1),
        .DOC(linebuf_reg_r2_128_191_6_8_n_2),
        .DOD(NLW_linebuf_reg_r2_128_191_6_8_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_128_191_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "128" *) 
  (* ram_addr_end = "191" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "9" *) 
  (* ram_slice_end = "11" *) 
  RAM64M linebuf_reg_r2_128_191_9_11
       (.ADDRA({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[9]),
        .DIB(lb_wdata[10]),
        .DIC(lb_wdata[11]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_128_191_9_11_n_0),
        .DOB(linebuf_reg_r2_128_191_9_11_n_1),
        .DOC(linebuf_reg_r2_128_191_9_11_n_2),
        .DOD(NLW_linebuf_reg_r2_128_191_9_11_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_128_191_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "192" *) 
  (* ram_addr_end = "255" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "2" *) 
  RAM64M linebuf_reg_r2_192_255_0_2
       (.ADDRA({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRB({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRC({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[0]),
        .DIB(lb_wdata[1]),
        .DIC(lb_wdata[2]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_192_255_0_2_n_0),
        .DOB(linebuf_reg_r2_192_255_0_2_n_1),
        .DOC(linebuf_reg_r2_192_255_0_2_n_2),
        .DOD(NLW_linebuf_reg_r2_192_255_0_2_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_192_255_0_2_i_1_n_0));
  LUT5 #(
    .INIT(32'h00400000)) 
    linebuf_reg_r2_192_255_0_2_i_1
       (.I0(lb_waddr__0[9]),
        .I1(lb_waddr__0[7]),
        .I2(lb_waddr__0[6]),
        .I3(lb_waddr__0[8]),
        .I4(lb_we),
        .O(linebuf_reg_r2_192_255_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "192" *) 
  (* ram_addr_end = "255" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "12" *) 
  (* ram_slice_end = "14" *) 
  RAM64M linebuf_reg_r2_192_255_12_14
       (.ADDRA({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[12]),
        .DIB(lb_wdata[13]),
        .DIC(lb_wdata[14]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_192_255_12_14_n_0),
        .DOB(linebuf_reg_r2_192_255_12_14_n_1),
        .DOC(linebuf_reg_r2_192_255_12_14_n_2),
        .DOD(NLW_linebuf_reg_r2_192_255_12_14_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_192_255_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "192" *) 
  (* ram_addr_end = "255" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "15" *) 
  (* ram_slice_end = "17" *) 
  RAM64M linebuf_reg_r2_192_255_15_17
       (.ADDRA({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[15]),
        .DIB(lb_wdata[16]),
        .DIC(lb_wdata[17]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_192_255_15_17_n_0),
        .DOB(linebuf_reg_r2_192_255_15_17_n_1),
        .DOC(linebuf_reg_r2_192_255_15_17_n_2),
        .DOD(NLW_linebuf_reg_r2_192_255_15_17_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_192_255_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "192" *) 
  (* ram_addr_end = "255" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "18" *) 
  (* ram_slice_end = "20" *) 
  RAM64M linebuf_reg_r2_192_255_18_20
       (.ADDRA({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[18]),
        .DIB(lb_wdata[19]),
        .DIC(lb_wdata[20]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_192_255_18_20_n_0),
        .DOB(linebuf_reg_r2_192_255_18_20_n_1),
        .DOC(linebuf_reg_r2_192_255_18_20_n_2),
        .DOD(NLW_linebuf_reg_r2_192_255_18_20_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_192_255_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "192" *) 
  (* ram_addr_end = "255" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "21" *) 
  (* ram_slice_end = "23" *) 
  RAM64M linebuf_reg_r2_192_255_21_23
       (.ADDRA({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[21]),
        .DIB(lb_wdata[22]),
        .DIC(lb_wdata[23]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_192_255_21_23_n_0),
        .DOB(linebuf_reg_r2_192_255_21_23_n_1),
        .DOC(linebuf_reg_r2_192_255_21_23_n_2),
        .DOD(NLW_linebuf_reg_r2_192_255_21_23_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_192_255_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "192" *) 
  (* ram_addr_end = "255" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "24" *) 
  (* ram_slice_end = "26" *) 
  RAM64M linebuf_reg_r2_192_255_24_26
       (.ADDRA({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[24]),
        .DIB(lb_wdata[25]),
        .DIC(lb_wdata[26]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_192_255_24_26_n_0),
        .DOB(linebuf_reg_r2_192_255_24_26_n_1),
        .DOC(linebuf_reg_r2_192_255_24_26_n_2),
        .DOD(NLW_linebuf_reg_r2_192_255_24_26_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_192_255_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "192" *) 
  (* ram_addr_end = "255" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "27" *) 
  (* ram_slice_end = "29" *) 
  RAM64M linebuf_reg_r2_192_255_27_29
       (.ADDRA({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[27]),
        .DIB(lb_wdata[28]),
        .DIC(lb_wdata[29]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_192_255_27_29_n_0),
        .DOB(linebuf_reg_r2_192_255_27_29_n_1),
        .DOC(linebuf_reg_r2_192_255_27_29_n_2),
        .DOD(NLW_linebuf_reg_r2_192_255_27_29_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_192_255_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "192" *) 
  (* ram_addr_end = "255" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "30" *) 
  (* ram_slice_end = "31" *) 
  RAM64M linebuf_reg_r2_192_255_30_31
       (.ADDRA({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[30]),
        .DIB(lb_wdata[31]),
        .DIC(1'b0),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_192_255_30_31_n_0),
        .DOB(linebuf_reg_r2_192_255_30_31_n_1),
        .DOC(NLW_linebuf_reg_r2_192_255_30_31_DOC_UNCONNECTED),
        .DOD(NLW_linebuf_reg_r2_192_255_30_31_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_192_255_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "192" *) 
  (* ram_addr_end = "255" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "3" *) 
  (* ram_slice_end = "5" *) 
  RAM64M linebuf_reg_r2_192_255_3_5
       (.ADDRA({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRB({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRC({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[3]),
        .DIB(lb_wdata[4]),
        .DIC(lb_wdata[5]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_192_255_3_5_n_0),
        .DOB(linebuf_reg_r2_192_255_3_5_n_1),
        .DOC(linebuf_reg_r2_192_255_3_5_n_2),
        .DOD(NLW_linebuf_reg_r2_192_255_3_5_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_192_255_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "192" *) 
  (* ram_addr_end = "255" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "8" *) 
  RAM64M linebuf_reg_r2_192_255_6_8
       (.ADDRA({rd_addr_next0[5:4],linebuf_reg_r2_0_63_6_8_i_1_n_0,rd_addr_next0[2:0]}),
        .ADDRB({rd_addr_next0[5:4],linebuf_reg_r2_0_63_6_8_i_1_n_0,rd_addr_next0[2:0]}),
        .ADDRC({rd_addr_next0[5:4],linebuf_reg_r2_0_63_6_8_i_1_n_0,rd_addr_next0[2:0]}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[6]),
        .DIB(lb_wdata[7]),
        .DIC(lb_wdata[8]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_192_255_6_8_n_0),
        .DOB(linebuf_reg_r2_192_255_6_8_n_1),
        .DOC(linebuf_reg_r2_192_255_6_8_n_2),
        .DOD(NLW_linebuf_reg_r2_192_255_6_8_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_192_255_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "192" *) 
  (* ram_addr_end = "255" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "9" *) 
  (* ram_slice_end = "11" *) 
  RAM64M linebuf_reg_r2_192_255_9_11
       (.ADDRA({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[9]),
        .DIB(lb_wdata[10]),
        .DIC(lb_wdata[11]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_192_255_9_11_n_0),
        .DOB(linebuf_reg_r2_192_255_9_11_n_1),
        .DOC(linebuf_reg_r2_192_255_9_11_n_2),
        .DOD(NLW_linebuf_reg_r2_192_255_9_11_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_192_255_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "256" *) 
  (* ram_addr_end = "319" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "2" *) 
  RAM64M linebuf_reg_r2_256_319_0_2
       (.ADDRA({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRB({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRC({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[0]),
        .DIB(lb_wdata[1]),
        .DIC(lb_wdata[2]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_256_319_0_2_n_0),
        .DOB(linebuf_reg_r2_256_319_0_2_n_1),
        .DOC(linebuf_reg_r2_256_319_0_2_n_2),
        .DOD(NLW_linebuf_reg_r2_256_319_0_2_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_256_319_0_2_i_1_n_0));
  LUT5 #(
    .INIT(32'h00020000)) 
    linebuf_reg_r2_256_319_0_2_i_1
       (.I0(lb_we),
        .I1(lb_waddr__0[7]),
        .I2(lb_waddr__0[6]),
        .I3(lb_waddr__0[9]),
        .I4(lb_waddr__0[8]),
        .O(linebuf_reg_r2_256_319_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "256" *) 
  (* ram_addr_end = "319" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "12" *) 
  (* ram_slice_end = "14" *) 
  RAM64M linebuf_reg_r2_256_319_12_14
       (.ADDRA({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[12]),
        .DIB(lb_wdata[13]),
        .DIC(lb_wdata[14]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_256_319_12_14_n_0),
        .DOB(linebuf_reg_r2_256_319_12_14_n_1),
        .DOC(linebuf_reg_r2_256_319_12_14_n_2),
        .DOD(NLW_linebuf_reg_r2_256_319_12_14_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_256_319_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "256" *) 
  (* ram_addr_end = "319" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "15" *) 
  (* ram_slice_end = "17" *) 
  RAM64M linebuf_reg_r2_256_319_15_17
       (.ADDRA({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[15]),
        .DIB(lb_wdata[16]),
        .DIC(lb_wdata[17]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_256_319_15_17_n_0),
        .DOB(linebuf_reg_r2_256_319_15_17_n_1),
        .DOC(linebuf_reg_r2_256_319_15_17_n_2),
        .DOD(NLW_linebuf_reg_r2_256_319_15_17_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_256_319_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "256" *) 
  (* ram_addr_end = "319" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "18" *) 
  (* ram_slice_end = "20" *) 
  RAM64M linebuf_reg_r2_256_319_18_20
       (.ADDRA({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[18]),
        .DIB(lb_wdata[19]),
        .DIC(lb_wdata[20]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_256_319_18_20_n_0),
        .DOB(linebuf_reg_r2_256_319_18_20_n_1),
        .DOC(linebuf_reg_r2_256_319_18_20_n_2),
        .DOD(NLW_linebuf_reg_r2_256_319_18_20_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_256_319_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "256" *) 
  (* ram_addr_end = "319" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "21" *) 
  (* ram_slice_end = "23" *) 
  RAM64M linebuf_reg_r2_256_319_21_23
       (.ADDRA({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[21]),
        .DIB(lb_wdata[22]),
        .DIC(lb_wdata[23]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_256_319_21_23_n_0),
        .DOB(linebuf_reg_r2_256_319_21_23_n_1),
        .DOC(linebuf_reg_r2_256_319_21_23_n_2),
        .DOD(NLW_linebuf_reg_r2_256_319_21_23_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_256_319_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "256" *) 
  (* ram_addr_end = "319" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "24" *) 
  (* ram_slice_end = "26" *) 
  RAM64M linebuf_reg_r2_256_319_24_26
       (.ADDRA({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[24]),
        .DIB(lb_wdata[25]),
        .DIC(lb_wdata[26]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_256_319_24_26_n_0),
        .DOB(linebuf_reg_r2_256_319_24_26_n_1),
        .DOC(linebuf_reg_r2_256_319_24_26_n_2),
        .DOD(NLW_linebuf_reg_r2_256_319_24_26_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_256_319_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "256" *) 
  (* ram_addr_end = "319" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "27" *) 
  (* ram_slice_end = "29" *) 
  RAM64M linebuf_reg_r2_256_319_27_29
       (.ADDRA({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[27]),
        .DIB(lb_wdata[28]),
        .DIC(lb_wdata[29]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_256_319_27_29_n_0),
        .DOB(linebuf_reg_r2_256_319_27_29_n_1),
        .DOC(linebuf_reg_r2_256_319_27_29_n_2),
        .DOD(NLW_linebuf_reg_r2_256_319_27_29_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_256_319_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "256" *) 
  (* ram_addr_end = "319" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "30" *) 
  (* ram_slice_end = "31" *) 
  RAM64M linebuf_reg_r2_256_319_30_31
       (.ADDRA({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[30]),
        .DIB(lb_wdata[31]),
        .DIC(1'b0),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_256_319_30_31_n_0),
        .DOB(linebuf_reg_r2_256_319_30_31_n_1),
        .DOC(NLW_linebuf_reg_r2_256_319_30_31_DOC_UNCONNECTED),
        .DOD(NLW_linebuf_reg_r2_256_319_30_31_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_256_319_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "256" *) 
  (* ram_addr_end = "319" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "3" *) 
  (* ram_slice_end = "5" *) 
  RAM64M linebuf_reg_r2_256_319_3_5
       (.ADDRA({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRB({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRC({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[3]),
        .DIB(lb_wdata[4]),
        .DIC(lb_wdata[5]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_256_319_3_5_n_0),
        .DOB(linebuf_reg_r2_256_319_3_5_n_1),
        .DOC(linebuf_reg_r2_256_319_3_5_n_2),
        .DOD(NLW_linebuf_reg_r2_256_319_3_5_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_256_319_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "256" *) 
  (* ram_addr_end = "319" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "8" *) 
  RAM64M linebuf_reg_r2_256_319_6_8
       (.ADDRA({rd_addr_next0[5:4],linebuf_reg_r2_0_63_6_8_i_1_n_0,rd_addr_next0[2:0]}),
        .ADDRB({rd_addr_next0[5:4],linebuf_reg_r2_0_63_6_8_i_1_n_0,rd_addr_next0[2:0]}),
        .ADDRC({rd_addr_next0[5:4],linebuf_reg_r2_0_63_6_8_i_1_n_0,rd_addr_next0[2:0]}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[6]),
        .DIB(lb_wdata[7]),
        .DIC(lb_wdata[8]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_256_319_6_8_n_0),
        .DOB(linebuf_reg_r2_256_319_6_8_n_1),
        .DOC(linebuf_reg_r2_256_319_6_8_n_2),
        .DOD(NLW_linebuf_reg_r2_256_319_6_8_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_256_319_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "256" *) 
  (* ram_addr_end = "319" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "9" *) 
  (* ram_slice_end = "11" *) 
  RAM64M linebuf_reg_r2_256_319_9_11
       (.ADDRA({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[9]),
        .DIB(lb_wdata[10]),
        .DIC(lb_wdata[11]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_256_319_9_11_n_0),
        .DOB(linebuf_reg_r2_256_319_9_11_n_1),
        .DOC(linebuf_reg_r2_256_319_9_11_n_2),
        .DOD(NLW_linebuf_reg_r2_256_319_9_11_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_256_319_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "320" *) 
  (* ram_addr_end = "383" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "2" *) 
  RAM64M linebuf_reg_r2_320_383_0_2
       (.ADDRA({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRB({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRC({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[0]),
        .DIB(lb_wdata[1]),
        .DIC(lb_wdata[2]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_320_383_0_2_n_0),
        .DOB(linebuf_reg_r2_320_383_0_2_n_1),
        .DOC(linebuf_reg_r2_320_383_0_2_n_2),
        .DOD(NLW_linebuf_reg_r2_320_383_0_2_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_320_383_0_2_i_1_n_0));
  LUT5 #(
    .INIT(32'h00400000)) 
    linebuf_reg_r2_320_383_0_2_i_1
       (.I0(lb_waddr__0[9]),
        .I1(lb_waddr__0[8]),
        .I2(lb_waddr__0[6]),
        .I3(lb_waddr__0[7]),
        .I4(lb_we),
        .O(linebuf_reg_r2_320_383_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "320" *) 
  (* ram_addr_end = "383" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "12" *) 
  (* ram_slice_end = "14" *) 
  RAM64M linebuf_reg_r2_320_383_12_14
       (.ADDRA({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[12]),
        .DIB(lb_wdata[13]),
        .DIC(lb_wdata[14]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_320_383_12_14_n_0),
        .DOB(linebuf_reg_r2_320_383_12_14_n_1),
        .DOC(linebuf_reg_r2_320_383_12_14_n_2),
        .DOD(NLW_linebuf_reg_r2_320_383_12_14_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_320_383_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "320" *) 
  (* ram_addr_end = "383" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "15" *) 
  (* ram_slice_end = "17" *) 
  RAM64M linebuf_reg_r2_320_383_15_17
       (.ADDRA({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[15]),
        .DIB(lb_wdata[16]),
        .DIC(lb_wdata[17]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_320_383_15_17_n_0),
        .DOB(linebuf_reg_r2_320_383_15_17_n_1),
        .DOC(linebuf_reg_r2_320_383_15_17_n_2),
        .DOD(NLW_linebuf_reg_r2_320_383_15_17_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_320_383_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "320" *) 
  (* ram_addr_end = "383" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "18" *) 
  (* ram_slice_end = "20" *) 
  RAM64M linebuf_reg_r2_320_383_18_20
       (.ADDRA({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[18]),
        .DIB(lb_wdata[19]),
        .DIC(lb_wdata[20]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_320_383_18_20_n_0),
        .DOB(linebuf_reg_r2_320_383_18_20_n_1),
        .DOC(linebuf_reg_r2_320_383_18_20_n_2),
        .DOD(NLW_linebuf_reg_r2_320_383_18_20_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_320_383_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "320" *) 
  (* ram_addr_end = "383" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "21" *) 
  (* ram_slice_end = "23" *) 
  RAM64M linebuf_reg_r2_320_383_21_23
       (.ADDRA({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[21]),
        .DIB(lb_wdata[22]),
        .DIC(lb_wdata[23]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_320_383_21_23_n_0),
        .DOB(linebuf_reg_r2_320_383_21_23_n_1),
        .DOC(linebuf_reg_r2_320_383_21_23_n_2),
        .DOD(NLW_linebuf_reg_r2_320_383_21_23_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_320_383_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "320" *) 
  (* ram_addr_end = "383" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "24" *) 
  (* ram_slice_end = "26" *) 
  RAM64M linebuf_reg_r2_320_383_24_26
       (.ADDRA({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[24]),
        .DIB(lb_wdata[25]),
        .DIC(lb_wdata[26]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_320_383_24_26_n_0),
        .DOB(linebuf_reg_r2_320_383_24_26_n_1),
        .DOC(linebuf_reg_r2_320_383_24_26_n_2),
        .DOD(NLW_linebuf_reg_r2_320_383_24_26_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_320_383_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "320" *) 
  (* ram_addr_end = "383" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "27" *) 
  (* ram_slice_end = "29" *) 
  RAM64M linebuf_reg_r2_320_383_27_29
       (.ADDRA({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[27]),
        .DIB(lb_wdata[28]),
        .DIC(lb_wdata[29]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_320_383_27_29_n_0),
        .DOB(linebuf_reg_r2_320_383_27_29_n_1),
        .DOC(linebuf_reg_r2_320_383_27_29_n_2),
        .DOD(NLW_linebuf_reg_r2_320_383_27_29_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_320_383_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "320" *) 
  (* ram_addr_end = "383" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "30" *) 
  (* ram_slice_end = "31" *) 
  RAM64M linebuf_reg_r2_320_383_30_31
       (.ADDRA({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[30]),
        .DIB(lb_wdata[31]),
        .DIC(1'b0),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_320_383_30_31_n_0),
        .DOB(linebuf_reg_r2_320_383_30_31_n_1),
        .DOC(NLW_linebuf_reg_r2_320_383_30_31_DOC_UNCONNECTED),
        .DOD(NLW_linebuf_reg_r2_320_383_30_31_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_320_383_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "320" *) 
  (* ram_addr_end = "383" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "3" *) 
  (* ram_slice_end = "5" *) 
  RAM64M linebuf_reg_r2_320_383_3_5
       (.ADDRA({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRB({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRC({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[3]),
        .DIB(lb_wdata[4]),
        .DIC(lb_wdata[5]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_320_383_3_5_n_0),
        .DOB(linebuf_reg_r2_320_383_3_5_n_1),
        .DOC(linebuf_reg_r2_320_383_3_5_n_2),
        .DOD(NLW_linebuf_reg_r2_320_383_3_5_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_320_383_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "320" *) 
  (* ram_addr_end = "383" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "8" *) 
  RAM64M linebuf_reg_r2_320_383_6_8
       (.ADDRA({rd_addr_next0[5:4],linebuf_reg_r2_0_63_6_8_i_1_n_0,rd_addr_next0[2:0]}),
        .ADDRB({rd_addr_next0[5:4],linebuf_reg_r2_0_63_6_8_i_1_n_0,rd_addr_next0[2:0]}),
        .ADDRC({rd_addr_next0[5:4],linebuf_reg_r2_0_63_6_8_i_1_n_0,rd_addr_next0[2:0]}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[6]),
        .DIB(lb_wdata[7]),
        .DIC(lb_wdata[8]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_320_383_6_8_n_0),
        .DOB(linebuf_reg_r2_320_383_6_8_n_1),
        .DOC(linebuf_reg_r2_320_383_6_8_n_2),
        .DOD(NLW_linebuf_reg_r2_320_383_6_8_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_320_383_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "320" *) 
  (* ram_addr_end = "383" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "9" *) 
  (* ram_slice_end = "11" *) 
  RAM64M linebuf_reg_r2_320_383_9_11
       (.ADDRA({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[9]),
        .DIB(lb_wdata[10]),
        .DIC(lb_wdata[11]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_320_383_9_11_n_0),
        .DOB(linebuf_reg_r2_320_383_9_11_n_1),
        .DOC(linebuf_reg_r2_320_383_9_11_n_2),
        .DOD(NLW_linebuf_reg_r2_320_383_9_11_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_320_383_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "384" *) 
  (* ram_addr_end = "447" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "2" *) 
  RAM64M linebuf_reg_r2_384_447_0_2
       (.ADDRA({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRB({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRC({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[0]),
        .DIB(lb_wdata[1]),
        .DIC(lb_wdata[2]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_384_447_0_2_n_0),
        .DOB(linebuf_reg_r2_384_447_0_2_n_1),
        .DOC(linebuf_reg_r2_384_447_0_2_n_2),
        .DOD(NLW_linebuf_reg_r2_384_447_0_2_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_384_447_0_2_i_1_n_0));
  LUT5 #(
    .INIT(32'h00400000)) 
    linebuf_reg_r2_384_447_0_2_i_1
       (.I0(lb_waddr__0[9]),
        .I1(lb_waddr__0[8]),
        .I2(lb_waddr__0[7]),
        .I3(lb_waddr__0[6]),
        .I4(lb_we),
        .O(linebuf_reg_r2_384_447_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "384" *) 
  (* ram_addr_end = "447" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "12" *) 
  (* ram_slice_end = "14" *) 
  RAM64M linebuf_reg_r2_384_447_12_14
       (.ADDRA({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[12]),
        .DIB(lb_wdata[13]),
        .DIC(lb_wdata[14]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_384_447_12_14_n_0),
        .DOB(linebuf_reg_r2_384_447_12_14_n_1),
        .DOC(linebuf_reg_r2_384_447_12_14_n_2),
        .DOD(NLW_linebuf_reg_r2_384_447_12_14_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_384_447_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "384" *) 
  (* ram_addr_end = "447" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "15" *) 
  (* ram_slice_end = "17" *) 
  RAM64M linebuf_reg_r2_384_447_15_17
       (.ADDRA({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[15]),
        .DIB(lb_wdata[16]),
        .DIC(lb_wdata[17]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_384_447_15_17_n_0),
        .DOB(linebuf_reg_r2_384_447_15_17_n_1),
        .DOC(linebuf_reg_r2_384_447_15_17_n_2),
        .DOD(NLW_linebuf_reg_r2_384_447_15_17_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_384_447_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "384" *) 
  (* ram_addr_end = "447" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "18" *) 
  (* ram_slice_end = "20" *) 
  RAM64M linebuf_reg_r2_384_447_18_20
       (.ADDRA({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[18]),
        .DIB(lb_wdata[19]),
        .DIC(lb_wdata[20]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_384_447_18_20_n_0),
        .DOB(linebuf_reg_r2_384_447_18_20_n_1),
        .DOC(linebuf_reg_r2_384_447_18_20_n_2),
        .DOD(NLW_linebuf_reg_r2_384_447_18_20_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_384_447_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "384" *) 
  (* ram_addr_end = "447" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "21" *) 
  (* ram_slice_end = "23" *) 
  RAM64M linebuf_reg_r2_384_447_21_23
       (.ADDRA({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[21]),
        .DIB(lb_wdata[22]),
        .DIC(lb_wdata[23]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_384_447_21_23_n_0),
        .DOB(linebuf_reg_r2_384_447_21_23_n_1),
        .DOC(linebuf_reg_r2_384_447_21_23_n_2),
        .DOD(NLW_linebuf_reg_r2_384_447_21_23_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_384_447_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "384" *) 
  (* ram_addr_end = "447" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "24" *) 
  (* ram_slice_end = "26" *) 
  RAM64M linebuf_reg_r2_384_447_24_26
       (.ADDRA({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[24]),
        .DIB(lb_wdata[25]),
        .DIC(lb_wdata[26]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_384_447_24_26_n_0),
        .DOB(linebuf_reg_r2_384_447_24_26_n_1),
        .DOC(linebuf_reg_r2_384_447_24_26_n_2),
        .DOD(NLW_linebuf_reg_r2_384_447_24_26_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_384_447_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "384" *) 
  (* ram_addr_end = "447" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "27" *) 
  (* ram_slice_end = "29" *) 
  RAM64M linebuf_reg_r2_384_447_27_29
       (.ADDRA({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[27]),
        .DIB(lb_wdata[28]),
        .DIC(lb_wdata[29]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_384_447_27_29_n_0),
        .DOB(linebuf_reg_r2_384_447_27_29_n_1),
        .DOC(linebuf_reg_r2_384_447_27_29_n_2),
        .DOD(NLW_linebuf_reg_r2_384_447_27_29_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_384_447_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "384" *) 
  (* ram_addr_end = "447" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "30" *) 
  (* ram_slice_end = "31" *) 
  RAM64M linebuf_reg_r2_384_447_30_31
       (.ADDRA({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[30]),
        .DIB(lb_wdata[31]),
        .DIC(1'b0),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_384_447_30_31_n_0),
        .DOB(linebuf_reg_r2_384_447_30_31_n_1),
        .DOC(NLW_linebuf_reg_r2_384_447_30_31_DOC_UNCONNECTED),
        .DOD(NLW_linebuf_reg_r2_384_447_30_31_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_384_447_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "384" *) 
  (* ram_addr_end = "447" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "3" *) 
  (* ram_slice_end = "5" *) 
  RAM64M linebuf_reg_r2_384_447_3_5
       (.ADDRA({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRB({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRC({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[3]),
        .DIB(lb_wdata[4]),
        .DIC(lb_wdata[5]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_384_447_3_5_n_0),
        .DOB(linebuf_reg_r2_384_447_3_5_n_1),
        .DOC(linebuf_reg_r2_384_447_3_5_n_2),
        .DOD(NLW_linebuf_reg_r2_384_447_3_5_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_384_447_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "384" *) 
  (* ram_addr_end = "447" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "8" *) 
  RAM64M linebuf_reg_r2_384_447_6_8
       (.ADDRA({rd_addr_next0[5:4],linebuf_reg_r2_0_63_6_8_i_1_n_0,rd_addr_next0[2:0]}),
        .ADDRB({rd_addr_next0[5:4],linebuf_reg_r2_0_63_6_8_i_1_n_0,rd_addr_next0[2:0]}),
        .ADDRC({rd_addr_next0[5:4],linebuf_reg_r2_0_63_6_8_i_1_n_0,rd_addr_next0[2:0]}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[6]),
        .DIB(lb_wdata[7]),
        .DIC(lb_wdata[8]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_384_447_6_8_n_0),
        .DOB(linebuf_reg_r2_384_447_6_8_n_1),
        .DOC(linebuf_reg_r2_384_447_6_8_n_2),
        .DOD(NLW_linebuf_reg_r2_384_447_6_8_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_384_447_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "384" *) 
  (* ram_addr_end = "447" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "9" *) 
  (* ram_slice_end = "11" *) 
  RAM64M linebuf_reg_r2_384_447_9_11
       (.ADDRA({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[9]),
        .DIB(lb_wdata[10]),
        .DIC(lb_wdata[11]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_384_447_9_11_n_0),
        .DOB(linebuf_reg_r2_384_447_9_11_n_1),
        .DOC(linebuf_reg_r2_384_447_9_11_n_2),
        .DOD(NLW_linebuf_reg_r2_384_447_9_11_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_384_447_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "448" *) 
  (* ram_addr_end = "511" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "2" *) 
  RAM64M linebuf_reg_r2_448_511_0_2
       (.ADDRA({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRB({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRC({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[0]),
        .DIB(lb_wdata[1]),
        .DIC(lb_wdata[2]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_448_511_0_2_n_0),
        .DOB(linebuf_reg_r2_448_511_0_2_n_1),
        .DOC(linebuf_reg_r2_448_511_0_2_n_2),
        .DOD(NLW_linebuf_reg_r2_448_511_0_2_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_448_511_0_2_i_1_n_0));
  LUT5 #(
    .INIT(32'h40000000)) 
    linebuf_reg_r2_448_511_0_2_i_1
       (.I0(lb_waddr__0[9]),
        .I1(lb_waddr__0[7]),
        .I2(lb_waddr__0[6]),
        .I3(lb_we),
        .I4(lb_waddr__0[8]),
        .O(linebuf_reg_r2_448_511_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "448" *) 
  (* ram_addr_end = "511" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "12" *) 
  (* ram_slice_end = "14" *) 
  RAM64M linebuf_reg_r2_448_511_12_14
       (.ADDRA({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[12]),
        .DIB(lb_wdata[13]),
        .DIC(lb_wdata[14]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_448_511_12_14_n_0),
        .DOB(linebuf_reg_r2_448_511_12_14_n_1),
        .DOC(linebuf_reg_r2_448_511_12_14_n_2),
        .DOD(NLW_linebuf_reg_r2_448_511_12_14_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_448_511_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "448" *) 
  (* ram_addr_end = "511" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "15" *) 
  (* ram_slice_end = "17" *) 
  RAM64M linebuf_reg_r2_448_511_15_17
       (.ADDRA({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[15]),
        .DIB(lb_wdata[16]),
        .DIC(lb_wdata[17]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_448_511_15_17_n_0),
        .DOB(linebuf_reg_r2_448_511_15_17_n_1),
        .DOC(linebuf_reg_r2_448_511_15_17_n_2),
        .DOD(NLW_linebuf_reg_r2_448_511_15_17_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_448_511_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "448" *) 
  (* ram_addr_end = "511" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "18" *) 
  (* ram_slice_end = "20" *) 
  RAM64M linebuf_reg_r2_448_511_18_20
       (.ADDRA({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[18]),
        .DIB(lb_wdata[19]),
        .DIC(lb_wdata[20]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_448_511_18_20_n_0),
        .DOB(linebuf_reg_r2_448_511_18_20_n_1),
        .DOC(linebuf_reg_r2_448_511_18_20_n_2),
        .DOD(NLW_linebuf_reg_r2_448_511_18_20_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_448_511_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "448" *) 
  (* ram_addr_end = "511" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "21" *) 
  (* ram_slice_end = "23" *) 
  RAM64M linebuf_reg_r2_448_511_21_23
       (.ADDRA({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[21]),
        .DIB(lb_wdata[22]),
        .DIC(lb_wdata[23]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_448_511_21_23_n_0),
        .DOB(linebuf_reg_r2_448_511_21_23_n_1),
        .DOC(linebuf_reg_r2_448_511_21_23_n_2),
        .DOD(NLW_linebuf_reg_r2_448_511_21_23_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_448_511_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "448" *) 
  (* ram_addr_end = "511" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "24" *) 
  (* ram_slice_end = "26" *) 
  RAM64M linebuf_reg_r2_448_511_24_26
       (.ADDRA({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[24]),
        .DIB(lb_wdata[25]),
        .DIC(lb_wdata[26]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_448_511_24_26_n_0),
        .DOB(linebuf_reg_r2_448_511_24_26_n_1),
        .DOC(linebuf_reg_r2_448_511_24_26_n_2),
        .DOD(NLW_linebuf_reg_r2_448_511_24_26_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_448_511_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "448" *) 
  (* ram_addr_end = "511" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "27" *) 
  (* ram_slice_end = "29" *) 
  RAM64M linebuf_reg_r2_448_511_27_29
       (.ADDRA({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[27]),
        .DIB(lb_wdata[28]),
        .DIC(lb_wdata[29]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_448_511_27_29_n_0),
        .DOB(linebuf_reg_r2_448_511_27_29_n_1),
        .DOC(linebuf_reg_r2_448_511_27_29_n_2),
        .DOD(NLW_linebuf_reg_r2_448_511_27_29_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_448_511_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "448" *) 
  (* ram_addr_end = "511" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "30" *) 
  (* ram_slice_end = "31" *) 
  RAM64M linebuf_reg_r2_448_511_30_31
       (.ADDRA({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[30]),
        .DIB(lb_wdata[31]),
        .DIC(1'b0),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_448_511_30_31_n_0),
        .DOB(linebuf_reg_r2_448_511_30_31_n_1),
        .DOC(NLW_linebuf_reg_r2_448_511_30_31_DOC_UNCONNECTED),
        .DOD(NLW_linebuf_reg_r2_448_511_30_31_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_448_511_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "448" *) 
  (* ram_addr_end = "511" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "3" *) 
  (* ram_slice_end = "5" *) 
  RAM64M linebuf_reg_r2_448_511_3_5
       (.ADDRA({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRB({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRC({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[3]),
        .DIB(lb_wdata[4]),
        .DIC(lb_wdata[5]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_448_511_3_5_n_0),
        .DOB(linebuf_reg_r2_448_511_3_5_n_1),
        .DOC(linebuf_reg_r2_448_511_3_5_n_2),
        .DOD(NLW_linebuf_reg_r2_448_511_3_5_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_448_511_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "448" *) 
  (* ram_addr_end = "511" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "8" *) 
  RAM64M linebuf_reg_r2_448_511_6_8
       (.ADDRA({rd_addr_next0[5:4],linebuf_reg_r2_0_63_6_8_i_1_n_0,rd_addr_next0[2:0]}),
        .ADDRB({rd_addr_next0[5:4],linebuf_reg_r2_0_63_6_8_i_1_n_0,rd_addr_next0[2:0]}),
        .ADDRC({rd_addr_next0[5:4],linebuf_reg_r2_0_63_6_8_i_1_n_0,rd_addr_next0[2:0]}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[6]),
        .DIB(lb_wdata[7]),
        .DIC(lb_wdata[8]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_448_511_6_8_n_0),
        .DOB(linebuf_reg_r2_448_511_6_8_n_1),
        .DOC(linebuf_reg_r2_448_511_6_8_n_2),
        .DOD(NLW_linebuf_reg_r2_448_511_6_8_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_448_511_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "448" *) 
  (* ram_addr_end = "511" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "9" *) 
  (* ram_slice_end = "11" *) 
  RAM64M linebuf_reg_r2_448_511_9_11
       (.ADDRA({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[9]),
        .DIB(lb_wdata[10]),
        .DIC(lb_wdata[11]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_448_511_9_11_n_0),
        .DOB(linebuf_reg_r2_448_511_9_11_n_1),
        .DOC(linebuf_reg_r2_448_511_9_11_n_2),
        .DOD(NLW_linebuf_reg_r2_448_511_9_11_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_448_511_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "512" *) 
  (* ram_addr_end = "575" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "2" *) 
  RAM64M linebuf_reg_r2_512_575_0_2
       (.ADDRA({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRB({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRC({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[0]),
        .DIB(lb_wdata[1]),
        .DIC(lb_wdata[2]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_512_575_0_2_n_0),
        .DOB(linebuf_reg_r2_512_575_0_2_n_1),
        .DOC(linebuf_reg_r2_512_575_0_2_n_2),
        .DOD(NLW_linebuf_reg_r2_512_575_0_2_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r1_512_575_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "512" *) 
  (* ram_addr_end = "575" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "12" *) 
  (* ram_slice_end = "14" *) 
  RAM64M linebuf_reg_r2_512_575_12_14
       (.ADDRA({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[12]),
        .DIB(lb_wdata[13]),
        .DIC(lb_wdata[14]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_512_575_12_14_n_0),
        .DOB(linebuf_reg_r2_512_575_12_14_n_1),
        .DOC(linebuf_reg_r2_512_575_12_14_n_2),
        .DOD(NLW_linebuf_reg_r2_512_575_12_14_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r1_512_575_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "512" *) 
  (* ram_addr_end = "575" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "15" *) 
  (* ram_slice_end = "17" *) 
  RAM64M linebuf_reg_r2_512_575_15_17
       (.ADDRA({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[15]),
        .DIB(lb_wdata[16]),
        .DIC(lb_wdata[17]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_512_575_15_17_n_0),
        .DOB(linebuf_reg_r2_512_575_15_17_n_1),
        .DOC(linebuf_reg_r2_512_575_15_17_n_2),
        .DOD(NLW_linebuf_reg_r2_512_575_15_17_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r1_512_575_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "512" *) 
  (* ram_addr_end = "575" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "18" *) 
  (* ram_slice_end = "20" *) 
  RAM64M linebuf_reg_r2_512_575_18_20
       (.ADDRA({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[18]),
        .DIB(lb_wdata[19]),
        .DIC(lb_wdata[20]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_512_575_18_20_n_0),
        .DOB(linebuf_reg_r2_512_575_18_20_n_1),
        .DOC(linebuf_reg_r2_512_575_18_20_n_2),
        .DOD(NLW_linebuf_reg_r2_512_575_18_20_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r1_512_575_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "512" *) 
  (* ram_addr_end = "575" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "21" *) 
  (* ram_slice_end = "23" *) 
  RAM64M linebuf_reg_r2_512_575_21_23
       (.ADDRA({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[21]),
        .DIB(lb_wdata[22]),
        .DIC(lb_wdata[23]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_512_575_21_23_n_0),
        .DOB(linebuf_reg_r2_512_575_21_23_n_1),
        .DOC(linebuf_reg_r2_512_575_21_23_n_2),
        .DOD(NLW_linebuf_reg_r2_512_575_21_23_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r1_512_575_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "512" *) 
  (* ram_addr_end = "575" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "24" *) 
  (* ram_slice_end = "26" *) 
  RAM64M linebuf_reg_r2_512_575_24_26
       (.ADDRA({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[24]),
        .DIB(lb_wdata[25]),
        .DIC(lb_wdata[26]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_512_575_24_26_n_0),
        .DOB(linebuf_reg_r2_512_575_24_26_n_1),
        .DOC(linebuf_reg_r2_512_575_24_26_n_2),
        .DOD(NLW_linebuf_reg_r2_512_575_24_26_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r1_512_575_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "512" *) 
  (* ram_addr_end = "575" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "27" *) 
  (* ram_slice_end = "29" *) 
  RAM64M linebuf_reg_r2_512_575_27_29
       (.ADDRA({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[27]),
        .DIB(lb_wdata[28]),
        .DIC(lb_wdata[29]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_512_575_27_29_n_0),
        .DOB(linebuf_reg_r2_512_575_27_29_n_1),
        .DOC(linebuf_reg_r2_512_575_27_29_n_2),
        .DOD(NLW_linebuf_reg_r2_512_575_27_29_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r1_512_575_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "512" *) 
  (* ram_addr_end = "575" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "30" *) 
  (* ram_slice_end = "31" *) 
  RAM64M linebuf_reg_r2_512_575_30_31
       (.ADDRA({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[30]),
        .DIB(lb_wdata[31]),
        .DIC(1'b0),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_512_575_30_31_n_0),
        .DOB(linebuf_reg_r2_512_575_30_31_n_1),
        .DOC(NLW_linebuf_reg_r2_512_575_30_31_DOC_UNCONNECTED),
        .DOD(NLW_linebuf_reg_r2_512_575_30_31_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r1_512_575_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "512" *) 
  (* ram_addr_end = "575" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "3" *) 
  (* ram_slice_end = "5" *) 
  RAM64M linebuf_reg_r2_512_575_3_5
       (.ADDRA({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRB({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRC({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[3]),
        .DIB(lb_wdata[4]),
        .DIC(lb_wdata[5]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_512_575_3_5_n_0),
        .DOB(linebuf_reg_r2_512_575_3_5_n_1),
        .DOC(linebuf_reg_r2_512_575_3_5_n_2),
        .DOD(NLW_linebuf_reg_r2_512_575_3_5_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r1_512_575_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "512" *) 
  (* ram_addr_end = "575" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "8" *) 
  RAM64M linebuf_reg_r2_512_575_6_8
       (.ADDRA({rd_addr_next0[5:4],linebuf_reg_r2_0_63_6_8_i_1_n_0,rd_addr_next0[2:0]}),
        .ADDRB({rd_addr_next0[5:4],linebuf_reg_r2_0_63_6_8_i_1_n_0,rd_addr_next0[2:0]}),
        .ADDRC({rd_addr_next0[5:4],linebuf_reg_r2_0_63_6_8_i_1_n_0,rd_addr_next0[2:0]}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[6]),
        .DIB(lb_wdata[7]),
        .DIC(lb_wdata[8]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_512_575_6_8_n_0),
        .DOB(linebuf_reg_r2_512_575_6_8_n_1),
        .DOC(linebuf_reg_r2_512_575_6_8_n_2),
        .DOD(NLW_linebuf_reg_r2_512_575_6_8_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r1_512_575_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "512" *) 
  (* ram_addr_end = "575" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "9" *) 
  (* ram_slice_end = "11" *) 
  RAM64M linebuf_reg_r2_512_575_9_11
       (.ADDRA({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[9]),
        .DIB(lb_wdata[10]),
        .DIC(lb_wdata[11]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_512_575_9_11_n_0),
        .DOB(linebuf_reg_r2_512_575_9_11_n_1),
        .DOC(linebuf_reg_r2_512_575_9_11_n_2),
        .DOD(NLW_linebuf_reg_r2_512_575_9_11_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r1_512_575_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "576" *) 
  (* ram_addr_end = "639" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "2" *) 
  RAM64M linebuf_reg_r2_576_639_0_2
       (.ADDRA({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRB({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRC({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[0]),
        .DIB(lb_wdata[1]),
        .DIC(lb_wdata[2]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_576_639_0_2_n_0),
        .DOB(linebuf_reg_r2_576_639_0_2_n_1),
        .DOC(linebuf_reg_r2_576_639_0_2_n_2),
        .DOD(NLW_linebuf_reg_r2_576_639_0_2_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_576_639_0_2_i_1_n_0));
  LUT5 #(
    .INIT(32'h00400000)) 
    linebuf_reg_r2_576_639_0_2_i_1
       (.I0(lb_waddr__0[8]),
        .I1(lb_waddr__0[9]),
        .I2(lb_waddr__0[6]),
        .I3(lb_waddr__0[7]),
        .I4(lb_we),
        .O(linebuf_reg_r2_576_639_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "576" *) 
  (* ram_addr_end = "639" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "12" *) 
  (* ram_slice_end = "14" *) 
  RAM64M linebuf_reg_r2_576_639_12_14
       (.ADDRA({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[12]),
        .DIB(lb_wdata[13]),
        .DIC(lb_wdata[14]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_576_639_12_14_n_0),
        .DOB(linebuf_reg_r2_576_639_12_14_n_1),
        .DOC(linebuf_reg_r2_576_639_12_14_n_2),
        .DOD(NLW_linebuf_reg_r2_576_639_12_14_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_576_639_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "576" *) 
  (* ram_addr_end = "639" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "15" *) 
  (* ram_slice_end = "17" *) 
  RAM64M linebuf_reg_r2_576_639_15_17
       (.ADDRA({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[15]),
        .DIB(lb_wdata[16]),
        .DIC(lb_wdata[17]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_576_639_15_17_n_0),
        .DOB(linebuf_reg_r2_576_639_15_17_n_1),
        .DOC(linebuf_reg_r2_576_639_15_17_n_2),
        .DOD(NLW_linebuf_reg_r2_576_639_15_17_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_576_639_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "576" *) 
  (* ram_addr_end = "639" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "18" *) 
  (* ram_slice_end = "20" *) 
  RAM64M linebuf_reg_r2_576_639_18_20
       (.ADDRA({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[18]),
        .DIB(lb_wdata[19]),
        .DIC(lb_wdata[20]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_576_639_18_20_n_0),
        .DOB(linebuf_reg_r2_576_639_18_20_n_1),
        .DOC(linebuf_reg_r2_576_639_18_20_n_2),
        .DOD(NLW_linebuf_reg_r2_576_639_18_20_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_576_639_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "576" *) 
  (* ram_addr_end = "639" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "21" *) 
  (* ram_slice_end = "23" *) 
  RAM64M linebuf_reg_r2_576_639_21_23
       (.ADDRA({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[21]),
        .DIB(lb_wdata[22]),
        .DIC(lb_wdata[23]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_576_639_21_23_n_0),
        .DOB(linebuf_reg_r2_576_639_21_23_n_1),
        .DOC(linebuf_reg_r2_576_639_21_23_n_2),
        .DOD(NLW_linebuf_reg_r2_576_639_21_23_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_576_639_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "576" *) 
  (* ram_addr_end = "639" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "24" *) 
  (* ram_slice_end = "26" *) 
  RAM64M linebuf_reg_r2_576_639_24_26
       (.ADDRA({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[24]),
        .DIB(lb_wdata[25]),
        .DIC(lb_wdata[26]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_576_639_24_26_n_0),
        .DOB(linebuf_reg_r2_576_639_24_26_n_1),
        .DOC(linebuf_reg_r2_576_639_24_26_n_2),
        .DOD(NLW_linebuf_reg_r2_576_639_24_26_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_576_639_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "576" *) 
  (* ram_addr_end = "639" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "27" *) 
  (* ram_slice_end = "29" *) 
  RAM64M linebuf_reg_r2_576_639_27_29
       (.ADDRA({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[27]),
        .DIB(lb_wdata[28]),
        .DIC(lb_wdata[29]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_576_639_27_29_n_0),
        .DOB(linebuf_reg_r2_576_639_27_29_n_1),
        .DOC(linebuf_reg_r2_576_639_27_29_n_2),
        .DOD(NLW_linebuf_reg_r2_576_639_27_29_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_576_639_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "576" *) 
  (* ram_addr_end = "639" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "30" *) 
  (* ram_slice_end = "31" *) 
  RAM64M linebuf_reg_r2_576_639_30_31
       (.ADDRA({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[30]),
        .DIB(lb_wdata[31]),
        .DIC(1'b0),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_576_639_30_31_n_0),
        .DOB(linebuf_reg_r2_576_639_30_31_n_1),
        .DOC(NLW_linebuf_reg_r2_576_639_30_31_DOC_UNCONNECTED),
        .DOD(NLW_linebuf_reg_r2_576_639_30_31_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_576_639_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "576" *) 
  (* ram_addr_end = "639" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "3" *) 
  (* ram_slice_end = "5" *) 
  RAM64M linebuf_reg_r2_576_639_3_5
       (.ADDRA({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRB({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRC({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[3]),
        .DIB(lb_wdata[4]),
        .DIC(lb_wdata[5]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_576_639_3_5_n_0),
        .DOB(linebuf_reg_r2_576_639_3_5_n_1),
        .DOC(linebuf_reg_r2_576_639_3_5_n_2),
        .DOD(NLW_linebuf_reg_r2_576_639_3_5_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_576_639_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "576" *) 
  (* ram_addr_end = "639" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "8" *) 
  RAM64M linebuf_reg_r2_576_639_6_8
       (.ADDRA({rd_addr_next0[5:4],linebuf_reg_r2_0_63_6_8_i_1_n_0,rd_addr_next0[2:0]}),
        .ADDRB({rd_addr_next0[5:4],linebuf_reg_r2_0_63_6_8_i_1_n_0,rd_addr_next0[2:0]}),
        .ADDRC({rd_addr_next0[5:4],linebuf_reg_r2_0_63_6_8_i_1_n_0,rd_addr_next0[2:0]}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[6]),
        .DIB(lb_wdata[7]),
        .DIC(lb_wdata[8]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_576_639_6_8_n_0),
        .DOB(linebuf_reg_r2_576_639_6_8_n_1),
        .DOC(linebuf_reg_r2_576_639_6_8_n_2),
        .DOD(NLW_linebuf_reg_r2_576_639_6_8_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_576_639_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "576" *) 
  (* ram_addr_end = "639" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "9" *) 
  (* ram_slice_end = "11" *) 
  RAM64M linebuf_reg_r2_576_639_9_11
       (.ADDRA({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[9]),
        .DIB(lb_wdata[10]),
        .DIC(lb_wdata[11]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_576_639_9_11_n_0),
        .DOB(linebuf_reg_r2_576_639_9_11_n_1),
        .DOC(linebuf_reg_r2_576_639_9_11_n_2),
        .DOD(NLW_linebuf_reg_r2_576_639_9_11_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_576_639_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "640" *) 
  (* ram_addr_end = "703" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "2" *) 
  RAM64M linebuf_reg_r2_640_703_0_2
       (.ADDRA({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRB({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRC({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[0]),
        .DIB(lb_wdata[1]),
        .DIC(lb_wdata[2]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_640_703_0_2_n_0),
        .DOB(linebuf_reg_r2_640_703_0_2_n_1),
        .DOC(linebuf_reg_r2_640_703_0_2_n_2),
        .DOD(NLW_linebuf_reg_r2_640_703_0_2_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_640_703_0_2_i_1_n_0));
  LUT5 #(
    .INIT(32'h00400000)) 
    linebuf_reg_r2_640_703_0_2_i_1
       (.I0(lb_waddr__0[8]),
        .I1(lb_waddr__0[9]),
        .I2(lb_waddr__0[7]),
        .I3(lb_waddr__0[6]),
        .I4(lb_we),
        .O(linebuf_reg_r2_640_703_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "640" *) 
  (* ram_addr_end = "703" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "12" *) 
  (* ram_slice_end = "14" *) 
  RAM64M linebuf_reg_r2_640_703_12_14
       (.ADDRA({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[12]),
        .DIB(lb_wdata[13]),
        .DIC(lb_wdata[14]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_640_703_12_14_n_0),
        .DOB(linebuf_reg_r2_640_703_12_14_n_1),
        .DOC(linebuf_reg_r2_640_703_12_14_n_2),
        .DOD(NLW_linebuf_reg_r2_640_703_12_14_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_640_703_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "640" *) 
  (* ram_addr_end = "703" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "15" *) 
  (* ram_slice_end = "17" *) 
  RAM64M linebuf_reg_r2_640_703_15_17
       (.ADDRA({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[15]),
        .DIB(lb_wdata[16]),
        .DIC(lb_wdata[17]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_640_703_15_17_n_0),
        .DOB(linebuf_reg_r2_640_703_15_17_n_1),
        .DOC(linebuf_reg_r2_640_703_15_17_n_2),
        .DOD(NLW_linebuf_reg_r2_640_703_15_17_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_640_703_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "640" *) 
  (* ram_addr_end = "703" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "18" *) 
  (* ram_slice_end = "20" *) 
  RAM64M linebuf_reg_r2_640_703_18_20
       (.ADDRA({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[18]),
        .DIB(lb_wdata[19]),
        .DIC(lb_wdata[20]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_640_703_18_20_n_0),
        .DOB(linebuf_reg_r2_640_703_18_20_n_1),
        .DOC(linebuf_reg_r2_640_703_18_20_n_2),
        .DOD(NLW_linebuf_reg_r2_640_703_18_20_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_640_703_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "640" *) 
  (* ram_addr_end = "703" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "21" *) 
  (* ram_slice_end = "23" *) 
  RAM64M linebuf_reg_r2_640_703_21_23
       (.ADDRA({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[21]),
        .DIB(lb_wdata[22]),
        .DIC(lb_wdata[23]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_640_703_21_23_n_0),
        .DOB(linebuf_reg_r2_640_703_21_23_n_1),
        .DOC(linebuf_reg_r2_640_703_21_23_n_2),
        .DOD(NLW_linebuf_reg_r2_640_703_21_23_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_640_703_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "640" *) 
  (* ram_addr_end = "703" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "24" *) 
  (* ram_slice_end = "26" *) 
  RAM64M linebuf_reg_r2_640_703_24_26
       (.ADDRA({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[24]),
        .DIB(lb_wdata[25]),
        .DIC(lb_wdata[26]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_640_703_24_26_n_0),
        .DOB(linebuf_reg_r2_640_703_24_26_n_1),
        .DOC(linebuf_reg_r2_640_703_24_26_n_2),
        .DOD(NLW_linebuf_reg_r2_640_703_24_26_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_640_703_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "640" *) 
  (* ram_addr_end = "703" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "27" *) 
  (* ram_slice_end = "29" *) 
  RAM64M linebuf_reg_r2_640_703_27_29
       (.ADDRA({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[27]),
        .DIB(lb_wdata[28]),
        .DIC(lb_wdata[29]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_640_703_27_29_n_0),
        .DOB(linebuf_reg_r2_640_703_27_29_n_1),
        .DOC(linebuf_reg_r2_640_703_27_29_n_2),
        .DOD(NLW_linebuf_reg_r2_640_703_27_29_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_640_703_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "640" *) 
  (* ram_addr_end = "703" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "30" *) 
  (* ram_slice_end = "31" *) 
  RAM64M linebuf_reg_r2_640_703_30_31
       (.ADDRA({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[30]),
        .DIB(lb_wdata[31]),
        .DIC(1'b0),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_640_703_30_31_n_0),
        .DOB(linebuf_reg_r2_640_703_30_31_n_1),
        .DOC(NLW_linebuf_reg_r2_640_703_30_31_DOC_UNCONNECTED),
        .DOD(NLW_linebuf_reg_r2_640_703_30_31_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_640_703_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "640" *) 
  (* ram_addr_end = "703" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "3" *) 
  (* ram_slice_end = "5" *) 
  RAM64M linebuf_reg_r2_640_703_3_5
       (.ADDRA({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRB({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRC({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[3]),
        .DIB(lb_wdata[4]),
        .DIC(lb_wdata[5]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_640_703_3_5_n_0),
        .DOB(linebuf_reg_r2_640_703_3_5_n_1),
        .DOC(linebuf_reg_r2_640_703_3_5_n_2),
        .DOD(NLW_linebuf_reg_r2_640_703_3_5_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_640_703_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "640" *) 
  (* ram_addr_end = "703" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "8" *) 
  RAM64M linebuf_reg_r2_640_703_6_8
       (.ADDRA({rd_addr_next0[5:4],linebuf_reg_r2_0_63_6_8_i_1_n_0,rd_addr_next0[2:0]}),
        .ADDRB({rd_addr_next0[5:4],linebuf_reg_r2_0_63_6_8_i_1_n_0,rd_addr_next0[2:0]}),
        .ADDRC({rd_addr_next0[5:4],linebuf_reg_r2_0_63_6_8_i_1_n_0,rd_addr_next0[2:0]}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[6]),
        .DIB(lb_wdata[7]),
        .DIC(lb_wdata[8]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_640_703_6_8_n_0),
        .DOB(linebuf_reg_r2_640_703_6_8_n_1),
        .DOC(linebuf_reg_r2_640_703_6_8_n_2),
        .DOD(NLW_linebuf_reg_r2_640_703_6_8_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_640_703_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "640" *) 
  (* ram_addr_end = "703" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "9" *) 
  (* ram_slice_end = "11" *) 
  RAM64M linebuf_reg_r2_640_703_9_11
       (.ADDRA({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[9]),
        .DIB(lb_wdata[10]),
        .DIC(lb_wdata[11]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_640_703_9_11_n_0),
        .DOB(linebuf_reg_r2_640_703_9_11_n_1),
        .DOC(linebuf_reg_r2_640_703_9_11_n_2),
        .DOD(NLW_linebuf_reg_r2_640_703_9_11_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_640_703_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "64" *) 
  (* ram_addr_end = "127" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "2" *) 
  RAM64M linebuf_reg_r2_64_127_0_2
       (.ADDRA({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRB({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRC({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[0]),
        .DIB(lb_wdata[1]),
        .DIC(lb_wdata[2]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_64_127_0_2_n_0),
        .DOB(linebuf_reg_r2_64_127_0_2_n_1),
        .DOC(linebuf_reg_r2_64_127_0_2_n_2),
        .DOD(NLW_linebuf_reg_r2_64_127_0_2_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_64_127_0_2_i_1_n_0));
  LUT5 #(
    .INIT(32'h00020000)) 
    linebuf_reg_r2_64_127_0_2_i_1
       (.I0(lb_we),
        .I1(lb_waddr__0[8]),
        .I2(lb_waddr__0[7]),
        .I3(lb_waddr__0[9]),
        .I4(lb_waddr__0[6]),
        .O(linebuf_reg_r2_64_127_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "64" *) 
  (* ram_addr_end = "127" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "12" *) 
  (* ram_slice_end = "14" *) 
  RAM64M linebuf_reg_r2_64_127_12_14
       (.ADDRA({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[12]),
        .DIB(lb_wdata[13]),
        .DIC(lb_wdata[14]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_64_127_12_14_n_0),
        .DOB(linebuf_reg_r2_64_127_12_14_n_1),
        .DOC(linebuf_reg_r2_64_127_12_14_n_2),
        .DOD(NLW_linebuf_reg_r2_64_127_12_14_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_64_127_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "64" *) 
  (* ram_addr_end = "127" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "15" *) 
  (* ram_slice_end = "17" *) 
  RAM64M linebuf_reg_r2_64_127_15_17
       (.ADDRA({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[15]),
        .DIB(lb_wdata[16]),
        .DIC(lb_wdata[17]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_64_127_15_17_n_0),
        .DOB(linebuf_reg_r2_64_127_15_17_n_1),
        .DOC(linebuf_reg_r2_64_127_15_17_n_2),
        .DOD(NLW_linebuf_reg_r2_64_127_15_17_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_64_127_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "64" *) 
  (* ram_addr_end = "127" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "18" *) 
  (* ram_slice_end = "20" *) 
  RAM64M linebuf_reg_r2_64_127_18_20
       (.ADDRA({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[18]),
        .DIB(lb_wdata[19]),
        .DIC(lb_wdata[20]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_64_127_18_20_n_0),
        .DOB(linebuf_reg_r2_64_127_18_20_n_1),
        .DOC(linebuf_reg_r2_64_127_18_20_n_2),
        .DOD(NLW_linebuf_reg_r2_64_127_18_20_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_64_127_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "64" *) 
  (* ram_addr_end = "127" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "21" *) 
  (* ram_slice_end = "23" *) 
  RAM64M linebuf_reg_r2_64_127_21_23
       (.ADDRA({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[21]),
        .DIB(lb_wdata[22]),
        .DIC(lb_wdata[23]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_64_127_21_23_n_0),
        .DOB(linebuf_reg_r2_64_127_21_23_n_1),
        .DOC(linebuf_reg_r2_64_127_21_23_n_2),
        .DOD(NLW_linebuf_reg_r2_64_127_21_23_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_64_127_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "64" *) 
  (* ram_addr_end = "127" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "24" *) 
  (* ram_slice_end = "26" *) 
  RAM64M linebuf_reg_r2_64_127_24_26
       (.ADDRA({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[24]),
        .DIB(lb_wdata[25]),
        .DIC(lb_wdata[26]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_64_127_24_26_n_0),
        .DOB(linebuf_reg_r2_64_127_24_26_n_1),
        .DOC(linebuf_reg_r2_64_127_24_26_n_2),
        .DOD(NLW_linebuf_reg_r2_64_127_24_26_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_64_127_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "64" *) 
  (* ram_addr_end = "127" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "27" *) 
  (* ram_slice_end = "29" *) 
  RAM64M linebuf_reg_r2_64_127_27_29
       (.ADDRA({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[27]),
        .DIB(lb_wdata[28]),
        .DIC(lb_wdata[29]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_64_127_27_29_n_0),
        .DOB(linebuf_reg_r2_64_127_27_29_n_1),
        .DOC(linebuf_reg_r2_64_127_27_29_n_2),
        .DOD(NLW_linebuf_reg_r2_64_127_27_29_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_64_127_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "64" *) 
  (* ram_addr_end = "127" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "30" *) 
  (* ram_slice_end = "31" *) 
  RAM64M linebuf_reg_r2_64_127_30_31
       (.ADDRA({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[30]),
        .DIB(lb_wdata[31]),
        .DIC(1'b0),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_64_127_30_31_n_0),
        .DOB(linebuf_reg_r2_64_127_30_31_n_1),
        .DOC(NLW_linebuf_reg_r2_64_127_30_31_DOC_UNCONNECTED),
        .DOD(NLW_linebuf_reg_r2_64_127_30_31_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_64_127_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "64" *) 
  (* ram_addr_end = "127" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "3" *) 
  (* ram_slice_end = "5" *) 
  RAM64M linebuf_reg_r2_64_127_3_5
       (.ADDRA({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRB({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRC({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[3]),
        .DIB(lb_wdata[4]),
        .DIC(lb_wdata[5]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_64_127_3_5_n_0),
        .DOB(linebuf_reg_r2_64_127_3_5_n_1),
        .DOC(linebuf_reg_r2_64_127_3_5_n_2),
        .DOD(NLW_linebuf_reg_r2_64_127_3_5_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_64_127_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "64" *) 
  (* ram_addr_end = "127" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "8" *) 
  RAM64M linebuf_reg_r2_64_127_6_8
       (.ADDRA({rd_addr_next0[5:4],linebuf_reg_r2_0_63_6_8_i_1_n_0,rd_addr_next0[2:0]}),
        .ADDRB({rd_addr_next0[5:4],linebuf_reg_r2_0_63_6_8_i_1_n_0,rd_addr_next0[2:0]}),
        .ADDRC({rd_addr_next0[5:4],linebuf_reg_r2_0_63_6_8_i_1_n_0,rd_addr_next0[2:0]}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[6]),
        .DIB(lb_wdata[7]),
        .DIC(lb_wdata[8]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_64_127_6_8_n_0),
        .DOB(linebuf_reg_r2_64_127_6_8_n_1),
        .DOC(linebuf_reg_r2_64_127_6_8_n_2),
        .DOD(NLW_linebuf_reg_r2_64_127_6_8_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_64_127_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "64" *) 
  (* ram_addr_end = "127" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "9" *) 
  (* ram_slice_end = "11" *) 
  RAM64M linebuf_reg_r2_64_127_9_11
       (.ADDRA({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[9]),
        .DIB(lb_wdata[10]),
        .DIC(lb_wdata[11]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_64_127_9_11_n_0),
        .DOB(linebuf_reg_r2_64_127_9_11_n_1),
        .DOC(linebuf_reg_r2_64_127_9_11_n_2),
        .DOD(NLW_linebuf_reg_r2_64_127_9_11_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_64_127_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "704" *) 
  (* ram_addr_end = "767" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "2" *) 
  RAM64M linebuf_reg_r2_704_767_0_2
       (.ADDRA({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRB({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRC({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[0]),
        .DIB(lb_wdata[1]),
        .DIC(lb_wdata[2]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_704_767_0_2_n_0),
        .DOB(linebuf_reg_r2_704_767_0_2_n_1),
        .DOC(linebuf_reg_r2_704_767_0_2_n_2),
        .DOD(NLW_linebuf_reg_r2_704_767_0_2_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_704_767_0_2_i_1_n_0));
  LUT5 #(
    .INIT(32'h40000000)) 
    linebuf_reg_r2_704_767_0_2_i_1
       (.I0(lb_waddr__0[8]),
        .I1(lb_waddr__0[7]),
        .I2(lb_waddr__0[6]),
        .I3(lb_we),
        .I4(lb_waddr__0[9]),
        .O(linebuf_reg_r2_704_767_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "704" *) 
  (* ram_addr_end = "767" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "12" *) 
  (* ram_slice_end = "14" *) 
  RAM64M linebuf_reg_r2_704_767_12_14
       (.ADDRA({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[12]),
        .DIB(lb_wdata[13]),
        .DIC(lb_wdata[14]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_704_767_12_14_n_0),
        .DOB(linebuf_reg_r2_704_767_12_14_n_1),
        .DOC(linebuf_reg_r2_704_767_12_14_n_2),
        .DOD(NLW_linebuf_reg_r2_704_767_12_14_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_704_767_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "704" *) 
  (* ram_addr_end = "767" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "15" *) 
  (* ram_slice_end = "17" *) 
  RAM64M linebuf_reg_r2_704_767_15_17
       (.ADDRA({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[15]),
        .DIB(lb_wdata[16]),
        .DIC(lb_wdata[17]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_704_767_15_17_n_0),
        .DOB(linebuf_reg_r2_704_767_15_17_n_1),
        .DOC(linebuf_reg_r2_704_767_15_17_n_2),
        .DOD(NLW_linebuf_reg_r2_704_767_15_17_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_704_767_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "704" *) 
  (* ram_addr_end = "767" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "18" *) 
  (* ram_slice_end = "20" *) 
  RAM64M linebuf_reg_r2_704_767_18_20
       (.ADDRA({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[18]),
        .DIB(lb_wdata[19]),
        .DIC(lb_wdata[20]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_704_767_18_20_n_0),
        .DOB(linebuf_reg_r2_704_767_18_20_n_1),
        .DOC(linebuf_reg_r2_704_767_18_20_n_2),
        .DOD(NLW_linebuf_reg_r2_704_767_18_20_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_704_767_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "704" *) 
  (* ram_addr_end = "767" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "21" *) 
  (* ram_slice_end = "23" *) 
  RAM64M linebuf_reg_r2_704_767_21_23
       (.ADDRA({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[21]),
        .DIB(lb_wdata[22]),
        .DIC(lb_wdata[23]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_704_767_21_23_n_0),
        .DOB(linebuf_reg_r2_704_767_21_23_n_1),
        .DOC(linebuf_reg_r2_704_767_21_23_n_2),
        .DOD(NLW_linebuf_reg_r2_704_767_21_23_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_704_767_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "704" *) 
  (* ram_addr_end = "767" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "24" *) 
  (* ram_slice_end = "26" *) 
  RAM64M linebuf_reg_r2_704_767_24_26
       (.ADDRA({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[24]),
        .DIB(lb_wdata[25]),
        .DIC(lb_wdata[26]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_704_767_24_26_n_0),
        .DOB(linebuf_reg_r2_704_767_24_26_n_1),
        .DOC(linebuf_reg_r2_704_767_24_26_n_2),
        .DOD(NLW_linebuf_reg_r2_704_767_24_26_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_704_767_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "704" *) 
  (* ram_addr_end = "767" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "27" *) 
  (* ram_slice_end = "29" *) 
  RAM64M linebuf_reg_r2_704_767_27_29
       (.ADDRA({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[27]),
        .DIB(lb_wdata[28]),
        .DIC(lb_wdata[29]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_704_767_27_29_n_0),
        .DOB(linebuf_reg_r2_704_767_27_29_n_1),
        .DOC(linebuf_reg_r2_704_767_27_29_n_2),
        .DOD(NLW_linebuf_reg_r2_704_767_27_29_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_704_767_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "704" *) 
  (* ram_addr_end = "767" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "30" *) 
  (* ram_slice_end = "31" *) 
  RAM64M linebuf_reg_r2_704_767_30_31
       (.ADDRA({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[30]),
        .DIB(lb_wdata[31]),
        .DIC(1'b0),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_704_767_30_31_n_0),
        .DOB(linebuf_reg_r2_704_767_30_31_n_1),
        .DOC(NLW_linebuf_reg_r2_704_767_30_31_DOC_UNCONNECTED),
        .DOD(NLW_linebuf_reg_r2_704_767_30_31_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_704_767_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "704" *) 
  (* ram_addr_end = "767" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "3" *) 
  (* ram_slice_end = "5" *) 
  RAM64M linebuf_reg_r2_704_767_3_5
       (.ADDRA({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRB({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRC({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[3]),
        .DIB(lb_wdata[4]),
        .DIC(lb_wdata[5]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_704_767_3_5_n_0),
        .DOB(linebuf_reg_r2_704_767_3_5_n_1),
        .DOC(linebuf_reg_r2_704_767_3_5_n_2),
        .DOD(NLW_linebuf_reg_r2_704_767_3_5_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_704_767_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "704" *) 
  (* ram_addr_end = "767" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "8" *) 
  RAM64M linebuf_reg_r2_704_767_6_8
       (.ADDRA({rd_addr_next0[5:4],linebuf_reg_r2_0_63_6_8_i_1_n_0,rd_addr_next0[2:0]}),
        .ADDRB({rd_addr_next0[5:4],linebuf_reg_r2_0_63_6_8_i_1_n_0,rd_addr_next0[2:0]}),
        .ADDRC({rd_addr_next0[5:4],linebuf_reg_r2_0_63_6_8_i_1_n_0,rd_addr_next0[2:0]}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[6]),
        .DIB(lb_wdata[7]),
        .DIC(lb_wdata[8]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_704_767_6_8_n_0),
        .DOB(linebuf_reg_r2_704_767_6_8_n_1),
        .DOC(linebuf_reg_r2_704_767_6_8_n_2),
        .DOD(NLW_linebuf_reg_r2_704_767_6_8_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_704_767_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "704" *) 
  (* ram_addr_end = "767" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "9" *) 
  (* ram_slice_end = "11" *) 
  RAM64M linebuf_reg_r2_704_767_9_11
       (.ADDRA({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[9]),
        .DIB(lb_wdata[10]),
        .DIC(lb_wdata[11]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_704_767_9_11_n_0),
        .DOB(linebuf_reg_r2_704_767_9_11_n_1),
        .DOC(linebuf_reg_r2_704_767_9_11_n_2),
        .DOD(NLW_linebuf_reg_r2_704_767_9_11_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_704_767_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "768" *) 
  (* ram_addr_end = "831" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "2" *) 
  RAM64M linebuf_reg_r2_768_831_0_2
       (.ADDRA({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRB({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRC({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[0]),
        .DIB(lb_wdata[1]),
        .DIC(lb_wdata[2]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_768_831_0_2_n_0),
        .DOB(linebuf_reg_r2_768_831_0_2_n_1),
        .DOC(linebuf_reg_r2_768_831_0_2_n_2),
        .DOD(NLW_linebuf_reg_r2_768_831_0_2_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_768_831_0_2_i_1_n_0));
  LUT5 #(
    .INIT(32'h00400000)) 
    linebuf_reg_r2_768_831_0_2_i_1
       (.I0(lb_waddr__0[7]),
        .I1(lb_waddr__0[9]),
        .I2(lb_waddr__0[8]),
        .I3(lb_waddr__0[6]),
        .I4(lb_we),
        .O(linebuf_reg_r2_768_831_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "768" *) 
  (* ram_addr_end = "831" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "12" *) 
  (* ram_slice_end = "14" *) 
  RAM64M linebuf_reg_r2_768_831_12_14
       (.ADDRA({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[12]),
        .DIB(lb_wdata[13]),
        .DIC(lb_wdata[14]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_768_831_12_14_n_0),
        .DOB(linebuf_reg_r2_768_831_12_14_n_1),
        .DOC(linebuf_reg_r2_768_831_12_14_n_2),
        .DOD(NLW_linebuf_reg_r2_768_831_12_14_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_768_831_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "768" *) 
  (* ram_addr_end = "831" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "15" *) 
  (* ram_slice_end = "17" *) 
  RAM64M linebuf_reg_r2_768_831_15_17
       (.ADDRA({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[15]),
        .DIB(lb_wdata[16]),
        .DIC(lb_wdata[17]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_768_831_15_17_n_0),
        .DOB(linebuf_reg_r2_768_831_15_17_n_1),
        .DOC(linebuf_reg_r2_768_831_15_17_n_2),
        .DOD(NLW_linebuf_reg_r2_768_831_15_17_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_768_831_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "768" *) 
  (* ram_addr_end = "831" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "18" *) 
  (* ram_slice_end = "20" *) 
  RAM64M linebuf_reg_r2_768_831_18_20
       (.ADDRA({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[18]),
        .DIB(lb_wdata[19]),
        .DIC(lb_wdata[20]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_768_831_18_20_n_0),
        .DOB(linebuf_reg_r2_768_831_18_20_n_1),
        .DOC(linebuf_reg_r2_768_831_18_20_n_2),
        .DOD(NLW_linebuf_reg_r2_768_831_18_20_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_768_831_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "768" *) 
  (* ram_addr_end = "831" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "21" *) 
  (* ram_slice_end = "23" *) 
  RAM64M linebuf_reg_r2_768_831_21_23
       (.ADDRA({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[21]),
        .DIB(lb_wdata[22]),
        .DIC(lb_wdata[23]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_768_831_21_23_n_0),
        .DOB(linebuf_reg_r2_768_831_21_23_n_1),
        .DOC(linebuf_reg_r2_768_831_21_23_n_2),
        .DOD(NLW_linebuf_reg_r2_768_831_21_23_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_768_831_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "768" *) 
  (* ram_addr_end = "831" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "24" *) 
  (* ram_slice_end = "26" *) 
  RAM64M linebuf_reg_r2_768_831_24_26
       (.ADDRA({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[24]),
        .DIB(lb_wdata[25]),
        .DIC(lb_wdata[26]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_768_831_24_26_n_0),
        .DOB(linebuf_reg_r2_768_831_24_26_n_1),
        .DOC(linebuf_reg_r2_768_831_24_26_n_2),
        .DOD(NLW_linebuf_reg_r2_768_831_24_26_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_768_831_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "768" *) 
  (* ram_addr_end = "831" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "27" *) 
  (* ram_slice_end = "29" *) 
  RAM64M linebuf_reg_r2_768_831_27_29
       (.ADDRA({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[27]),
        .DIB(lb_wdata[28]),
        .DIC(lb_wdata[29]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_768_831_27_29_n_0),
        .DOB(linebuf_reg_r2_768_831_27_29_n_1),
        .DOC(linebuf_reg_r2_768_831_27_29_n_2),
        .DOD(NLW_linebuf_reg_r2_768_831_27_29_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_768_831_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "768" *) 
  (* ram_addr_end = "831" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "30" *) 
  (* ram_slice_end = "31" *) 
  RAM64M linebuf_reg_r2_768_831_30_31
       (.ADDRA({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[30]),
        .DIB(lb_wdata[31]),
        .DIC(1'b0),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_768_831_30_31_n_0),
        .DOB(linebuf_reg_r2_768_831_30_31_n_1),
        .DOC(NLW_linebuf_reg_r2_768_831_30_31_DOC_UNCONNECTED),
        .DOD(NLW_linebuf_reg_r2_768_831_30_31_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_768_831_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "768" *) 
  (* ram_addr_end = "831" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "3" *) 
  (* ram_slice_end = "5" *) 
  RAM64M linebuf_reg_r2_768_831_3_5
       (.ADDRA({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRB({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRC({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[3]),
        .DIB(lb_wdata[4]),
        .DIC(lb_wdata[5]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_768_831_3_5_n_0),
        .DOB(linebuf_reg_r2_768_831_3_5_n_1),
        .DOC(linebuf_reg_r2_768_831_3_5_n_2),
        .DOD(NLW_linebuf_reg_r2_768_831_3_5_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_768_831_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "768" *) 
  (* ram_addr_end = "831" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "8" *) 
  RAM64M linebuf_reg_r2_768_831_6_8
       (.ADDRA({rd_addr_next0[5:4],linebuf_reg_r2_0_63_6_8_i_1_n_0,rd_addr_next0[2:0]}),
        .ADDRB({rd_addr_next0[5:4],linebuf_reg_r2_0_63_6_8_i_1_n_0,rd_addr_next0[2:0]}),
        .ADDRC({rd_addr_next0[5:4],linebuf_reg_r2_0_63_6_8_i_1_n_0,rd_addr_next0[2:0]}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[6]),
        .DIB(lb_wdata[7]),
        .DIC(lb_wdata[8]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_768_831_6_8_n_0),
        .DOB(linebuf_reg_r2_768_831_6_8_n_1),
        .DOC(linebuf_reg_r2_768_831_6_8_n_2),
        .DOD(NLW_linebuf_reg_r2_768_831_6_8_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_768_831_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "768" *) 
  (* ram_addr_end = "831" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "9" *) 
  (* ram_slice_end = "11" *) 
  RAM64M linebuf_reg_r2_768_831_9_11
       (.ADDRA({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[9]),
        .DIB(lb_wdata[10]),
        .DIC(lb_wdata[11]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_768_831_9_11_n_0),
        .DOB(linebuf_reg_r2_768_831_9_11_n_1),
        .DOC(linebuf_reg_r2_768_831_9_11_n_2),
        .DOD(NLW_linebuf_reg_r2_768_831_9_11_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_768_831_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "832" *) 
  (* ram_addr_end = "895" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "2" *) 
  RAM64M linebuf_reg_r2_832_895_0_2
       (.ADDRA({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRB({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRC({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[0]),
        .DIB(lb_wdata[1]),
        .DIC(lb_wdata[2]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_832_895_0_2_n_0),
        .DOB(linebuf_reg_r2_832_895_0_2_n_1),
        .DOC(linebuf_reg_r2_832_895_0_2_n_2),
        .DOD(NLW_linebuf_reg_r2_832_895_0_2_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_832_895_0_2_i_1_n_0));
  LUT5 #(
    .INIT(32'h40000000)) 
    linebuf_reg_r2_832_895_0_2_i_1
       (.I0(lb_waddr__0[7]),
        .I1(lb_waddr__0[8]),
        .I2(lb_waddr__0[6]),
        .I3(lb_we),
        .I4(lb_waddr__0[9]),
        .O(linebuf_reg_r2_832_895_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "832" *) 
  (* ram_addr_end = "895" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "12" *) 
  (* ram_slice_end = "14" *) 
  RAM64M linebuf_reg_r2_832_895_12_14
       (.ADDRA({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[12]),
        .DIB(lb_wdata[13]),
        .DIC(lb_wdata[14]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_832_895_12_14_n_0),
        .DOB(linebuf_reg_r2_832_895_12_14_n_1),
        .DOC(linebuf_reg_r2_832_895_12_14_n_2),
        .DOD(NLW_linebuf_reg_r2_832_895_12_14_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_832_895_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "832" *) 
  (* ram_addr_end = "895" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "15" *) 
  (* ram_slice_end = "17" *) 
  RAM64M linebuf_reg_r2_832_895_15_17
       (.ADDRA({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[15]),
        .DIB(lb_wdata[16]),
        .DIC(lb_wdata[17]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_832_895_15_17_n_0),
        .DOB(linebuf_reg_r2_832_895_15_17_n_1),
        .DOC(linebuf_reg_r2_832_895_15_17_n_2),
        .DOD(NLW_linebuf_reg_r2_832_895_15_17_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_832_895_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "832" *) 
  (* ram_addr_end = "895" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "18" *) 
  (* ram_slice_end = "20" *) 
  RAM64M linebuf_reg_r2_832_895_18_20
       (.ADDRA({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[18]),
        .DIB(lb_wdata[19]),
        .DIC(lb_wdata[20]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_832_895_18_20_n_0),
        .DOB(linebuf_reg_r2_832_895_18_20_n_1),
        .DOC(linebuf_reg_r2_832_895_18_20_n_2),
        .DOD(NLW_linebuf_reg_r2_832_895_18_20_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_832_895_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "832" *) 
  (* ram_addr_end = "895" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "21" *) 
  (* ram_slice_end = "23" *) 
  RAM64M linebuf_reg_r2_832_895_21_23
       (.ADDRA({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[21]),
        .DIB(lb_wdata[22]),
        .DIC(lb_wdata[23]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_832_895_21_23_n_0),
        .DOB(linebuf_reg_r2_832_895_21_23_n_1),
        .DOC(linebuf_reg_r2_832_895_21_23_n_2),
        .DOD(NLW_linebuf_reg_r2_832_895_21_23_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_832_895_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "832" *) 
  (* ram_addr_end = "895" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "24" *) 
  (* ram_slice_end = "26" *) 
  RAM64M linebuf_reg_r2_832_895_24_26
       (.ADDRA({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[24]),
        .DIB(lb_wdata[25]),
        .DIC(lb_wdata[26]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_832_895_24_26_n_0),
        .DOB(linebuf_reg_r2_832_895_24_26_n_1),
        .DOC(linebuf_reg_r2_832_895_24_26_n_2),
        .DOD(NLW_linebuf_reg_r2_832_895_24_26_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_832_895_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "832" *) 
  (* ram_addr_end = "895" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "27" *) 
  (* ram_slice_end = "29" *) 
  RAM64M linebuf_reg_r2_832_895_27_29
       (.ADDRA({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[27]),
        .DIB(lb_wdata[28]),
        .DIC(lb_wdata[29]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_832_895_27_29_n_0),
        .DOB(linebuf_reg_r2_832_895_27_29_n_1),
        .DOC(linebuf_reg_r2_832_895_27_29_n_2),
        .DOD(NLW_linebuf_reg_r2_832_895_27_29_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_832_895_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "832" *) 
  (* ram_addr_end = "895" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "30" *) 
  (* ram_slice_end = "31" *) 
  RAM64M linebuf_reg_r2_832_895_30_31
       (.ADDRA({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[30]),
        .DIB(lb_wdata[31]),
        .DIC(1'b0),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_832_895_30_31_n_0),
        .DOB(linebuf_reg_r2_832_895_30_31_n_1),
        .DOC(NLW_linebuf_reg_r2_832_895_30_31_DOC_UNCONNECTED),
        .DOD(NLW_linebuf_reg_r2_832_895_30_31_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_832_895_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "832" *) 
  (* ram_addr_end = "895" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "3" *) 
  (* ram_slice_end = "5" *) 
  RAM64M linebuf_reg_r2_832_895_3_5
       (.ADDRA({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRB({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRC({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[3]),
        .DIB(lb_wdata[4]),
        .DIC(lb_wdata[5]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_832_895_3_5_n_0),
        .DOB(linebuf_reg_r2_832_895_3_5_n_1),
        .DOC(linebuf_reg_r2_832_895_3_5_n_2),
        .DOD(NLW_linebuf_reg_r2_832_895_3_5_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_832_895_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "832" *) 
  (* ram_addr_end = "895" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "8" *) 
  RAM64M linebuf_reg_r2_832_895_6_8
       (.ADDRA({rd_addr_next0[5:4],linebuf_reg_r2_0_63_6_8_i_1_n_0,rd_addr_next0[2:0]}),
        .ADDRB({rd_addr_next0[5:4],linebuf_reg_r2_0_63_6_8_i_1_n_0,rd_addr_next0[2:0]}),
        .ADDRC({rd_addr_next0[5:4],linebuf_reg_r2_0_63_6_8_i_1_n_0,rd_addr_next0[2:0]}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[6]),
        .DIB(lb_wdata[7]),
        .DIC(lb_wdata[8]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_832_895_6_8_n_0),
        .DOB(linebuf_reg_r2_832_895_6_8_n_1),
        .DOC(linebuf_reg_r2_832_895_6_8_n_2),
        .DOD(NLW_linebuf_reg_r2_832_895_6_8_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_832_895_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "832" *) 
  (* ram_addr_end = "895" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "9" *) 
  (* ram_slice_end = "11" *) 
  RAM64M linebuf_reg_r2_832_895_9_11
       (.ADDRA({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[9]),
        .DIB(lb_wdata[10]),
        .DIC(lb_wdata[11]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_832_895_9_11_n_0),
        .DOB(linebuf_reg_r2_832_895_9_11_n_1),
        .DOC(linebuf_reg_r2_832_895_9_11_n_2),
        .DOD(NLW_linebuf_reg_r2_832_895_9_11_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_832_895_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "896" *) 
  (* ram_addr_end = "959" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "2" *) 
  RAM64M linebuf_reg_r2_896_959_0_2
       (.ADDRA({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRB({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRC({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[0]),
        .DIB(lb_wdata[1]),
        .DIC(lb_wdata[2]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_896_959_0_2_n_0),
        .DOB(linebuf_reg_r2_896_959_0_2_n_1),
        .DOC(linebuf_reg_r2_896_959_0_2_n_2),
        .DOD(NLW_linebuf_reg_r2_896_959_0_2_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_896_959_0_2_i_1_n_0));
  LUT5 #(
    .INIT(32'h40000000)) 
    linebuf_reg_r2_896_959_0_2_i_1
       (.I0(lb_waddr__0[6]),
        .I1(lb_waddr__0[8]),
        .I2(lb_waddr__0[7]),
        .I3(lb_we),
        .I4(lb_waddr__0[9]),
        .O(linebuf_reg_r2_896_959_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "896" *) 
  (* ram_addr_end = "959" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "12" *) 
  (* ram_slice_end = "14" *) 
  RAM64M linebuf_reg_r2_896_959_12_14
       (.ADDRA({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[12]),
        .DIB(lb_wdata[13]),
        .DIC(lb_wdata[14]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_896_959_12_14_n_0),
        .DOB(linebuf_reg_r2_896_959_12_14_n_1),
        .DOC(linebuf_reg_r2_896_959_12_14_n_2),
        .DOD(NLW_linebuf_reg_r2_896_959_12_14_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_896_959_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "896" *) 
  (* ram_addr_end = "959" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "15" *) 
  (* ram_slice_end = "17" *) 
  RAM64M linebuf_reg_r2_896_959_15_17
       (.ADDRA({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[15]),
        .DIB(lb_wdata[16]),
        .DIC(lb_wdata[17]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_896_959_15_17_n_0),
        .DOB(linebuf_reg_r2_896_959_15_17_n_1),
        .DOC(linebuf_reg_r2_896_959_15_17_n_2),
        .DOD(NLW_linebuf_reg_r2_896_959_15_17_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_896_959_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "896" *) 
  (* ram_addr_end = "959" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "18" *) 
  (* ram_slice_end = "20" *) 
  RAM64M linebuf_reg_r2_896_959_18_20
       (.ADDRA({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[18]),
        .DIB(lb_wdata[19]),
        .DIC(lb_wdata[20]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_896_959_18_20_n_0),
        .DOB(linebuf_reg_r2_896_959_18_20_n_1),
        .DOC(linebuf_reg_r2_896_959_18_20_n_2),
        .DOD(NLW_linebuf_reg_r2_896_959_18_20_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_896_959_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "896" *) 
  (* ram_addr_end = "959" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "21" *) 
  (* ram_slice_end = "23" *) 
  RAM64M linebuf_reg_r2_896_959_21_23
       (.ADDRA({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[21]),
        .DIB(lb_wdata[22]),
        .DIC(lb_wdata[23]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_896_959_21_23_n_0),
        .DOB(linebuf_reg_r2_896_959_21_23_n_1),
        .DOC(linebuf_reg_r2_896_959_21_23_n_2),
        .DOD(NLW_linebuf_reg_r2_896_959_21_23_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_896_959_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "896" *) 
  (* ram_addr_end = "959" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "24" *) 
  (* ram_slice_end = "26" *) 
  RAM64M linebuf_reg_r2_896_959_24_26
       (.ADDRA({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[24]),
        .DIB(lb_wdata[25]),
        .DIC(lb_wdata[26]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_896_959_24_26_n_0),
        .DOB(linebuf_reg_r2_896_959_24_26_n_1),
        .DOC(linebuf_reg_r2_896_959_24_26_n_2),
        .DOD(NLW_linebuf_reg_r2_896_959_24_26_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_896_959_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "896" *) 
  (* ram_addr_end = "959" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "27" *) 
  (* ram_slice_end = "29" *) 
  RAM64M linebuf_reg_r2_896_959_27_29
       (.ADDRA({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[27]),
        .DIB(lb_wdata[28]),
        .DIC(lb_wdata[29]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_896_959_27_29_n_0),
        .DOB(linebuf_reg_r2_896_959_27_29_n_1),
        .DOC(linebuf_reg_r2_896_959_27_29_n_2),
        .DOD(NLW_linebuf_reg_r2_896_959_27_29_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_896_959_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "896" *) 
  (* ram_addr_end = "959" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "30" *) 
  (* ram_slice_end = "31" *) 
  RAM64M linebuf_reg_r2_896_959_30_31
       (.ADDRA({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[30]),
        .DIB(lb_wdata[31]),
        .DIC(1'b0),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_896_959_30_31_n_0),
        .DOB(linebuf_reg_r2_896_959_30_31_n_1),
        .DOC(NLW_linebuf_reg_r2_896_959_30_31_DOC_UNCONNECTED),
        .DOD(NLW_linebuf_reg_r2_896_959_30_31_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_896_959_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "896" *) 
  (* ram_addr_end = "959" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "3" *) 
  (* ram_slice_end = "5" *) 
  RAM64M linebuf_reg_r2_896_959_3_5
       (.ADDRA({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRB({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRC({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[3]),
        .DIB(lb_wdata[4]),
        .DIC(lb_wdata[5]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_896_959_3_5_n_0),
        .DOB(linebuf_reg_r2_896_959_3_5_n_1),
        .DOC(linebuf_reg_r2_896_959_3_5_n_2),
        .DOD(NLW_linebuf_reg_r2_896_959_3_5_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_896_959_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "896" *) 
  (* ram_addr_end = "959" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "8" *) 
  RAM64M linebuf_reg_r2_896_959_6_8
       (.ADDRA({rd_addr_next0[5:4],linebuf_reg_r2_0_63_6_8_i_1_n_0,rd_addr_next0[2:0]}),
        .ADDRB({rd_addr_next0[5:4],linebuf_reg_r2_0_63_6_8_i_1_n_0,rd_addr_next0[2:0]}),
        .ADDRC({rd_addr_next0[5:4],linebuf_reg_r2_0_63_6_8_i_1_n_0,rd_addr_next0[2:0]}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[6]),
        .DIB(lb_wdata[7]),
        .DIC(lb_wdata[8]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_896_959_6_8_n_0),
        .DOB(linebuf_reg_r2_896_959_6_8_n_1),
        .DOC(linebuf_reg_r2_896_959_6_8_n_2),
        .DOD(NLW_linebuf_reg_r2_896_959_6_8_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_896_959_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "896" *) 
  (* ram_addr_end = "959" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "9" *) 
  (* ram_slice_end = "11" *) 
  RAM64M linebuf_reg_r2_896_959_9_11
       (.ADDRA({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[9]),
        .DIB(lb_wdata[10]),
        .DIC(lb_wdata[11]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_896_959_9_11_n_0),
        .DOB(linebuf_reg_r2_896_959_9_11_n_1),
        .DOC(linebuf_reg_r2_896_959_9_11_n_2),
        .DOD(NLW_linebuf_reg_r2_896_959_9_11_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_896_959_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "960" *) 
  (* ram_addr_end = "1023" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "2" *) 
  RAM64M linebuf_reg_r2_960_1023_0_2
       (.ADDRA({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRB({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRC({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[0]),
        .DIB(lb_wdata[1]),
        .DIC(lb_wdata[2]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_960_1023_0_2_n_0),
        .DOB(linebuf_reg_r2_960_1023_0_2_n_1),
        .DOC(linebuf_reg_r2_960_1023_0_2_n_2),
        .DOD(NLW_linebuf_reg_r2_960_1023_0_2_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_960_1023_0_2_i_1_n_0));
  LUT5 #(
    .INIT(32'h80000000)) 
    linebuf_reg_r2_960_1023_0_2_i_1
       (.I0(lb_we),
        .I1(lb_waddr__0[7]),
        .I2(lb_waddr__0[6]),
        .I3(lb_waddr__0[9]),
        .I4(lb_waddr__0[8]),
        .O(linebuf_reg_r2_960_1023_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "960" *) 
  (* ram_addr_end = "1023" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "12" *) 
  (* ram_slice_end = "14" *) 
  RAM64M linebuf_reg_r2_960_1023_12_14
       (.ADDRA({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[12]),
        .DIB(lb_wdata[13]),
        .DIC(lb_wdata[14]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_960_1023_12_14_n_0),
        .DOB(linebuf_reg_r2_960_1023_12_14_n_1),
        .DOC(linebuf_reg_r2_960_1023_12_14_n_2),
        .DOD(NLW_linebuf_reg_r2_960_1023_12_14_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_960_1023_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "960" *) 
  (* ram_addr_end = "1023" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "15" *) 
  (* ram_slice_end = "17" *) 
  RAM64M linebuf_reg_r2_960_1023_15_17
       (.ADDRA({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[15]),
        .DIB(lb_wdata[16]),
        .DIC(lb_wdata[17]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_960_1023_15_17_n_0),
        .DOB(linebuf_reg_r2_960_1023_15_17_n_1),
        .DOC(linebuf_reg_r2_960_1023_15_17_n_2),
        .DOD(NLW_linebuf_reg_r2_960_1023_15_17_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_960_1023_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "960" *) 
  (* ram_addr_end = "1023" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "18" *) 
  (* ram_slice_end = "20" *) 
  RAM64M linebuf_reg_r2_960_1023_18_20
       (.ADDRA({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[18]),
        .DIB(lb_wdata[19]),
        .DIC(lb_wdata[20]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_960_1023_18_20_n_0),
        .DOB(linebuf_reg_r2_960_1023_18_20_n_1),
        .DOC(linebuf_reg_r2_960_1023_18_20_n_2),
        .DOD(NLW_linebuf_reg_r2_960_1023_18_20_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_960_1023_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "960" *) 
  (* ram_addr_end = "1023" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "21" *) 
  (* ram_slice_end = "23" *) 
  RAM64M linebuf_reg_r2_960_1023_21_23
       (.ADDRA({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_15_17_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[21]),
        .DIB(lb_wdata[22]),
        .DIC(lb_wdata[23]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_960_1023_21_23_n_0),
        .DOB(linebuf_reg_r2_960_1023_21_23_n_1),
        .DOC(linebuf_reg_r2_960_1023_21_23_n_2),
        .DOD(NLW_linebuf_reg_r2_960_1023_21_23_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_960_1023_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "960" *) 
  (* ram_addr_end = "1023" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "24" *) 
  (* ram_slice_end = "26" *) 
  RAM64M linebuf_reg_r2_960_1023_24_26
       (.ADDRA({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_18_20_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_18_20_i_3_n_0,linebuf_reg_r2_0_63_18_20_i_4_n_0,linebuf_reg_r2_0_63_18_20_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[24]),
        .DIB(lb_wdata[25]),
        .DIC(lb_wdata[26]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_960_1023_24_26_n_0),
        .DOB(linebuf_reg_r2_960_1023_24_26_n_1),
        .DOC(linebuf_reg_r2_960_1023_24_26_n_2),
        .DOD(NLW_linebuf_reg_r2_960_1023_24_26_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_960_1023_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "960" *) 
  (* ram_addr_end = "1023" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "27" *) 
  (* ram_slice_end = "29" *) 
  RAM64M linebuf_reg_r2_960_1023_27_29
       (.ADDRA({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[27]),
        .DIB(lb_wdata[28]),
        .DIC(lb_wdata[29]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_960_1023_27_29_n_0),
        .DOB(linebuf_reg_r2_960_1023_27_29_n_1),
        .DOC(linebuf_reg_r2_960_1023_27_29_n_2),
        .DOD(NLW_linebuf_reg_r2_960_1023_27_29_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_960_1023_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "960" *) 
  (* ram_addr_end = "1023" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "30" *) 
  (* ram_slice_end = "31" *) 
  RAM64M linebuf_reg_r2_960_1023_30_31
       (.ADDRA({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_27_29_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_2_n_0,linebuf_reg_r2_0_63_24_26_i_1_n_0,linebuf_reg_r2_0_63_27_29_i_3_n_0,linebuf_reg_r2_0_63_27_29_i_4_n_0,linebuf_reg_r2_0_63_27_29_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[30]),
        .DIB(lb_wdata[31]),
        .DIC(1'b0),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_960_1023_30_31_n_0),
        .DOB(linebuf_reg_r2_960_1023_30_31_n_1),
        .DOC(NLW_linebuf_reg_r2_960_1023_30_31_DOC_UNCONNECTED),
        .DOD(NLW_linebuf_reg_r2_960_1023_30_31_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_960_1023_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "960" *) 
  (* ram_addr_end = "1023" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "3" *) 
  (* ram_slice_end = "5" *) 
  RAM64M linebuf_reg_r2_960_1023_3_5
       (.ADDRA({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRB({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRC({rd_addr_next0[5:4],linebuf_reg_r2_0_63_0_2_i_3_n_0,rd_addr_next0[2:0]}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[3]),
        .DIB(lb_wdata[4]),
        .DIC(lb_wdata[5]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_960_1023_3_5_n_0),
        .DOB(linebuf_reg_r2_960_1023_3_5_n_1),
        .DOC(linebuf_reg_r2_960_1023_3_5_n_2),
        .DOD(NLW_linebuf_reg_r2_960_1023_3_5_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_960_1023_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "960" *) 
  (* ram_addr_end = "1023" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "8" *) 
  RAM64M linebuf_reg_r2_960_1023_6_8
       (.ADDRA({rd_addr_next0[5:4],linebuf_reg_r2_0_63_6_8_i_1_n_0,rd_addr_next0[2:0]}),
        .ADDRB({rd_addr_next0[5:4],linebuf_reg_r2_0_63_6_8_i_1_n_0,rd_addr_next0[2:0]}),
        .ADDRC({rd_addr_next0[5:4],linebuf_reg_r2_0_63_6_8_i_1_n_0,rd_addr_next0[2:0]}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[6]),
        .DIB(lb_wdata[7]),
        .DIC(lb_wdata[8]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_960_1023_6_8_n_0),
        .DOB(linebuf_reg_r2_960_1023_6_8_n_1),
        .DOC(linebuf_reg_r2_960_1023_6_8_n_2),
        .DOD(NLW_linebuf_reg_r2_960_1023_6_8_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_960_1023_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "system_hdmi_0/inst/linebuf_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "960" *) 
  (* ram_addr_end = "1023" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "9" *) 
  (* ram_slice_end = "11" *) 
  RAM64M linebuf_reg_r2_960_1023_9_11
       (.ADDRA({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRB({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRC({linebuf_reg_r2_0_63_9_11_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_2_n_0,linebuf_reg_r2_0_63_6_8_i_1_n_0,linebuf_reg_r2_0_63_9_11_i_3_n_0,linebuf_reg_r2_0_63_9_11_i_4_n_0,linebuf_reg_r2_0_63_9_11_i_5_n_0}),
        .ADDRD(lb_waddr__0[5:0]),
        .DIA(lb_wdata[9]),
        .DIB(lb_wdata[10]),
        .DIC(lb_wdata[11]),
        .DID(1'b0),
        .DOA(linebuf_reg_r2_960_1023_9_11_n_0),
        .DOB(linebuf_reg_r2_960_1023_9_11_n_1),
        .DOC(linebuf_reg_r2_960_1023_9_11_n_2),
        .DOD(NLW_linebuf_reg_r2_960_1023_9_11_DOD_UNCONNECTED),
        .WCLK(aclk),
        .WE(linebuf_reg_r2_960_1023_0_2_i_1_n_0));
  FDRE mono_p1_reg
       (.C(pixel_clk),
        .CE(1'b1),
        .D(ctrl_mono),
        .Q(mono_p1),
        .R(1'b0));
  FDRE mono_p2_reg
       (.C(pixel_clk),
        .CE(1'b1),
        .D(mono_p1),
        .Q(mono_p2),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \pix_alive[0]_i_2 
       (.I0(\pix_alive_reg_n_0_[0] ),
        .O(\pix_alive[0]_i_2_n_0 ));
  FDRE \pix_alive_reg[0] 
       (.C(pixel_clk),
        .CE(1'b1),
        .D(\pix_alive_reg[0]_i_1_n_7 ),
        .Q(\pix_alive_reg_n_0_[0] ),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \pix_alive_reg[0]_i_1 
       (.CI(1'b0),
        .CO({\pix_alive_reg[0]_i_1_n_0 ,\pix_alive_reg[0]_i_1_n_1 ,\pix_alive_reg[0]_i_1_n_2 ,\pix_alive_reg[0]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\pix_alive_reg[0]_i_1_n_4 ,\pix_alive_reg[0]_i_1_n_5 ,\pix_alive_reg[0]_i_1_n_6 ,\pix_alive_reg[0]_i_1_n_7 }),
        .S({\pix_alive_reg_n_0_[3] ,\pix_alive_reg_n_0_[2] ,\pix_alive_reg_n_0_[1] ,\pix_alive[0]_i_2_n_0 }));
  FDRE \pix_alive_reg[10] 
       (.C(pixel_clk),
        .CE(1'b1),
        .D(\pix_alive_reg[8]_i_1_n_5 ),
        .Q(\pix_alive_reg_n_0_[10] ),
        .R(1'b0));
  FDRE \pix_alive_reg[11] 
       (.C(pixel_clk),
        .CE(1'b1),
        .D(\pix_alive_reg[8]_i_1_n_4 ),
        .Q(\pix_alive_reg_n_0_[11] ),
        .R(1'b0));
  FDRE \pix_alive_reg[12] 
       (.C(pixel_clk),
        .CE(1'b1),
        .D(\pix_alive_reg[12]_i_1_n_7 ),
        .Q(\pix_alive_reg_n_0_[12] ),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \pix_alive_reg[12]_i_1 
       (.CI(\pix_alive_reg[8]_i_1_n_0 ),
        .CO({\pix_alive_reg[12]_i_1_n_0 ,\pix_alive_reg[12]_i_1_n_1 ,\pix_alive_reg[12]_i_1_n_2 ,\pix_alive_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\pix_alive_reg[12]_i_1_n_4 ,\pix_alive_reg[12]_i_1_n_5 ,\pix_alive_reg[12]_i_1_n_6 ,\pix_alive_reg[12]_i_1_n_7 }),
        .S({\pix_alive_reg_n_0_[15] ,\pix_alive_reg_n_0_[14] ,\pix_alive_reg_n_0_[13] ,\pix_alive_reg_n_0_[12] }));
  FDRE \pix_alive_reg[13] 
       (.C(pixel_clk),
        .CE(1'b1),
        .D(\pix_alive_reg[12]_i_1_n_6 ),
        .Q(\pix_alive_reg_n_0_[13] ),
        .R(1'b0));
  FDRE \pix_alive_reg[14] 
       (.C(pixel_clk),
        .CE(1'b1),
        .D(\pix_alive_reg[12]_i_1_n_5 ),
        .Q(\pix_alive_reg_n_0_[14] ),
        .R(1'b0));
  FDRE \pix_alive_reg[15] 
       (.C(pixel_clk),
        .CE(1'b1),
        .D(\pix_alive_reg[12]_i_1_n_4 ),
        .Q(\pix_alive_reg_n_0_[15] ),
        .R(1'b0));
  FDRE \pix_alive_reg[16] 
       (.C(pixel_clk),
        .CE(1'b1),
        .D(\pix_alive_reg[16]_i_1_n_7 ),
        .Q(p_0_in[0]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \pix_alive_reg[16]_i_1 
       (.CI(\pix_alive_reg[12]_i_1_n_0 ),
        .CO({\pix_alive_reg[16]_i_1_n_0 ,\pix_alive_reg[16]_i_1_n_1 ,\pix_alive_reg[16]_i_1_n_2 ,\pix_alive_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\pix_alive_reg[16]_i_1_n_4 ,\pix_alive_reg[16]_i_1_n_5 ,\pix_alive_reg[16]_i_1_n_6 ,\pix_alive_reg[16]_i_1_n_7 }),
        .S(p_0_in[3:0]));
  FDRE \pix_alive_reg[17] 
       (.C(pixel_clk),
        .CE(1'b1),
        .D(\pix_alive_reg[16]_i_1_n_6 ),
        .Q(p_0_in[1]),
        .R(1'b0));
  FDRE \pix_alive_reg[18] 
       (.C(pixel_clk),
        .CE(1'b1),
        .D(\pix_alive_reg[16]_i_1_n_5 ),
        .Q(p_0_in[2]),
        .R(1'b0));
  FDRE \pix_alive_reg[19] 
       (.C(pixel_clk),
        .CE(1'b1),
        .D(\pix_alive_reg[16]_i_1_n_4 ),
        .Q(p_0_in[3]),
        .R(1'b0));
  FDRE \pix_alive_reg[1] 
       (.C(pixel_clk),
        .CE(1'b1),
        .D(\pix_alive_reg[0]_i_1_n_6 ),
        .Q(\pix_alive_reg_n_0_[1] ),
        .R(1'b0));
  FDRE \pix_alive_reg[20] 
       (.C(pixel_clk),
        .CE(1'b1),
        .D(\pix_alive_reg[20]_i_1_n_7 ),
        .Q(p_0_in[4]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \pix_alive_reg[20]_i_1 
       (.CI(\pix_alive_reg[16]_i_1_n_0 ),
        .CO({\NLW_pix_alive_reg[20]_i_1_CO_UNCONNECTED [3],\pix_alive_reg[20]_i_1_n_1 ,\pix_alive_reg[20]_i_1_n_2 ,\pix_alive_reg[20]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\pix_alive_reg[20]_i_1_n_4 ,\pix_alive_reg[20]_i_1_n_5 ,\pix_alive_reg[20]_i_1_n_6 ,\pix_alive_reg[20]_i_1_n_7 }),
        .S(p_0_in[7:4]));
  FDRE \pix_alive_reg[21] 
       (.C(pixel_clk),
        .CE(1'b1),
        .D(\pix_alive_reg[20]_i_1_n_6 ),
        .Q(p_0_in[5]),
        .R(1'b0));
  FDRE \pix_alive_reg[22] 
       (.C(pixel_clk),
        .CE(1'b1),
        .D(\pix_alive_reg[20]_i_1_n_5 ),
        .Q(p_0_in[6]),
        .R(1'b0));
  FDRE \pix_alive_reg[23] 
       (.C(pixel_clk),
        .CE(1'b1),
        .D(\pix_alive_reg[20]_i_1_n_4 ),
        .Q(p_0_in[7]),
        .R(1'b0));
  FDRE \pix_alive_reg[2] 
       (.C(pixel_clk),
        .CE(1'b1),
        .D(\pix_alive_reg[0]_i_1_n_5 ),
        .Q(\pix_alive_reg_n_0_[2] ),
        .R(1'b0));
  FDRE \pix_alive_reg[3] 
       (.C(pixel_clk),
        .CE(1'b1),
        .D(\pix_alive_reg[0]_i_1_n_4 ),
        .Q(\pix_alive_reg_n_0_[3] ),
        .R(1'b0));
  FDRE \pix_alive_reg[4] 
       (.C(pixel_clk),
        .CE(1'b1),
        .D(\pix_alive_reg[4]_i_1_n_7 ),
        .Q(\pix_alive_reg_n_0_[4] ),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \pix_alive_reg[4]_i_1 
       (.CI(\pix_alive_reg[0]_i_1_n_0 ),
        .CO({\pix_alive_reg[4]_i_1_n_0 ,\pix_alive_reg[4]_i_1_n_1 ,\pix_alive_reg[4]_i_1_n_2 ,\pix_alive_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\pix_alive_reg[4]_i_1_n_4 ,\pix_alive_reg[4]_i_1_n_5 ,\pix_alive_reg[4]_i_1_n_6 ,\pix_alive_reg[4]_i_1_n_7 }),
        .S({\pix_alive_reg_n_0_[7] ,\pix_alive_reg_n_0_[6] ,\pix_alive_reg_n_0_[5] ,\pix_alive_reg_n_0_[4] }));
  FDRE \pix_alive_reg[5] 
       (.C(pixel_clk),
        .CE(1'b1),
        .D(\pix_alive_reg[4]_i_1_n_6 ),
        .Q(\pix_alive_reg_n_0_[5] ),
        .R(1'b0));
  FDRE \pix_alive_reg[6] 
       (.C(pixel_clk),
        .CE(1'b1),
        .D(\pix_alive_reg[4]_i_1_n_5 ),
        .Q(\pix_alive_reg_n_0_[6] ),
        .R(1'b0));
  FDRE \pix_alive_reg[7] 
       (.C(pixel_clk),
        .CE(1'b1),
        .D(\pix_alive_reg[4]_i_1_n_4 ),
        .Q(\pix_alive_reg_n_0_[7] ),
        .R(1'b0));
  FDRE \pix_alive_reg[8] 
       (.C(pixel_clk),
        .CE(1'b1),
        .D(\pix_alive_reg[8]_i_1_n_7 ),
        .Q(\pix_alive_reg_n_0_[8] ),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \pix_alive_reg[8]_i_1 
       (.CI(\pix_alive_reg[4]_i_1_n_0 ),
        .CO({\pix_alive_reg[8]_i_1_n_0 ,\pix_alive_reg[8]_i_1_n_1 ,\pix_alive_reg[8]_i_1_n_2 ,\pix_alive_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\pix_alive_reg[8]_i_1_n_4 ,\pix_alive_reg[8]_i_1_n_5 ,\pix_alive_reg[8]_i_1_n_6 ,\pix_alive_reg[8]_i_1_n_7 }),
        .S({\pix_alive_reg_n_0_[11] ,\pix_alive_reg_n_0_[10] ,\pix_alive_reg_n_0_[9] ,\pix_alive_reg_n_0_[8] }));
  FDRE \pix_alive_reg[9] 
       (.C(pixel_clk),
        .CE(1'b1),
        .D(\pix_alive_reg[8]_i_1_n_6 ),
        .Q(\pix_alive_reg_n_0_[9] ),
        .R(1'b0));
  FDRE \pix_alive_s1_reg[0] 
       (.C(aclk),
        .CE(aresetn),
        .D(p_0_in[0]),
        .Q(pix_alive_s1[0]),
        .R(1'b0));
  FDRE \pix_alive_s1_reg[1] 
       (.C(aclk),
        .CE(aresetn),
        .D(p_0_in[1]),
        .Q(pix_alive_s1[1]),
        .R(1'b0));
  FDRE \pix_alive_s1_reg[2] 
       (.C(aclk),
        .CE(aresetn),
        .D(p_0_in[2]),
        .Q(pix_alive_s1[2]),
        .R(1'b0));
  FDRE \pix_alive_s1_reg[3] 
       (.C(aclk),
        .CE(aresetn),
        .D(p_0_in[3]),
        .Q(pix_alive_s1[3]),
        .R(1'b0));
  FDRE \pix_alive_s1_reg[4] 
       (.C(aclk),
        .CE(aresetn),
        .D(p_0_in[4]),
        .Q(pix_alive_s1[4]),
        .R(1'b0));
  FDRE \pix_alive_s1_reg[5] 
       (.C(aclk),
        .CE(aresetn),
        .D(p_0_in[5]),
        .Q(pix_alive_s1[5]),
        .R(1'b0));
  FDRE \pix_alive_s1_reg[6] 
       (.C(aclk),
        .CE(aresetn),
        .D(p_0_in[6]),
        .Q(pix_alive_s1[6]),
        .R(1'b0));
  FDRE \pix_alive_s1_reg[7] 
       (.C(aclk),
        .CE(aresetn),
        .D(p_0_in[7]),
        .Q(pix_alive_s1[7]),
        .R(1'b0));
  FDRE \pix_alive_s2_reg[0] 
       (.C(aclk),
        .CE(aresetn),
        .D(pix_alive_s1[0]),
        .Q(data2[16]),
        .R(1'b0));
  FDRE \pix_alive_s2_reg[1] 
       (.C(aclk),
        .CE(aresetn),
        .D(pix_alive_s1[1]),
        .Q(data2[17]),
        .R(1'b0));
  FDRE \pix_alive_s2_reg[2] 
       (.C(aclk),
        .CE(aresetn),
        .D(pix_alive_s1[2]),
        .Q(data2[18]),
        .R(1'b0));
  FDRE \pix_alive_s2_reg[3] 
       (.C(aclk),
        .CE(aresetn),
        .D(pix_alive_s1[3]),
        .Q(data2[19]),
        .R(1'b0));
  FDRE \pix_alive_s2_reg[4] 
       (.C(aclk),
        .CE(aresetn),
        .D(pix_alive_s1[4]),
        .Q(data2[20]),
        .R(1'b0));
  FDRE \pix_alive_s2_reg[5] 
       (.C(aclk),
        .CE(aresetn),
        .D(pix_alive_s1[5]),
        .Q(data2[21]),
        .R(1'b0));
  FDRE \pix_alive_s2_reg[6] 
       (.C(aclk),
        .CE(aresetn),
        .D(pix_alive_s1[6]),
        .Q(data2[22]),
        .R(1'b0));
  FDRE \pix_alive_s2_reg[7] 
       (.C(aclk),
        .CE(aresetn),
        .D(pix_alive_s1[7]),
        .Q(data2[23]),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hFFFFBAAA)) 
    \rdata_q[0]_i_1 
       (.I0(\rdata_q[31]_i_4_n_0 ),
        .I1(araddr_q[2]),
        .I2(araddr_q[3]),
        .I3(data2[0]),
        .I4(\rdata_q[0]_i_2_n_0 ),
        .O(\rdata_q[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT5 #(
    .INIT(32'hAA00F0CC)) 
    \rdata_q[0]_i_2 
       (.I0(i2c_sda_low),
        .I1(p_3_in[0]),
        .I2(fb_base[0]),
        .I3(araddr_q[2]),
        .I4(araddr_q[3]),
        .O(\rdata_q[0]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hAAEEFAAA)) 
    \rdata_q[10]_i_1 
       (.I0(\rdata_q[31]_i_4_n_0 ),
        .I1(fb_base[10]),
        .I2(data2[10]),
        .I3(araddr_q[3]),
        .I4(araddr_q[2]),
        .O(\rdata_q[10]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAAEEFAAA)) 
    \rdata_q[11]_i_1 
       (.I0(\rdata_q[31]_i_4_n_0 ),
        .I1(fb_base[11]),
        .I2(data2[11]),
        .I3(araddr_q[3]),
        .I4(araddr_q[2]),
        .O(\rdata_q[11]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAAEEFAAA)) 
    \rdata_q[12]_i_1 
       (.I0(\rdata_q[31]_i_4_n_0 ),
        .I1(fb_base[12]),
        .I2(data2[12]),
        .I3(araddr_q[3]),
        .I4(araddr_q[2]),
        .O(\rdata_q[12]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAAEEFAAA)) 
    \rdata_q[13]_i_1 
       (.I0(\rdata_q[31]_i_4_n_0 ),
        .I1(fb_base[13]),
        .I2(data2[13]),
        .I3(araddr_q[3]),
        .I4(araddr_q[2]),
        .O(\rdata_q[13]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00000CA0)) 
    \rdata_q[14]_i_1 
       (.I0(data2[14]),
        .I1(fb_base[14]),
        .I2(araddr_q[3]),
        .I3(araddr_q[2]),
        .I4(\rdata_q[31]_i_4_n_0 ),
        .O(\rdata_q[14]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAAEEFAAA)) 
    \rdata_q[15]_i_1 
       (.I0(\rdata_q[31]_i_4_n_0 ),
        .I1(fb_base[15]),
        .I2(data2[15]),
        .I3(araddr_q[3]),
        .I4(araddr_q[2]),
        .O(\rdata_q[15]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAAEEFAAA)) 
    \rdata_q[16]_i_1 
       (.I0(\rdata_q[31]_i_4_n_0 ),
        .I1(fb_base[16]),
        .I2(data2[16]),
        .I3(araddr_q[3]),
        .I4(araddr_q[2]),
        .O(\rdata_q[16]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00000CA0)) 
    \rdata_q[17]_i_1 
       (.I0(data2[17]),
        .I1(fb_base[17]),
        .I2(araddr_q[3]),
        .I3(araddr_q[2]),
        .I4(\rdata_q[31]_i_4_n_0 ),
        .O(\rdata_q[17]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAAEEFAAA)) 
    \rdata_q[18]_i_1 
       (.I0(\rdata_q[31]_i_4_n_0 ),
        .I1(fb_base[18]),
        .I2(data2[18]),
        .I3(araddr_q[3]),
        .I4(araddr_q[2]),
        .O(\rdata_q[18]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAAEEFAAA)) 
    \rdata_q[19]_i_1 
       (.I0(\rdata_q[31]_i_4_n_0 ),
        .I1(fb_base[19]),
        .I2(data2[19]),
        .I3(araddr_q[3]),
        .I4(araddr_q[2]),
        .O(\rdata_q[19]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFD9C85140)) 
    \rdata_q[1]_i_1 
       (.I0(araddr_q[3]),
        .I1(araddr_q[2]),
        .I2(fb_base[1]),
        .I3(ctrl_yc_swap),
        .I4(i2c_scl_low),
        .I5(\rdata_q[31]_i_4_n_0 ),
        .O(\rdata_q[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00000CA0)) 
    \rdata_q[20]_i_1 
       (.I0(data2[20]),
        .I1(fb_base[20]),
        .I2(araddr_q[3]),
        .I3(araddr_q[2]),
        .I4(\rdata_q[31]_i_4_n_0 ),
        .O(\rdata_q[20]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAAEEFAAA)) 
    \rdata_q[21]_i_1 
       (.I0(\rdata_q[31]_i_4_n_0 ),
        .I1(fb_base[21]),
        .I2(data2[21]),
        .I3(araddr_q[3]),
        .I4(araddr_q[2]),
        .O(\rdata_q[21]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00000CA0)) 
    \rdata_q[22]_i_1 
       (.I0(data2[22]),
        .I1(fb_base[22]),
        .I2(araddr_q[3]),
        .I3(araddr_q[2]),
        .I4(\rdata_q[31]_i_4_n_0 ),
        .O(\rdata_q[22]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAAEEFAAA)) 
    \rdata_q[23]_i_1 
       (.I0(\rdata_q[31]_i_4_n_0 ),
        .I1(fb_base[23]),
        .I2(data2[23]),
        .I3(araddr_q[3]),
        .I4(araddr_q[2]),
        .O(\rdata_q[23]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT4 #(
    .INIT(16'h0400)) 
    \rdata_q[24]_i_1 
       (.I0(\rdata_q[31]_i_4_n_0 ),
        .I1(araddr_q[2]),
        .I2(araddr_q[3]),
        .I3(fb_base[24]),
        .O(\rdata_q[24]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT4 #(
    .INIT(16'hFF08)) 
    \rdata_q[25]_i_1 
       (.I0(fb_base[25]),
        .I1(araddr_q[2]),
        .I2(araddr_q[3]),
        .I3(\rdata_q[31]_i_4_n_0 ),
        .O(\rdata_q[25]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT4 #(
    .INIT(16'hFF08)) 
    \rdata_q[26]_i_1 
       (.I0(fb_base[26]),
        .I1(araddr_q[2]),
        .I2(araddr_q[3]),
        .I3(\rdata_q[31]_i_4_n_0 ),
        .O(\rdata_q[26]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT4 #(
    .INIT(16'hFF08)) 
    \rdata_q[27]_i_1 
       (.I0(fb_base[27]),
        .I1(araddr_q[2]),
        .I2(araddr_q[3]),
        .I3(\rdata_q[31]_i_4_n_0 ),
        .O(\rdata_q[27]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT4 #(
    .INIT(16'hFF08)) 
    \rdata_q[28]_i_1 
       (.I0(fb_base[28]),
        .I1(araddr_q[2]),
        .I2(araddr_q[3]),
        .I3(\rdata_q[31]_i_4_n_0 ),
        .O(\rdata_q[28]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT4 #(
    .INIT(16'h0400)) 
    \rdata_q[29]_i_1 
       (.I0(\rdata_q[31]_i_4_n_0 ),
        .I1(araddr_q[2]),
        .I2(araddr_q[3]),
        .I3(fb_base[29]),
        .O(\rdata_q[29]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAFAEE)) 
    \rdata_q[2]_i_1 
       (.I0(\rdata_q[31]_i_4_n_0 ),
        .I1(ctrl_cbcr_swap),
        .I2(fb_base[2]),
        .I3(araddr_q[2]),
        .I4(araddr_q[3]),
        .O(\rdata_q[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT4 #(
    .INIT(16'hFF08)) 
    \rdata_q[30]_i_1 
       (.I0(fb_base[30]),
        .I1(araddr_q[2]),
        .I2(araddr_q[3]),
        .I3(\rdata_q[31]_i_4_n_0 ),
        .O(\rdata_q[30]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \rdata_q[31]_i_1 
       (.I0(aresetn),
        .O(\rdata_q[31]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \rdata_q[31]_i_2 
       (.I0(ar_done_reg_n_0),
        .I1(rvalid_q_reg_0),
        .O(rvalid_q0));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT4 #(
    .INIT(16'hFF08)) 
    \rdata_q[31]_i_3 
       (.I0(fb_base[31]),
        .I1(araddr_q[2]),
        .I2(araddr_q[3]),
        .I3(\rdata_q[31]_i_4_n_0 ),
        .O(\rdata_q[31]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \rdata_q[31]_i_4 
       (.I0(araddr_q[6]),
        .I1(araddr_q[7]),
        .I2(araddr_q[4]),
        .I3(araddr_q[5]),
        .I4(araddr_q[1]),
        .I5(araddr_q[0]),
        .O(\rdata_q[31]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAFAEE)) 
    \rdata_q[3]_i_1 
       (.I0(\rdata_q[31]_i_4_n_0 ),
        .I1(p_3_in[3]),
        .I2(fb_base[3]),
        .I3(araddr_q[2]),
        .I4(araddr_q[3]),
        .O(\rdata_q[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT4 #(
    .INIT(16'h0400)) 
    \rdata_q[4]_i_1 
       (.I0(\rdata_q[31]_i_4_n_0 ),
        .I1(araddr_q[2]),
        .I2(araddr_q[3]),
        .I3(fb_base[4]),
        .O(\rdata_q[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT4 #(
    .INIT(16'hFF08)) 
    \rdata_q[5]_i_1 
       (.I0(fb_base[5]),
        .I1(araddr_q[2]),
        .I2(araddr_q[3]),
        .I3(\rdata_q[31]_i_4_n_0 ),
        .O(\rdata_q[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT4 #(
    .INIT(16'hFF08)) 
    \rdata_q[6]_i_1 
       (.I0(fb_base[6]),
        .I1(araddr_q[2]),
        .I2(araddr_q[3]),
        .I3(\rdata_q[31]_i_4_n_0 ),
        .O(\rdata_q[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT4 #(
    .INIT(16'hFF08)) 
    \rdata_q[7]_i_1 
       (.I0(fb_base[7]),
        .I1(araddr_q[2]),
        .I2(araddr_q[3]),
        .I3(\rdata_q[31]_i_4_n_0 ),
        .O(\rdata_q[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000CAF00000CA00)) 
    \rdata_q[8]_i_1 
       (.I0(data2[8]),
        .I1(sda_in),
        .I2(araddr_q[2]),
        .I3(araddr_q[3]),
        .I4(\rdata_q[31]_i_4_n_0 ),
        .I5(fb_base[8]),
        .O(\rdata_q[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFEAC86240)) 
    \rdata_q[9]_i_1 
       (.I0(araddr_q[2]),
        .I1(araddr_q[3]),
        .I2(data2[9]),
        .I3(fb_base[9]),
        .I4(scl_in),
        .I5(\rdata_q[31]_i_4_n_0 ),
        .O(\rdata_q[9]_i_1_n_0 ));
  FDRE \rdata_q_reg[0] 
       (.C(aclk),
        .CE(rvalid_q0),
        .D(\rdata_q[0]_i_1_n_0 ),
        .Q(s_axi_lite_rdata[0]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \rdata_q_reg[10] 
       (.C(aclk),
        .CE(rvalid_q0),
        .D(\rdata_q[10]_i_1_n_0 ),
        .Q(s_axi_lite_rdata[10]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \rdata_q_reg[11] 
       (.C(aclk),
        .CE(rvalid_q0),
        .D(\rdata_q[11]_i_1_n_0 ),
        .Q(s_axi_lite_rdata[11]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \rdata_q_reg[12] 
       (.C(aclk),
        .CE(rvalid_q0),
        .D(\rdata_q[12]_i_1_n_0 ),
        .Q(s_axi_lite_rdata[12]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \rdata_q_reg[13] 
       (.C(aclk),
        .CE(rvalid_q0),
        .D(\rdata_q[13]_i_1_n_0 ),
        .Q(s_axi_lite_rdata[13]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \rdata_q_reg[14] 
       (.C(aclk),
        .CE(rvalid_q0),
        .D(\rdata_q[14]_i_1_n_0 ),
        .Q(s_axi_lite_rdata[14]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \rdata_q_reg[15] 
       (.C(aclk),
        .CE(rvalid_q0),
        .D(\rdata_q[15]_i_1_n_0 ),
        .Q(s_axi_lite_rdata[15]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \rdata_q_reg[16] 
       (.C(aclk),
        .CE(rvalid_q0),
        .D(\rdata_q[16]_i_1_n_0 ),
        .Q(s_axi_lite_rdata[16]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \rdata_q_reg[17] 
       (.C(aclk),
        .CE(rvalid_q0),
        .D(\rdata_q[17]_i_1_n_0 ),
        .Q(s_axi_lite_rdata[17]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \rdata_q_reg[18] 
       (.C(aclk),
        .CE(rvalid_q0),
        .D(\rdata_q[18]_i_1_n_0 ),
        .Q(s_axi_lite_rdata[18]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \rdata_q_reg[19] 
       (.C(aclk),
        .CE(rvalid_q0),
        .D(\rdata_q[19]_i_1_n_0 ),
        .Q(s_axi_lite_rdata[19]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \rdata_q_reg[1] 
       (.C(aclk),
        .CE(rvalid_q0),
        .D(\rdata_q[1]_i_1_n_0 ),
        .Q(s_axi_lite_rdata[1]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \rdata_q_reg[20] 
       (.C(aclk),
        .CE(rvalid_q0),
        .D(\rdata_q[20]_i_1_n_0 ),
        .Q(s_axi_lite_rdata[20]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \rdata_q_reg[21] 
       (.C(aclk),
        .CE(rvalid_q0),
        .D(\rdata_q[21]_i_1_n_0 ),
        .Q(s_axi_lite_rdata[21]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \rdata_q_reg[22] 
       (.C(aclk),
        .CE(rvalid_q0),
        .D(\rdata_q[22]_i_1_n_0 ),
        .Q(s_axi_lite_rdata[22]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \rdata_q_reg[23] 
       (.C(aclk),
        .CE(rvalid_q0),
        .D(\rdata_q[23]_i_1_n_0 ),
        .Q(s_axi_lite_rdata[23]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \rdata_q_reg[24] 
       (.C(aclk),
        .CE(rvalid_q0),
        .D(\rdata_q[24]_i_1_n_0 ),
        .Q(s_axi_lite_rdata[24]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \rdata_q_reg[25] 
       (.C(aclk),
        .CE(rvalid_q0),
        .D(\rdata_q[25]_i_1_n_0 ),
        .Q(s_axi_lite_rdata[25]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \rdata_q_reg[26] 
       (.C(aclk),
        .CE(rvalid_q0),
        .D(\rdata_q[26]_i_1_n_0 ),
        .Q(s_axi_lite_rdata[26]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \rdata_q_reg[27] 
       (.C(aclk),
        .CE(rvalid_q0),
        .D(\rdata_q[27]_i_1_n_0 ),
        .Q(s_axi_lite_rdata[27]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \rdata_q_reg[28] 
       (.C(aclk),
        .CE(rvalid_q0),
        .D(\rdata_q[28]_i_1_n_0 ),
        .Q(s_axi_lite_rdata[28]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \rdata_q_reg[29] 
       (.C(aclk),
        .CE(rvalid_q0),
        .D(\rdata_q[29]_i_1_n_0 ),
        .Q(s_axi_lite_rdata[29]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \rdata_q_reg[2] 
       (.C(aclk),
        .CE(rvalid_q0),
        .D(\rdata_q[2]_i_1_n_0 ),
        .Q(s_axi_lite_rdata[2]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \rdata_q_reg[30] 
       (.C(aclk),
        .CE(rvalid_q0),
        .D(\rdata_q[30]_i_1_n_0 ),
        .Q(s_axi_lite_rdata[30]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \rdata_q_reg[31] 
       (.C(aclk),
        .CE(rvalid_q0),
        .D(\rdata_q[31]_i_3_n_0 ),
        .Q(s_axi_lite_rdata[31]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \rdata_q_reg[3] 
       (.C(aclk),
        .CE(rvalid_q0),
        .D(\rdata_q[3]_i_1_n_0 ),
        .Q(s_axi_lite_rdata[3]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \rdata_q_reg[4] 
       (.C(aclk),
        .CE(rvalid_q0),
        .D(\rdata_q[4]_i_1_n_0 ),
        .Q(s_axi_lite_rdata[4]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \rdata_q_reg[5] 
       (.C(aclk),
        .CE(rvalid_q0),
        .D(\rdata_q[5]_i_1_n_0 ),
        .Q(s_axi_lite_rdata[5]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \rdata_q_reg[6] 
       (.C(aclk),
        .CE(rvalid_q0),
        .D(\rdata_q[6]_i_1_n_0 ),
        .Q(s_axi_lite_rdata[6]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \rdata_q_reg[7] 
       (.C(aclk),
        .CE(rvalid_q0),
        .D(\rdata_q[7]_i_1_n_0 ),
        .Q(s_axi_lite_rdata[7]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \rdata_q_reg[8] 
       (.C(aclk),
        .CE(rvalid_q0),
        .D(\rdata_q[8]_i_1_n_0 ),
        .Q(s_axi_lite_rdata[8]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \rdata_q_reg[9] 
       (.C(aclk),
        .CE(rvalid_q0),
        .D(\rdata_q[9]_i_1_n_0 ),
        .Q(s_axi_lite_rdata[9]),
        .R(\rdata_q[31]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h08C8)) 
    rvalid_q_i_1
       (.I0(ar_done_reg_n_0),
        .I1(aresetn),
        .I2(rvalid_q_reg_0),
        .I3(s_axi_lite_rready),
        .O(rvalid_q_i_1_n_0));
  FDRE rvalid_q_reg
       (.C(aclk),
        .CE(1'b1),
        .D(rvalid_q_i_1_n_0),
        .Q(rvalid_q_reg_0),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFFFF7FFFFFF0000)) 
    st_overrun_i_1
       (.I0(st_overrun_i_2_n_0),
        .I1(aw_done_reg_n_0),
        .I2(bvalid_q_reg_0),
        .I3(w_done_reg_n_0),
        .I4(fetch_overrun_set),
        .I5(data2[0]),
        .O(st_overrun_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000000010000)) 
    st_overrun_i_2
       (.I0(\awaddr_q_reg_n_0_[0] ),
        .I1(\awaddr_q_reg_n_0_[3] ),
        .I2(\awaddr_q_reg_n_0_[1] ),
        .I3(\awaddr_q_reg_n_0_[2] ),
        .I4(\wdata_q_reg_n_0_[4] ),
        .I5(ctrl_enable_i_3_n_0),
        .O(st_overrun_i_2_n_0));
  FDRE st_overrun_reg
       (.C(aclk),
        .CE(1'b1),
        .D(st_overrun_i_1_n_0),
        .Q(data2[0]),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE t_s1_reg
       (.C(aclk),
        .CE(1'b1),
        .D(line_req_tgl),
        .Q(t_s1),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE t_s2_reg
       (.C(aclk),
        .CE(1'b1),
        .D(t_s1),
        .Q(t_s2),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE t_s3_reg
       (.C(aclk),
        .CE(1'b1),
        .D(t_s2),
        .Q(t_s3),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE tp_p1_reg
       (.C(pixel_clk),
        .CE(1'b1),
        .D(p_3_in[3]),
        .Q(tp_p1),
        .R(1'b0));
  FDRE tp_p2_reg
       (.C(pixel_clk),
        .CE(1'b1),
        .D(tp_p1),
        .Q(tp_p2),
        .R(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "MLO" *) 
  (* __SRVAL = "TRUE" *) 
  ODDR #(
    .DDR_CLK_EDGE("SAME_EDGE"),
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D1_INVERTED(1'b0),
    .IS_D2_INVERTED(1'b0),
    .SRTYPE("SYNC")) 
    u_clk_fwd
       (.C(pixel_clk),
        .CE(1'b1),
        .D1(1'b0),
        .D2(1'b1),
        .Q(hdmi_clk),
        .R(NLW_u_clk_fwd_R_UNCONNECTED),
        .S(NLW_u_clk_fwd_S_UNCONNECTED));
  (* BOX_TYPE = "PRIMITIVE" *) 
  IOBUF #(
    .IOSTANDARD("DEFAULT")) 
    u_iobuf_scl
       (.I(1'b0),
        .IO(hdmi_scl),
        .O(scl_in),
        .T(T0));
  LUT1 #(
    .INIT(2'h1)) 
    u_iobuf_scl_i_1
       (.I0(i2c_scl_low),
        .O(T0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  IOBUF #(
    .IOSTANDARD("DEFAULT")) 
    u_iobuf_sda
       (.I(1'b0),
        .IO(hdmi_sda),
        .O(sda_in),
        .T(u_iobuf_sda_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT1 #(
    .INIT(2'h1)) 
    u_iobuf_sda_i_1
       (.I0(i2c_sda_low),
        .O(u_iobuf_sda_i_1_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    \vcnt[0]_i_1 
       (.I0(\vcnt[9]_i_5_n_0 ),
        .I1(rd_addr_next),
        .O(vcnt__0[0]));
  LUT2 #(
    .INIT(4'h6)) 
    \vcnt[1]_i_1 
       (.I0(\vcnt_reg_n_0_[1] ),
        .I1(rd_addr_next),
        .O(vcnt__0[1]));
  LUT4 #(
    .INIT(16'hB4E4)) 
    \vcnt[2]_i_1 
       (.I0(\vcnt[3]_i_2_n_0 ),
        .I1(\vcnt_reg_n_0_[2] ),
        .I2(rd_addr_next),
        .I3(\vcnt_reg_n_0_[1] ),
        .O(vcnt__0[2]));
  LUT5 #(
    .INIT(32'hBEEE4444)) 
    \vcnt[3]_i_1 
       (.I0(\vcnt[3]_i_2_n_0 ),
        .I1(\vcnt_reg_n_0_[3] ),
        .I2(\vcnt_reg_n_0_[2] ),
        .I3(\vcnt_reg_n_0_[1] ),
        .I4(rd_addr_next),
        .O(vcnt__0[3]));
  LUT6 #(
    .INIT(64'h0000000000010000)) 
    \vcnt[3]_i_2 
       (.I0(\vcnt_reg_n_0_[6] ),
        .I1(\vcnt[9]_i_7_n_0 ),
        .I2(\vcnt_reg_n_0_[7] ),
        .I3(\vcnt_reg_n_0_[8] ),
        .I4(\vcnt_reg_n_0_[9] ),
        .I5(\vcnt[9]_i_8_n_0 ),
        .O(\vcnt[3]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \vcnt[4]_i_1 
       (.I0(\vcnt_reg_n_0_[4] ),
        .I1(\vcnt_reg_n_0_[2] ),
        .I2(\vcnt_reg_n_0_[1] ),
        .I3(rd_addr_next),
        .I4(\vcnt_reg_n_0_[3] ),
        .O(vcnt__0[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \vcnt[5]_i_1 
       (.I0(\vcnt_reg_n_0_[4] ),
        .I1(\vcnt_reg_n_0_[3] ),
        .I2(rd_addr_next),
        .I3(\vcnt_reg_n_0_[1] ),
        .I4(\vcnt_reg_n_0_[2] ),
        .I5(\vcnt_reg_n_0_[5] ),
        .O(vcnt__0[5]));
  LUT3 #(
    .INIT(8'h78)) 
    \vcnt[6]_i_1 
       (.I0(\vcnt_reg_n_0_[5] ),
        .I1(\vcnt[8]_i_2_n_0 ),
        .I2(\vcnt_reg_n_0_[6] ),
        .O(vcnt__0[6]));
  LUT4 #(
    .INIT(16'h7F80)) 
    \vcnt[7]_i_1 
       (.I0(\vcnt_reg_n_0_[6] ),
        .I1(\vcnt[8]_i_2_n_0 ),
        .I2(\vcnt_reg_n_0_[5] ),
        .I3(\vcnt_reg_n_0_[7] ),
        .O(vcnt__0[7]));
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \vcnt[8]_i_1 
       (.I0(\vcnt_reg_n_0_[8] ),
        .I1(\vcnt_reg_n_0_[7] ),
        .I2(\vcnt_reg_n_0_[6] ),
        .I3(\vcnt[8]_i_2_n_0 ),
        .I4(\vcnt_reg_n_0_[5] ),
        .O(vcnt__0[8]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \vcnt[8]_i_2 
       (.I0(\vcnt_reg_n_0_[4] ),
        .I1(\vcnt_reg_n_0_[3] ),
        .I2(rd_addr_next),
        .I3(\vcnt_reg_n_0_[1] ),
        .I4(\vcnt_reg_n_0_[2] ),
        .O(\vcnt[8]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \vcnt[9]_i_1 
       (.I0(en_p2),
        .O(\vcnt[9]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00200000)) 
    \vcnt[9]_i_2 
       (.I0(\vcnt[9]_i_4_n_0 ),
        .I1(p_0_in_2[5]),
        .I2(p_0_in_2[8]),
        .I3(p_0_in_2[6]),
        .I4(p_0_in_2[7]),
        .O(vcnt));
  LUT6 #(
    .INIT(64'hFF5D00000000FF5D)) 
    \vcnt[9]_i_3 
       (.I0(\vcnt_reg_n_0_[2] ),
        .I1(rd_addr_next),
        .I2(\vcnt_reg_n_0_[1] ),
        .I3(\vcnt[9]_i_5_n_0 ),
        .I4(\vcnt_reg_n_0_[9] ),
        .I5(\vcnt[9]_i_6_n_0 ),
        .O(vcnt__0[9]));
  LUT6 #(
    .INIT(64'h4000000000000000)) 
    \vcnt[9]_i_4 
       (.I0(p_0_in_2[4]),
        .I1(p_0_in_2[3]),
        .I2(p_0_in_2[2]),
        .I3(p_0_in_2[0]),
        .I4(p_0_in_2[1]),
        .I5(\hcnt_reg_n_0_[0] ),
        .O(\vcnt[9]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFD)) 
    \vcnt[9]_i_5 
       (.I0(\vcnt_reg_n_0_[9] ),
        .I1(\vcnt_reg_n_0_[8] ),
        .I2(\vcnt_reg_n_0_[7] ),
        .I3(\vcnt_reg_n_0_[6] ),
        .I4(\vcnt[9]_i_7_n_0 ),
        .I5(\vcnt[9]_i_8_n_0 ),
        .O(\vcnt[9]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    \vcnt[9]_i_6 
       (.I0(\vcnt_reg_n_0_[8] ),
        .I1(\vcnt_reg_n_0_[6] ),
        .I2(\vcnt_reg_n_0_[7] ),
        .I3(\vcnt_reg_n_0_[5] ),
        .I4(\vcnt[8]_i_2_n_0 ),
        .O(\vcnt[9]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \vcnt[9]_i_7 
       (.I0(\vcnt_reg_n_0_[1] ),
        .I1(\vcnt_reg_n_0_[2] ),
        .O(\vcnt[9]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hFB)) 
    \vcnt[9]_i_8 
       (.I0(\vcnt_reg_n_0_[5] ),
        .I1(\vcnt_reg_n_0_[3] ),
        .I2(\vcnt_reg_n_0_[4] ),
        .O(\vcnt[9]_i_8_n_0 ));
  FDRE \vcnt_reg[0] 
       (.C(pixel_clk),
        .CE(vcnt),
        .D(vcnt__0[0]),
        .Q(rd_addr_next),
        .R(\vcnt[9]_i_1_n_0 ));
  FDRE \vcnt_reg[1] 
       (.C(pixel_clk),
        .CE(vcnt),
        .D(vcnt__0[1]),
        .Q(\vcnt_reg_n_0_[1] ),
        .R(\vcnt[9]_i_1_n_0 ));
  FDRE \vcnt_reg[2] 
       (.C(pixel_clk),
        .CE(vcnt),
        .D(vcnt__0[2]),
        .Q(\vcnt_reg_n_0_[2] ),
        .R(\vcnt[9]_i_1_n_0 ));
  FDRE \vcnt_reg[3] 
       (.C(pixel_clk),
        .CE(vcnt),
        .D(vcnt__0[3]),
        .Q(\vcnt_reg_n_0_[3] ),
        .R(\vcnt[9]_i_1_n_0 ));
  FDRE \vcnt_reg[4] 
       (.C(pixel_clk),
        .CE(vcnt),
        .D(vcnt__0[4]),
        .Q(\vcnt_reg_n_0_[4] ),
        .R(\vcnt[9]_i_1_n_0 ));
  FDRE \vcnt_reg[5] 
       (.C(pixel_clk),
        .CE(vcnt),
        .D(vcnt__0[5]),
        .Q(\vcnt_reg_n_0_[5] ),
        .R(\vcnt[9]_i_1_n_0 ));
  FDRE \vcnt_reg[6] 
       (.C(pixel_clk),
        .CE(vcnt),
        .D(vcnt__0[6]),
        .Q(\vcnt_reg_n_0_[6] ),
        .R(\vcnt[9]_i_1_n_0 ));
  FDRE \vcnt_reg[7] 
       (.C(pixel_clk),
        .CE(vcnt),
        .D(vcnt__0[7]),
        .Q(\vcnt_reg_n_0_[7] ),
        .R(\vcnt[9]_i_1_n_0 ));
  FDRE \vcnt_reg[8] 
       (.C(pixel_clk),
        .CE(vcnt),
        .D(vcnt__0[8]),
        .Q(\vcnt_reg_n_0_[8] ),
        .R(\vcnt[9]_i_1_n_0 ));
  FDRE \vcnt_reg[9] 
       (.C(pixel_clk),
        .CE(vcnt),
        .D(vcnt__0[9]),
        .Q(\vcnt_reg_n_0_[9] ),
        .R(\vcnt[9]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h1F1F10101F101F10)) 
    \vga_q[0]_i_1 
       (.I0(\vga_q[1]_i_2_n_0 ),
        .I1(p_0_in_2[8]),
        .I2(tp_p2),
        .I3(\lb_rdata_reg_n_0_[4] ),
        .I4(\lb_rdata_reg_n_0_[20] ),
        .I5(\hcnt_reg_n_0_[0] ),
        .O(\vga_q[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEFE0EFEFEFE0E0E0)) 
    \vga_q[1]_i_1 
       (.I0(p_0_in_2[8]),
        .I1(\vga_q[1]_i_2_n_0 ),
        .I2(tp_p2),
        .I3(\lb_rdata_reg_n_0_[21] ),
        .I4(\hcnt_reg_n_0_[0] ),
        .I5(\lb_rdata_reg_n_0_[5] ),
        .O(\vga_q[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \vga_q[1]_i_2 
       (.I0(p_0_in_2[6]),
        .I1(p_0_in_2[7]),
        .O(\vga_q[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00FFB8B80000B8B8)) 
    \vga_q[2]_i_1 
       (.I0(\lb_rdata_reg_n_0_[22] ),
        .I1(\hcnt_reg_n_0_[0] ),
        .I2(\lb_rdata_reg_n_0_[6] ),
        .I3(p_0_in_2[8]),
        .I4(tp_p2),
        .I5(\vga_q[2]_i_2_n_0 ),
        .O(\vga_q[2]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \vga_q[2]_i_2 
       (.I0(p_0_in_2[6]),
        .I1(p_0_in_2[7]),
        .O(\vga_q[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h3737370404043704)) 
    \vga_q[3]_i_1 
       (.I0(\vga_q[3]_i_2_n_0 ),
        .I1(tp_p2),
        .I2(p_0_in_2[8]),
        .I3(\lb_rdata_reg_n_0_[7] ),
        .I4(\hcnt_reg_n_0_[0] ),
        .I5(\lb_rdata_reg_n_0_[23] ),
        .O(\vga_q[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \vga_q[3]_i_2 
       (.I0(p_0_in_2[6]),
        .I1(p_0_in_2[7]),
        .O(\vga_q[3]_i_2_n_0 ));
  FDRE \vga_q_reg[0] 
       (.C(pixel_clk),
        .CE(1'b1),
        .D(\vga_q[0]_i_1_n_0 ),
        .Q(vga_b[0]),
        .R(\hdmi_d_q[15]_i_1_n_0 ));
  FDRE \vga_q_reg[1] 
       (.C(pixel_clk),
        .CE(1'b1),
        .D(\vga_q[1]_i_1_n_0 ),
        .Q(vga_b[1]),
        .R(\hdmi_d_q[15]_i_1_n_0 ));
  FDRE \vga_q_reg[2] 
       (.C(pixel_clk),
        .CE(1'b1),
        .D(\vga_q[2]_i_1_n_0 ),
        .Q(vga_b[2]),
        .R(\hdmi_d_q[15]_i_1_n_0 ));
  FDRE \vga_q_reg[3] 
       (.C(pixel_clk),
        .CE(1'b1),
        .D(\vga_q[3]_i_1_n_0 ),
        .Q(vga_b[3]),
        .R(\hdmi_d_q[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000EA00EA00EA00)) 
    w_done_i_1
       (.I0(w_done_reg_n_0),
        .I1(s_axi_lite_wvalid),
        .I2(wready_q_reg_0),
        .I3(aresetn),
        .I4(bvalid_q_reg_0),
        .I5(s_axi_lite_bready),
        .O(w_done_i_1_n_0));
  FDRE w_done_reg
       (.C(aclk),
        .CE(1'b1),
        .D(w_done_i_1_n_0),
        .Q(w_done_reg_n_0),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h08)) 
    \wdata_q[31]_i_1 
       (.I0(wready_q_reg_0),
        .I1(s_axi_lite_wvalid),
        .I2(w_done_reg_n_0),
        .O(\wdata_q[31]_i_1_n_0 ));
  FDRE \wdata_q_reg[0] 
       (.C(aclk),
        .CE(\wdata_q[31]_i_1_n_0 ),
        .D(s_axi_lite_wdata[0]),
        .Q(\wdata_q_reg_n_0_[0] ),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \wdata_q_reg[10] 
       (.C(aclk),
        .CE(\wdata_q[31]_i_1_n_0 ),
        .D(s_axi_lite_wdata[10]),
        .Q(\wdata_q_reg_n_0_[10] ),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \wdata_q_reg[11] 
       (.C(aclk),
        .CE(\wdata_q[31]_i_1_n_0 ),
        .D(s_axi_lite_wdata[11]),
        .Q(\wdata_q_reg_n_0_[11] ),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \wdata_q_reg[12] 
       (.C(aclk),
        .CE(\wdata_q[31]_i_1_n_0 ),
        .D(s_axi_lite_wdata[12]),
        .Q(\wdata_q_reg_n_0_[12] ),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \wdata_q_reg[13] 
       (.C(aclk),
        .CE(\wdata_q[31]_i_1_n_0 ),
        .D(s_axi_lite_wdata[13]),
        .Q(\wdata_q_reg_n_0_[13] ),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \wdata_q_reg[14] 
       (.C(aclk),
        .CE(\wdata_q[31]_i_1_n_0 ),
        .D(s_axi_lite_wdata[14]),
        .Q(\wdata_q_reg_n_0_[14] ),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \wdata_q_reg[15] 
       (.C(aclk),
        .CE(\wdata_q[31]_i_1_n_0 ),
        .D(s_axi_lite_wdata[15]),
        .Q(\wdata_q_reg_n_0_[15] ),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \wdata_q_reg[16] 
       (.C(aclk),
        .CE(\wdata_q[31]_i_1_n_0 ),
        .D(s_axi_lite_wdata[16]),
        .Q(\wdata_q_reg_n_0_[16] ),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \wdata_q_reg[17] 
       (.C(aclk),
        .CE(\wdata_q[31]_i_1_n_0 ),
        .D(s_axi_lite_wdata[17]),
        .Q(\wdata_q_reg_n_0_[17] ),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \wdata_q_reg[18] 
       (.C(aclk),
        .CE(\wdata_q[31]_i_1_n_0 ),
        .D(s_axi_lite_wdata[18]),
        .Q(\wdata_q_reg_n_0_[18] ),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \wdata_q_reg[19] 
       (.C(aclk),
        .CE(\wdata_q[31]_i_1_n_0 ),
        .D(s_axi_lite_wdata[19]),
        .Q(\wdata_q_reg_n_0_[19] ),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \wdata_q_reg[1] 
       (.C(aclk),
        .CE(\wdata_q[31]_i_1_n_0 ),
        .D(s_axi_lite_wdata[1]),
        .Q(\wdata_q_reg_n_0_[1] ),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \wdata_q_reg[20] 
       (.C(aclk),
        .CE(\wdata_q[31]_i_1_n_0 ),
        .D(s_axi_lite_wdata[20]),
        .Q(\wdata_q_reg_n_0_[20] ),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \wdata_q_reg[21] 
       (.C(aclk),
        .CE(\wdata_q[31]_i_1_n_0 ),
        .D(s_axi_lite_wdata[21]),
        .Q(\wdata_q_reg_n_0_[21] ),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \wdata_q_reg[22] 
       (.C(aclk),
        .CE(\wdata_q[31]_i_1_n_0 ),
        .D(s_axi_lite_wdata[22]),
        .Q(\wdata_q_reg_n_0_[22] ),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \wdata_q_reg[23] 
       (.C(aclk),
        .CE(\wdata_q[31]_i_1_n_0 ),
        .D(s_axi_lite_wdata[23]),
        .Q(\wdata_q_reg_n_0_[23] ),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \wdata_q_reg[24] 
       (.C(aclk),
        .CE(\wdata_q[31]_i_1_n_0 ),
        .D(s_axi_lite_wdata[24]),
        .Q(\wdata_q_reg_n_0_[24] ),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \wdata_q_reg[25] 
       (.C(aclk),
        .CE(\wdata_q[31]_i_1_n_0 ),
        .D(s_axi_lite_wdata[25]),
        .Q(\wdata_q_reg_n_0_[25] ),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \wdata_q_reg[26] 
       (.C(aclk),
        .CE(\wdata_q[31]_i_1_n_0 ),
        .D(s_axi_lite_wdata[26]),
        .Q(\wdata_q_reg_n_0_[26] ),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \wdata_q_reg[27] 
       (.C(aclk),
        .CE(\wdata_q[31]_i_1_n_0 ),
        .D(s_axi_lite_wdata[27]),
        .Q(\wdata_q_reg_n_0_[27] ),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \wdata_q_reg[28] 
       (.C(aclk),
        .CE(\wdata_q[31]_i_1_n_0 ),
        .D(s_axi_lite_wdata[28]),
        .Q(\wdata_q_reg_n_0_[28] ),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \wdata_q_reg[29] 
       (.C(aclk),
        .CE(\wdata_q[31]_i_1_n_0 ),
        .D(s_axi_lite_wdata[29]),
        .Q(\wdata_q_reg_n_0_[29] ),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \wdata_q_reg[2] 
       (.C(aclk),
        .CE(\wdata_q[31]_i_1_n_0 ),
        .D(s_axi_lite_wdata[2]),
        .Q(\wdata_q_reg_n_0_[2] ),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \wdata_q_reg[30] 
       (.C(aclk),
        .CE(\wdata_q[31]_i_1_n_0 ),
        .D(s_axi_lite_wdata[30]),
        .Q(\wdata_q_reg_n_0_[30] ),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \wdata_q_reg[31] 
       (.C(aclk),
        .CE(\wdata_q[31]_i_1_n_0 ),
        .D(s_axi_lite_wdata[31]),
        .Q(\wdata_q_reg_n_0_[31] ),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \wdata_q_reg[3] 
       (.C(aclk),
        .CE(\wdata_q[31]_i_1_n_0 ),
        .D(s_axi_lite_wdata[3]),
        .Q(\wdata_q_reg_n_0_[3] ),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \wdata_q_reg[4] 
       (.C(aclk),
        .CE(\wdata_q[31]_i_1_n_0 ),
        .D(s_axi_lite_wdata[4]),
        .Q(\wdata_q_reg_n_0_[4] ),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \wdata_q_reg[5] 
       (.C(aclk),
        .CE(\wdata_q[31]_i_1_n_0 ),
        .D(s_axi_lite_wdata[5]),
        .Q(p_1_in),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \wdata_q_reg[6] 
       (.C(aclk),
        .CE(\wdata_q[31]_i_1_n_0 ),
        .D(s_axi_lite_wdata[6]),
        .Q(\wdata_q_reg_n_0_[6] ),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \wdata_q_reg[7] 
       (.C(aclk),
        .CE(\wdata_q[31]_i_1_n_0 ),
        .D(s_axi_lite_wdata[7]),
        .Q(\wdata_q_reg_n_0_[7] ),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \wdata_q_reg[8] 
       (.C(aclk),
        .CE(\wdata_q[31]_i_1_n_0 ),
        .D(s_axi_lite_wdata[8]),
        .Q(\wdata_q_reg_n_0_[8] ),
        .R(\rdata_q[31]_i_1_n_0 ));
  FDRE \wdata_q_reg[9] 
       (.C(aclk),
        .CE(\wdata_q[31]_i_1_n_0 ),
        .D(s_axi_lite_wdata[9]),
        .Q(\wdata_q_reg_n_0_[9] ),
        .R(\rdata_q[31]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h882A)) 
    wready_q_i_1
       (.I0(aresetn),
        .I1(wready_q_reg_0),
        .I2(s_axi_lite_wvalid),
        .I3(w_done_reg_n_0),
        .O(wready_q_i_1_n_0));
  FDRE wready_q_reg
       (.C(aclk),
        .CE(1'b1),
        .D(wready_q_i_1_n_0),
        .Q(wready_q_reg_0),
        .R(1'b0));
  FDRE ycs_p1_reg
       (.C(pixel_clk),
        .CE(1'b1),
        .D(ctrl_yc_swap),
        .Q(ycs_p1),
        .R(1'b0));
  FDRE ycs_p2_reg
       (.C(pixel_clk),
        .CE(1'b1),
        .D(ycs_p1),
        .Q(ycs_p2),
        .R(1'b0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
