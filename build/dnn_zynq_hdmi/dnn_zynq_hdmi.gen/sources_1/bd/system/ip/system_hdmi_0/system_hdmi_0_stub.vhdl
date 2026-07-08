-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
-- Date        : Wed Jul  8 16:38:57 2026
-- Host        : chathupa-Nitro-AN515-55 running 64-bit Ubuntu 24.04.3 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/chathupa/Desktop/dnn_opt/build/dnn_zynq_hdmi/dnn_zynq_hdmi.gen/sources_1/bd/system/ip/system_hdmi_0/system_hdmi_0_stub.vhdl
-- Design      : system_hdmi_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity system_hdmi_0 is
  Port ( 
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    pixel_clk : in STD_LOGIC;
    s_axi_lite_awaddr : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axi_lite_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_lite_awvalid : in STD_LOGIC;
    s_axi_lite_awready : out STD_LOGIC;
    s_axi_lite_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_lite_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_lite_wvalid : in STD_LOGIC;
    s_axi_lite_wready : out STD_LOGIC;
    s_axi_lite_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_lite_bvalid : out STD_LOGIC;
    s_axi_lite_bready : in STD_LOGIC;
    s_axi_lite_araddr : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axi_lite_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_lite_arvalid : in STD_LOGIC;
    s_axi_lite_arready : out STD_LOGIC;
    s_axi_lite_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_lite_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_lite_rvalid : out STD_LOGIC;
    s_axi_lite_rready : in STD_LOGIC;
    m_axi_hp_arid : out STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axi_hp_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_hp_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_hp_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_hp_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_hp_arlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_hp_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_hp_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_hp_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_hp_arvalid : out STD_LOGIC;
    m_axi_hp_arready : in STD_LOGIC;
    m_axi_hp_rid : in STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axi_hp_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_hp_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_hp_rlast : in STD_LOGIC;
    m_axi_hp_rvalid : in STD_LOGIC;
    m_axi_hp_rready : out STD_LOGIC;
    hdmi_clk : out STD_LOGIC;
    hdmi_d : out STD_LOGIC_VECTOR ( 15 downto 0 );
    hdmi_de : out STD_LOGIC;
    hdmi_hsync : out STD_LOGIC;
    hdmi_vsync : out STD_LOGIC;
    hdmi_scl : inout STD_LOGIC;
    hdmi_sda : inout STD_LOGIC;
    vga_r : out STD_LOGIC_VECTOR ( 3 downto 0 );
    vga_g : out STD_LOGIC_VECTOR ( 3 downto 0 );
    vga_b : out STD_LOGIC_VECTOR ( 3 downto 0 );
    vga_hsync : out STD_LOGIC;
    vga_vsync : out STD_LOGIC
  );

  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of system_hdmi_0 : entity is "system_hdmi_0,hdmi_out,{}";
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of system_hdmi_0 : entity is "system_hdmi_0,hdmi_out,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=hdmi_out,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,AXI_LITE_ADDR_W=16,AXI_ID_W=6,FB_DEFAULT=0x10100000,H_ACT=640,H_FP=16,H_SYNC=96,H_BP=48,V_ACT=480,V_FP=10,V_SYNC=2,V_BP=33}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of system_hdmi_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of system_hdmi_0 : entity is "module_ref";
end system_hdmi_0;

