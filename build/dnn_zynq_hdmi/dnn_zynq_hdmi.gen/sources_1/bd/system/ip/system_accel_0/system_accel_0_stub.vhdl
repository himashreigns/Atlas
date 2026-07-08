-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
-- Date        : Wed Jul  8 16:40:24 2026
-- Host        : chathupa-Nitro-AN515-55 running 64-bit Ubuntu 24.04.3 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/chathupa/Desktop/dnn_opt/build/dnn_zynq_hdmi/dnn_zynq_hdmi.gen/sources_1/bd/system/ip/system_accel_0/system_accel_0_stub.vhdl
-- Design      : system_accel_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity system_accel_0 is
  Port ( 
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
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
    m_axi_hp_awid : out STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axi_hp_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_hp_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_hp_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_hp_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_hp_awlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_hp_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_hp_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_hp_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_hp_awvalid : out STD_LOGIC;
    m_axi_hp_awready : in STD_LOGIC;
    m_axi_hp_wid : out STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axi_hp_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_hp_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_hp_wlast : out STD_LOGIC;
    m_axi_hp_wvalid : out STD_LOGIC;
    m_axi_hp_wready : in STD_LOGIC;
    m_axi_hp_bid : in STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axi_hp_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_hp_bvalid : in STD_LOGIC;
    m_axi_hp_bready : out STD_LOGIC;
    status_leds : out STD_LOGIC_VECTOR ( 3 downto 0 );
    irq_done : out STD_LOGIC
  );

  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of system_accel_0 : entity is "system_accel_0,dnn_accel_ps_top,{}";
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of system_accel_0 : entity is "system_accel_0,dnn_accel_ps_top,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=dnn_accel_ps_top,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,AXI_LITE_ADDR_W=16,ACCEL_ADDR_W=20,AXI_DATA_W=32,AXI_ID_W=6,DDR_BASE_ADDR=0x10000000}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of system_accel_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of system_accel_0 : entity is "module_ref";
end system_accel_0;