architecture stub of system_hdmi_0 is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "aclk,aresetn,pixel_clk,s_axi_lite_awaddr[15:0],s_axi_lite_awprot[2:0],s_axi_lite_awvalid,s_axi_lite_awready,s_axi_lite_wdata[31:0],s_axi_lite_wstrb[3:0],s_axi_lite_wvalid,s_axi_lite_wready,s_axi_lite_bresp[1:0],s_axi_lite_bvalid,s_axi_lite_bready,s_axi_lite_araddr[15:0],s_axi_lite_arprot[2:0],s_axi_lite_arvalid,s_axi_lite_arready,s_axi_lite_rdata[31:0],s_axi_lite_rresp[1:0],s_axi_lite_rvalid,s_axi_lite_rready,m_axi_hp_arid[5:0],m_axi_hp_araddr[31:0],m_axi_hp_arlen[7:0],m_axi_hp_arsize[2:0],m_axi_hp_arburst[1:0],m_axi_hp_arlock[1:0],m_axi_hp_arcache[3:0],m_axi_hp_arprot[2:0],m_axi_hp_arqos[3:0],m_axi_hp_arvalid,m_axi_hp_arready,m_axi_hp_rid[5:0],m_axi_hp_rdata[31:0],m_axi_hp_rresp[1:0],m_axi_hp_rlast,m_axi_hp_rvalid,m_axi_hp_rready,hdmi_clk,hdmi_d[15:0],hdmi_de,hdmi_hsync,hdmi_vsync,hdmi_scl,hdmi_sda,vga_r[3:0],vga_g[3:0],vga_b[3:0],vga_hsync,vga_vsync";
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of aclk : signal is "xilinx.com:signal:clock:1.0 aclk CLK";
  attribute X_INTERFACE_MODE : string;
  attribute X_INTERFACE_MODE of aclk : signal is "slave";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of aclk : signal is "XIL_INTERFACENAME aclk, ASSOCIATED_BUSIF m_axi_hp:s_axi_lite, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_ps7_0_FCLK_CLK0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of aresetn : signal is "xilinx.com:signal:reset:1.0 aresetn RST";
  attribute X_INTERFACE_MODE of aresetn : signal is "slave";
  attribute X_INTERFACE_PARAMETER of aresetn : signal is "XIL_INTERFACENAME aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of pixel_clk : signal is "xilinx.com:signal:clock:1.0 pixel_clk CLK";
  attribute X_INTERFACE_MODE of pixel_clk : signal is "slave";
  attribute X_INTERFACE_PARAMETER of pixel_clk : signal is "XIL_INTERFACENAME pixel_clk, FREQ_HZ 25000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_ps7_0_FCLK_CLK1, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s_axi_lite_awaddr : signal is "xilinx.com:interface:aximm:1.0 s_axi_lite AWADDR";
  attribute X_INTERFACE_MODE of s_axi_lite_awaddr : signal is "slave";
  attribute X_INTERFACE_PARAMETER of s_axi_lite_awaddr : signal is "XIL_INTERFACENAME s_axi_lite, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 16, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN system_ps7_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s_axi_lite_awprot : signal is "xilinx.com:interface:aximm:1.0 s_axi_lite AWPROT";
  attribute X_INTERFACE_INFO of s_axi_lite_awvalid : signal is "xilinx.com:interface:aximm:1.0 s_axi_lite AWVALID";
  attribute X_INTERFACE_INFO of s_axi_lite_awready : signal is "xilinx.com:interface:aximm:1.0 s_axi_lite AWREADY";
  attribute X_INTERFACE_INFO of s_axi_lite_wdata : signal is "xilinx.com:interface:aximm:1.0 s_axi_lite WDATA";
  attribute X_INTERFACE_INFO of s_axi_lite_wstrb : signal is "xilinx.com:interface:aximm:1.0 s_axi_lite WSTRB";
  attribute X_INTERFACE_INFO of s_axi_lite_wvalid : signal is "xilinx.com:interface:aximm:1.0 s_axi_lite WVALID";
  attribute X_INTERFACE_INFO of s_axi_lite_wready : signal is "xilinx.com:interface:aximm:1.0 s_axi_lite WREADY";
  attribute X_INTERFACE_INFO of s_axi_lite_bresp : signal is "xilinx.com:interface:aximm:1.0 s_axi_lite BRESP";
  attribute X_INTERFACE_INFO of s_axi_lite_bvalid : signal is "xilinx.com:interface:aximm:1.0 s_axi_lite BVALID";
  attribute X_INTERFACE_INFO of s_axi_lite_bready : signal is "xilinx.com:interface:aximm:1.0 s_axi_lite BREADY";
  attribute X_INTERFACE_INFO of s_axi_lite_araddr : signal is "xilinx.com:interface:aximm:1.0 s_axi_lite ARADDR";
  attribute X_INTERFACE_INFO of s_axi_lite_arprot : signal is "xilinx.com:interface:aximm:1.0 s_axi_lite ARPROT";
  attribute X_INTERFACE_INFO of s_axi_lite_arvalid : signal is "xilinx.com:interface:aximm:1.0 s_axi_lite ARVALID";
  attribute X_INTERFACE_INFO of s_axi_lite_arready : signal is "xilinx.com:interface:aximm:1.0 s_axi_lite ARREADY";
  attribute X_INTERFACE_INFO of s_axi_lite_rdata : signal is "xilinx.com:interface:aximm:1.0 s_axi_lite RDATA";
  attribute X_INTERFACE_INFO of s_axi_lite_rresp : signal is "xilinx.com:interface:aximm:1.0 s_axi_lite RRESP";
  attribute X_INTERFACE_INFO of s_axi_lite_rvalid : signal is "xilinx.com:interface:aximm:1.0 s_axi_lite RVALID";
  attribute X_INTERFACE_INFO of s_axi_lite_rready : signal is "xilinx.com:interface:aximm:1.0 s_axi_lite RREADY";
  attribute X_INTERFACE_INFO of m_axi_hp_arid : signal is "xilinx.com:interface:aximm:1.0 m_axi_hp ARID";
  attribute X_INTERFACE_MODE of m_axi_hp_arid : signal is "master";
  attribute X_INTERFACE_PARAMETER of m_axi_hp_arid : signal is "XIL_INTERFACENAME m_axi_hp, DATA_WIDTH 32, PROTOCOL AXI4, FREQ_HZ 100000000, ID_WIDTH 6, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_ONLY, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 0, HAS_WSTRB 0, HAS_BRESP 0, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 256, PHASE 0.0, CLK_DOMAIN system_ps7_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of m_axi_hp_araddr : signal is "xilinx.com:interface:aximm:1.0 m_axi_hp ARADDR";
  attribute X_INTERFACE_INFO of m_axi_hp_arlen : signal is "xilinx.com:interface:aximm:1.0 m_axi_hp ARLEN";
  attribute X_INTERFACE_INFO of m_axi_hp_arsize : signal is "xilinx.com:interface:aximm:1.0 m_axi_hp ARSIZE";
  attribute X_INTERFACE_INFO of m_axi_hp_arburst : signal is "xilinx.com:interface:aximm:1.0 m_axi_hp ARBURST";
  attribute X_INTERFACE_INFO of m_axi_hp_arlock : signal is "xilinx.com:interface:aximm:1.0 m_axi_hp ARLOCK";
  attribute X_INTERFACE_INFO of m_axi_hp_arcache : signal is "xilinx.com:interface:aximm:1.0 m_axi_hp ARCACHE";
  attribute X_INTERFACE_INFO of m_axi_hp_arprot : signal is "xilinx.com:interface:aximm:1.0 m_axi_hp ARPROT";
  attribute X_INTERFACE_INFO of m_axi_hp_arqos : signal is "xilinx.com:interface:aximm:1.0 m_axi_hp ARQOS";
  attribute X_INTERFACE_INFO of m_axi_hp_arvalid : signal is "xilinx.com:interface:aximm:1.0 m_axi_hp ARVALID";
  attribute X_INTERFACE_INFO of m_axi_hp_arready : signal is "xilinx.com:interface:aximm:1.0 m_axi_hp ARREADY";
  attribute X_INTERFACE_INFO of m_axi_hp_rid : signal is "xilinx.com:interface:aximm:1.0 m_axi_hp RID";
  attribute X_INTERFACE_INFO of m_axi_hp_rdata : signal is "xilinx.com:interface:aximm:1.0 m_axi_hp RDATA";
  attribute X_INTERFACE_INFO of m_axi_hp_rresp : signal is "xilinx.com:interface:aximm:1.0 m_axi_hp RRESP";
  attribute X_INTERFACE_INFO of m_axi_hp_rlast : signal is "xilinx.com:interface:aximm:1.0 m_axi_hp RLAST";
  attribute X_INTERFACE_INFO of m_axi_hp_rvalid : signal is "xilinx.com:interface:aximm:1.0 m_axi_hp RVALID";
  attribute X_INTERFACE_INFO of m_axi_hp_rready : signal is "xilinx.com:interface:aximm:1.0 m_axi_hp RREADY";
  attribute X_INTERFACE_INFO of hdmi_clk : signal is "xilinx.com:signal:clock:1.0 hdmi_clk CLK";
  attribute X_INTERFACE_MODE of hdmi_clk : signal is "master";
  attribute X_INTERFACE_PARAMETER of hdmi_clk : signal is "XIL_INTERFACENAME hdmi_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_hdmi_0_hdmi_clk, INSERT_VIP 0";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of stub : architecture is "hdmi_out,Vivado 2025.2";
begin
end;