architecture stub of system_accel_0 is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "aclk,aresetn,s_axi_lite_awaddr[15:0],s_axi_lite_awprot[2:0],s_axi_lite_awvalid,s_axi_lite_awready,s_axi_lite_wdata[31:0],s_axi_lite_wstrb[3:0],s_axi_lite_wvalid,s_axi_lite_wready,s_axi_lite_bresp[1:0],s_axi_lite_bvalid,s_axi_lite_bready,s_axi_lite_araddr[15:0],s_axi_lite_arprot[2:0],s_axi_lite_arvalid,s_axi_lite_arready,s_axi_lite_rdata[31:0],s_axi_lite_rresp[1:0],s_axi_lite_rvalid,s_axi_lite_rready,m_axi_hp_arid[5:0],m_axi_hp_araddr[31:0],m_axi_hp_arlen[7:0],m_axi_hp_arsize[2:0],m_axi_hp_arburst[1:0],m_axi_hp_arlock[1:0],m_axi_hp_arcache[3:0],m_axi_hp_arprot[2:0],m_axi_hp_arqos[3:0],m_axi_hp_arvalid,m_axi_hp_arready,m_axi_hp_rid[5:0],m_axi_hp_rdata[31:0],m_axi_hp_rresp[1:0],m_axi_hp_rlast,m_axi_hp_rvalid,m_axi_hp_rready,m_axi_hp_awid[5:0],m_axi_hp_awaddr[31:0],m_axi_hp_awlen[7:0],m_axi_hp_awsize[2:0],m_axi_hp_awburst[1:0],m_axi_hp_awlock[1:0],m_axi_hp_awcache[3:0],m_axi_hp_awprot[2:0],m_axi_hp_awqos[3:0],m_axi_hp_awvalid,m_axi_hp_awready,m_axi_hp_wid[5:0],m_axi_hp_wdata[31:0],m_axi_hp_wstrb[3:0],m_axi_hp_wlast,m_axi_hp_wvalid,m_axi_hp_wready,m_axi_hp_bid[5:0],m_axi_hp_bresp[1:0],m_axi_hp_bvalid,m_axi_hp_bready,status_leds[3:0],irq_done";
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of aclk : signal is "xilinx.com:signal:clock:1.0 aclk CLK";
  attribute X_INTERFACE_MODE : string;
  attribute X_INTERFACE_MODE of aclk : signal is "slave";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of aclk : signal is "XIL_INTERFACENAME aclk, ASSOCIATED_BUSIF m_axi_hp:s_axi_lite, ASSOCIATED_RESET aresetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_ps7_0_FCLK_CLK0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of aresetn : signal is "xilinx.com:signal:reset:1.0 aresetn RST";
  attribute X_INTERFACE_MODE of aresetn : signal is "slave";
  attribute X_INTERFACE_PARAMETER of aresetn : signal is "XIL_INTERFACENAME aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
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
  attribute X_INTERFACE_PARAMETER of m_axi_hp_arid : signal is "XIL_INTERFACENAME m_axi_hp, DATA_WIDTH 32, PROTOCOL AXI4, FREQ_HZ 100000000, ID_WIDTH 6, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 256, PHASE 0.0, CLK_DOMAIN system_ps7_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
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
  attribute X_INTERFACE_INFO of m_axi_hp_awid : signal is "xilinx.com:interface:aximm:1.0 m_axi_hp AWID";
  attribute X_INTERFACE_INFO of m_axi_hp_awaddr : signal is "xilinx.com:interface:aximm:1.0 m_axi_hp AWADDR";
  attribute X_INTERFACE_INFO of m_axi_hp_awlen : signal is "xilinx.com:interface:aximm:1.0 m_axi_hp AWLEN";
  attribute X_INTERFACE_INFO of m_axi_hp_awsize : signal is "xilinx.com:interface:aximm:1.0 m_axi_hp AWSIZE";
  attribute X_INTERFACE_INFO of m_axi_hp_awburst : signal is "xilinx.com:interface:aximm:1.0 m_axi_hp AWBURST";
  attribute X_INTERFACE_INFO of m_axi_hp_awlock : signal is "xilinx.com:interface:aximm:1.0 m_axi_hp AWLOCK";
  attribute X_INTERFACE_INFO of m_axi_hp_awcache : signal is "xilinx.com:interface:aximm:1.0 m_axi_hp AWCACHE";
  attribute X_INTERFACE_INFO of m_axi_hp_awprot : signal is "xilinx.com:interface:aximm:1.0 m_axi_hp AWPROT";
  attribute X_INTERFACE_INFO of m_axi_hp_awqos : signal is "xilinx.com:interface:aximm:1.0 m_axi_hp AWQOS";
  attribute X_INTERFACE_INFO of m_axi_hp_awvalid : signal is "xilinx.com:interface:aximm:1.0 m_axi_hp AWVALID";
  attribute X_INTERFACE_INFO of m_axi_hp_awready : signal is "xilinx.com:interface:aximm:1.0 m_axi_hp AWREADY";
  attribute X_INTERFACE_INFO of m_axi_hp_wid : signal is "xilinx.com:interface:aximm:1.0 m_axi_hp WID";
  attribute X_INTERFACE_INFO of m_axi_hp_wdata : signal is "xilinx.com:interface:aximm:1.0 m_axi_hp WDATA";
  attribute X_INTERFACE_INFO of m_axi_hp_wstrb : signal is "xilinx.com:interface:aximm:1.0 m_axi_hp WSTRB";
  attribute X_INTERFACE_INFO of m_axi_hp_wlast : signal is "xilinx.com:interface:aximm:1.0 m_axi_hp WLAST";
  attribute X_INTERFACE_INFO of m_axi_hp_wvalid : signal is "xilinx.com:interface:aximm:1.0 m_axi_hp WVALID";
  attribute X_INTERFACE_INFO of m_axi_hp_wready : signal is "xilinx.com:interface:aximm:1.0 m_axi_hp WREADY";
  attribute X_INTERFACE_INFO of m_axi_hp_bid : signal is "xilinx.com:interface:aximm:1.0 m_axi_hp BID";
  attribute X_INTERFACE_INFO of m_axi_hp_bresp : signal is "xilinx.com:interface:aximm:1.0 m_axi_hp BRESP";
  attribute X_INTERFACE_INFO of m_axi_hp_bvalid : signal is "xilinx.com:interface:aximm:1.0 m_axi_hp BVALID";
  attribute X_INTERFACE_INFO of m_axi_hp_bready : signal is "xilinx.com:interface:aximm:1.0 m_axi_hp BREADY";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of stub : architecture is "dnn_accel_ps_top,Vivado 2025.2";
begin
end;
