-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
-- Date        : Wed Jul  8 16:38:57 2026
-- Host        : chathupa-Nitro-AN515-55 running 64-bit Ubuntu 24.04.3 LTS
-- Command     : write_vhdl -force -mode funcsim
--               /home/chathupa/Desktop/dnn_opt/build/dnn_zynq_hdmi/dnn_zynq_hdmi.gen/sources_1/bd/system/ip/system_hdmi_0/system_hdmi_0_sim_netlist.vhdl
-- Design      : system_hdmi_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_hdmi_0_hdmi_out is
  port (
    wready_q_reg_0 : out STD_LOGIC;
    awready_q_reg_0 : out STD_LOGIC;
    arready_q_reg_0 : out STD_LOGIC;
    hdmi_clk : out STD_LOGIC;
    m_axi_hp_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    bvalid_q_reg_0 : out STD_LOGIC;
    s_axi_lite_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    hdmi_d : out STD_LOGIC_VECTOR ( 15 downto 0 );
    hdmi_de : out STD_LOGIC;
    vga_hsync : out STD_LOGIC;
    vga_vsync : out STD_LOGIC;
    vga_b : out STD_LOGIC_VECTOR ( 3 downto 0 );
    rvalid_q_reg_0 : out STD_LOGIC;
    m_axi_hp_arvalid : out STD_LOGIC;
    hdmi_scl : inout STD_LOGIC;
    hdmi_sda : inout STD_LOGIC;
    s_axi_lite_wvalid : in STD_LOGIC;
    s_axi_lite_awvalid : in STD_LOGIC;
    s_axi_lite_arvalid : in STD_LOGIC;
    pixel_clk : in STD_LOGIC;
    m_axi_hp_rlast : in STD_LOGIC;
    m_axi_hp_rvalid : in STD_LOGIC;
    aclk : in STD_LOGIC;
    m_axi_hp_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_lite_awaddr : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_lite_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_lite_araddr : in STD_LOGIC_VECTOR ( 7 downto 0 );
    aresetn : in STD_LOGIC;
    m_axi_hp_arready : in STD_LOGIC;
    s_axi_lite_bready : in STD_LOGIC;
    s_axi_lite_rready : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_hdmi_0_hdmi_out : entity is "hdmi_out";
end system_hdmi_0_hdmi_out;

architecture STRUCTURE of system_hdmi_0_hdmi_out is
  signal \FSM_sequential_fstate[0]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_fstate[0]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_fstate[1]_i_1_n_0\ : STD_LOGIC;
  signal T0 : STD_LOGIC;
  signal ar_done_i_1_n_0 : STD_LOGIC;
  signal ar_done_reg_n_0 : STD_LOGIC;
  signal araddr_q : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \araddr_q[7]_i_1_n_0\ : STD_LOGIC;
  signal arready_q_i_1_n_0 : STD_LOGIC;
  signal \^arready_q_reg_0\ : STD_LOGIC;
  signal arvalid_q2_i_1_n_0 : STD_LOGIC;
  signal arvalid_q2_i_2_n_0 : STD_LOGIC;
  signal arvalid_q2_i_4_n_0 : STD_LOGIC;
  signal arvalid_q2_i_5_n_0 : STD_LOGIC;
  signal aw_done_i_1_n_0 : STD_LOGIC;
  signal aw_done_reg_n_0 : STD_LOGIC;
  signal \awaddr_q[7]_i_1_n_0\ : STD_LOGIC;
  signal \awaddr_q_reg_n_0_[0]\ : STD_LOGIC;
  signal \awaddr_q_reg_n_0_[1]\ : STD_LOGIC;
  signal \awaddr_q_reg_n_0_[2]\ : STD_LOGIC;
  signal \awaddr_q_reg_n_0_[3]\ : STD_LOGIC;
  signal \awaddr_q_reg_n_0_[5]\ : STD_LOGIC;
  signal \awaddr_q_reg_n_0_[6]\ : STD_LOGIC;
  signal \awaddr_q_reg_n_0_[7]\ : STD_LOGIC;
  signal awready_q_i_1_n_0 : STD_LOGIC;
  signal \^awready_q_reg_0\ : STD_LOGIC;
  signal bvalid_q_i_1_n_0 : STD_LOGIC;
  signal \^bvalid_q_reg_0\ : STD_LOGIC;
  signal ccs_p1 : STD_LOGIC;
  signal ccs_p2 : STD_LOGIC;
  signal ctrl_cbcr_swap : STD_LOGIC;
  signal ctrl_enable : STD_LOGIC;
  signal ctrl_enable1 : STD_LOGIC;
  signal ctrl_enable_i_3_n_0 : STD_LOGIC;
  signal ctrl_mono : STD_LOGIC;
  signal ctrl_yc_swap : STD_LOGIC;
  signal data2 : STD_LOGIC_VECTOR ( 23 downto 0 );
  signal en_p1 : STD_LOGIC;
  signal en_p2 : STD_LOGIC;
  signal f_addr : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \f_addr0_carry__0_n_0\ : STD_LOGIC;
  signal \f_addr0_carry__0_n_1\ : STD_LOGIC;
  signal \f_addr0_carry__0_n_2\ : STD_LOGIC;
  signal \f_addr0_carry__0_n_3\ : STD_LOGIC;
  signal \f_addr0_carry__1_n_0\ : STD_LOGIC;
  signal \f_addr0_carry__1_n_1\ : STD_LOGIC;
  signal \f_addr0_carry__1_n_2\ : STD_LOGIC;
  signal \f_addr0_carry__1_n_3\ : STD_LOGIC;
  signal \f_addr0_carry__2_n_0\ : STD_LOGIC;
  signal \f_addr0_carry__2_n_1\ : STD_LOGIC;
  signal \f_addr0_carry__2_n_2\ : STD_LOGIC;
  signal \f_addr0_carry__2_n_3\ : STD_LOGIC;
  signal \f_addr0_carry__3_n_0\ : STD_LOGIC;
  signal \f_addr0_carry__3_n_1\ : STD_LOGIC;
  signal \f_addr0_carry__3_n_2\ : STD_LOGIC;
  signal \f_addr0_carry__3_n_3\ : STD_LOGIC;
  signal \f_addr0_carry__4_n_0\ : STD_LOGIC;
  signal \f_addr0_carry__4_n_1\ : STD_LOGIC;
  signal \f_addr0_carry__4_n_2\ : STD_LOGIC;
  signal \f_addr0_carry__4_n_3\ : STD_LOGIC;
  signal \f_addr0_carry__5_n_2\ : STD_LOGIC;
  signal \f_addr0_carry__5_n_3\ : STD_LOGIC;
  signal f_addr0_carry_i_1_n_0 : STD_LOGIC;
  signal f_addr0_carry_n_0 : STD_LOGIC;
  signal f_addr0_carry_n_1 : STD_LOGIC;
  signal f_addr0_carry_n_2 : STD_LOGIC;
  signal f_addr0_carry_n_3 : STD_LOGIC;
  signal f_addr0_i_2_n_0 : STD_LOGIC;
  signal f_addr0_i_3_n_0 : STD_LOGIC;
  signal f_addr0_i_4_n_0 : STD_LOGIC;
  signal f_addr0_i_5_n_0 : STD_LOGIC;
  signal f_addr0_i_6_n_0 : STD_LOGIC;
  signal f_addr0_i_7_n_0 : STD_LOGIC;
  signal f_addr0_n_100 : STD_LOGIC;
  signal f_addr0_n_101 : STD_LOGIC;
  signal f_addr0_n_102 : STD_LOGIC;
  signal f_addr0_n_103 : STD_LOGIC;
  signal f_addr0_n_104 : STD_LOGIC;
  signal f_addr0_n_105 : STD_LOGIC;
  signal f_addr0_n_74 : STD_LOGIC;
  signal f_addr0_n_75 : STD_LOGIC;
  signal f_addr0_n_76 : STD_LOGIC;
  signal f_addr0_n_77 : STD_LOGIC;
  signal f_addr0_n_78 : STD_LOGIC;
  signal f_addr0_n_79 : STD_LOGIC;
  signal f_addr0_n_80 : STD_LOGIC;
  signal f_addr0_n_81 : STD_LOGIC;
  signal f_addr0_n_82 : STD_LOGIC;
  signal f_addr0_n_83 : STD_LOGIC;
  signal f_addr0_n_84 : STD_LOGIC;
  signal f_addr0_n_85 : STD_LOGIC;
  signal f_addr0_n_86 : STD_LOGIC;
  signal f_addr0_n_87 : STD_LOGIC;
  signal f_addr0_n_88 : STD_LOGIC;
  signal f_addr0_n_89 : STD_LOGIC;
  signal f_addr0_n_90 : STD_LOGIC;
  signal f_addr0_n_91 : STD_LOGIC;
  signal f_addr0_n_92 : STD_LOGIC;
  signal f_addr0_n_93 : STD_LOGIC;
  signal f_addr0_n_94 : STD_LOGIC;
  signal f_addr0_n_95 : STD_LOGIC;
  signal f_addr0_n_96 : STD_LOGIC;
  signal f_addr0_n_97 : STD_LOGIC;
  signal f_addr0_n_98 : STD_LOGIC;
  signal f_addr0_n_99 : STD_LOGIC;
  signal \f_addr[31]_i_3_n_0\ : STD_LOGIC;
  signal \f_addr[31]_i_4_n_0\ : STD_LOGIC;
  signal \f_addr[31]_i_5_n_0\ : STD_LOGIC;
  signal f_burst : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \f_burst[0]_i_1_n_0\ : STD_LOGIC;
  signal \f_burst[1]_i_1_n_0\ : STD_LOGIC;
  signal \f_burst[2]_i_1_n_0\ : STD_LOGIC;
  signal \f_burst[3]_i_1_n_0\ : STD_LOGIC;
  signal \f_burst[4]_i_1_n_0\ : STD_LOGIC;
  signal \f_burst_reg_n_0_[0]\ : STD_LOGIC;
  signal \f_burst_reg_n_0_[1]\ : STD_LOGIC;
  signal \f_burst_reg_n_0_[2]\ : STD_LOGIC;
  signal \f_burst_reg_n_0_[3]\ : STD_LOGIC;
  signal \f_burst_reg_n_0_[4]\ : STD_LOGIC;
  signal f_line : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \f_line[0]_i_1_n_0\ : STD_LOGIC;
  signal \f_line_reg_n_0_[0]\ : STD_LOGIC;
  signal f_word : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \f_word[8]_i_3_n_0\ : STD_LOGIC;
  signal f_word_3 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \f_word_reg_n_0_[0]\ : STD_LOGIC;
  signal \f_word_reg_n_0_[1]\ : STD_LOGIC;
  signal \f_word_reg_n_0_[2]\ : STD_LOGIC;
  signal \f_word_reg_n_0_[3]\ : STD_LOGIC;
  signal \f_word_reg_n_0_[4]\ : STD_LOGIC;
  signal \f_word_reg_n_0_[5]\ : STD_LOGIC;
  signal \f_word_reg_n_0_[6]\ : STD_LOGIC;
  signal \f_word_reg_n_0_[7]\ : STD_LOGIC;
  signal \f_word_reg_n_0_[8]\ : STD_LOGIC;
  signal fb_base : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal fb_base_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal fetch_overrun_set : STD_LOGIC;
  signal fetch_overrun_set_4 : STD_LOGIC;
  signal \frame_cnt_pix[0]_i_1_n_0\ : STD_LOGIC;
  signal \frame_cnt_pix[1]_i_1_n_0\ : STD_LOGIC;
  signal \frame_cnt_pix[2]_i_1_n_0\ : STD_LOGIC;
  signal \frame_cnt_pix[3]_i_1_n_0\ : STD_LOGIC;
  signal \frame_cnt_pix[4]_i_1_n_0\ : STD_LOGIC;
  signal \frame_cnt_pix[5]_i_1_n_0\ : STD_LOGIC;
  signal \frame_cnt_pix[5]_i_2_n_0\ : STD_LOGIC;
  signal \frame_cnt_pix[6]_i_1_n_0\ : STD_LOGIC;
  signal \frame_cnt_pix[7]_i_1_n_0\ : STD_LOGIC;
  signal \frame_cnt_pix[7]_i_2_n_0\ : STD_LOGIC;
  signal \frame_cnt_pix[7]_i_3_n_0\ : STD_LOGIC;
  signal \frame_cnt_pix[7]_i_4_n_0\ : STD_LOGIC;
  signal \frame_cnt_pix[7]_i_5_n_0\ : STD_LOGIC;
  signal \frame_cnt_pix[7]_i_6_n_0\ : STD_LOGIC;
  signal frame_cnt_pix_reg : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal frame_cnt_s1 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal fstate : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \hcnt[0]_i_1_n_0\ : STD_LOGIC;
  signal \hcnt[1]_i_1_n_0\ : STD_LOGIC;
  signal \hcnt[2]_i_1_n_0\ : STD_LOGIC;
  signal \hcnt[3]_i_1_n_0\ : STD_LOGIC;
  signal \hcnt[4]_i_1_n_0\ : STD_LOGIC;
  signal \hcnt[5]_i_1_n_0\ : STD_LOGIC;
  signal \hcnt[6]_i_1_n_0\ : STD_LOGIC;
  signal \hcnt[7]_i_1_n_0\ : STD_LOGIC;
  signal \hcnt[7]_i_2_n_0\ : STD_LOGIC;
  signal \hcnt[8]_i_1_n_0\ : STD_LOGIC;
  signal \hcnt[9]_i_1_n_0\ : STD_LOGIC;
  signal \hcnt[9]_i_2_n_0\ : STD_LOGIC;
  signal \hcnt[9]_i_3_n_0\ : STD_LOGIC;
  signal \hcnt_reg_n_0_[0]\ : STD_LOGIC;
  signal \hdmi_d_q[0]_i_1_n_0\ : STD_LOGIC;
  signal \hdmi_d_q[10]_i_1_n_0\ : STD_LOGIC;
  signal \hdmi_d_q[10]_i_2_n_0\ : STD_LOGIC;
  signal \hdmi_d_q[10]_i_3_n_0\ : STD_LOGIC;
  signal \hdmi_d_q[10]_i_4_n_0\ : STD_LOGIC;
  signal \hdmi_d_q[11]_i_1_n_0\ : STD_LOGIC;
  signal \hdmi_d_q[11]_i_2_n_0\ : STD_LOGIC;
  signal \hdmi_d_q[11]_i_3_n_0\ : STD_LOGIC;
  signal \hdmi_d_q[11]_i_4_n_0\ : STD_LOGIC;
  signal \hdmi_d_q[12]_i_1_n_0\ : STD_LOGIC;
  signal \hdmi_d_q[12]_i_2_n_0\ : STD_LOGIC;
  signal \hdmi_d_q[12]_i_3_n_0\ : STD_LOGIC;
  signal \hdmi_d_q[13]_i_1_n_0\ : STD_LOGIC;
  signal \hdmi_d_q[13]_i_2_n_0\ : STD_LOGIC;
  signal \hdmi_d_q[13]_i_3_n_0\ : STD_LOGIC;
  signal \hdmi_d_q[13]_i_4_n_0\ : STD_LOGIC;
  signal \hdmi_d_q[14]_i_1_n_0\ : STD_LOGIC;
  signal \hdmi_d_q[14]_i_2_n_0\ : STD_LOGIC;
  signal \hdmi_d_q[14]_i_3_n_0\ : STD_LOGIC;
  signal \hdmi_d_q[14]_i_4_n_0\ : STD_LOGIC;
  signal \hdmi_d_q[15]_i_1_n_0\ : STD_LOGIC;
  signal \hdmi_d_q[15]_i_2_n_0\ : STD_LOGIC;
  signal \hdmi_d_q[15]_i_3_n_0\ : STD_LOGIC;
  signal \hdmi_d_q[15]_i_4_n_0\ : STD_LOGIC;
  signal \hdmi_d_q[15]_i_5_n_0\ : STD_LOGIC;
  signal \hdmi_d_q[15]_i_6_n_0\ : STD_LOGIC;
  signal \hdmi_d_q[1]_i_1_n_0\ : STD_LOGIC;
  signal \hdmi_d_q[2]_i_1_n_0\ : STD_LOGIC;
  signal \hdmi_d_q[3]_i_1_n_0\ : STD_LOGIC;
  signal \hdmi_d_q[4]_i_1_n_0\ : STD_LOGIC;
  signal \hdmi_d_q[5]_i_1_n_0\ : STD_LOGIC;
  signal \hdmi_d_q[6]_i_1_n_0\ : STD_LOGIC;
  signal \hdmi_d_q[7]_i_1_n_0\ : STD_LOGIC;
  signal \hdmi_d_q[8]_i_1_n_0\ : STD_LOGIC;
  signal \hdmi_d_q[8]_i_2_n_0\ : STD_LOGIC;
  signal \hdmi_d_q[8]_i_3_n_0\ : STD_LOGIC;
  signal \hdmi_d_q[8]_i_4_n_0\ : STD_LOGIC;
  signal \hdmi_d_q[8]_i_5_n_0\ : STD_LOGIC;
  signal \hdmi_d_q[9]_i_1_n_0\ : STD_LOGIC;
  signal \hdmi_d_q[9]_i_2_n_0\ : STD_LOGIC;
  signal \hdmi_d_q[9]_i_3_n_0\ : STD_LOGIC;
  signal \hdmi_d_q[9]_i_4_n_0\ : STD_LOGIC;
  signal hdmi_de_i_1_n_0 : STD_LOGIC;
  signal hdmi_hsync_i_1_n_0 : STD_LOGIC;
  signal hdmi_vsync_i_1_n_0 : STD_LOGIC;
  signal i2c_scl_low : STD_LOGIC;
  signal i2c_scl_low_i_1_n_0 : STD_LOGIC;
  signal i2c_sda_low : STD_LOGIC;
  signal i2c_sda_low_1 : STD_LOGIC;
  signal i2c_sda_low_i_1_n_0 : STD_LOGIC;
  signal in10 : STD_LOGIC_VECTOR ( 31 downto 5 );
  signal lb_rdata0 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \lb_rdata[0]_i_1_n_0\ : STD_LOGIC;
  signal \lb_rdata[0]_i_5_n_0\ : STD_LOGIC;
  signal \lb_rdata[0]_i_6_n_0\ : STD_LOGIC;
  signal \lb_rdata[0]_i_7_n_0\ : STD_LOGIC;
  signal \lb_rdata[0]_i_8_n_0\ : STD_LOGIC;
  signal \lb_rdata[10]_i_1_n_0\ : STD_LOGIC;
  signal \lb_rdata[10]_i_5_n_0\ : STD_LOGIC;
  signal \lb_rdata[10]_i_6_n_0\ : STD_LOGIC;
  signal \lb_rdata[10]_i_7_n_0\ : STD_LOGIC;
  signal \lb_rdata[10]_i_8_n_0\ : STD_LOGIC;
  signal \lb_rdata[11]_i_1_n_0\ : STD_LOGIC;
  signal \lb_rdata[11]_i_5_n_0\ : STD_LOGIC;
  signal \lb_rdata[11]_i_6_n_0\ : STD_LOGIC;
  signal \lb_rdata[11]_i_7_n_0\ : STD_LOGIC;
  signal \lb_rdata[11]_i_8_n_0\ : STD_LOGIC;
  signal \lb_rdata[12]_i_1_n_0\ : STD_LOGIC;
  signal \lb_rdata[12]_i_5_n_0\ : STD_LOGIC;
  signal \lb_rdata[12]_i_6_n_0\ : STD_LOGIC;
  signal \lb_rdata[12]_i_7_n_0\ : STD_LOGIC;
  signal \lb_rdata[12]_i_8_n_0\ : STD_LOGIC;
  signal \lb_rdata[13]_i_1_n_0\ : STD_LOGIC;
  signal \lb_rdata[13]_i_5_n_0\ : STD_LOGIC;
  signal \lb_rdata[13]_i_6_n_0\ : STD_LOGIC;
  signal \lb_rdata[13]_i_7_n_0\ : STD_LOGIC;
  signal \lb_rdata[13]_i_8_n_0\ : STD_LOGIC;
  signal \lb_rdata[14]_i_1_n_0\ : STD_LOGIC;
  signal \lb_rdata[14]_i_5_n_0\ : STD_LOGIC;
  signal \lb_rdata[14]_i_6_n_0\ : STD_LOGIC;
  signal \lb_rdata[14]_i_7_n_0\ : STD_LOGIC;
  signal \lb_rdata[14]_i_8_n_0\ : STD_LOGIC;
  signal \lb_rdata[15]_i_1_n_0\ : STD_LOGIC;
  signal \lb_rdata[15]_i_5_n_0\ : STD_LOGIC;
  signal \lb_rdata[15]_i_6_n_0\ : STD_LOGIC;
  signal \lb_rdata[15]_i_7_n_0\ : STD_LOGIC;
  signal \lb_rdata[15]_i_8_n_0\ : STD_LOGIC;
  signal \lb_rdata[16]_i_1_n_0\ : STD_LOGIC;
  signal \lb_rdata[16]_i_5_n_0\ : STD_LOGIC;
  signal \lb_rdata[16]_i_6_n_0\ : STD_LOGIC;
  signal \lb_rdata[16]_i_7_n_0\ : STD_LOGIC;
  signal \lb_rdata[16]_i_8_n_0\ : STD_LOGIC;
  signal \lb_rdata[17]_i_1_n_0\ : STD_LOGIC;
  signal \lb_rdata[17]_i_5_n_0\ : STD_LOGIC;
  signal \lb_rdata[17]_i_6_n_0\ : STD_LOGIC;
  signal \lb_rdata[17]_i_7_n_0\ : STD_LOGIC;
  signal \lb_rdata[17]_i_8_n_0\ : STD_LOGIC;
  signal \lb_rdata[18]_i_1_n_0\ : STD_LOGIC;
  signal \lb_rdata[18]_i_5_n_0\ : STD_LOGIC;
  signal \lb_rdata[18]_i_6_n_0\ : STD_LOGIC;
  signal \lb_rdata[18]_i_7_n_0\ : STD_LOGIC;
  signal \lb_rdata[18]_i_8_n_0\ : STD_LOGIC;
  signal \lb_rdata[19]_i_1_n_0\ : STD_LOGIC;
  signal \lb_rdata[19]_i_5_n_0\ : STD_LOGIC;
  signal \lb_rdata[19]_i_6_n_0\ : STD_LOGIC;
  signal \lb_rdata[19]_i_7_n_0\ : STD_LOGIC;
  signal \lb_rdata[19]_i_8_n_0\ : STD_LOGIC;
  signal \lb_rdata[1]_i_1_n_0\ : STD_LOGIC;
  signal \lb_rdata[1]_i_5_n_0\ : STD_LOGIC;
  signal \lb_rdata[1]_i_6_n_0\ : STD_LOGIC;
  signal \lb_rdata[1]_i_7_n_0\ : STD_LOGIC;
  signal \lb_rdata[1]_i_8_n_0\ : STD_LOGIC;
  signal \lb_rdata[20]_i_1_n_0\ : STD_LOGIC;
  signal \lb_rdata[20]_i_5_n_0\ : STD_LOGIC;
  signal \lb_rdata[20]_i_6_n_0\ : STD_LOGIC;
  signal \lb_rdata[20]_i_7_n_0\ : STD_LOGIC;
  signal \lb_rdata[20]_i_8_n_0\ : STD_LOGIC;
  signal \lb_rdata[21]_i_1_n_0\ : STD_LOGIC;
  signal \lb_rdata[21]_i_5_n_0\ : STD_LOGIC;
  signal \lb_rdata[21]_i_6_n_0\ : STD_LOGIC;
  signal \lb_rdata[21]_i_7_n_0\ : STD_LOGIC;
  signal \lb_rdata[21]_i_8_n_0\ : STD_LOGIC;
  signal \lb_rdata[22]_i_1_n_0\ : STD_LOGIC;
  signal \lb_rdata[22]_i_5_n_0\ : STD_LOGIC;
  signal \lb_rdata[22]_i_6_n_0\ : STD_LOGIC;
  signal \lb_rdata[22]_i_7_n_0\ : STD_LOGIC;
  signal \lb_rdata[22]_i_8_n_0\ : STD_LOGIC;
  signal \lb_rdata[23]_i_1_n_0\ : STD_LOGIC;
  signal \lb_rdata[23]_i_5_n_0\ : STD_LOGIC;
  signal \lb_rdata[23]_i_6_n_0\ : STD_LOGIC;
  signal \lb_rdata[23]_i_7_n_0\ : STD_LOGIC;
  signal \lb_rdata[23]_i_8_n_0\ : STD_LOGIC;
  signal \lb_rdata[24]_i_1_n_0\ : STD_LOGIC;
  signal \lb_rdata[24]_i_5_n_0\ : STD_LOGIC;
  signal \lb_rdata[24]_i_6_n_0\ : STD_LOGIC;
  signal \lb_rdata[24]_i_7_n_0\ : STD_LOGIC;
  signal \lb_rdata[24]_i_8_n_0\ : STD_LOGIC;
  signal \lb_rdata[25]_i_1_n_0\ : STD_LOGIC;
  signal \lb_rdata[25]_i_5_n_0\ : STD_LOGIC;
  signal \lb_rdata[25]_i_6_n_0\ : STD_LOGIC;
  signal \lb_rdata[25]_i_7_n_0\ : STD_LOGIC;
  signal \lb_rdata[25]_i_8_n_0\ : STD_LOGIC;
  signal \lb_rdata[26]_i_1_n_0\ : STD_LOGIC;
  signal \lb_rdata[26]_i_5_n_0\ : STD_LOGIC;
  signal \lb_rdata[26]_i_6_n_0\ : STD_LOGIC;
  signal \lb_rdata[26]_i_7_n_0\ : STD_LOGIC;
  signal \lb_rdata[26]_i_8_n_0\ : STD_LOGIC;
  signal \lb_rdata[27]_i_1_n_0\ : STD_LOGIC;
  signal \lb_rdata[27]_i_5_n_0\ : STD_LOGIC;
  signal \lb_rdata[27]_i_6_n_0\ : STD_LOGIC;
  signal \lb_rdata[27]_i_7_n_0\ : STD_LOGIC;
  signal \lb_rdata[27]_i_8_n_0\ : STD_LOGIC;
  signal \lb_rdata[28]_i_1_n_0\ : STD_LOGIC;
  signal \lb_rdata[28]_i_5_n_0\ : STD_LOGIC;
  signal \lb_rdata[28]_i_6_n_0\ : STD_LOGIC;
  signal \lb_rdata[28]_i_7_n_0\ : STD_LOGIC;
  signal \lb_rdata[28]_i_8_n_0\ : STD_LOGIC;
  signal \lb_rdata[29]_i_1_n_0\ : STD_LOGIC;
  signal \lb_rdata[29]_i_5_n_0\ : STD_LOGIC;
  signal \lb_rdata[29]_i_6_n_0\ : STD_LOGIC;
  signal \lb_rdata[29]_i_7_n_0\ : STD_LOGIC;
  signal \lb_rdata[29]_i_8_n_0\ : STD_LOGIC;
  signal \lb_rdata[2]_i_1_n_0\ : STD_LOGIC;
  signal \lb_rdata[2]_i_5_n_0\ : STD_LOGIC;
  signal \lb_rdata[2]_i_6_n_0\ : STD_LOGIC;
  signal \lb_rdata[2]_i_7_n_0\ : STD_LOGIC;
  signal \lb_rdata[2]_i_8_n_0\ : STD_LOGIC;
  signal \lb_rdata[30]_i_1_n_0\ : STD_LOGIC;
  signal \lb_rdata[30]_i_5_n_0\ : STD_LOGIC;
  signal \lb_rdata[30]_i_6_n_0\ : STD_LOGIC;
  signal \lb_rdata[30]_i_7_n_0\ : STD_LOGIC;
  signal \lb_rdata[30]_i_8_n_0\ : STD_LOGIC;
  signal \lb_rdata[31]_i_10_n_0\ : STD_LOGIC;
  signal \lb_rdata[31]_i_11_n_0\ : STD_LOGIC;
  signal \lb_rdata[31]_i_1_n_0\ : STD_LOGIC;
  signal \lb_rdata[31]_i_2_n_0\ : STD_LOGIC;
  signal \lb_rdata[31]_i_4_n_0\ : STD_LOGIC;
  signal \lb_rdata[31]_i_8_n_0\ : STD_LOGIC;
  signal \lb_rdata[31]_i_9_n_0\ : STD_LOGIC;
  signal \lb_rdata[3]_i_1_n_0\ : STD_LOGIC;
  signal \lb_rdata[3]_i_5_n_0\ : STD_LOGIC;
  signal \lb_rdata[3]_i_6_n_0\ : STD_LOGIC;
  signal \lb_rdata[3]_i_7_n_0\ : STD_LOGIC;
  signal \lb_rdata[3]_i_8_n_0\ : STD_LOGIC;
  signal \lb_rdata[4]_i_1_n_0\ : STD_LOGIC;
  signal \lb_rdata[4]_i_5_n_0\ : STD_LOGIC;
  signal \lb_rdata[4]_i_6_n_0\ : STD_LOGIC;
  signal \lb_rdata[4]_i_7_n_0\ : STD_LOGIC;
  signal \lb_rdata[4]_i_8_n_0\ : STD_LOGIC;
  signal \lb_rdata[5]_i_1_n_0\ : STD_LOGIC;
  signal \lb_rdata[5]_i_5_n_0\ : STD_LOGIC;
  signal \lb_rdata[5]_i_6_n_0\ : STD_LOGIC;
  signal \lb_rdata[5]_i_7_n_0\ : STD_LOGIC;
  signal \lb_rdata[5]_i_8_n_0\ : STD_LOGIC;
  signal \lb_rdata[6]_i_1_n_0\ : STD_LOGIC;
  signal \lb_rdata[6]_i_5_n_0\ : STD_LOGIC;
  signal \lb_rdata[6]_i_6_n_0\ : STD_LOGIC;
  signal \lb_rdata[6]_i_7_n_0\ : STD_LOGIC;
  signal \lb_rdata[6]_i_8_n_0\ : STD_LOGIC;
  signal \lb_rdata[7]_i_1_n_0\ : STD_LOGIC;
  signal \lb_rdata[7]_i_5_n_0\ : STD_LOGIC;
  signal \lb_rdata[7]_i_6_n_0\ : STD_LOGIC;
  signal \lb_rdata[7]_i_7_n_0\ : STD_LOGIC;
  signal \lb_rdata[7]_i_8_n_0\ : STD_LOGIC;
  signal \lb_rdata[8]_i_1_n_0\ : STD_LOGIC;
  signal \lb_rdata[8]_i_5_n_0\ : STD_LOGIC;
  signal \lb_rdata[8]_i_6_n_0\ : STD_LOGIC;
  signal \lb_rdata[8]_i_7_n_0\ : STD_LOGIC;
  signal \lb_rdata[8]_i_8_n_0\ : STD_LOGIC;
  signal \lb_rdata[9]_i_1_n_0\ : STD_LOGIC;
  signal \lb_rdata[9]_i_5_n_0\ : STD_LOGIC;
  signal \lb_rdata[9]_i_6_n_0\ : STD_LOGIC;
  signal \lb_rdata[9]_i_7_n_0\ : STD_LOGIC;
  signal \lb_rdata[9]_i_8_n_0\ : STD_LOGIC;
  signal \lb_rdata_reg[0]_i_3_n_0\ : STD_LOGIC;
  signal \lb_rdata_reg[0]_i_4_n_0\ : STD_LOGIC;
  signal \lb_rdata_reg[10]_i_3_n_0\ : STD_LOGIC;
  signal \lb_rdata_reg[10]_i_4_n_0\ : STD_LOGIC;
  signal \lb_rdata_reg[11]_i_3_n_0\ : STD_LOGIC;
  signal \lb_rdata_reg[11]_i_4_n_0\ : STD_LOGIC;
  signal \lb_rdata_reg[12]_i_3_n_0\ : STD_LOGIC;
  signal \lb_rdata_reg[12]_i_4_n_0\ : STD_LOGIC;
  signal \lb_rdata_reg[13]_i_3_n_0\ : STD_LOGIC;
  signal \lb_rdata_reg[13]_i_4_n_0\ : STD_LOGIC;
  signal \lb_rdata_reg[14]_i_3_n_0\ : STD_LOGIC;
  signal \lb_rdata_reg[14]_i_4_n_0\ : STD_LOGIC;
  signal \lb_rdata_reg[15]_i_3_n_0\ : STD_LOGIC;
  signal \lb_rdata_reg[15]_i_4_n_0\ : STD_LOGIC;
  signal \lb_rdata_reg[16]_i_3_n_0\ : STD_LOGIC;
  signal \lb_rdata_reg[16]_i_4_n_0\ : STD_LOGIC;
  signal \lb_rdata_reg[17]_i_3_n_0\ : STD_LOGIC;
  signal \lb_rdata_reg[17]_i_4_n_0\ : STD_LOGIC;
  signal \lb_rdata_reg[18]_i_3_n_0\ : STD_LOGIC;
  signal \lb_rdata_reg[18]_i_4_n_0\ : STD_LOGIC;
  signal \lb_rdata_reg[19]_i_3_n_0\ : STD_LOGIC;
  signal \lb_rdata_reg[19]_i_4_n_0\ : STD_LOGIC;
  signal \lb_rdata_reg[1]_i_3_n_0\ : STD_LOGIC;
  signal \lb_rdata_reg[1]_i_4_n_0\ : STD_LOGIC;
  signal \lb_rdata_reg[20]_i_3_n_0\ : STD_LOGIC;
  signal \lb_rdata_reg[20]_i_4_n_0\ : STD_LOGIC;
  signal \lb_rdata_reg[21]_i_3_n_0\ : STD_LOGIC;
  signal \lb_rdata_reg[21]_i_4_n_0\ : STD_LOGIC;
  signal \lb_rdata_reg[22]_i_3_n_0\ : STD_LOGIC;
  signal \lb_rdata_reg[22]_i_4_n_0\ : STD_LOGIC;
  signal \lb_rdata_reg[23]_i_3_n_0\ : STD_LOGIC;
  signal \lb_rdata_reg[23]_i_4_n_0\ : STD_LOGIC;
  signal \lb_rdata_reg[24]_i_3_n_0\ : STD_LOGIC;
  signal \lb_rdata_reg[24]_i_4_n_0\ : STD_LOGIC;
  signal \lb_rdata_reg[25]_i_3_n_0\ : STD_LOGIC;
  signal \lb_rdata_reg[25]_i_4_n_0\ : STD_LOGIC;
  signal \lb_rdata_reg[26]_i_3_n_0\ : STD_LOGIC;
  signal \lb_rdata_reg[26]_i_4_n_0\ : STD_LOGIC;
  signal \lb_rdata_reg[27]_i_3_n_0\ : STD_LOGIC;
  signal \lb_rdata_reg[27]_i_4_n_0\ : STD_LOGIC;
  signal \lb_rdata_reg[28]_i_3_n_0\ : STD_LOGIC;
  signal \lb_rdata_reg[28]_i_4_n_0\ : STD_LOGIC;
  signal \lb_rdata_reg[29]_i_3_n_0\ : STD_LOGIC;
  signal \lb_rdata_reg[29]_i_4_n_0\ : STD_LOGIC;
  signal \lb_rdata_reg[2]_i_3_n_0\ : STD_LOGIC;
  signal \lb_rdata_reg[2]_i_4_n_0\ : STD_LOGIC;
  signal \lb_rdata_reg[30]_i_3_n_0\ : STD_LOGIC;
  signal \lb_rdata_reg[30]_i_4_n_0\ : STD_LOGIC;
  signal \lb_rdata_reg[31]_i_5_n_0\ : STD_LOGIC;
  signal \lb_rdata_reg[31]_i_6_n_0\ : STD_LOGIC;
  signal \lb_rdata_reg[3]_i_3_n_0\ : STD_LOGIC;
  signal \lb_rdata_reg[3]_i_4_n_0\ : STD_LOGIC;
  signal \lb_rdata_reg[4]_i_3_n_0\ : STD_LOGIC;
  signal \lb_rdata_reg[4]_i_4_n_0\ : STD_LOGIC;
  signal \lb_rdata_reg[5]_i_3_n_0\ : STD_LOGIC;
  signal \lb_rdata_reg[5]_i_4_n_0\ : STD_LOGIC;
  signal \lb_rdata_reg[6]_i_3_n_0\ : STD_LOGIC;
  signal \lb_rdata_reg[6]_i_4_n_0\ : STD_LOGIC;
  signal \lb_rdata_reg[7]_i_3_n_0\ : STD_LOGIC;
  signal \lb_rdata_reg[7]_i_4_n_0\ : STD_LOGIC;
  signal \lb_rdata_reg[8]_i_3_n_0\ : STD_LOGIC;
  signal \lb_rdata_reg[8]_i_4_n_0\ : STD_LOGIC;
  signal \lb_rdata_reg[9]_i_3_n_0\ : STD_LOGIC;
  signal \lb_rdata_reg[9]_i_4_n_0\ : STD_LOGIC;
  signal \lb_rdata_reg_n_0_[0]\ : STD_LOGIC;
  signal \lb_rdata_reg_n_0_[10]\ : STD_LOGIC;
  signal \lb_rdata_reg_n_0_[11]\ : STD_LOGIC;
  signal \lb_rdata_reg_n_0_[12]\ : STD_LOGIC;
  signal \lb_rdata_reg_n_0_[13]\ : STD_LOGIC;
  signal \lb_rdata_reg_n_0_[14]\ : STD_LOGIC;
  signal \lb_rdata_reg_n_0_[15]\ : STD_LOGIC;
  signal \lb_rdata_reg_n_0_[16]\ : STD_LOGIC;
  signal \lb_rdata_reg_n_0_[17]\ : STD_LOGIC;
  signal \lb_rdata_reg_n_0_[18]\ : STD_LOGIC;
  signal \lb_rdata_reg_n_0_[19]\ : STD_LOGIC;
  signal \lb_rdata_reg_n_0_[1]\ : STD_LOGIC;
  signal \lb_rdata_reg_n_0_[20]\ : STD_LOGIC;
  signal \lb_rdata_reg_n_0_[21]\ : STD_LOGIC;
  signal \lb_rdata_reg_n_0_[22]\ : STD_LOGIC;
  signal \lb_rdata_reg_n_0_[23]\ : STD_LOGIC;
  signal \lb_rdata_reg_n_0_[24]\ : STD_LOGIC;
  signal \lb_rdata_reg_n_0_[25]\ : STD_LOGIC;
  signal \lb_rdata_reg_n_0_[26]\ : STD_LOGIC;
  signal \lb_rdata_reg_n_0_[27]\ : STD_LOGIC;
  signal \lb_rdata_reg_n_0_[28]\ : STD_LOGIC;
  signal \lb_rdata_reg_n_0_[29]\ : STD_LOGIC;
  signal \lb_rdata_reg_n_0_[2]\ : STD_LOGIC;
  signal \lb_rdata_reg_n_0_[30]\ : STD_LOGIC;
  signal \lb_rdata_reg_n_0_[31]\ : STD_LOGIC;
  signal \lb_rdata_reg_n_0_[3]\ : STD_LOGIC;
  signal \lb_rdata_reg_n_0_[4]\ : STD_LOGIC;
  signal \lb_rdata_reg_n_0_[5]\ : STD_LOGIC;
  signal \lb_rdata_reg_n_0_[6]\ : STD_LOGIC;
  signal \lb_rdata_reg_n_0_[7]\ : STD_LOGIC;
  signal \lb_rdata_reg_n_0_[8]\ : STD_LOGIC;
  signal \lb_rdata_reg_n_0_[9]\ : STD_LOGIC;
  signal lb_waddr : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \lb_waddr__0\ : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal lb_wdata : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal lb_we : STD_LOGIC;
  signal line_req_num : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \line_req_num[0]_i_1_n_0\ : STD_LOGIC;
  signal line_req_tgl : STD_LOGIC;
  signal line_req_tgl0 : STD_LOGIC;
  signal line_req_tgl_i_1_n_0 : STD_LOGIC;
  signal linebuf_reg_r1_0_63_0_2_i_1_n_0 : STD_LOGIC;
  signal linebuf_reg_r1_0_63_0_2_n_0 : STD_LOGIC;
  signal linebuf_reg_r1_0_63_0_2_n_1 : STD_LOGIC;
  signal linebuf_reg_r1_0_63_0_2_n_2 : STD_LOGIC;
  signal linebuf_reg_r1_0_63_12_14_n_0 : STD_LOGIC;
  signal linebuf_reg_r1_0_63_12_14_n_1 : STD_LOGIC;
  signal linebuf_reg_r1_0_63_12_14_n_2 : STD_LOGIC;
  signal linebuf_reg_r1_0_63_15_17_n_0 : STD_LOGIC;
  signal linebuf_reg_r1_0_63_15_17_n_1 : STD_LOGIC;
  signal linebuf_reg_r1_0_63_15_17_n_2 : STD_LOGIC;
  signal linebuf_reg_r1_0_63_18_20_n_0 : STD_LOGIC;
  signal linebuf_reg_r1_0_63_18_20_n_1 : STD_LOGIC;
  signal linebuf_reg_r1_0_63_18_20_n_2 : STD_LOGIC;
  signal linebuf_reg_r1_0_63_21_23_n_0 : STD_LOGIC;
  signal linebuf_reg_r1_0_63_21_23_n_1 : STD_LOGIC;
  signal linebuf_reg_r1_0_63_21_23_n_2 : STD_LOGIC;
  signal linebuf_reg_r1_0_63_24_26_n_0 : STD_LOGIC;
  signal linebuf_reg_r1_0_63_24_26_n_1 : STD_LOGIC;
  signal linebuf_reg_r1_0_63_24_26_n_2 : STD_LOGIC;
  signal linebuf_reg_r1_0_63_27_29_n_0 : STD_LOGIC;
  signal linebuf_reg_r1_0_63_27_29_n_1 : STD_LOGIC;
  signal linebuf_reg_r1_0_63_27_29_n_2 : STD_LOGIC;
  signal linebuf_reg_r1_0_63_30_31_n_0 : STD_LOGIC;
  signal linebuf_reg_r1_0_63_30_31_n_1 : STD_LOGIC;
  signal linebuf_reg_r1_0_63_3_5_n_0 : STD_LOGIC;
  signal linebuf_reg_r1_0_63_3_5_n_1 : STD_LOGIC;
  signal linebuf_reg_r1_0_63_3_5_n_2 : STD_LOGIC;
  signal linebuf_reg_r1_0_63_6_8_n_0 : STD_LOGIC;
  signal linebuf_reg_r1_0_63_6_8_n_1 : STD_LOGIC;
  signal linebuf_reg_r1_0_63_6_8_n_2 : STD_LOGIC;
  signal linebuf_reg_r1_0_63_9_11_n_0 : STD_LOGIC;
  signal linebuf_reg_r1_0_63_9_11_n_1 : STD_LOGIC;
  signal linebuf_reg_r1_0_63_9_11_n_2 : STD_LOGIC;
  signal linebuf_reg_r1_512_575_0_2_i_1_n_0 : STD_LOGIC;
  signal linebuf_reg_r1_512_575_0_2_n_0 : STD_LOGIC;
  signal linebuf_reg_r1_512_575_0_2_n_1 : STD_LOGIC;
  signal linebuf_reg_r1_512_575_0_2_n_2 : STD_LOGIC;
  signal linebuf_reg_r1_512_575_12_14_n_0 : STD_LOGIC;
  signal linebuf_reg_r1_512_575_12_14_n_1 : STD_LOGIC;
  signal linebuf_reg_r1_512_575_12_14_n_2 : STD_LOGIC;
  signal linebuf_reg_r1_512_575_15_17_n_0 : STD_LOGIC;
  signal linebuf_reg_r1_512_575_15_17_n_1 : STD_LOGIC;
  signal linebuf_reg_r1_512_575_15_17_n_2 : STD_LOGIC;
  signal linebuf_reg_r1_512_575_18_20_n_0 : STD_LOGIC;
  signal linebuf_reg_r1_512_575_18_20_n_1 : STD_LOGIC;
  signal linebuf_reg_r1_512_575_18_20_n_2 : STD_LOGIC;
  signal linebuf_reg_r1_512_575_21_23_n_0 : STD_LOGIC;
  signal linebuf_reg_r1_512_575_21_23_n_1 : STD_LOGIC;
  signal linebuf_reg_r1_512_575_21_23_n_2 : STD_LOGIC;
  signal linebuf_reg_r1_512_575_24_26_n_0 : STD_LOGIC;
  signal linebuf_reg_r1_512_575_24_26_n_1 : STD_LOGIC;
  signal linebuf_reg_r1_512_575_24_26_n_2 : STD_LOGIC;
  signal linebuf_reg_r1_512_575_27_29_n_0 : STD_LOGIC;
  signal linebuf_reg_r1_512_575_27_29_n_1 : STD_LOGIC;
  signal linebuf_reg_r1_512_575_27_29_n_2 : STD_LOGIC;
  signal linebuf_reg_r1_512_575_30_31_n_0 : STD_LOGIC;
  signal linebuf_reg_r1_512_575_30_31_n_1 : STD_LOGIC;
  signal linebuf_reg_r1_512_575_3_5_n_0 : STD_LOGIC;
  signal linebuf_reg_r1_512_575_3_5_n_1 : STD_LOGIC;
  signal linebuf_reg_r1_512_575_3_5_n_2 : STD_LOGIC;
  signal linebuf_reg_r1_512_575_6_8_n_0 : STD_LOGIC;
  signal linebuf_reg_r1_512_575_6_8_n_1 : STD_LOGIC;
  signal linebuf_reg_r1_512_575_6_8_n_2 : STD_LOGIC;
  signal linebuf_reg_r1_512_575_9_11_n_0 : STD_LOGIC;
  signal linebuf_reg_r1_512_575_9_11_n_1 : STD_LOGIC;
  signal linebuf_reg_r1_512_575_9_11_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_0_63_0_2_i_3_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_0_63_0_2_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_0_63_0_2_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_0_63_0_2_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_0_63_12_14_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_0_63_12_14_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_0_63_12_14_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_0_63_15_17_i_1_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_0_63_15_17_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_0_63_15_17_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_0_63_15_17_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_0_63_18_20_i_1_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_0_63_18_20_i_2_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_0_63_18_20_i_3_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_0_63_18_20_i_4_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_0_63_18_20_i_5_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_0_63_18_20_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_0_63_18_20_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_0_63_18_20_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_0_63_21_23_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_0_63_21_23_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_0_63_21_23_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_0_63_24_26_i_1_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_0_63_24_26_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_0_63_24_26_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_0_63_24_26_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_0_63_27_29_i_1_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_0_63_27_29_i_2_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_0_63_27_29_i_3_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_0_63_27_29_i_4_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_0_63_27_29_i_5_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_0_63_27_29_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_0_63_27_29_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_0_63_27_29_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_0_63_30_31_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_0_63_30_31_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_0_63_3_5_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_0_63_3_5_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_0_63_3_5_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_0_63_6_8_i_1_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_0_63_6_8_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_0_63_6_8_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_0_63_6_8_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_0_63_9_11_i_1_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_0_63_9_11_i_2_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_0_63_9_11_i_3_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_0_63_9_11_i_4_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_0_63_9_11_i_5_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_0_63_9_11_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_0_63_9_11_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_0_63_9_11_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_128_191_0_2_i_1_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_128_191_0_2_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_128_191_0_2_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_128_191_0_2_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_128_191_12_14_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_128_191_12_14_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_128_191_12_14_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_128_191_15_17_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_128_191_15_17_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_128_191_15_17_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_128_191_18_20_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_128_191_18_20_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_128_191_18_20_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_128_191_21_23_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_128_191_21_23_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_128_191_21_23_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_128_191_24_26_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_128_191_24_26_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_128_191_24_26_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_128_191_27_29_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_128_191_27_29_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_128_191_27_29_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_128_191_30_31_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_128_191_30_31_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_128_191_3_5_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_128_191_3_5_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_128_191_3_5_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_128_191_6_8_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_128_191_6_8_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_128_191_6_8_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_128_191_9_11_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_128_191_9_11_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_128_191_9_11_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_192_255_0_2_i_1_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_192_255_0_2_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_192_255_0_2_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_192_255_0_2_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_192_255_12_14_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_192_255_12_14_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_192_255_12_14_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_192_255_15_17_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_192_255_15_17_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_192_255_15_17_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_192_255_18_20_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_192_255_18_20_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_192_255_18_20_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_192_255_21_23_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_192_255_21_23_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_192_255_21_23_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_192_255_24_26_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_192_255_24_26_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_192_255_24_26_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_192_255_27_29_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_192_255_27_29_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_192_255_27_29_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_192_255_30_31_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_192_255_30_31_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_192_255_3_5_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_192_255_3_5_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_192_255_3_5_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_192_255_6_8_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_192_255_6_8_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_192_255_6_8_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_192_255_9_11_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_192_255_9_11_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_192_255_9_11_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_256_319_0_2_i_1_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_256_319_0_2_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_256_319_0_2_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_256_319_0_2_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_256_319_12_14_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_256_319_12_14_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_256_319_12_14_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_256_319_15_17_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_256_319_15_17_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_256_319_15_17_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_256_319_18_20_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_256_319_18_20_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_256_319_18_20_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_256_319_21_23_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_256_319_21_23_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_256_319_21_23_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_256_319_24_26_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_256_319_24_26_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_256_319_24_26_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_256_319_27_29_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_256_319_27_29_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_256_319_27_29_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_256_319_30_31_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_256_319_30_31_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_256_319_3_5_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_256_319_3_5_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_256_319_3_5_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_256_319_6_8_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_256_319_6_8_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_256_319_6_8_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_256_319_9_11_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_256_319_9_11_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_256_319_9_11_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_320_383_0_2_i_1_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_320_383_0_2_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_320_383_0_2_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_320_383_0_2_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_320_383_12_14_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_320_383_12_14_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_320_383_12_14_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_320_383_15_17_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_320_383_15_17_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_320_383_15_17_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_320_383_18_20_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_320_383_18_20_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_320_383_18_20_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_320_383_21_23_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_320_383_21_23_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_320_383_21_23_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_320_383_24_26_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_320_383_24_26_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_320_383_24_26_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_320_383_27_29_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_320_383_27_29_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_320_383_27_29_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_320_383_30_31_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_320_383_30_31_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_320_383_3_5_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_320_383_3_5_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_320_383_3_5_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_320_383_6_8_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_320_383_6_8_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_320_383_6_8_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_320_383_9_11_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_320_383_9_11_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_320_383_9_11_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_384_447_0_2_i_1_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_384_447_0_2_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_384_447_0_2_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_384_447_0_2_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_384_447_12_14_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_384_447_12_14_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_384_447_12_14_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_384_447_15_17_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_384_447_15_17_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_384_447_15_17_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_384_447_18_20_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_384_447_18_20_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_384_447_18_20_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_384_447_21_23_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_384_447_21_23_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_384_447_21_23_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_384_447_24_26_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_384_447_24_26_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_384_447_24_26_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_384_447_27_29_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_384_447_27_29_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_384_447_27_29_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_384_447_30_31_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_384_447_30_31_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_384_447_3_5_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_384_447_3_5_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_384_447_3_5_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_384_447_6_8_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_384_447_6_8_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_384_447_6_8_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_384_447_9_11_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_384_447_9_11_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_384_447_9_11_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_448_511_0_2_i_1_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_448_511_0_2_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_448_511_0_2_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_448_511_0_2_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_448_511_12_14_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_448_511_12_14_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_448_511_12_14_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_448_511_15_17_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_448_511_15_17_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_448_511_15_17_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_448_511_18_20_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_448_511_18_20_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_448_511_18_20_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_448_511_21_23_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_448_511_21_23_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_448_511_21_23_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_448_511_24_26_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_448_511_24_26_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_448_511_24_26_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_448_511_27_29_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_448_511_27_29_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_448_511_27_29_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_448_511_30_31_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_448_511_30_31_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_448_511_3_5_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_448_511_3_5_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_448_511_3_5_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_448_511_6_8_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_448_511_6_8_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_448_511_6_8_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_448_511_9_11_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_448_511_9_11_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_448_511_9_11_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_512_575_0_2_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_512_575_0_2_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_512_575_0_2_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_512_575_12_14_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_512_575_12_14_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_512_575_12_14_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_512_575_15_17_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_512_575_15_17_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_512_575_15_17_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_512_575_18_20_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_512_575_18_20_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_512_575_18_20_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_512_575_21_23_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_512_575_21_23_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_512_575_21_23_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_512_575_24_26_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_512_575_24_26_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_512_575_24_26_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_512_575_27_29_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_512_575_27_29_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_512_575_27_29_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_512_575_30_31_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_512_575_30_31_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_512_575_3_5_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_512_575_3_5_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_512_575_3_5_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_512_575_6_8_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_512_575_6_8_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_512_575_6_8_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_512_575_9_11_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_512_575_9_11_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_512_575_9_11_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_576_639_0_2_i_1_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_576_639_0_2_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_576_639_0_2_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_576_639_0_2_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_576_639_12_14_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_576_639_12_14_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_576_639_12_14_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_576_639_15_17_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_576_639_15_17_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_576_639_15_17_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_576_639_18_20_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_576_639_18_20_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_576_639_18_20_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_576_639_21_23_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_576_639_21_23_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_576_639_21_23_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_576_639_24_26_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_576_639_24_26_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_576_639_24_26_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_576_639_27_29_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_576_639_27_29_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_576_639_27_29_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_576_639_30_31_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_576_639_30_31_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_576_639_3_5_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_576_639_3_5_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_576_639_3_5_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_576_639_6_8_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_576_639_6_8_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_576_639_6_8_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_576_639_9_11_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_576_639_9_11_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_576_639_9_11_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_640_703_0_2_i_1_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_640_703_0_2_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_640_703_0_2_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_640_703_0_2_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_640_703_12_14_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_640_703_12_14_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_640_703_12_14_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_640_703_15_17_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_640_703_15_17_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_640_703_15_17_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_640_703_18_20_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_640_703_18_20_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_640_703_18_20_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_640_703_21_23_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_640_703_21_23_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_640_703_21_23_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_640_703_24_26_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_640_703_24_26_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_640_703_24_26_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_640_703_27_29_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_640_703_27_29_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_640_703_27_29_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_640_703_30_31_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_640_703_30_31_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_640_703_3_5_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_640_703_3_5_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_640_703_3_5_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_640_703_6_8_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_640_703_6_8_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_640_703_6_8_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_640_703_9_11_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_640_703_9_11_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_640_703_9_11_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_64_127_0_2_i_1_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_64_127_0_2_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_64_127_0_2_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_64_127_0_2_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_64_127_12_14_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_64_127_12_14_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_64_127_12_14_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_64_127_15_17_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_64_127_15_17_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_64_127_15_17_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_64_127_18_20_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_64_127_18_20_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_64_127_18_20_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_64_127_21_23_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_64_127_21_23_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_64_127_21_23_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_64_127_24_26_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_64_127_24_26_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_64_127_24_26_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_64_127_27_29_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_64_127_27_29_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_64_127_27_29_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_64_127_30_31_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_64_127_30_31_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_64_127_3_5_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_64_127_3_5_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_64_127_3_5_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_64_127_6_8_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_64_127_6_8_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_64_127_6_8_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_64_127_9_11_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_64_127_9_11_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_64_127_9_11_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_704_767_0_2_i_1_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_704_767_0_2_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_704_767_0_2_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_704_767_0_2_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_704_767_12_14_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_704_767_12_14_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_704_767_12_14_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_704_767_15_17_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_704_767_15_17_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_704_767_15_17_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_704_767_18_20_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_704_767_18_20_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_704_767_18_20_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_704_767_21_23_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_704_767_21_23_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_704_767_21_23_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_704_767_24_26_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_704_767_24_26_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_704_767_24_26_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_704_767_27_29_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_704_767_27_29_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_704_767_27_29_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_704_767_30_31_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_704_767_30_31_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_704_767_3_5_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_704_767_3_5_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_704_767_3_5_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_704_767_6_8_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_704_767_6_8_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_704_767_6_8_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_704_767_9_11_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_704_767_9_11_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_704_767_9_11_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_768_831_0_2_i_1_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_768_831_0_2_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_768_831_0_2_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_768_831_0_2_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_768_831_12_14_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_768_831_12_14_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_768_831_12_14_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_768_831_15_17_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_768_831_15_17_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_768_831_15_17_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_768_831_18_20_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_768_831_18_20_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_768_831_18_20_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_768_831_21_23_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_768_831_21_23_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_768_831_21_23_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_768_831_24_26_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_768_831_24_26_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_768_831_24_26_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_768_831_27_29_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_768_831_27_29_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_768_831_27_29_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_768_831_30_31_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_768_831_30_31_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_768_831_3_5_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_768_831_3_5_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_768_831_3_5_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_768_831_6_8_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_768_831_6_8_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_768_831_6_8_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_768_831_9_11_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_768_831_9_11_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_768_831_9_11_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_832_895_0_2_i_1_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_832_895_0_2_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_832_895_0_2_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_832_895_0_2_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_832_895_12_14_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_832_895_12_14_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_832_895_12_14_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_832_895_15_17_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_832_895_15_17_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_832_895_15_17_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_832_895_18_20_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_832_895_18_20_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_832_895_18_20_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_832_895_21_23_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_832_895_21_23_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_832_895_21_23_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_832_895_24_26_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_832_895_24_26_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_832_895_24_26_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_832_895_27_29_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_832_895_27_29_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_832_895_27_29_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_832_895_30_31_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_832_895_30_31_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_832_895_3_5_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_832_895_3_5_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_832_895_3_5_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_832_895_6_8_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_832_895_6_8_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_832_895_6_8_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_832_895_9_11_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_832_895_9_11_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_832_895_9_11_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_896_959_0_2_i_1_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_896_959_0_2_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_896_959_0_2_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_896_959_0_2_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_896_959_12_14_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_896_959_12_14_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_896_959_12_14_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_896_959_15_17_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_896_959_15_17_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_896_959_15_17_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_896_959_18_20_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_896_959_18_20_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_896_959_18_20_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_896_959_21_23_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_896_959_21_23_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_896_959_21_23_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_896_959_24_26_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_896_959_24_26_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_896_959_24_26_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_896_959_27_29_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_896_959_27_29_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_896_959_27_29_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_896_959_30_31_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_896_959_30_31_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_896_959_3_5_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_896_959_3_5_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_896_959_3_5_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_896_959_6_8_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_896_959_6_8_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_896_959_6_8_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_896_959_9_11_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_896_959_9_11_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_896_959_9_11_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_960_1023_0_2_i_1_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_960_1023_0_2_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_960_1023_0_2_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_960_1023_0_2_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_960_1023_12_14_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_960_1023_12_14_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_960_1023_12_14_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_960_1023_15_17_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_960_1023_15_17_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_960_1023_15_17_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_960_1023_18_20_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_960_1023_18_20_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_960_1023_18_20_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_960_1023_21_23_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_960_1023_21_23_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_960_1023_21_23_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_960_1023_24_26_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_960_1023_24_26_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_960_1023_24_26_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_960_1023_27_29_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_960_1023_27_29_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_960_1023_27_29_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_960_1023_30_31_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_960_1023_30_31_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_960_1023_3_5_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_960_1023_3_5_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_960_1023_3_5_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_960_1023_6_8_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_960_1023_6_8_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_960_1023_6_8_n_2 : STD_LOGIC;
  signal linebuf_reg_r2_960_1023_9_11_n_0 : STD_LOGIC;
  signal linebuf_reg_r2_960_1023_9_11_n_1 : STD_LOGIC;
  signal linebuf_reg_r2_960_1023_9_11_n_2 : STD_LOGIC;
  signal \^m_axi_hp_araddr\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \^m_axi_hp_arvalid\ : STD_LOGIC;
  signal mono_p1 : STD_LOGIC;
  signal mono_p2 : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal p_0_in0 : STD_LOGIC;
  signal p_0_in_2 : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal p_1_in : STD_LOGIC;
  signal p_3_in : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \pix_alive[0]_i_2_n_0\ : STD_LOGIC;
  signal \pix_alive_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \pix_alive_reg[0]_i_1_n_1\ : STD_LOGIC;
  signal \pix_alive_reg[0]_i_1_n_2\ : STD_LOGIC;
  signal \pix_alive_reg[0]_i_1_n_3\ : STD_LOGIC;
  signal \pix_alive_reg[0]_i_1_n_4\ : STD_LOGIC;
  signal \pix_alive_reg[0]_i_1_n_5\ : STD_LOGIC;
  signal \pix_alive_reg[0]_i_1_n_6\ : STD_LOGIC;
  signal \pix_alive_reg[0]_i_1_n_7\ : STD_LOGIC;
  signal \pix_alive_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \pix_alive_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \pix_alive_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \pix_alive_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \pix_alive_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \pix_alive_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \pix_alive_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \pix_alive_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \pix_alive_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \pix_alive_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \pix_alive_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \pix_alive_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \pix_alive_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \pix_alive_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \pix_alive_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \pix_alive_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \pix_alive_reg[20]_i_1_n_1\ : STD_LOGIC;
  signal \pix_alive_reg[20]_i_1_n_2\ : STD_LOGIC;
  signal \pix_alive_reg[20]_i_1_n_3\ : STD_LOGIC;
  signal \pix_alive_reg[20]_i_1_n_4\ : STD_LOGIC;
  signal \pix_alive_reg[20]_i_1_n_5\ : STD_LOGIC;
  signal \pix_alive_reg[20]_i_1_n_6\ : STD_LOGIC;
  signal \pix_alive_reg[20]_i_1_n_7\ : STD_LOGIC;
  signal \pix_alive_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \pix_alive_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \pix_alive_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \pix_alive_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \pix_alive_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \pix_alive_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \pix_alive_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \pix_alive_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \pix_alive_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \pix_alive_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \pix_alive_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \pix_alive_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \pix_alive_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \pix_alive_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \pix_alive_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \pix_alive_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \pix_alive_reg_n_0_[0]\ : STD_LOGIC;
  signal \pix_alive_reg_n_0_[10]\ : STD_LOGIC;
  signal \pix_alive_reg_n_0_[11]\ : STD_LOGIC;
  signal \pix_alive_reg_n_0_[12]\ : STD_LOGIC;
  signal \pix_alive_reg_n_0_[13]\ : STD_LOGIC;
  signal \pix_alive_reg_n_0_[14]\ : STD_LOGIC;
  signal \pix_alive_reg_n_0_[15]\ : STD_LOGIC;
  signal \pix_alive_reg_n_0_[1]\ : STD_LOGIC;
  signal \pix_alive_reg_n_0_[2]\ : STD_LOGIC;
  signal \pix_alive_reg_n_0_[3]\ : STD_LOGIC;
  signal \pix_alive_reg_n_0_[4]\ : STD_LOGIC;
  signal \pix_alive_reg_n_0_[5]\ : STD_LOGIC;
  signal \pix_alive_reg_n_0_[6]\ : STD_LOGIC;
  signal \pix_alive_reg_n_0_[7]\ : STD_LOGIC;
  signal \pix_alive_reg_n_0_[8]\ : STD_LOGIC;
  signal \pix_alive_reg_n_0_[9]\ : STD_LOGIC;
  signal pix_alive_s1 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal rd_addr_next : STD_LOGIC_VECTOR ( 9 to 9 );
  signal rd_addr_next0 : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \rdata_q[0]_i_1_n_0\ : STD_LOGIC;
  signal \rdata_q[0]_i_2_n_0\ : STD_LOGIC;
  signal \rdata_q[10]_i_1_n_0\ : STD_LOGIC;
  signal \rdata_q[11]_i_1_n_0\ : STD_LOGIC;
  signal \rdata_q[12]_i_1_n_0\ : STD_LOGIC;
  signal \rdata_q[13]_i_1_n_0\ : STD_LOGIC;
  signal \rdata_q[14]_i_1_n_0\ : STD_LOGIC;
  signal \rdata_q[15]_i_1_n_0\ : STD_LOGIC;
  signal \rdata_q[16]_i_1_n_0\ : STD_LOGIC;
  signal \rdata_q[17]_i_1_n_0\ : STD_LOGIC;
  signal \rdata_q[18]_i_1_n_0\ : STD_LOGIC;
  signal \rdata_q[19]_i_1_n_0\ : STD_LOGIC;
  signal \rdata_q[1]_i_1_n_0\ : STD_LOGIC;
  signal \rdata_q[20]_i_1_n_0\ : STD_LOGIC;
  signal \rdata_q[21]_i_1_n_0\ : STD_LOGIC;
  signal \rdata_q[22]_i_1_n_0\ : STD_LOGIC;
  signal \rdata_q[23]_i_1_n_0\ : STD_LOGIC;
  signal \rdata_q[24]_i_1_n_0\ : STD_LOGIC;
  signal \rdata_q[25]_i_1_n_0\ : STD_LOGIC;
  signal \rdata_q[26]_i_1_n_0\ : STD_LOGIC;
  signal \rdata_q[27]_i_1_n_0\ : STD_LOGIC;
  signal \rdata_q[28]_i_1_n_0\ : STD_LOGIC;
  signal \rdata_q[29]_i_1_n_0\ : STD_LOGIC;
  signal \rdata_q[2]_i_1_n_0\ : STD_LOGIC;
  signal \rdata_q[30]_i_1_n_0\ : STD_LOGIC;
  signal \rdata_q[31]_i_1_n_0\ : STD_LOGIC;
  signal \rdata_q[31]_i_3_n_0\ : STD_LOGIC;
  signal \rdata_q[31]_i_4_n_0\ : STD_LOGIC;
  signal \rdata_q[3]_i_1_n_0\ : STD_LOGIC;
  signal \rdata_q[4]_i_1_n_0\ : STD_LOGIC;
  signal \rdata_q[5]_i_1_n_0\ : STD_LOGIC;
  signal \rdata_q[6]_i_1_n_0\ : STD_LOGIC;
  signal \rdata_q[7]_i_1_n_0\ : STD_LOGIC;
  signal \rdata_q[8]_i_1_n_0\ : STD_LOGIC;
  signal \rdata_q[9]_i_1_n_0\ : STD_LOGIC;
  signal rvalid_q0 : STD_LOGIC;
  signal rvalid_q_i_1_n_0 : STD_LOGIC;
  signal \^rvalid_q_reg_0\ : STD_LOGIC;
  signal scl_in : STD_LOGIC;
  signal sda_in : STD_LOGIC;
  signal st_overrun_i_1_n_0 : STD_LOGIC;
  signal st_overrun_i_2_n_0 : STD_LOGIC;
  signal t_s1 : STD_LOGIC;
  signal t_s2 : STD_LOGIC;
  signal t_s3 : STD_LOGIC;
  signal tp_p1 : STD_LOGIC;
  signal tp_p2 : STD_LOGIC;
  signal u_iobuf_sda_i_1_n_0 : STD_LOGIC;
  signal vcnt : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \vcnt[3]_i_2_n_0\ : STD_LOGIC;
  signal \vcnt[8]_i_2_n_0\ : STD_LOGIC;
  signal \vcnt[9]_i_1_n_0\ : STD_LOGIC;
  signal \vcnt[9]_i_4_n_0\ : STD_LOGIC;
  signal \vcnt[9]_i_5_n_0\ : STD_LOGIC;
  signal \vcnt[9]_i_6_n_0\ : STD_LOGIC;
  signal \vcnt[9]_i_7_n_0\ : STD_LOGIC;
  signal \vcnt[9]_i_8_n_0\ : STD_LOGIC;
  signal \vcnt__0\ : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal \vcnt_reg_n_0_[1]\ : STD_LOGIC;
  signal \vcnt_reg_n_0_[2]\ : STD_LOGIC;
  signal \vcnt_reg_n_0_[3]\ : STD_LOGIC;
  signal \vcnt_reg_n_0_[4]\ : STD_LOGIC;
  signal \vcnt_reg_n_0_[5]\ : STD_LOGIC;
  signal \vcnt_reg_n_0_[6]\ : STD_LOGIC;
  signal \vcnt_reg_n_0_[7]\ : STD_LOGIC;
  signal \vcnt_reg_n_0_[8]\ : STD_LOGIC;
  signal \vcnt_reg_n_0_[9]\ : STD_LOGIC;
  signal \vga_q[0]_i_1_n_0\ : STD_LOGIC;
  signal \vga_q[1]_i_1_n_0\ : STD_LOGIC;
  signal \vga_q[1]_i_2_n_0\ : STD_LOGIC;
  signal \vga_q[2]_i_1_n_0\ : STD_LOGIC;
  signal \vga_q[2]_i_2_n_0\ : STD_LOGIC;
  signal \vga_q[3]_i_1_n_0\ : STD_LOGIC;
  signal \vga_q[3]_i_2_n_0\ : STD_LOGIC;
  signal w_done_i_1_n_0 : STD_LOGIC;
  signal w_done_reg_n_0 : STD_LOGIC;
  signal \wdata_q[31]_i_1_n_0\ : STD_LOGIC;
  signal \wdata_q_reg_n_0_[0]\ : STD_LOGIC;
  signal \wdata_q_reg_n_0_[10]\ : STD_LOGIC;
  signal \wdata_q_reg_n_0_[11]\ : STD_LOGIC;
  signal \wdata_q_reg_n_0_[12]\ : STD_LOGIC;
  signal \wdata_q_reg_n_0_[13]\ : STD_LOGIC;
  signal \wdata_q_reg_n_0_[14]\ : STD_LOGIC;
  signal \wdata_q_reg_n_0_[15]\ : STD_LOGIC;
  signal \wdata_q_reg_n_0_[16]\ : STD_LOGIC;
  signal \wdata_q_reg_n_0_[17]\ : STD_LOGIC;
  signal \wdata_q_reg_n_0_[18]\ : STD_LOGIC;
  signal \wdata_q_reg_n_0_[19]\ : STD_LOGIC;
  signal \wdata_q_reg_n_0_[1]\ : STD_LOGIC;
  signal \wdata_q_reg_n_0_[20]\ : STD_LOGIC;
  signal \wdata_q_reg_n_0_[21]\ : STD_LOGIC;
  signal \wdata_q_reg_n_0_[22]\ : STD_LOGIC;
  signal \wdata_q_reg_n_0_[23]\ : STD_LOGIC;
  signal \wdata_q_reg_n_0_[24]\ : STD_LOGIC;
  signal \wdata_q_reg_n_0_[25]\ : STD_LOGIC;
  signal \wdata_q_reg_n_0_[26]\ : STD_LOGIC;
  signal \wdata_q_reg_n_0_[27]\ : STD_LOGIC;
  signal \wdata_q_reg_n_0_[28]\ : STD_LOGIC;
  signal \wdata_q_reg_n_0_[29]\ : STD_LOGIC;
  signal \wdata_q_reg_n_0_[2]\ : STD_LOGIC;
  signal \wdata_q_reg_n_0_[30]\ : STD_LOGIC;
  signal \wdata_q_reg_n_0_[31]\ : STD_LOGIC;
  signal \wdata_q_reg_n_0_[3]\ : STD_LOGIC;
  signal \wdata_q_reg_n_0_[4]\ : STD_LOGIC;
  signal \wdata_q_reg_n_0_[6]\ : STD_LOGIC;
  signal \wdata_q_reg_n_0_[7]\ : STD_LOGIC;
  signal \wdata_q_reg_n_0_[8]\ : STD_LOGIC;
  signal \wdata_q_reg_n_0_[9]\ : STD_LOGIC;
  signal wready_q_i_1_n_0 : STD_LOGIC;
  signal \^wready_q_reg_0\ : STD_LOGIC;
  signal ycs_p1 : STD_LOGIC;
  signal ycs_p2 : STD_LOGIC;
  signal NLW_f_addr0_CARRYCASCOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_f_addr0_MULTSIGNOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_f_addr0_OVERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_f_addr0_PATTERNBDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_f_addr0_PATTERNDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_f_addr0_UNDERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_f_addr0_ACOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal NLW_f_addr0_BCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal NLW_f_addr0_CARRYOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_f_addr0_P_UNCONNECTED : STD_LOGIC_VECTOR ( 47 downto 32 );
  signal NLW_f_addr0_PCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 47 downto 0 );
  signal \NLW_f_addr0_carry__5_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_f_addr0_carry__5_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal NLW_linebuf_reg_r1_0_63_0_2_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r1_0_63_12_14_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r1_0_63_15_17_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r1_0_63_18_20_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r1_0_63_21_23_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r1_0_63_24_26_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r1_0_63_27_29_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r1_0_63_30_31_DOC_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r1_0_63_30_31_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r1_0_63_3_5_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r1_0_63_6_8_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r1_0_63_9_11_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r1_512_575_0_2_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r1_512_575_12_14_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r1_512_575_15_17_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r1_512_575_18_20_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r1_512_575_21_23_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r1_512_575_24_26_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r1_512_575_27_29_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r1_512_575_30_31_DOC_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r1_512_575_30_31_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r1_512_575_3_5_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r1_512_575_6_8_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r1_512_575_9_11_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_0_63_0_2_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_0_63_12_14_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_0_63_15_17_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_0_63_18_20_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_0_63_21_23_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_0_63_24_26_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_0_63_27_29_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_0_63_30_31_DOC_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_0_63_30_31_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_0_63_3_5_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_0_63_6_8_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_0_63_9_11_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_128_191_0_2_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_128_191_12_14_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_128_191_15_17_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_128_191_18_20_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_128_191_21_23_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_128_191_24_26_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_128_191_27_29_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_128_191_30_31_DOC_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_128_191_30_31_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_128_191_3_5_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_128_191_6_8_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_128_191_9_11_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_192_255_0_2_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_192_255_12_14_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_192_255_15_17_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_192_255_18_20_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_192_255_21_23_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_192_255_24_26_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_192_255_27_29_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_192_255_30_31_DOC_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_192_255_30_31_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_192_255_3_5_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_192_255_6_8_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_192_255_9_11_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_256_319_0_2_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_256_319_12_14_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_256_319_15_17_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_256_319_18_20_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_256_319_21_23_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_256_319_24_26_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_256_319_27_29_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_256_319_30_31_DOC_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_256_319_30_31_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_256_319_3_5_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_256_319_6_8_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_256_319_9_11_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_320_383_0_2_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_320_383_12_14_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_320_383_15_17_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_320_383_18_20_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_320_383_21_23_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_320_383_24_26_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_320_383_27_29_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_320_383_30_31_DOC_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_320_383_30_31_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_320_383_3_5_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_320_383_6_8_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_320_383_9_11_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_384_447_0_2_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_384_447_12_14_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_384_447_15_17_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_384_447_18_20_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_384_447_21_23_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_384_447_24_26_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_384_447_27_29_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_384_447_30_31_DOC_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_384_447_30_31_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_384_447_3_5_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_384_447_6_8_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_384_447_9_11_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_448_511_0_2_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_448_511_12_14_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_448_511_15_17_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_448_511_18_20_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_448_511_21_23_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_448_511_24_26_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_448_511_27_29_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_448_511_30_31_DOC_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_448_511_30_31_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_448_511_3_5_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_448_511_6_8_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_448_511_9_11_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_512_575_0_2_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_512_575_12_14_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_512_575_15_17_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_512_575_18_20_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_512_575_21_23_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_512_575_24_26_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_512_575_27_29_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_512_575_30_31_DOC_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_512_575_30_31_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_512_575_3_5_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_512_575_6_8_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_512_575_9_11_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_576_639_0_2_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_576_639_12_14_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_576_639_15_17_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_576_639_18_20_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_576_639_21_23_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_576_639_24_26_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_576_639_27_29_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_576_639_30_31_DOC_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_576_639_30_31_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_576_639_3_5_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_576_639_6_8_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_576_639_9_11_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_640_703_0_2_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_640_703_12_14_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_640_703_15_17_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_640_703_18_20_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_640_703_21_23_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_640_703_24_26_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_640_703_27_29_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_640_703_30_31_DOC_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_640_703_30_31_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_640_703_3_5_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_640_703_6_8_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_640_703_9_11_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_64_127_0_2_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_64_127_12_14_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_64_127_15_17_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_64_127_18_20_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_64_127_21_23_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_64_127_24_26_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_64_127_27_29_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_64_127_30_31_DOC_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_64_127_30_31_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_64_127_3_5_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_64_127_6_8_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_64_127_9_11_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_704_767_0_2_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_704_767_12_14_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_704_767_15_17_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_704_767_18_20_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_704_767_21_23_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_704_767_24_26_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_704_767_27_29_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_704_767_30_31_DOC_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_704_767_30_31_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_704_767_3_5_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_704_767_6_8_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_704_767_9_11_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_768_831_0_2_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_768_831_12_14_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_768_831_15_17_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_768_831_18_20_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_768_831_21_23_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_768_831_24_26_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_768_831_27_29_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_768_831_30_31_DOC_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_768_831_30_31_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_768_831_3_5_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_768_831_6_8_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_768_831_9_11_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_832_895_0_2_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_832_895_12_14_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_832_895_15_17_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_832_895_18_20_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_832_895_21_23_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_832_895_24_26_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_832_895_27_29_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_832_895_30_31_DOC_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_832_895_30_31_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_832_895_3_5_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_832_895_6_8_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_832_895_9_11_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_896_959_0_2_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_896_959_12_14_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_896_959_15_17_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_896_959_18_20_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_896_959_21_23_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_896_959_24_26_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_896_959_27_29_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_896_959_30_31_DOC_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_896_959_30_31_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_896_959_3_5_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_896_959_6_8_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_896_959_9_11_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_960_1023_0_2_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_960_1023_12_14_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_960_1023_15_17_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_960_1023_18_20_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_960_1023_21_23_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_960_1023_24_26_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_960_1023_27_29_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_960_1023_30_31_DOC_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_960_1023_30_31_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_960_1023_3_5_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_960_1023_6_8_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_linebuf_reg_r2_960_1023_9_11_DOD_UNCONNECTED : STD_LOGIC;
  signal \NLW_pix_alive_reg[20]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal NLW_u_clk_fwd_R_UNCONNECTED : STD_LOGIC;
  signal NLW_u_clk_fwd_S_UNCONNECTED : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_sequential_fstate[0]_i_2\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \FSM_sequential_fstate[1]_i_1\ : label is "soft_lutpair4";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_fstate_reg[0]\ : label is "F_DATA:10,F_AR:01,F_IDLE:00";
  attribute FSM_ENCODED_STATES of \FSM_sequential_fstate_reg[1]\ : label is "F_DATA:10,F_AR:01,F_IDLE:00";
  attribute SOFT_HLUTNM of arvalid_q2_i_2 : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of arvalid_q2_i_4 : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of bvalid_q_i_1 : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of ctrl_enable_i_2 : label is "soft_lutpair18";
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of f_addr0 : label is "{SYNTH-11 {cell *THIS*}}";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of f_addr0_carry : label is 35;
  attribute ADDER_THRESHOLD of \f_addr0_carry__0\ : label is 35;
  attribute ADDER_THRESHOLD of \f_addr0_carry__1\ : label is 35;
  attribute ADDER_THRESHOLD of \f_addr0_carry__2\ : label is 35;
  attribute ADDER_THRESHOLD of \f_addr0_carry__3\ : label is 35;
  attribute ADDER_THRESHOLD of \f_addr0_carry__4\ : label is 35;
  attribute ADDER_THRESHOLD of \f_addr0_carry__5\ : label is 35;
  attribute SOFT_HLUTNM of f_addr0_i_2 : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of f_addr0_i_3 : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of f_addr0_i_6 : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of f_addr0_i_7 : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \f_addr[0]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \f_addr[31]_i_4\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \f_addr[31]_i_5\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \f_burst[0]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \f_burst[1]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \f_burst[2]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \f_word[1]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \f_word[2]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \f_word[5]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \f_word[6]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \frame_cnt_pix[2]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \frame_cnt_pix[3]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \frame_cnt_pix[5]_i_2\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \frame_cnt_pix[7]_i_3\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \frame_cnt_pix[7]_i_5\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \frame_cnt_pix[7]_i_6\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \hcnt[0]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \hcnt[1]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \hcnt[2]_i_1\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \hcnt[3]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \hcnt[4]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \hcnt[6]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \hcnt[7]_i_2\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \hcnt[8]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \hcnt[9]_i_2\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \hdmi_d_q[0]_i_1\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \hdmi_d_q[10]_i_4\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \hdmi_d_q[11]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \hdmi_d_q[12]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \hdmi_d_q[12]_i_3\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \hdmi_d_q[13]_i_1\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \hdmi_d_q[13]_i_3\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \hdmi_d_q[13]_i_4\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \hdmi_d_q[14]_i_1\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \hdmi_d_q[14]_i_3\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \hdmi_d_q[14]_i_4\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \hdmi_d_q[15]_i_3\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \hdmi_d_q[3]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \hdmi_d_q[4]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \hdmi_d_q[5]_i_1\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \hdmi_d_q[6]_i_1\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \hdmi_d_q[8]_i_1\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \hdmi_d_q[8]_i_4\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \hdmi_d_q[8]_i_5\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \hdmi_d_q[9]_i_3\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \hdmi_d_q[9]_i_4\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of i2c_scl_low_i_1 : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of i2c_sda_low_i_1 : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \line_req_num[0]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of line_req_tgl_i_1 : label is "soft_lutpair21";
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r1_0_63_0_2 : label is "";
  attribute RTL_RAM_BITS : integer;
  attribute RTL_RAM_BITS of linebuf_reg_r1_0_63_0_2 : label is 32768;
  attribute RTL_RAM_NAME : string;
  attribute RTL_RAM_NAME of linebuf_reg_r1_0_63_0_2 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE : string;
  attribute RTL_RAM_STYLE of linebuf_reg_r1_0_63_0_2 : label is "auto";
  attribute RTL_RAM_TYPE : string;
  attribute RTL_RAM_TYPE of linebuf_reg_r1_0_63_0_2 : label is "RAM_SDP";
  attribute ram_addr_begin : integer;
  attribute ram_addr_begin of linebuf_reg_r1_0_63_0_2 : label is 0;
  attribute ram_addr_end : integer;
  attribute ram_addr_end of linebuf_reg_r1_0_63_0_2 : label is 63;
  attribute ram_offset : integer;
  attribute ram_offset of linebuf_reg_r1_0_63_0_2 : label is 0;
  attribute ram_slice_begin : integer;
  attribute ram_slice_begin of linebuf_reg_r1_0_63_0_2 : label is 0;
  attribute ram_slice_end : integer;
  attribute ram_slice_end of linebuf_reg_r1_0_63_0_2 : label is 2;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r1_0_63_12_14 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r1_0_63_12_14 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r1_0_63_12_14 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r1_0_63_12_14 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r1_0_63_12_14 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r1_0_63_12_14 : label is 0;
  attribute ram_addr_end of linebuf_reg_r1_0_63_12_14 : label is 63;
  attribute ram_offset of linebuf_reg_r1_0_63_12_14 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r1_0_63_12_14 : label is 12;
  attribute ram_slice_end of linebuf_reg_r1_0_63_12_14 : label is 14;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r1_0_63_15_17 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r1_0_63_15_17 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r1_0_63_15_17 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r1_0_63_15_17 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r1_0_63_15_17 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r1_0_63_15_17 : label is 0;
  attribute ram_addr_end of linebuf_reg_r1_0_63_15_17 : label is 63;
  attribute ram_offset of linebuf_reg_r1_0_63_15_17 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r1_0_63_15_17 : label is 15;
  attribute ram_slice_end of linebuf_reg_r1_0_63_15_17 : label is 17;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r1_0_63_18_20 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r1_0_63_18_20 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r1_0_63_18_20 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r1_0_63_18_20 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r1_0_63_18_20 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r1_0_63_18_20 : label is 0;
  attribute ram_addr_end of linebuf_reg_r1_0_63_18_20 : label is 63;
  attribute ram_offset of linebuf_reg_r1_0_63_18_20 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r1_0_63_18_20 : label is 18;
  attribute ram_slice_end of linebuf_reg_r1_0_63_18_20 : label is 20;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r1_0_63_21_23 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r1_0_63_21_23 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r1_0_63_21_23 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r1_0_63_21_23 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r1_0_63_21_23 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r1_0_63_21_23 : label is 0;
  attribute ram_addr_end of linebuf_reg_r1_0_63_21_23 : label is 63;
  attribute ram_offset of linebuf_reg_r1_0_63_21_23 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r1_0_63_21_23 : label is 21;
  attribute ram_slice_end of linebuf_reg_r1_0_63_21_23 : label is 23;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r1_0_63_24_26 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r1_0_63_24_26 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r1_0_63_24_26 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r1_0_63_24_26 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r1_0_63_24_26 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r1_0_63_24_26 : label is 0;
  attribute ram_addr_end of linebuf_reg_r1_0_63_24_26 : label is 63;
  attribute ram_offset of linebuf_reg_r1_0_63_24_26 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r1_0_63_24_26 : label is 24;
  attribute ram_slice_end of linebuf_reg_r1_0_63_24_26 : label is 26;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r1_0_63_27_29 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r1_0_63_27_29 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r1_0_63_27_29 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r1_0_63_27_29 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r1_0_63_27_29 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r1_0_63_27_29 : label is 0;
  attribute ram_addr_end of linebuf_reg_r1_0_63_27_29 : label is 63;
  attribute ram_offset of linebuf_reg_r1_0_63_27_29 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r1_0_63_27_29 : label is 27;
  attribute ram_slice_end of linebuf_reg_r1_0_63_27_29 : label is 29;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r1_0_63_30_31 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r1_0_63_30_31 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r1_0_63_30_31 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r1_0_63_30_31 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r1_0_63_30_31 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r1_0_63_30_31 : label is 0;
  attribute ram_addr_end of linebuf_reg_r1_0_63_30_31 : label is 63;
  attribute ram_offset of linebuf_reg_r1_0_63_30_31 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r1_0_63_30_31 : label is 30;
  attribute ram_slice_end of linebuf_reg_r1_0_63_30_31 : label is 31;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r1_0_63_3_5 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r1_0_63_3_5 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r1_0_63_3_5 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r1_0_63_3_5 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r1_0_63_3_5 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r1_0_63_3_5 : label is 0;
  attribute ram_addr_end of linebuf_reg_r1_0_63_3_5 : label is 63;
  attribute ram_offset of linebuf_reg_r1_0_63_3_5 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r1_0_63_3_5 : label is 3;
  attribute ram_slice_end of linebuf_reg_r1_0_63_3_5 : label is 5;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r1_0_63_6_8 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r1_0_63_6_8 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r1_0_63_6_8 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r1_0_63_6_8 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r1_0_63_6_8 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r1_0_63_6_8 : label is 0;
  attribute ram_addr_end of linebuf_reg_r1_0_63_6_8 : label is 63;
  attribute ram_offset of linebuf_reg_r1_0_63_6_8 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r1_0_63_6_8 : label is 6;
  attribute ram_slice_end of linebuf_reg_r1_0_63_6_8 : label is 8;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r1_0_63_9_11 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r1_0_63_9_11 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r1_0_63_9_11 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r1_0_63_9_11 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r1_0_63_9_11 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r1_0_63_9_11 : label is 0;
  attribute ram_addr_end of linebuf_reg_r1_0_63_9_11 : label is 63;
  attribute ram_offset of linebuf_reg_r1_0_63_9_11 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r1_0_63_9_11 : label is 9;
  attribute ram_slice_end of linebuf_reg_r1_0_63_9_11 : label is 11;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r1_512_575_0_2 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r1_512_575_0_2 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r1_512_575_0_2 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r1_512_575_0_2 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r1_512_575_0_2 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r1_512_575_0_2 : label is 512;
  attribute ram_addr_end of linebuf_reg_r1_512_575_0_2 : label is 575;
  attribute ram_offset of linebuf_reg_r1_512_575_0_2 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r1_512_575_0_2 : label is 0;
  attribute ram_slice_end of linebuf_reg_r1_512_575_0_2 : label is 2;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r1_512_575_12_14 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r1_512_575_12_14 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r1_512_575_12_14 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r1_512_575_12_14 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r1_512_575_12_14 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r1_512_575_12_14 : label is 512;
  attribute ram_addr_end of linebuf_reg_r1_512_575_12_14 : label is 575;
  attribute ram_offset of linebuf_reg_r1_512_575_12_14 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r1_512_575_12_14 : label is 12;
  attribute ram_slice_end of linebuf_reg_r1_512_575_12_14 : label is 14;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r1_512_575_15_17 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r1_512_575_15_17 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r1_512_575_15_17 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r1_512_575_15_17 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r1_512_575_15_17 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r1_512_575_15_17 : label is 512;
  attribute ram_addr_end of linebuf_reg_r1_512_575_15_17 : label is 575;
  attribute ram_offset of linebuf_reg_r1_512_575_15_17 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r1_512_575_15_17 : label is 15;
  attribute ram_slice_end of linebuf_reg_r1_512_575_15_17 : label is 17;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r1_512_575_18_20 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r1_512_575_18_20 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r1_512_575_18_20 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r1_512_575_18_20 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r1_512_575_18_20 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r1_512_575_18_20 : label is 512;
  attribute ram_addr_end of linebuf_reg_r1_512_575_18_20 : label is 575;
  attribute ram_offset of linebuf_reg_r1_512_575_18_20 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r1_512_575_18_20 : label is 18;
  attribute ram_slice_end of linebuf_reg_r1_512_575_18_20 : label is 20;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r1_512_575_21_23 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r1_512_575_21_23 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r1_512_575_21_23 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r1_512_575_21_23 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r1_512_575_21_23 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r1_512_575_21_23 : label is 512;
  attribute ram_addr_end of linebuf_reg_r1_512_575_21_23 : label is 575;
  attribute ram_offset of linebuf_reg_r1_512_575_21_23 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r1_512_575_21_23 : label is 21;
  attribute ram_slice_end of linebuf_reg_r1_512_575_21_23 : label is 23;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r1_512_575_24_26 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r1_512_575_24_26 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r1_512_575_24_26 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r1_512_575_24_26 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r1_512_575_24_26 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r1_512_575_24_26 : label is 512;
  attribute ram_addr_end of linebuf_reg_r1_512_575_24_26 : label is 575;
  attribute ram_offset of linebuf_reg_r1_512_575_24_26 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r1_512_575_24_26 : label is 24;
  attribute ram_slice_end of linebuf_reg_r1_512_575_24_26 : label is 26;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r1_512_575_27_29 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r1_512_575_27_29 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r1_512_575_27_29 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r1_512_575_27_29 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r1_512_575_27_29 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r1_512_575_27_29 : label is 512;
  attribute ram_addr_end of linebuf_reg_r1_512_575_27_29 : label is 575;
  attribute ram_offset of linebuf_reg_r1_512_575_27_29 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r1_512_575_27_29 : label is 27;
  attribute ram_slice_end of linebuf_reg_r1_512_575_27_29 : label is 29;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r1_512_575_30_31 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r1_512_575_30_31 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r1_512_575_30_31 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r1_512_575_30_31 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r1_512_575_30_31 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r1_512_575_30_31 : label is 512;
  attribute ram_addr_end of linebuf_reg_r1_512_575_30_31 : label is 575;
  attribute ram_offset of linebuf_reg_r1_512_575_30_31 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r1_512_575_30_31 : label is 30;
  attribute ram_slice_end of linebuf_reg_r1_512_575_30_31 : label is 31;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r1_512_575_3_5 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r1_512_575_3_5 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r1_512_575_3_5 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r1_512_575_3_5 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r1_512_575_3_5 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r1_512_575_3_5 : label is 512;
  attribute ram_addr_end of linebuf_reg_r1_512_575_3_5 : label is 575;
  attribute ram_offset of linebuf_reg_r1_512_575_3_5 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r1_512_575_3_5 : label is 3;
  attribute ram_slice_end of linebuf_reg_r1_512_575_3_5 : label is 5;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r1_512_575_6_8 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r1_512_575_6_8 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r1_512_575_6_8 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r1_512_575_6_8 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r1_512_575_6_8 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r1_512_575_6_8 : label is 512;
  attribute ram_addr_end of linebuf_reg_r1_512_575_6_8 : label is 575;
  attribute ram_offset of linebuf_reg_r1_512_575_6_8 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r1_512_575_6_8 : label is 6;
  attribute ram_slice_end of linebuf_reg_r1_512_575_6_8 : label is 8;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r1_512_575_9_11 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r1_512_575_9_11 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r1_512_575_9_11 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r1_512_575_9_11 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r1_512_575_9_11 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r1_512_575_9_11 : label is 512;
  attribute ram_addr_end of linebuf_reg_r1_512_575_9_11 : label is 575;
  attribute ram_offset of linebuf_reg_r1_512_575_9_11 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r1_512_575_9_11 : label is 9;
  attribute ram_slice_end of linebuf_reg_r1_512_575_9_11 : label is 11;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_0_63_0_2 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_0_63_0_2 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_0_63_0_2 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_0_63_0_2 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_0_63_0_2 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_0_63_0_2 : label is 0;
  attribute ram_addr_end of linebuf_reg_r2_0_63_0_2 : label is 63;
  attribute ram_offset of linebuf_reg_r2_0_63_0_2 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_0_63_0_2 : label is 0;
  attribute ram_slice_end of linebuf_reg_r2_0_63_0_2 : label is 2;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_0_63_12_14 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_0_63_12_14 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_0_63_12_14 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_0_63_12_14 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_0_63_12_14 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_0_63_12_14 : label is 0;
  attribute ram_addr_end of linebuf_reg_r2_0_63_12_14 : label is 63;
  attribute ram_offset of linebuf_reg_r2_0_63_12_14 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_0_63_12_14 : label is 12;
  attribute ram_slice_end of linebuf_reg_r2_0_63_12_14 : label is 14;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_0_63_15_17 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_0_63_15_17 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_0_63_15_17 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_0_63_15_17 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_0_63_15_17 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_0_63_15_17 : label is 0;
  attribute ram_addr_end of linebuf_reg_r2_0_63_15_17 : label is 63;
  attribute ram_offset of linebuf_reg_r2_0_63_15_17 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_0_63_15_17 : label is 15;
  attribute ram_slice_end of linebuf_reg_r2_0_63_15_17 : label is 17;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_0_63_18_20 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_0_63_18_20 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_0_63_18_20 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_0_63_18_20 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_0_63_18_20 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_0_63_18_20 : label is 0;
  attribute ram_addr_end of linebuf_reg_r2_0_63_18_20 : label is 63;
  attribute ram_offset of linebuf_reg_r2_0_63_18_20 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_0_63_18_20 : label is 18;
  attribute ram_slice_end of linebuf_reg_r2_0_63_18_20 : label is 20;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_0_63_21_23 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_0_63_21_23 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_0_63_21_23 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_0_63_21_23 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_0_63_21_23 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_0_63_21_23 : label is 0;
  attribute ram_addr_end of linebuf_reg_r2_0_63_21_23 : label is 63;
  attribute ram_offset of linebuf_reg_r2_0_63_21_23 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_0_63_21_23 : label is 21;
  attribute ram_slice_end of linebuf_reg_r2_0_63_21_23 : label is 23;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_0_63_24_26 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_0_63_24_26 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_0_63_24_26 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_0_63_24_26 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_0_63_24_26 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_0_63_24_26 : label is 0;
  attribute ram_addr_end of linebuf_reg_r2_0_63_24_26 : label is 63;
  attribute ram_offset of linebuf_reg_r2_0_63_24_26 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_0_63_24_26 : label is 24;
  attribute ram_slice_end of linebuf_reg_r2_0_63_24_26 : label is 26;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_0_63_27_29 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_0_63_27_29 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_0_63_27_29 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_0_63_27_29 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_0_63_27_29 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_0_63_27_29 : label is 0;
  attribute ram_addr_end of linebuf_reg_r2_0_63_27_29 : label is 63;
  attribute ram_offset of linebuf_reg_r2_0_63_27_29 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_0_63_27_29 : label is 27;
  attribute ram_slice_end of linebuf_reg_r2_0_63_27_29 : label is 29;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_0_63_30_31 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_0_63_30_31 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_0_63_30_31 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_0_63_30_31 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_0_63_30_31 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_0_63_30_31 : label is 0;
  attribute ram_addr_end of linebuf_reg_r2_0_63_30_31 : label is 63;
  attribute ram_offset of linebuf_reg_r2_0_63_30_31 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_0_63_30_31 : label is 30;
  attribute ram_slice_end of linebuf_reg_r2_0_63_30_31 : label is 31;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_0_63_3_5 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_0_63_3_5 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_0_63_3_5 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_0_63_3_5 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_0_63_3_5 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_0_63_3_5 : label is 0;
  attribute ram_addr_end of linebuf_reg_r2_0_63_3_5 : label is 63;
  attribute ram_offset of linebuf_reg_r2_0_63_3_5 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_0_63_3_5 : label is 3;
  attribute ram_slice_end of linebuf_reg_r2_0_63_3_5 : label is 5;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_0_63_6_8 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_0_63_6_8 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_0_63_6_8 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_0_63_6_8 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_0_63_6_8 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_0_63_6_8 : label is 0;
  attribute ram_addr_end of linebuf_reg_r2_0_63_6_8 : label is 63;
  attribute ram_offset of linebuf_reg_r2_0_63_6_8 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_0_63_6_8 : label is 6;
  attribute ram_slice_end of linebuf_reg_r2_0_63_6_8 : label is 8;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_0_63_9_11 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_0_63_9_11 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_0_63_9_11 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_0_63_9_11 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_0_63_9_11 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_0_63_9_11 : label is 0;
  attribute ram_addr_end of linebuf_reg_r2_0_63_9_11 : label is 63;
  attribute ram_offset of linebuf_reg_r2_0_63_9_11 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_0_63_9_11 : label is 9;
  attribute ram_slice_end of linebuf_reg_r2_0_63_9_11 : label is 11;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_128_191_0_2 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_128_191_0_2 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_128_191_0_2 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_128_191_0_2 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_128_191_0_2 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_128_191_0_2 : label is 128;
  attribute ram_addr_end of linebuf_reg_r2_128_191_0_2 : label is 191;
  attribute ram_offset of linebuf_reg_r2_128_191_0_2 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_128_191_0_2 : label is 0;
  attribute ram_slice_end of linebuf_reg_r2_128_191_0_2 : label is 2;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_128_191_12_14 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_128_191_12_14 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_128_191_12_14 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_128_191_12_14 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_128_191_12_14 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_128_191_12_14 : label is 128;
  attribute ram_addr_end of linebuf_reg_r2_128_191_12_14 : label is 191;
  attribute ram_offset of linebuf_reg_r2_128_191_12_14 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_128_191_12_14 : label is 12;
  attribute ram_slice_end of linebuf_reg_r2_128_191_12_14 : label is 14;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_128_191_15_17 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_128_191_15_17 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_128_191_15_17 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_128_191_15_17 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_128_191_15_17 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_128_191_15_17 : label is 128;
  attribute ram_addr_end of linebuf_reg_r2_128_191_15_17 : label is 191;
  attribute ram_offset of linebuf_reg_r2_128_191_15_17 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_128_191_15_17 : label is 15;
  attribute ram_slice_end of linebuf_reg_r2_128_191_15_17 : label is 17;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_128_191_18_20 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_128_191_18_20 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_128_191_18_20 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_128_191_18_20 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_128_191_18_20 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_128_191_18_20 : label is 128;
  attribute ram_addr_end of linebuf_reg_r2_128_191_18_20 : label is 191;
  attribute ram_offset of linebuf_reg_r2_128_191_18_20 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_128_191_18_20 : label is 18;
  attribute ram_slice_end of linebuf_reg_r2_128_191_18_20 : label is 20;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_128_191_21_23 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_128_191_21_23 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_128_191_21_23 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_128_191_21_23 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_128_191_21_23 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_128_191_21_23 : label is 128;
  attribute ram_addr_end of linebuf_reg_r2_128_191_21_23 : label is 191;
  attribute ram_offset of linebuf_reg_r2_128_191_21_23 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_128_191_21_23 : label is 21;
  attribute ram_slice_end of linebuf_reg_r2_128_191_21_23 : label is 23;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_128_191_24_26 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_128_191_24_26 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_128_191_24_26 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_128_191_24_26 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_128_191_24_26 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_128_191_24_26 : label is 128;
  attribute ram_addr_end of linebuf_reg_r2_128_191_24_26 : label is 191;
  attribute ram_offset of linebuf_reg_r2_128_191_24_26 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_128_191_24_26 : label is 24;
  attribute ram_slice_end of linebuf_reg_r2_128_191_24_26 : label is 26;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_128_191_27_29 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_128_191_27_29 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_128_191_27_29 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_128_191_27_29 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_128_191_27_29 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_128_191_27_29 : label is 128;
  attribute ram_addr_end of linebuf_reg_r2_128_191_27_29 : label is 191;
  attribute ram_offset of linebuf_reg_r2_128_191_27_29 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_128_191_27_29 : label is 27;
  attribute ram_slice_end of linebuf_reg_r2_128_191_27_29 : label is 29;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_128_191_30_31 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_128_191_30_31 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_128_191_30_31 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_128_191_30_31 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_128_191_30_31 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_128_191_30_31 : label is 128;
  attribute ram_addr_end of linebuf_reg_r2_128_191_30_31 : label is 191;
  attribute ram_offset of linebuf_reg_r2_128_191_30_31 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_128_191_30_31 : label is 30;
  attribute ram_slice_end of linebuf_reg_r2_128_191_30_31 : label is 31;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_128_191_3_5 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_128_191_3_5 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_128_191_3_5 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_128_191_3_5 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_128_191_3_5 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_128_191_3_5 : label is 128;
  attribute ram_addr_end of linebuf_reg_r2_128_191_3_5 : label is 191;
  attribute ram_offset of linebuf_reg_r2_128_191_3_5 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_128_191_3_5 : label is 3;
  attribute ram_slice_end of linebuf_reg_r2_128_191_3_5 : label is 5;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_128_191_6_8 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_128_191_6_8 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_128_191_6_8 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_128_191_6_8 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_128_191_6_8 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_128_191_6_8 : label is 128;
  attribute ram_addr_end of linebuf_reg_r2_128_191_6_8 : label is 191;
  attribute ram_offset of linebuf_reg_r2_128_191_6_8 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_128_191_6_8 : label is 6;
  attribute ram_slice_end of linebuf_reg_r2_128_191_6_8 : label is 8;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_128_191_9_11 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_128_191_9_11 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_128_191_9_11 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_128_191_9_11 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_128_191_9_11 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_128_191_9_11 : label is 128;
  attribute ram_addr_end of linebuf_reg_r2_128_191_9_11 : label is 191;
  attribute ram_offset of linebuf_reg_r2_128_191_9_11 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_128_191_9_11 : label is 9;
  attribute ram_slice_end of linebuf_reg_r2_128_191_9_11 : label is 11;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_192_255_0_2 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_192_255_0_2 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_192_255_0_2 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_192_255_0_2 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_192_255_0_2 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_192_255_0_2 : label is 192;
  attribute ram_addr_end of linebuf_reg_r2_192_255_0_2 : label is 255;
  attribute ram_offset of linebuf_reg_r2_192_255_0_2 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_192_255_0_2 : label is 0;
  attribute ram_slice_end of linebuf_reg_r2_192_255_0_2 : label is 2;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_192_255_12_14 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_192_255_12_14 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_192_255_12_14 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_192_255_12_14 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_192_255_12_14 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_192_255_12_14 : label is 192;
  attribute ram_addr_end of linebuf_reg_r2_192_255_12_14 : label is 255;
  attribute ram_offset of linebuf_reg_r2_192_255_12_14 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_192_255_12_14 : label is 12;
  attribute ram_slice_end of linebuf_reg_r2_192_255_12_14 : label is 14;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_192_255_15_17 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_192_255_15_17 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_192_255_15_17 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_192_255_15_17 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_192_255_15_17 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_192_255_15_17 : label is 192;
  attribute ram_addr_end of linebuf_reg_r2_192_255_15_17 : label is 255;
  attribute ram_offset of linebuf_reg_r2_192_255_15_17 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_192_255_15_17 : label is 15;
  attribute ram_slice_end of linebuf_reg_r2_192_255_15_17 : label is 17;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_192_255_18_20 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_192_255_18_20 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_192_255_18_20 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_192_255_18_20 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_192_255_18_20 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_192_255_18_20 : label is 192;
  attribute ram_addr_end of linebuf_reg_r2_192_255_18_20 : label is 255;
  attribute ram_offset of linebuf_reg_r2_192_255_18_20 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_192_255_18_20 : label is 18;
  attribute ram_slice_end of linebuf_reg_r2_192_255_18_20 : label is 20;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_192_255_21_23 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_192_255_21_23 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_192_255_21_23 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_192_255_21_23 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_192_255_21_23 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_192_255_21_23 : label is 192;
  attribute ram_addr_end of linebuf_reg_r2_192_255_21_23 : label is 255;
  attribute ram_offset of linebuf_reg_r2_192_255_21_23 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_192_255_21_23 : label is 21;
  attribute ram_slice_end of linebuf_reg_r2_192_255_21_23 : label is 23;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_192_255_24_26 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_192_255_24_26 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_192_255_24_26 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_192_255_24_26 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_192_255_24_26 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_192_255_24_26 : label is 192;
  attribute ram_addr_end of linebuf_reg_r2_192_255_24_26 : label is 255;
  attribute ram_offset of linebuf_reg_r2_192_255_24_26 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_192_255_24_26 : label is 24;
  attribute ram_slice_end of linebuf_reg_r2_192_255_24_26 : label is 26;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_192_255_27_29 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_192_255_27_29 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_192_255_27_29 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_192_255_27_29 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_192_255_27_29 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_192_255_27_29 : label is 192;
  attribute ram_addr_end of linebuf_reg_r2_192_255_27_29 : label is 255;
  attribute ram_offset of linebuf_reg_r2_192_255_27_29 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_192_255_27_29 : label is 27;
  attribute ram_slice_end of linebuf_reg_r2_192_255_27_29 : label is 29;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_192_255_30_31 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_192_255_30_31 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_192_255_30_31 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_192_255_30_31 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_192_255_30_31 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_192_255_30_31 : label is 192;
  attribute ram_addr_end of linebuf_reg_r2_192_255_30_31 : label is 255;
  attribute ram_offset of linebuf_reg_r2_192_255_30_31 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_192_255_30_31 : label is 30;
  attribute ram_slice_end of linebuf_reg_r2_192_255_30_31 : label is 31;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_192_255_3_5 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_192_255_3_5 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_192_255_3_5 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_192_255_3_5 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_192_255_3_5 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_192_255_3_5 : label is 192;
  attribute ram_addr_end of linebuf_reg_r2_192_255_3_5 : label is 255;
  attribute ram_offset of linebuf_reg_r2_192_255_3_5 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_192_255_3_5 : label is 3;
  attribute ram_slice_end of linebuf_reg_r2_192_255_3_5 : label is 5;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_192_255_6_8 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_192_255_6_8 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_192_255_6_8 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_192_255_6_8 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_192_255_6_8 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_192_255_6_8 : label is 192;
  attribute ram_addr_end of linebuf_reg_r2_192_255_6_8 : label is 255;
  attribute ram_offset of linebuf_reg_r2_192_255_6_8 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_192_255_6_8 : label is 6;
  attribute ram_slice_end of linebuf_reg_r2_192_255_6_8 : label is 8;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_192_255_9_11 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_192_255_9_11 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_192_255_9_11 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_192_255_9_11 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_192_255_9_11 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_192_255_9_11 : label is 192;
  attribute ram_addr_end of linebuf_reg_r2_192_255_9_11 : label is 255;
  attribute ram_offset of linebuf_reg_r2_192_255_9_11 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_192_255_9_11 : label is 9;
  attribute ram_slice_end of linebuf_reg_r2_192_255_9_11 : label is 11;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_256_319_0_2 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_256_319_0_2 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_256_319_0_2 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_256_319_0_2 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_256_319_0_2 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_256_319_0_2 : label is 256;
  attribute ram_addr_end of linebuf_reg_r2_256_319_0_2 : label is 319;
  attribute ram_offset of linebuf_reg_r2_256_319_0_2 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_256_319_0_2 : label is 0;
  attribute ram_slice_end of linebuf_reg_r2_256_319_0_2 : label is 2;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_256_319_12_14 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_256_319_12_14 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_256_319_12_14 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_256_319_12_14 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_256_319_12_14 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_256_319_12_14 : label is 256;
  attribute ram_addr_end of linebuf_reg_r2_256_319_12_14 : label is 319;
  attribute ram_offset of linebuf_reg_r2_256_319_12_14 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_256_319_12_14 : label is 12;
  attribute ram_slice_end of linebuf_reg_r2_256_319_12_14 : label is 14;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_256_319_15_17 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_256_319_15_17 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_256_319_15_17 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_256_319_15_17 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_256_319_15_17 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_256_319_15_17 : label is 256;
  attribute ram_addr_end of linebuf_reg_r2_256_319_15_17 : label is 319;
  attribute ram_offset of linebuf_reg_r2_256_319_15_17 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_256_319_15_17 : label is 15;
  attribute ram_slice_end of linebuf_reg_r2_256_319_15_17 : label is 17;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_256_319_18_20 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_256_319_18_20 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_256_319_18_20 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_256_319_18_20 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_256_319_18_20 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_256_319_18_20 : label is 256;
  attribute ram_addr_end of linebuf_reg_r2_256_319_18_20 : label is 319;
  attribute ram_offset of linebuf_reg_r2_256_319_18_20 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_256_319_18_20 : label is 18;
  attribute ram_slice_end of linebuf_reg_r2_256_319_18_20 : label is 20;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_256_319_21_23 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_256_319_21_23 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_256_319_21_23 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_256_319_21_23 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_256_319_21_23 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_256_319_21_23 : label is 256;
  attribute ram_addr_end of linebuf_reg_r2_256_319_21_23 : label is 319;
  attribute ram_offset of linebuf_reg_r2_256_319_21_23 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_256_319_21_23 : label is 21;
  attribute ram_slice_end of linebuf_reg_r2_256_319_21_23 : label is 23;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_256_319_24_26 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_256_319_24_26 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_256_319_24_26 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_256_319_24_26 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_256_319_24_26 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_256_319_24_26 : label is 256;
  attribute ram_addr_end of linebuf_reg_r2_256_319_24_26 : label is 319;
  attribute ram_offset of linebuf_reg_r2_256_319_24_26 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_256_319_24_26 : label is 24;
  attribute ram_slice_end of linebuf_reg_r2_256_319_24_26 : label is 26;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_256_319_27_29 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_256_319_27_29 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_256_319_27_29 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_256_319_27_29 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_256_319_27_29 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_256_319_27_29 : label is 256;
  attribute ram_addr_end of linebuf_reg_r2_256_319_27_29 : label is 319;
  attribute ram_offset of linebuf_reg_r2_256_319_27_29 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_256_319_27_29 : label is 27;
  attribute ram_slice_end of linebuf_reg_r2_256_319_27_29 : label is 29;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_256_319_30_31 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_256_319_30_31 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_256_319_30_31 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_256_319_30_31 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_256_319_30_31 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_256_319_30_31 : label is 256;
  attribute ram_addr_end of linebuf_reg_r2_256_319_30_31 : label is 319;
  attribute ram_offset of linebuf_reg_r2_256_319_30_31 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_256_319_30_31 : label is 30;
  attribute ram_slice_end of linebuf_reg_r2_256_319_30_31 : label is 31;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_256_319_3_5 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_256_319_3_5 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_256_319_3_5 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_256_319_3_5 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_256_319_3_5 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_256_319_3_5 : label is 256;
  attribute ram_addr_end of linebuf_reg_r2_256_319_3_5 : label is 319;
  attribute ram_offset of linebuf_reg_r2_256_319_3_5 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_256_319_3_5 : label is 3;
  attribute ram_slice_end of linebuf_reg_r2_256_319_3_5 : label is 5;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_256_319_6_8 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_256_319_6_8 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_256_319_6_8 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_256_319_6_8 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_256_319_6_8 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_256_319_6_8 : label is 256;
  attribute ram_addr_end of linebuf_reg_r2_256_319_6_8 : label is 319;
  attribute ram_offset of linebuf_reg_r2_256_319_6_8 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_256_319_6_8 : label is 6;
  attribute ram_slice_end of linebuf_reg_r2_256_319_6_8 : label is 8;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_256_319_9_11 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_256_319_9_11 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_256_319_9_11 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_256_319_9_11 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_256_319_9_11 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_256_319_9_11 : label is 256;
  attribute ram_addr_end of linebuf_reg_r2_256_319_9_11 : label is 319;
  attribute ram_offset of linebuf_reg_r2_256_319_9_11 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_256_319_9_11 : label is 9;
  attribute ram_slice_end of linebuf_reg_r2_256_319_9_11 : label is 11;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_320_383_0_2 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_320_383_0_2 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_320_383_0_2 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_320_383_0_2 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_320_383_0_2 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_320_383_0_2 : label is 320;
  attribute ram_addr_end of linebuf_reg_r2_320_383_0_2 : label is 383;
  attribute ram_offset of linebuf_reg_r2_320_383_0_2 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_320_383_0_2 : label is 0;
  attribute ram_slice_end of linebuf_reg_r2_320_383_0_2 : label is 2;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_320_383_12_14 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_320_383_12_14 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_320_383_12_14 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_320_383_12_14 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_320_383_12_14 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_320_383_12_14 : label is 320;
  attribute ram_addr_end of linebuf_reg_r2_320_383_12_14 : label is 383;
  attribute ram_offset of linebuf_reg_r2_320_383_12_14 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_320_383_12_14 : label is 12;
  attribute ram_slice_end of linebuf_reg_r2_320_383_12_14 : label is 14;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_320_383_15_17 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_320_383_15_17 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_320_383_15_17 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_320_383_15_17 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_320_383_15_17 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_320_383_15_17 : label is 320;
  attribute ram_addr_end of linebuf_reg_r2_320_383_15_17 : label is 383;
  attribute ram_offset of linebuf_reg_r2_320_383_15_17 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_320_383_15_17 : label is 15;
  attribute ram_slice_end of linebuf_reg_r2_320_383_15_17 : label is 17;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_320_383_18_20 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_320_383_18_20 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_320_383_18_20 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_320_383_18_20 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_320_383_18_20 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_320_383_18_20 : label is 320;
  attribute ram_addr_end of linebuf_reg_r2_320_383_18_20 : label is 383;
  attribute ram_offset of linebuf_reg_r2_320_383_18_20 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_320_383_18_20 : label is 18;
  attribute ram_slice_end of linebuf_reg_r2_320_383_18_20 : label is 20;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_320_383_21_23 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_320_383_21_23 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_320_383_21_23 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_320_383_21_23 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_320_383_21_23 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_320_383_21_23 : label is 320;
  attribute ram_addr_end of linebuf_reg_r2_320_383_21_23 : label is 383;
  attribute ram_offset of linebuf_reg_r2_320_383_21_23 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_320_383_21_23 : label is 21;
  attribute ram_slice_end of linebuf_reg_r2_320_383_21_23 : label is 23;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_320_383_24_26 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_320_383_24_26 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_320_383_24_26 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_320_383_24_26 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_320_383_24_26 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_320_383_24_26 : label is 320;
  attribute ram_addr_end of linebuf_reg_r2_320_383_24_26 : label is 383;
  attribute ram_offset of linebuf_reg_r2_320_383_24_26 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_320_383_24_26 : label is 24;
  attribute ram_slice_end of linebuf_reg_r2_320_383_24_26 : label is 26;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_320_383_27_29 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_320_383_27_29 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_320_383_27_29 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_320_383_27_29 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_320_383_27_29 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_320_383_27_29 : label is 320;
  attribute ram_addr_end of linebuf_reg_r2_320_383_27_29 : label is 383;
  attribute ram_offset of linebuf_reg_r2_320_383_27_29 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_320_383_27_29 : label is 27;
  attribute ram_slice_end of linebuf_reg_r2_320_383_27_29 : label is 29;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_320_383_30_31 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_320_383_30_31 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_320_383_30_31 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_320_383_30_31 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_320_383_30_31 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_320_383_30_31 : label is 320;
  attribute ram_addr_end of linebuf_reg_r2_320_383_30_31 : label is 383;
  attribute ram_offset of linebuf_reg_r2_320_383_30_31 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_320_383_30_31 : label is 30;
  attribute ram_slice_end of linebuf_reg_r2_320_383_30_31 : label is 31;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_320_383_3_5 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_320_383_3_5 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_320_383_3_5 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_320_383_3_5 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_320_383_3_5 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_320_383_3_5 : label is 320;
  attribute ram_addr_end of linebuf_reg_r2_320_383_3_5 : label is 383;
  attribute ram_offset of linebuf_reg_r2_320_383_3_5 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_320_383_3_5 : label is 3;
  attribute ram_slice_end of linebuf_reg_r2_320_383_3_5 : label is 5;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_320_383_6_8 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_320_383_6_8 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_320_383_6_8 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_320_383_6_8 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_320_383_6_8 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_320_383_6_8 : label is 320;
  attribute ram_addr_end of linebuf_reg_r2_320_383_6_8 : label is 383;
  attribute ram_offset of linebuf_reg_r2_320_383_6_8 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_320_383_6_8 : label is 6;
  attribute ram_slice_end of linebuf_reg_r2_320_383_6_8 : label is 8;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_320_383_9_11 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_320_383_9_11 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_320_383_9_11 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_320_383_9_11 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_320_383_9_11 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_320_383_9_11 : label is 320;
  attribute ram_addr_end of linebuf_reg_r2_320_383_9_11 : label is 383;
  attribute ram_offset of linebuf_reg_r2_320_383_9_11 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_320_383_9_11 : label is 9;
  attribute ram_slice_end of linebuf_reg_r2_320_383_9_11 : label is 11;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_384_447_0_2 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_384_447_0_2 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_384_447_0_2 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_384_447_0_2 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_384_447_0_2 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_384_447_0_2 : label is 384;
  attribute ram_addr_end of linebuf_reg_r2_384_447_0_2 : label is 447;
  attribute ram_offset of linebuf_reg_r2_384_447_0_2 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_384_447_0_2 : label is 0;
  attribute ram_slice_end of linebuf_reg_r2_384_447_0_2 : label is 2;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_384_447_12_14 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_384_447_12_14 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_384_447_12_14 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_384_447_12_14 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_384_447_12_14 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_384_447_12_14 : label is 384;
  attribute ram_addr_end of linebuf_reg_r2_384_447_12_14 : label is 447;
  attribute ram_offset of linebuf_reg_r2_384_447_12_14 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_384_447_12_14 : label is 12;
  attribute ram_slice_end of linebuf_reg_r2_384_447_12_14 : label is 14;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_384_447_15_17 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_384_447_15_17 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_384_447_15_17 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_384_447_15_17 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_384_447_15_17 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_384_447_15_17 : label is 384;
  attribute ram_addr_end of linebuf_reg_r2_384_447_15_17 : label is 447;
  attribute ram_offset of linebuf_reg_r2_384_447_15_17 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_384_447_15_17 : label is 15;
  attribute ram_slice_end of linebuf_reg_r2_384_447_15_17 : label is 17;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_384_447_18_20 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_384_447_18_20 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_384_447_18_20 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_384_447_18_20 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_384_447_18_20 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_384_447_18_20 : label is 384;
  attribute ram_addr_end of linebuf_reg_r2_384_447_18_20 : label is 447;
  attribute ram_offset of linebuf_reg_r2_384_447_18_20 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_384_447_18_20 : label is 18;
  attribute ram_slice_end of linebuf_reg_r2_384_447_18_20 : label is 20;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_384_447_21_23 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_384_447_21_23 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_384_447_21_23 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_384_447_21_23 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_384_447_21_23 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_384_447_21_23 : label is 384;
  attribute ram_addr_end of linebuf_reg_r2_384_447_21_23 : label is 447;
  attribute ram_offset of linebuf_reg_r2_384_447_21_23 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_384_447_21_23 : label is 21;
  attribute ram_slice_end of linebuf_reg_r2_384_447_21_23 : label is 23;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_384_447_24_26 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_384_447_24_26 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_384_447_24_26 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_384_447_24_26 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_384_447_24_26 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_384_447_24_26 : label is 384;
  attribute ram_addr_end of linebuf_reg_r2_384_447_24_26 : label is 447;
  attribute ram_offset of linebuf_reg_r2_384_447_24_26 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_384_447_24_26 : label is 24;
  attribute ram_slice_end of linebuf_reg_r2_384_447_24_26 : label is 26;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_384_447_27_29 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_384_447_27_29 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_384_447_27_29 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_384_447_27_29 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_384_447_27_29 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_384_447_27_29 : label is 384;
  attribute ram_addr_end of linebuf_reg_r2_384_447_27_29 : label is 447;
  attribute ram_offset of linebuf_reg_r2_384_447_27_29 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_384_447_27_29 : label is 27;
  attribute ram_slice_end of linebuf_reg_r2_384_447_27_29 : label is 29;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_384_447_30_31 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_384_447_30_31 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_384_447_30_31 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_384_447_30_31 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_384_447_30_31 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_384_447_30_31 : label is 384;
  attribute ram_addr_end of linebuf_reg_r2_384_447_30_31 : label is 447;
  attribute ram_offset of linebuf_reg_r2_384_447_30_31 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_384_447_30_31 : label is 30;
  attribute ram_slice_end of linebuf_reg_r2_384_447_30_31 : label is 31;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_384_447_3_5 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_384_447_3_5 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_384_447_3_5 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_384_447_3_5 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_384_447_3_5 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_384_447_3_5 : label is 384;
  attribute ram_addr_end of linebuf_reg_r2_384_447_3_5 : label is 447;
  attribute ram_offset of linebuf_reg_r2_384_447_3_5 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_384_447_3_5 : label is 3;
  attribute ram_slice_end of linebuf_reg_r2_384_447_3_5 : label is 5;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_384_447_6_8 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_384_447_6_8 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_384_447_6_8 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_384_447_6_8 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_384_447_6_8 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_384_447_6_8 : label is 384;
  attribute ram_addr_end of linebuf_reg_r2_384_447_6_8 : label is 447;
  attribute ram_offset of linebuf_reg_r2_384_447_6_8 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_384_447_6_8 : label is 6;
  attribute ram_slice_end of linebuf_reg_r2_384_447_6_8 : label is 8;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_384_447_9_11 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_384_447_9_11 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_384_447_9_11 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_384_447_9_11 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_384_447_9_11 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_384_447_9_11 : label is 384;
  attribute ram_addr_end of linebuf_reg_r2_384_447_9_11 : label is 447;
  attribute ram_offset of linebuf_reg_r2_384_447_9_11 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_384_447_9_11 : label is 9;
  attribute ram_slice_end of linebuf_reg_r2_384_447_9_11 : label is 11;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_448_511_0_2 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_448_511_0_2 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_448_511_0_2 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_448_511_0_2 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_448_511_0_2 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_448_511_0_2 : label is 448;
  attribute ram_addr_end of linebuf_reg_r2_448_511_0_2 : label is 511;
  attribute ram_offset of linebuf_reg_r2_448_511_0_2 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_448_511_0_2 : label is 0;
  attribute ram_slice_end of linebuf_reg_r2_448_511_0_2 : label is 2;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_448_511_12_14 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_448_511_12_14 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_448_511_12_14 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_448_511_12_14 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_448_511_12_14 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_448_511_12_14 : label is 448;
  attribute ram_addr_end of linebuf_reg_r2_448_511_12_14 : label is 511;
  attribute ram_offset of linebuf_reg_r2_448_511_12_14 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_448_511_12_14 : label is 12;
  attribute ram_slice_end of linebuf_reg_r2_448_511_12_14 : label is 14;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_448_511_15_17 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_448_511_15_17 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_448_511_15_17 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_448_511_15_17 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_448_511_15_17 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_448_511_15_17 : label is 448;
  attribute ram_addr_end of linebuf_reg_r2_448_511_15_17 : label is 511;
  attribute ram_offset of linebuf_reg_r2_448_511_15_17 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_448_511_15_17 : label is 15;
  attribute ram_slice_end of linebuf_reg_r2_448_511_15_17 : label is 17;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_448_511_18_20 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_448_511_18_20 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_448_511_18_20 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_448_511_18_20 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_448_511_18_20 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_448_511_18_20 : label is 448;
  attribute ram_addr_end of linebuf_reg_r2_448_511_18_20 : label is 511;
  attribute ram_offset of linebuf_reg_r2_448_511_18_20 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_448_511_18_20 : label is 18;
  attribute ram_slice_end of linebuf_reg_r2_448_511_18_20 : label is 20;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_448_511_21_23 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_448_511_21_23 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_448_511_21_23 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_448_511_21_23 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_448_511_21_23 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_448_511_21_23 : label is 448;
  attribute ram_addr_end of linebuf_reg_r2_448_511_21_23 : label is 511;
  attribute ram_offset of linebuf_reg_r2_448_511_21_23 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_448_511_21_23 : label is 21;
  attribute ram_slice_end of linebuf_reg_r2_448_511_21_23 : label is 23;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_448_511_24_26 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_448_511_24_26 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_448_511_24_26 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_448_511_24_26 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_448_511_24_26 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_448_511_24_26 : label is 448;
  attribute ram_addr_end of linebuf_reg_r2_448_511_24_26 : label is 511;
  attribute ram_offset of linebuf_reg_r2_448_511_24_26 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_448_511_24_26 : label is 24;
  attribute ram_slice_end of linebuf_reg_r2_448_511_24_26 : label is 26;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_448_511_27_29 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_448_511_27_29 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_448_511_27_29 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_448_511_27_29 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_448_511_27_29 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_448_511_27_29 : label is 448;
  attribute ram_addr_end of linebuf_reg_r2_448_511_27_29 : label is 511;
  attribute ram_offset of linebuf_reg_r2_448_511_27_29 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_448_511_27_29 : label is 27;
  attribute ram_slice_end of linebuf_reg_r2_448_511_27_29 : label is 29;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_448_511_30_31 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_448_511_30_31 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_448_511_30_31 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_448_511_30_31 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_448_511_30_31 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_448_511_30_31 : label is 448;
  attribute ram_addr_end of linebuf_reg_r2_448_511_30_31 : label is 511;
  attribute ram_offset of linebuf_reg_r2_448_511_30_31 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_448_511_30_31 : label is 30;
  attribute ram_slice_end of linebuf_reg_r2_448_511_30_31 : label is 31;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_448_511_3_5 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_448_511_3_5 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_448_511_3_5 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_448_511_3_5 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_448_511_3_5 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_448_511_3_5 : label is 448;
  attribute ram_addr_end of linebuf_reg_r2_448_511_3_5 : label is 511;
  attribute ram_offset of linebuf_reg_r2_448_511_3_5 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_448_511_3_5 : label is 3;
  attribute ram_slice_end of linebuf_reg_r2_448_511_3_5 : label is 5;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_448_511_6_8 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_448_511_6_8 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_448_511_6_8 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_448_511_6_8 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_448_511_6_8 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_448_511_6_8 : label is 448;
  attribute ram_addr_end of linebuf_reg_r2_448_511_6_8 : label is 511;
  attribute ram_offset of linebuf_reg_r2_448_511_6_8 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_448_511_6_8 : label is 6;
  attribute ram_slice_end of linebuf_reg_r2_448_511_6_8 : label is 8;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_448_511_9_11 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_448_511_9_11 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_448_511_9_11 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_448_511_9_11 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_448_511_9_11 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_448_511_9_11 : label is 448;
  attribute ram_addr_end of linebuf_reg_r2_448_511_9_11 : label is 511;
  attribute ram_offset of linebuf_reg_r2_448_511_9_11 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_448_511_9_11 : label is 9;
  attribute ram_slice_end of linebuf_reg_r2_448_511_9_11 : label is 11;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_512_575_0_2 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_512_575_0_2 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_512_575_0_2 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_512_575_0_2 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_512_575_0_2 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_512_575_0_2 : label is 512;
  attribute ram_addr_end of linebuf_reg_r2_512_575_0_2 : label is 575;
  attribute ram_offset of linebuf_reg_r2_512_575_0_2 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_512_575_0_2 : label is 0;
  attribute ram_slice_end of linebuf_reg_r2_512_575_0_2 : label is 2;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_512_575_12_14 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_512_575_12_14 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_512_575_12_14 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_512_575_12_14 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_512_575_12_14 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_512_575_12_14 : label is 512;
  attribute ram_addr_end of linebuf_reg_r2_512_575_12_14 : label is 575;
  attribute ram_offset of linebuf_reg_r2_512_575_12_14 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_512_575_12_14 : label is 12;
  attribute ram_slice_end of linebuf_reg_r2_512_575_12_14 : label is 14;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_512_575_15_17 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_512_575_15_17 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_512_575_15_17 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_512_575_15_17 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_512_575_15_17 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_512_575_15_17 : label is 512;
  attribute ram_addr_end of linebuf_reg_r2_512_575_15_17 : label is 575;
  attribute ram_offset of linebuf_reg_r2_512_575_15_17 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_512_575_15_17 : label is 15;
  attribute ram_slice_end of linebuf_reg_r2_512_575_15_17 : label is 17;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_512_575_18_20 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_512_575_18_20 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_512_575_18_20 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_512_575_18_20 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_512_575_18_20 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_512_575_18_20 : label is 512;
  attribute ram_addr_end of linebuf_reg_r2_512_575_18_20 : label is 575;
  attribute ram_offset of linebuf_reg_r2_512_575_18_20 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_512_575_18_20 : label is 18;
  attribute ram_slice_end of linebuf_reg_r2_512_575_18_20 : label is 20;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_512_575_21_23 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_512_575_21_23 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_512_575_21_23 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_512_575_21_23 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_512_575_21_23 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_512_575_21_23 : label is 512;
  attribute ram_addr_end of linebuf_reg_r2_512_575_21_23 : label is 575;
  attribute ram_offset of linebuf_reg_r2_512_575_21_23 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_512_575_21_23 : label is 21;
  attribute ram_slice_end of linebuf_reg_r2_512_575_21_23 : label is 23;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_512_575_24_26 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_512_575_24_26 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_512_575_24_26 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_512_575_24_26 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_512_575_24_26 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_512_575_24_26 : label is 512;
  attribute ram_addr_end of linebuf_reg_r2_512_575_24_26 : label is 575;
  attribute ram_offset of linebuf_reg_r2_512_575_24_26 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_512_575_24_26 : label is 24;
  attribute ram_slice_end of linebuf_reg_r2_512_575_24_26 : label is 26;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_512_575_27_29 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_512_575_27_29 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_512_575_27_29 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_512_575_27_29 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_512_575_27_29 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_512_575_27_29 : label is 512;
  attribute ram_addr_end of linebuf_reg_r2_512_575_27_29 : label is 575;
  attribute ram_offset of linebuf_reg_r2_512_575_27_29 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_512_575_27_29 : label is 27;
  attribute ram_slice_end of linebuf_reg_r2_512_575_27_29 : label is 29;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_512_575_30_31 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_512_575_30_31 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_512_575_30_31 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_512_575_30_31 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_512_575_30_31 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_512_575_30_31 : label is 512;
  attribute ram_addr_end of linebuf_reg_r2_512_575_30_31 : label is 575;
  attribute ram_offset of linebuf_reg_r2_512_575_30_31 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_512_575_30_31 : label is 30;
  attribute ram_slice_end of linebuf_reg_r2_512_575_30_31 : label is 31;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_512_575_3_5 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_512_575_3_5 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_512_575_3_5 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_512_575_3_5 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_512_575_3_5 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_512_575_3_5 : label is 512;
  attribute ram_addr_end of linebuf_reg_r2_512_575_3_5 : label is 575;
  attribute ram_offset of linebuf_reg_r2_512_575_3_5 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_512_575_3_5 : label is 3;
  attribute ram_slice_end of linebuf_reg_r2_512_575_3_5 : label is 5;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_512_575_6_8 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_512_575_6_8 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_512_575_6_8 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_512_575_6_8 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_512_575_6_8 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_512_575_6_8 : label is 512;
  attribute ram_addr_end of linebuf_reg_r2_512_575_6_8 : label is 575;
  attribute ram_offset of linebuf_reg_r2_512_575_6_8 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_512_575_6_8 : label is 6;
  attribute ram_slice_end of linebuf_reg_r2_512_575_6_8 : label is 8;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_512_575_9_11 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_512_575_9_11 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_512_575_9_11 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_512_575_9_11 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_512_575_9_11 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_512_575_9_11 : label is 512;
  attribute ram_addr_end of linebuf_reg_r2_512_575_9_11 : label is 575;
  attribute ram_offset of linebuf_reg_r2_512_575_9_11 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_512_575_9_11 : label is 9;
  attribute ram_slice_end of linebuf_reg_r2_512_575_9_11 : label is 11;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_576_639_0_2 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_576_639_0_2 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_576_639_0_2 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_576_639_0_2 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_576_639_0_2 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_576_639_0_2 : label is 576;
  attribute ram_addr_end of linebuf_reg_r2_576_639_0_2 : label is 639;
  attribute ram_offset of linebuf_reg_r2_576_639_0_2 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_576_639_0_2 : label is 0;
  attribute ram_slice_end of linebuf_reg_r2_576_639_0_2 : label is 2;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_576_639_12_14 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_576_639_12_14 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_576_639_12_14 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_576_639_12_14 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_576_639_12_14 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_576_639_12_14 : label is 576;
  attribute ram_addr_end of linebuf_reg_r2_576_639_12_14 : label is 639;
  attribute ram_offset of linebuf_reg_r2_576_639_12_14 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_576_639_12_14 : label is 12;
  attribute ram_slice_end of linebuf_reg_r2_576_639_12_14 : label is 14;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_576_639_15_17 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_576_639_15_17 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_576_639_15_17 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_576_639_15_17 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_576_639_15_17 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_576_639_15_17 : label is 576;
  attribute ram_addr_end of linebuf_reg_r2_576_639_15_17 : label is 639;
  attribute ram_offset of linebuf_reg_r2_576_639_15_17 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_576_639_15_17 : label is 15;
  attribute ram_slice_end of linebuf_reg_r2_576_639_15_17 : label is 17;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_576_639_18_20 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_576_639_18_20 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_576_639_18_20 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_576_639_18_20 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_576_639_18_20 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_576_639_18_20 : label is 576;
  attribute ram_addr_end of linebuf_reg_r2_576_639_18_20 : label is 639;
  attribute ram_offset of linebuf_reg_r2_576_639_18_20 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_576_639_18_20 : label is 18;
  attribute ram_slice_end of linebuf_reg_r2_576_639_18_20 : label is 20;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_576_639_21_23 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_576_639_21_23 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_576_639_21_23 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_576_639_21_23 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_576_639_21_23 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_576_639_21_23 : label is 576;
  attribute ram_addr_end of linebuf_reg_r2_576_639_21_23 : label is 639;
  attribute ram_offset of linebuf_reg_r2_576_639_21_23 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_576_639_21_23 : label is 21;
  attribute ram_slice_end of linebuf_reg_r2_576_639_21_23 : label is 23;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_576_639_24_26 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_576_639_24_26 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_576_639_24_26 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_576_639_24_26 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_576_639_24_26 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_576_639_24_26 : label is 576;
  attribute ram_addr_end of linebuf_reg_r2_576_639_24_26 : label is 639;
  attribute ram_offset of linebuf_reg_r2_576_639_24_26 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_576_639_24_26 : label is 24;
  attribute ram_slice_end of linebuf_reg_r2_576_639_24_26 : label is 26;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_576_639_27_29 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_576_639_27_29 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_576_639_27_29 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_576_639_27_29 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_576_639_27_29 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_576_639_27_29 : label is 576;
  attribute ram_addr_end of linebuf_reg_r2_576_639_27_29 : label is 639;
  attribute ram_offset of linebuf_reg_r2_576_639_27_29 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_576_639_27_29 : label is 27;
  attribute ram_slice_end of linebuf_reg_r2_576_639_27_29 : label is 29;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_576_639_30_31 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_576_639_30_31 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_576_639_30_31 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_576_639_30_31 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_576_639_30_31 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_576_639_30_31 : label is 576;
  attribute ram_addr_end of linebuf_reg_r2_576_639_30_31 : label is 639;
  attribute ram_offset of linebuf_reg_r2_576_639_30_31 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_576_639_30_31 : label is 30;
  attribute ram_slice_end of linebuf_reg_r2_576_639_30_31 : label is 31;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_576_639_3_5 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_576_639_3_5 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_576_639_3_5 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_576_639_3_5 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_576_639_3_5 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_576_639_3_5 : label is 576;
  attribute ram_addr_end of linebuf_reg_r2_576_639_3_5 : label is 639;
  attribute ram_offset of linebuf_reg_r2_576_639_3_5 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_576_639_3_5 : label is 3;
  attribute ram_slice_end of linebuf_reg_r2_576_639_3_5 : label is 5;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_576_639_6_8 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_576_639_6_8 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_576_639_6_8 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_576_639_6_8 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_576_639_6_8 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_576_639_6_8 : label is 576;
  attribute ram_addr_end of linebuf_reg_r2_576_639_6_8 : label is 639;
  attribute ram_offset of linebuf_reg_r2_576_639_6_8 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_576_639_6_8 : label is 6;
  attribute ram_slice_end of linebuf_reg_r2_576_639_6_8 : label is 8;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_576_639_9_11 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_576_639_9_11 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_576_639_9_11 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_576_639_9_11 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_576_639_9_11 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_576_639_9_11 : label is 576;
  attribute ram_addr_end of linebuf_reg_r2_576_639_9_11 : label is 639;
  attribute ram_offset of linebuf_reg_r2_576_639_9_11 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_576_639_9_11 : label is 9;
  attribute ram_slice_end of linebuf_reg_r2_576_639_9_11 : label is 11;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_640_703_0_2 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_640_703_0_2 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_640_703_0_2 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_640_703_0_2 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_640_703_0_2 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_640_703_0_2 : label is 640;
  attribute ram_addr_end of linebuf_reg_r2_640_703_0_2 : label is 703;
  attribute ram_offset of linebuf_reg_r2_640_703_0_2 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_640_703_0_2 : label is 0;
  attribute ram_slice_end of linebuf_reg_r2_640_703_0_2 : label is 2;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_640_703_12_14 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_640_703_12_14 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_640_703_12_14 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_640_703_12_14 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_640_703_12_14 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_640_703_12_14 : label is 640;
  attribute ram_addr_end of linebuf_reg_r2_640_703_12_14 : label is 703;
  attribute ram_offset of linebuf_reg_r2_640_703_12_14 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_640_703_12_14 : label is 12;
  attribute ram_slice_end of linebuf_reg_r2_640_703_12_14 : label is 14;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_640_703_15_17 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_640_703_15_17 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_640_703_15_17 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_640_703_15_17 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_640_703_15_17 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_640_703_15_17 : label is 640;
  attribute ram_addr_end of linebuf_reg_r2_640_703_15_17 : label is 703;
  attribute ram_offset of linebuf_reg_r2_640_703_15_17 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_640_703_15_17 : label is 15;
  attribute ram_slice_end of linebuf_reg_r2_640_703_15_17 : label is 17;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_640_703_18_20 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_640_703_18_20 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_640_703_18_20 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_640_703_18_20 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_640_703_18_20 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_640_703_18_20 : label is 640;
  attribute ram_addr_end of linebuf_reg_r2_640_703_18_20 : label is 703;
  attribute ram_offset of linebuf_reg_r2_640_703_18_20 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_640_703_18_20 : label is 18;
  attribute ram_slice_end of linebuf_reg_r2_640_703_18_20 : label is 20;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_640_703_21_23 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_640_703_21_23 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_640_703_21_23 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_640_703_21_23 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_640_703_21_23 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_640_703_21_23 : label is 640;
  attribute ram_addr_end of linebuf_reg_r2_640_703_21_23 : label is 703;
  attribute ram_offset of linebuf_reg_r2_640_703_21_23 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_640_703_21_23 : label is 21;
  attribute ram_slice_end of linebuf_reg_r2_640_703_21_23 : label is 23;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_640_703_24_26 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_640_703_24_26 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_640_703_24_26 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_640_703_24_26 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_640_703_24_26 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_640_703_24_26 : label is 640;
  attribute ram_addr_end of linebuf_reg_r2_640_703_24_26 : label is 703;
  attribute ram_offset of linebuf_reg_r2_640_703_24_26 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_640_703_24_26 : label is 24;
  attribute ram_slice_end of linebuf_reg_r2_640_703_24_26 : label is 26;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_640_703_27_29 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_640_703_27_29 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_640_703_27_29 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_640_703_27_29 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_640_703_27_29 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_640_703_27_29 : label is 640;
  attribute ram_addr_end of linebuf_reg_r2_640_703_27_29 : label is 703;
  attribute ram_offset of linebuf_reg_r2_640_703_27_29 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_640_703_27_29 : label is 27;
  attribute ram_slice_end of linebuf_reg_r2_640_703_27_29 : label is 29;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_640_703_30_31 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_640_703_30_31 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_640_703_30_31 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_640_703_30_31 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_640_703_30_31 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_640_703_30_31 : label is 640;
  attribute ram_addr_end of linebuf_reg_r2_640_703_30_31 : label is 703;
  attribute ram_offset of linebuf_reg_r2_640_703_30_31 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_640_703_30_31 : label is 30;
  attribute ram_slice_end of linebuf_reg_r2_640_703_30_31 : label is 31;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_640_703_3_5 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_640_703_3_5 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_640_703_3_5 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_640_703_3_5 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_640_703_3_5 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_640_703_3_5 : label is 640;
  attribute ram_addr_end of linebuf_reg_r2_640_703_3_5 : label is 703;
  attribute ram_offset of linebuf_reg_r2_640_703_3_5 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_640_703_3_5 : label is 3;
  attribute ram_slice_end of linebuf_reg_r2_640_703_3_5 : label is 5;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_640_703_6_8 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_640_703_6_8 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_640_703_6_8 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_640_703_6_8 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_640_703_6_8 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_640_703_6_8 : label is 640;
  attribute ram_addr_end of linebuf_reg_r2_640_703_6_8 : label is 703;
  attribute ram_offset of linebuf_reg_r2_640_703_6_8 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_640_703_6_8 : label is 6;
  attribute ram_slice_end of linebuf_reg_r2_640_703_6_8 : label is 8;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_640_703_9_11 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_640_703_9_11 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_640_703_9_11 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_640_703_9_11 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_640_703_9_11 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_640_703_9_11 : label is 640;
  attribute ram_addr_end of linebuf_reg_r2_640_703_9_11 : label is 703;
  attribute ram_offset of linebuf_reg_r2_640_703_9_11 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_640_703_9_11 : label is 9;
  attribute ram_slice_end of linebuf_reg_r2_640_703_9_11 : label is 11;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_64_127_0_2 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_64_127_0_2 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_64_127_0_2 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_64_127_0_2 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_64_127_0_2 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_64_127_0_2 : label is 64;
  attribute ram_addr_end of linebuf_reg_r2_64_127_0_2 : label is 127;
  attribute ram_offset of linebuf_reg_r2_64_127_0_2 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_64_127_0_2 : label is 0;
  attribute ram_slice_end of linebuf_reg_r2_64_127_0_2 : label is 2;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_64_127_12_14 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_64_127_12_14 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_64_127_12_14 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_64_127_12_14 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_64_127_12_14 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_64_127_12_14 : label is 64;
  attribute ram_addr_end of linebuf_reg_r2_64_127_12_14 : label is 127;
  attribute ram_offset of linebuf_reg_r2_64_127_12_14 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_64_127_12_14 : label is 12;
  attribute ram_slice_end of linebuf_reg_r2_64_127_12_14 : label is 14;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_64_127_15_17 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_64_127_15_17 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_64_127_15_17 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_64_127_15_17 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_64_127_15_17 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_64_127_15_17 : label is 64;
  attribute ram_addr_end of linebuf_reg_r2_64_127_15_17 : label is 127;
  attribute ram_offset of linebuf_reg_r2_64_127_15_17 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_64_127_15_17 : label is 15;
  attribute ram_slice_end of linebuf_reg_r2_64_127_15_17 : label is 17;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_64_127_18_20 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_64_127_18_20 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_64_127_18_20 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_64_127_18_20 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_64_127_18_20 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_64_127_18_20 : label is 64;
  attribute ram_addr_end of linebuf_reg_r2_64_127_18_20 : label is 127;
  attribute ram_offset of linebuf_reg_r2_64_127_18_20 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_64_127_18_20 : label is 18;
  attribute ram_slice_end of linebuf_reg_r2_64_127_18_20 : label is 20;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_64_127_21_23 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_64_127_21_23 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_64_127_21_23 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_64_127_21_23 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_64_127_21_23 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_64_127_21_23 : label is 64;
  attribute ram_addr_end of linebuf_reg_r2_64_127_21_23 : label is 127;
  attribute ram_offset of linebuf_reg_r2_64_127_21_23 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_64_127_21_23 : label is 21;
  attribute ram_slice_end of linebuf_reg_r2_64_127_21_23 : label is 23;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_64_127_24_26 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_64_127_24_26 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_64_127_24_26 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_64_127_24_26 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_64_127_24_26 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_64_127_24_26 : label is 64;
  attribute ram_addr_end of linebuf_reg_r2_64_127_24_26 : label is 127;
  attribute ram_offset of linebuf_reg_r2_64_127_24_26 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_64_127_24_26 : label is 24;
  attribute ram_slice_end of linebuf_reg_r2_64_127_24_26 : label is 26;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_64_127_27_29 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_64_127_27_29 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_64_127_27_29 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_64_127_27_29 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_64_127_27_29 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_64_127_27_29 : label is 64;
  attribute ram_addr_end of linebuf_reg_r2_64_127_27_29 : label is 127;
  attribute ram_offset of linebuf_reg_r2_64_127_27_29 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_64_127_27_29 : label is 27;
  attribute ram_slice_end of linebuf_reg_r2_64_127_27_29 : label is 29;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_64_127_30_31 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_64_127_30_31 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_64_127_30_31 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_64_127_30_31 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_64_127_30_31 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_64_127_30_31 : label is 64;
  attribute ram_addr_end of linebuf_reg_r2_64_127_30_31 : label is 127;
  attribute ram_offset of linebuf_reg_r2_64_127_30_31 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_64_127_30_31 : label is 30;
  attribute ram_slice_end of linebuf_reg_r2_64_127_30_31 : label is 31;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_64_127_3_5 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_64_127_3_5 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_64_127_3_5 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_64_127_3_5 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_64_127_3_5 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_64_127_3_5 : label is 64;
  attribute ram_addr_end of linebuf_reg_r2_64_127_3_5 : label is 127;
  attribute ram_offset of linebuf_reg_r2_64_127_3_5 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_64_127_3_5 : label is 3;
  attribute ram_slice_end of linebuf_reg_r2_64_127_3_5 : label is 5;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_64_127_6_8 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_64_127_6_8 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_64_127_6_8 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_64_127_6_8 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_64_127_6_8 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_64_127_6_8 : label is 64;
  attribute ram_addr_end of linebuf_reg_r2_64_127_6_8 : label is 127;
  attribute ram_offset of linebuf_reg_r2_64_127_6_8 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_64_127_6_8 : label is 6;
  attribute ram_slice_end of linebuf_reg_r2_64_127_6_8 : label is 8;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_64_127_9_11 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_64_127_9_11 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_64_127_9_11 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_64_127_9_11 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_64_127_9_11 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_64_127_9_11 : label is 64;
  attribute ram_addr_end of linebuf_reg_r2_64_127_9_11 : label is 127;
  attribute ram_offset of linebuf_reg_r2_64_127_9_11 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_64_127_9_11 : label is 9;
  attribute ram_slice_end of linebuf_reg_r2_64_127_9_11 : label is 11;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_704_767_0_2 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_704_767_0_2 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_704_767_0_2 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_704_767_0_2 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_704_767_0_2 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_704_767_0_2 : label is 704;
  attribute ram_addr_end of linebuf_reg_r2_704_767_0_2 : label is 767;
  attribute ram_offset of linebuf_reg_r2_704_767_0_2 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_704_767_0_2 : label is 0;
  attribute ram_slice_end of linebuf_reg_r2_704_767_0_2 : label is 2;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_704_767_12_14 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_704_767_12_14 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_704_767_12_14 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_704_767_12_14 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_704_767_12_14 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_704_767_12_14 : label is 704;
  attribute ram_addr_end of linebuf_reg_r2_704_767_12_14 : label is 767;
  attribute ram_offset of linebuf_reg_r2_704_767_12_14 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_704_767_12_14 : label is 12;
  attribute ram_slice_end of linebuf_reg_r2_704_767_12_14 : label is 14;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_704_767_15_17 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_704_767_15_17 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_704_767_15_17 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_704_767_15_17 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_704_767_15_17 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_704_767_15_17 : label is 704;
  attribute ram_addr_end of linebuf_reg_r2_704_767_15_17 : label is 767;
  attribute ram_offset of linebuf_reg_r2_704_767_15_17 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_704_767_15_17 : label is 15;
  attribute ram_slice_end of linebuf_reg_r2_704_767_15_17 : label is 17;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_704_767_18_20 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_704_767_18_20 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_704_767_18_20 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_704_767_18_20 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_704_767_18_20 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_704_767_18_20 : label is 704;
  attribute ram_addr_end of linebuf_reg_r2_704_767_18_20 : label is 767;
  attribute ram_offset of linebuf_reg_r2_704_767_18_20 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_704_767_18_20 : label is 18;
  attribute ram_slice_end of linebuf_reg_r2_704_767_18_20 : label is 20;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_704_767_21_23 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_704_767_21_23 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_704_767_21_23 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_704_767_21_23 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_704_767_21_23 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_704_767_21_23 : label is 704;
  attribute ram_addr_end of linebuf_reg_r2_704_767_21_23 : label is 767;
  attribute ram_offset of linebuf_reg_r2_704_767_21_23 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_704_767_21_23 : label is 21;
  attribute ram_slice_end of linebuf_reg_r2_704_767_21_23 : label is 23;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_704_767_24_26 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_704_767_24_26 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_704_767_24_26 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_704_767_24_26 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_704_767_24_26 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_704_767_24_26 : label is 704;
  attribute ram_addr_end of linebuf_reg_r2_704_767_24_26 : label is 767;
  attribute ram_offset of linebuf_reg_r2_704_767_24_26 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_704_767_24_26 : label is 24;
  attribute ram_slice_end of linebuf_reg_r2_704_767_24_26 : label is 26;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_704_767_27_29 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_704_767_27_29 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_704_767_27_29 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_704_767_27_29 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_704_767_27_29 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_704_767_27_29 : label is 704;
  attribute ram_addr_end of linebuf_reg_r2_704_767_27_29 : label is 767;
  attribute ram_offset of linebuf_reg_r2_704_767_27_29 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_704_767_27_29 : label is 27;
  attribute ram_slice_end of linebuf_reg_r2_704_767_27_29 : label is 29;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_704_767_30_31 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_704_767_30_31 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_704_767_30_31 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_704_767_30_31 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_704_767_30_31 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_704_767_30_31 : label is 704;
  attribute ram_addr_end of linebuf_reg_r2_704_767_30_31 : label is 767;
  attribute ram_offset of linebuf_reg_r2_704_767_30_31 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_704_767_30_31 : label is 30;
  attribute ram_slice_end of linebuf_reg_r2_704_767_30_31 : label is 31;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_704_767_3_5 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_704_767_3_5 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_704_767_3_5 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_704_767_3_5 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_704_767_3_5 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_704_767_3_5 : label is 704;
  attribute ram_addr_end of linebuf_reg_r2_704_767_3_5 : label is 767;
  attribute ram_offset of linebuf_reg_r2_704_767_3_5 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_704_767_3_5 : label is 3;
  attribute ram_slice_end of linebuf_reg_r2_704_767_3_5 : label is 5;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_704_767_6_8 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_704_767_6_8 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_704_767_6_8 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_704_767_6_8 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_704_767_6_8 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_704_767_6_8 : label is 704;
  attribute ram_addr_end of linebuf_reg_r2_704_767_6_8 : label is 767;
  attribute ram_offset of linebuf_reg_r2_704_767_6_8 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_704_767_6_8 : label is 6;
  attribute ram_slice_end of linebuf_reg_r2_704_767_6_8 : label is 8;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_704_767_9_11 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_704_767_9_11 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_704_767_9_11 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_704_767_9_11 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_704_767_9_11 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_704_767_9_11 : label is 704;
  attribute ram_addr_end of linebuf_reg_r2_704_767_9_11 : label is 767;
  attribute ram_offset of linebuf_reg_r2_704_767_9_11 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_704_767_9_11 : label is 9;
  attribute ram_slice_end of linebuf_reg_r2_704_767_9_11 : label is 11;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_768_831_0_2 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_768_831_0_2 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_768_831_0_2 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_768_831_0_2 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_768_831_0_2 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_768_831_0_2 : label is 768;
  attribute ram_addr_end of linebuf_reg_r2_768_831_0_2 : label is 831;
  attribute ram_offset of linebuf_reg_r2_768_831_0_2 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_768_831_0_2 : label is 0;
  attribute ram_slice_end of linebuf_reg_r2_768_831_0_2 : label is 2;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_768_831_12_14 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_768_831_12_14 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_768_831_12_14 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_768_831_12_14 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_768_831_12_14 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_768_831_12_14 : label is 768;
  attribute ram_addr_end of linebuf_reg_r2_768_831_12_14 : label is 831;
  attribute ram_offset of linebuf_reg_r2_768_831_12_14 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_768_831_12_14 : label is 12;
  attribute ram_slice_end of linebuf_reg_r2_768_831_12_14 : label is 14;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_768_831_15_17 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_768_831_15_17 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_768_831_15_17 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_768_831_15_17 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_768_831_15_17 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_768_831_15_17 : label is 768;
  attribute ram_addr_end of linebuf_reg_r2_768_831_15_17 : label is 831;
  attribute ram_offset of linebuf_reg_r2_768_831_15_17 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_768_831_15_17 : label is 15;
  attribute ram_slice_end of linebuf_reg_r2_768_831_15_17 : label is 17;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_768_831_18_20 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_768_831_18_20 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_768_831_18_20 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_768_831_18_20 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_768_831_18_20 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_768_831_18_20 : label is 768;
  attribute ram_addr_end of linebuf_reg_r2_768_831_18_20 : label is 831;
  attribute ram_offset of linebuf_reg_r2_768_831_18_20 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_768_831_18_20 : label is 18;
  attribute ram_slice_end of linebuf_reg_r2_768_831_18_20 : label is 20;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_768_831_21_23 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_768_831_21_23 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_768_831_21_23 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_768_831_21_23 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_768_831_21_23 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_768_831_21_23 : label is 768;
  attribute ram_addr_end of linebuf_reg_r2_768_831_21_23 : label is 831;
  attribute ram_offset of linebuf_reg_r2_768_831_21_23 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_768_831_21_23 : label is 21;
  attribute ram_slice_end of linebuf_reg_r2_768_831_21_23 : label is 23;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_768_831_24_26 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_768_831_24_26 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_768_831_24_26 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_768_831_24_26 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_768_831_24_26 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_768_831_24_26 : label is 768;
  attribute ram_addr_end of linebuf_reg_r2_768_831_24_26 : label is 831;
  attribute ram_offset of linebuf_reg_r2_768_831_24_26 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_768_831_24_26 : label is 24;
  attribute ram_slice_end of linebuf_reg_r2_768_831_24_26 : label is 26;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_768_831_27_29 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_768_831_27_29 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_768_831_27_29 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_768_831_27_29 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_768_831_27_29 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_768_831_27_29 : label is 768;
  attribute ram_addr_end of linebuf_reg_r2_768_831_27_29 : label is 831;
  attribute ram_offset of linebuf_reg_r2_768_831_27_29 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_768_831_27_29 : label is 27;
  attribute ram_slice_end of linebuf_reg_r2_768_831_27_29 : label is 29;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_768_831_30_31 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_768_831_30_31 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_768_831_30_31 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_768_831_30_31 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_768_831_30_31 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_768_831_30_31 : label is 768;
  attribute ram_addr_end of linebuf_reg_r2_768_831_30_31 : label is 831;
  attribute ram_offset of linebuf_reg_r2_768_831_30_31 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_768_831_30_31 : label is 30;
  attribute ram_slice_end of linebuf_reg_r2_768_831_30_31 : label is 31;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_768_831_3_5 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_768_831_3_5 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_768_831_3_5 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_768_831_3_5 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_768_831_3_5 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_768_831_3_5 : label is 768;
  attribute ram_addr_end of linebuf_reg_r2_768_831_3_5 : label is 831;
  attribute ram_offset of linebuf_reg_r2_768_831_3_5 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_768_831_3_5 : label is 3;
  attribute ram_slice_end of linebuf_reg_r2_768_831_3_5 : label is 5;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_768_831_6_8 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_768_831_6_8 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_768_831_6_8 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_768_831_6_8 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_768_831_6_8 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_768_831_6_8 : label is 768;
  attribute ram_addr_end of linebuf_reg_r2_768_831_6_8 : label is 831;
  attribute ram_offset of linebuf_reg_r2_768_831_6_8 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_768_831_6_8 : label is 6;
  attribute ram_slice_end of linebuf_reg_r2_768_831_6_8 : label is 8;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_768_831_9_11 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_768_831_9_11 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_768_831_9_11 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_768_831_9_11 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_768_831_9_11 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_768_831_9_11 : label is 768;
  attribute ram_addr_end of linebuf_reg_r2_768_831_9_11 : label is 831;
  attribute ram_offset of linebuf_reg_r2_768_831_9_11 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_768_831_9_11 : label is 9;
  attribute ram_slice_end of linebuf_reg_r2_768_831_9_11 : label is 11;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_832_895_0_2 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_832_895_0_2 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_832_895_0_2 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_832_895_0_2 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_832_895_0_2 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_832_895_0_2 : label is 832;
  attribute ram_addr_end of linebuf_reg_r2_832_895_0_2 : label is 895;
  attribute ram_offset of linebuf_reg_r2_832_895_0_2 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_832_895_0_2 : label is 0;
  attribute ram_slice_end of linebuf_reg_r2_832_895_0_2 : label is 2;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_832_895_12_14 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_832_895_12_14 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_832_895_12_14 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_832_895_12_14 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_832_895_12_14 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_832_895_12_14 : label is 832;
  attribute ram_addr_end of linebuf_reg_r2_832_895_12_14 : label is 895;
  attribute ram_offset of linebuf_reg_r2_832_895_12_14 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_832_895_12_14 : label is 12;
  attribute ram_slice_end of linebuf_reg_r2_832_895_12_14 : label is 14;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_832_895_15_17 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_832_895_15_17 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_832_895_15_17 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_832_895_15_17 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_832_895_15_17 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_832_895_15_17 : label is 832;
  attribute ram_addr_end of linebuf_reg_r2_832_895_15_17 : label is 895;
  attribute ram_offset of linebuf_reg_r2_832_895_15_17 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_832_895_15_17 : label is 15;
  attribute ram_slice_end of linebuf_reg_r2_832_895_15_17 : label is 17;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_832_895_18_20 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_832_895_18_20 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_832_895_18_20 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_832_895_18_20 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_832_895_18_20 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_832_895_18_20 : label is 832;
  attribute ram_addr_end of linebuf_reg_r2_832_895_18_20 : label is 895;
  attribute ram_offset of linebuf_reg_r2_832_895_18_20 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_832_895_18_20 : label is 18;
  attribute ram_slice_end of linebuf_reg_r2_832_895_18_20 : label is 20;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_832_895_21_23 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_832_895_21_23 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_832_895_21_23 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_832_895_21_23 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_832_895_21_23 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_832_895_21_23 : label is 832;
  attribute ram_addr_end of linebuf_reg_r2_832_895_21_23 : label is 895;
  attribute ram_offset of linebuf_reg_r2_832_895_21_23 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_832_895_21_23 : label is 21;
  attribute ram_slice_end of linebuf_reg_r2_832_895_21_23 : label is 23;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_832_895_24_26 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_832_895_24_26 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_832_895_24_26 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_832_895_24_26 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_832_895_24_26 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_832_895_24_26 : label is 832;
  attribute ram_addr_end of linebuf_reg_r2_832_895_24_26 : label is 895;
  attribute ram_offset of linebuf_reg_r2_832_895_24_26 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_832_895_24_26 : label is 24;
  attribute ram_slice_end of linebuf_reg_r2_832_895_24_26 : label is 26;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_832_895_27_29 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_832_895_27_29 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_832_895_27_29 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_832_895_27_29 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_832_895_27_29 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_832_895_27_29 : label is 832;
  attribute ram_addr_end of linebuf_reg_r2_832_895_27_29 : label is 895;
  attribute ram_offset of linebuf_reg_r2_832_895_27_29 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_832_895_27_29 : label is 27;
  attribute ram_slice_end of linebuf_reg_r2_832_895_27_29 : label is 29;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_832_895_30_31 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_832_895_30_31 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_832_895_30_31 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_832_895_30_31 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_832_895_30_31 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_832_895_30_31 : label is 832;
  attribute ram_addr_end of linebuf_reg_r2_832_895_30_31 : label is 895;
  attribute ram_offset of linebuf_reg_r2_832_895_30_31 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_832_895_30_31 : label is 30;
  attribute ram_slice_end of linebuf_reg_r2_832_895_30_31 : label is 31;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_832_895_3_5 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_832_895_3_5 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_832_895_3_5 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_832_895_3_5 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_832_895_3_5 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_832_895_3_5 : label is 832;
  attribute ram_addr_end of linebuf_reg_r2_832_895_3_5 : label is 895;
  attribute ram_offset of linebuf_reg_r2_832_895_3_5 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_832_895_3_5 : label is 3;
  attribute ram_slice_end of linebuf_reg_r2_832_895_3_5 : label is 5;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_832_895_6_8 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_832_895_6_8 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_832_895_6_8 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_832_895_6_8 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_832_895_6_8 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_832_895_6_8 : label is 832;
  attribute ram_addr_end of linebuf_reg_r2_832_895_6_8 : label is 895;
  attribute ram_offset of linebuf_reg_r2_832_895_6_8 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_832_895_6_8 : label is 6;
  attribute ram_slice_end of linebuf_reg_r2_832_895_6_8 : label is 8;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_832_895_9_11 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_832_895_9_11 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_832_895_9_11 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_832_895_9_11 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_832_895_9_11 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_832_895_9_11 : label is 832;
  attribute ram_addr_end of linebuf_reg_r2_832_895_9_11 : label is 895;
  attribute ram_offset of linebuf_reg_r2_832_895_9_11 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_832_895_9_11 : label is 9;
  attribute ram_slice_end of linebuf_reg_r2_832_895_9_11 : label is 11;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_896_959_0_2 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_896_959_0_2 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_896_959_0_2 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_896_959_0_2 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_896_959_0_2 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_896_959_0_2 : label is 896;
  attribute ram_addr_end of linebuf_reg_r2_896_959_0_2 : label is 959;
  attribute ram_offset of linebuf_reg_r2_896_959_0_2 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_896_959_0_2 : label is 0;
  attribute ram_slice_end of linebuf_reg_r2_896_959_0_2 : label is 2;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_896_959_12_14 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_896_959_12_14 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_896_959_12_14 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_896_959_12_14 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_896_959_12_14 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_896_959_12_14 : label is 896;
  attribute ram_addr_end of linebuf_reg_r2_896_959_12_14 : label is 959;
  attribute ram_offset of linebuf_reg_r2_896_959_12_14 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_896_959_12_14 : label is 12;
  attribute ram_slice_end of linebuf_reg_r2_896_959_12_14 : label is 14;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_896_959_15_17 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_896_959_15_17 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_896_959_15_17 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_896_959_15_17 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_896_959_15_17 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_896_959_15_17 : label is 896;
  attribute ram_addr_end of linebuf_reg_r2_896_959_15_17 : label is 959;
  attribute ram_offset of linebuf_reg_r2_896_959_15_17 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_896_959_15_17 : label is 15;
  attribute ram_slice_end of linebuf_reg_r2_896_959_15_17 : label is 17;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_896_959_18_20 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_896_959_18_20 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_896_959_18_20 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_896_959_18_20 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_896_959_18_20 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_896_959_18_20 : label is 896;
  attribute ram_addr_end of linebuf_reg_r2_896_959_18_20 : label is 959;
  attribute ram_offset of linebuf_reg_r2_896_959_18_20 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_896_959_18_20 : label is 18;
  attribute ram_slice_end of linebuf_reg_r2_896_959_18_20 : label is 20;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_896_959_21_23 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_896_959_21_23 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_896_959_21_23 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_896_959_21_23 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_896_959_21_23 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_896_959_21_23 : label is 896;
  attribute ram_addr_end of linebuf_reg_r2_896_959_21_23 : label is 959;
  attribute ram_offset of linebuf_reg_r2_896_959_21_23 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_896_959_21_23 : label is 21;
  attribute ram_slice_end of linebuf_reg_r2_896_959_21_23 : label is 23;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_896_959_24_26 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_896_959_24_26 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_896_959_24_26 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_896_959_24_26 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_896_959_24_26 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_896_959_24_26 : label is 896;
  attribute ram_addr_end of linebuf_reg_r2_896_959_24_26 : label is 959;
  attribute ram_offset of linebuf_reg_r2_896_959_24_26 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_896_959_24_26 : label is 24;
  attribute ram_slice_end of linebuf_reg_r2_896_959_24_26 : label is 26;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_896_959_27_29 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_896_959_27_29 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_896_959_27_29 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_896_959_27_29 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_896_959_27_29 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_896_959_27_29 : label is 896;
  attribute ram_addr_end of linebuf_reg_r2_896_959_27_29 : label is 959;
  attribute ram_offset of linebuf_reg_r2_896_959_27_29 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_896_959_27_29 : label is 27;
  attribute ram_slice_end of linebuf_reg_r2_896_959_27_29 : label is 29;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_896_959_30_31 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_896_959_30_31 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_896_959_30_31 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_896_959_30_31 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_896_959_30_31 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_896_959_30_31 : label is 896;
  attribute ram_addr_end of linebuf_reg_r2_896_959_30_31 : label is 959;
  attribute ram_offset of linebuf_reg_r2_896_959_30_31 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_896_959_30_31 : label is 30;
  attribute ram_slice_end of linebuf_reg_r2_896_959_30_31 : label is 31;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_896_959_3_5 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_896_959_3_5 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_896_959_3_5 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_896_959_3_5 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_896_959_3_5 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_896_959_3_5 : label is 896;
  attribute ram_addr_end of linebuf_reg_r2_896_959_3_5 : label is 959;
  attribute ram_offset of linebuf_reg_r2_896_959_3_5 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_896_959_3_5 : label is 3;
  attribute ram_slice_end of linebuf_reg_r2_896_959_3_5 : label is 5;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_896_959_6_8 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_896_959_6_8 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_896_959_6_8 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_896_959_6_8 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_896_959_6_8 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_896_959_6_8 : label is 896;
  attribute ram_addr_end of linebuf_reg_r2_896_959_6_8 : label is 959;
  attribute ram_offset of linebuf_reg_r2_896_959_6_8 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_896_959_6_8 : label is 6;
  attribute ram_slice_end of linebuf_reg_r2_896_959_6_8 : label is 8;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_896_959_9_11 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_896_959_9_11 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_896_959_9_11 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_896_959_9_11 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_896_959_9_11 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_896_959_9_11 : label is 896;
  attribute ram_addr_end of linebuf_reg_r2_896_959_9_11 : label is 959;
  attribute ram_offset of linebuf_reg_r2_896_959_9_11 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_896_959_9_11 : label is 9;
  attribute ram_slice_end of linebuf_reg_r2_896_959_9_11 : label is 11;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_960_1023_0_2 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_960_1023_0_2 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_960_1023_0_2 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_960_1023_0_2 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_960_1023_0_2 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_960_1023_0_2 : label is 960;
  attribute ram_addr_end of linebuf_reg_r2_960_1023_0_2 : label is 1023;
  attribute ram_offset of linebuf_reg_r2_960_1023_0_2 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_960_1023_0_2 : label is 0;
  attribute ram_slice_end of linebuf_reg_r2_960_1023_0_2 : label is 2;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_960_1023_12_14 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_960_1023_12_14 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_960_1023_12_14 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_960_1023_12_14 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_960_1023_12_14 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_960_1023_12_14 : label is 960;
  attribute ram_addr_end of linebuf_reg_r2_960_1023_12_14 : label is 1023;
  attribute ram_offset of linebuf_reg_r2_960_1023_12_14 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_960_1023_12_14 : label is 12;
  attribute ram_slice_end of linebuf_reg_r2_960_1023_12_14 : label is 14;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_960_1023_15_17 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_960_1023_15_17 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_960_1023_15_17 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_960_1023_15_17 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_960_1023_15_17 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_960_1023_15_17 : label is 960;
  attribute ram_addr_end of linebuf_reg_r2_960_1023_15_17 : label is 1023;
  attribute ram_offset of linebuf_reg_r2_960_1023_15_17 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_960_1023_15_17 : label is 15;
  attribute ram_slice_end of linebuf_reg_r2_960_1023_15_17 : label is 17;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_960_1023_18_20 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_960_1023_18_20 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_960_1023_18_20 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_960_1023_18_20 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_960_1023_18_20 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_960_1023_18_20 : label is 960;
  attribute ram_addr_end of linebuf_reg_r2_960_1023_18_20 : label is 1023;
  attribute ram_offset of linebuf_reg_r2_960_1023_18_20 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_960_1023_18_20 : label is 18;
  attribute ram_slice_end of linebuf_reg_r2_960_1023_18_20 : label is 20;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_960_1023_21_23 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_960_1023_21_23 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_960_1023_21_23 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_960_1023_21_23 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_960_1023_21_23 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_960_1023_21_23 : label is 960;
  attribute ram_addr_end of linebuf_reg_r2_960_1023_21_23 : label is 1023;
  attribute ram_offset of linebuf_reg_r2_960_1023_21_23 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_960_1023_21_23 : label is 21;
  attribute ram_slice_end of linebuf_reg_r2_960_1023_21_23 : label is 23;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_960_1023_24_26 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_960_1023_24_26 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_960_1023_24_26 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_960_1023_24_26 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_960_1023_24_26 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_960_1023_24_26 : label is 960;
  attribute ram_addr_end of linebuf_reg_r2_960_1023_24_26 : label is 1023;
  attribute ram_offset of linebuf_reg_r2_960_1023_24_26 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_960_1023_24_26 : label is 24;
  attribute ram_slice_end of linebuf_reg_r2_960_1023_24_26 : label is 26;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_960_1023_27_29 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_960_1023_27_29 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_960_1023_27_29 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_960_1023_27_29 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_960_1023_27_29 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_960_1023_27_29 : label is 960;
  attribute ram_addr_end of linebuf_reg_r2_960_1023_27_29 : label is 1023;
  attribute ram_offset of linebuf_reg_r2_960_1023_27_29 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_960_1023_27_29 : label is 27;
  attribute ram_slice_end of linebuf_reg_r2_960_1023_27_29 : label is 29;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_960_1023_30_31 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_960_1023_30_31 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_960_1023_30_31 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_960_1023_30_31 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_960_1023_30_31 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_960_1023_30_31 : label is 960;
  attribute ram_addr_end of linebuf_reg_r2_960_1023_30_31 : label is 1023;
  attribute ram_offset of linebuf_reg_r2_960_1023_30_31 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_960_1023_30_31 : label is 30;
  attribute ram_slice_end of linebuf_reg_r2_960_1023_30_31 : label is 31;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_960_1023_3_5 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_960_1023_3_5 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_960_1023_3_5 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_960_1023_3_5 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_960_1023_3_5 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_960_1023_3_5 : label is 960;
  attribute ram_addr_end of linebuf_reg_r2_960_1023_3_5 : label is 1023;
  attribute ram_offset of linebuf_reg_r2_960_1023_3_5 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_960_1023_3_5 : label is 3;
  attribute ram_slice_end of linebuf_reg_r2_960_1023_3_5 : label is 5;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_960_1023_6_8 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_960_1023_6_8 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_960_1023_6_8 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_960_1023_6_8 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_960_1023_6_8 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_960_1023_6_8 : label is 960;
  attribute ram_addr_end of linebuf_reg_r2_960_1023_6_8 : label is 1023;
  attribute ram_offset of linebuf_reg_r2_960_1023_6_8 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_960_1023_6_8 : label is 6;
  attribute ram_slice_end of linebuf_reg_r2_960_1023_6_8 : label is 8;
  attribute METHODOLOGY_DRC_VIOS of linebuf_reg_r2_960_1023_9_11 : label is "";
  attribute RTL_RAM_BITS of linebuf_reg_r2_960_1023_9_11 : label is 32768;
  attribute RTL_RAM_NAME of linebuf_reg_r2_960_1023_9_11 : label is "system_hdmi_0/inst/linebuf_reg";
  attribute RTL_RAM_STYLE of linebuf_reg_r2_960_1023_9_11 : label is "auto";
  attribute RTL_RAM_TYPE of linebuf_reg_r2_960_1023_9_11 : label is "RAM_SDP";
  attribute ram_addr_begin of linebuf_reg_r2_960_1023_9_11 : label is 960;
  attribute ram_addr_end of linebuf_reg_r2_960_1023_9_11 : label is 1023;
  attribute ram_offset of linebuf_reg_r2_960_1023_9_11 : label is 0;
  attribute ram_slice_begin of linebuf_reg_r2_960_1023_9_11 : label is 9;
  attribute ram_slice_end of linebuf_reg_r2_960_1023_9_11 : label is 11;
  attribute ADDER_THRESHOLD of \pix_alive_reg[0]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \pix_alive_reg[12]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \pix_alive_reg[16]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \pix_alive_reg[20]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \pix_alive_reg[4]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \pix_alive_reg[8]_i_1\ : label is 35;
  attribute SOFT_HLUTNM of \rdata_q[0]_i_2\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \rdata_q[24]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \rdata_q[25]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \rdata_q[26]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \rdata_q[27]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \rdata_q[28]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \rdata_q[29]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \rdata_q[30]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \rdata_q[31]_i_3\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \rdata_q[4]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \rdata_q[5]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \rdata_q[6]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \rdata_q[7]_i_1\ : label is "soft_lutpair27";
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of u_clk_fwd : label is "PRIMITIVE";
  attribute OPT_MODIFIED : string;
  attribute OPT_MODIFIED of u_clk_fwd : label is "MLO";
  attribute \__SRVAL\ : string;
  attribute \__SRVAL\ of u_clk_fwd : label is "TRUE";
  attribute BOX_TYPE of u_iobuf_scl : label is "PRIMITIVE";
  attribute BOX_TYPE of u_iobuf_sda : label is "PRIMITIVE";
  attribute SOFT_HLUTNM of u_iobuf_sda_i_1 : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \vcnt[8]_i_2\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \vcnt[9]_i_6\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \vcnt[9]_i_7\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \vcnt[9]_i_8\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \vga_q[1]_i_2\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \vga_q[3]_i_2\ : label is "soft_lutpair39";
begin
  arready_q_reg_0 <= \^arready_q_reg_0\;
  awready_q_reg_0 <= \^awready_q_reg_0\;
  bvalid_q_reg_0 <= \^bvalid_q_reg_0\;
  m_axi_hp_araddr(31 downto 0) <= \^m_axi_hp_araddr\(31 downto 0);
  m_axi_hp_arvalid <= \^m_axi_hp_arvalid\;
  rvalid_q_reg_0 <= \^rvalid_q_reg_0\;
  wready_q_reg_0 <= \^wready_q_reg_0\;
\FSM_sequential_fstate[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"33A833CC338833CC"
    )
        port map (
      I0 => \FSM_sequential_fstate[0]_i_2_n_0\,
      I1 => arvalid_q2_i_4_n_0,
      I2 => m_axi_hp_rlast,
      I3 => fstate(0),
      I4 => fstate(1),
      I5 => m_axi_hp_rvalid,
      O => \FSM_sequential_fstate[0]_i_1_n_0\
    );
\FSM_sequential_fstate[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFBFFF"
    )
        port map (
      I0 => \f_burst_reg_n_0_[2]\,
      I1 => \f_burst_reg_n_0_[0]\,
      I2 => \f_burst_reg_n_0_[1]\,
      I3 => \f_burst_reg_n_0_[4]\,
      I4 => \f_burst_reg_n_0_[3]\,
      O => \FSM_sequential_fstate[0]_i_2_n_0\
    );
\FSM_sequential_fstate[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"51A055A0"
    )
        port map (
      I0 => arvalid_q2_i_4_n_0,
      I1 => m_axi_hp_rlast,
      I2 => fstate(0),
      I3 => fstate(1),
      I4 => m_axi_hp_rvalid,
      O => \FSM_sequential_fstate[1]_i_1_n_0\
    );
\FSM_sequential_fstate_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \FSM_sequential_fstate[0]_i_1_n_0\,
      Q => fstate(0),
      R => \rdata_q[31]_i_1_n_0\
    );
\FSM_sequential_fstate_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \FSM_sequential_fstate[1]_i_1_n_0\,
      Q => fstate(1),
      R => \rdata_q[31]_i_1_n_0\
    );
ar_done_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000EA00EA00EA00"
    )
        port map (
      I0 => ar_done_reg_n_0,
      I1 => s_axi_lite_arvalid,
      I2 => \^arready_q_reg_0\,
      I3 => aresetn,
      I4 => \^rvalid_q_reg_0\,
      I5 => s_axi_lite_rready,
      O => ar_done_i_1_n_0
    );
ar_done_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => ar_done_i_1_n_0,
      Q => ar_done_reg_n_0,
      R => '0'
    );
\araddr_q[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => \^arready_q_reg_0\,
      I1 => s_axi_lite_arvalid,
      I2 => ar_done_reg_n_0,
      O => \araddr_q[7]_i_1_n_0\
    );
\araddr_q_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \araddr_q[7]_i_1_n_0\,
      D => s_axi_lite_araddr(0),
      Q => araddr_q(0),
      R => \rdata_q[31]_i_1_n_0\
    );
\araddr_q_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \araddr_q[7]_i_1_n_0\,
      D => s_axi_lite_araddr(1),
      Q => araddr_q(1),
      R => \rdata_q[31]_i_1_n_0\
    );
\araddr_q_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \araddr_q[7]_i_1_n_0\,
      D => s_axi_lite_araddr(2),
      Q => araddr_q(2),
      R => \rdata_q[31]_i_1_n_0\
    );
\araddr_q_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \araddr_q[7]_i_1_n_0\,
      D => s_axi_lite_araddr(3),
      Q => araddr_q(3),
      R => \rdata_q[31]_i_1_n_0\
    );
\araddr_q_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \araddr_q[7]_i_1_n_0\,
      D => s_axi_lite_araddr(4),
      Q => araddr_q(4),
      R => \rdata_q[31]_i_1_n_0\
    );
\araddr_q_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \araddr_q[7]_i_1_n_0\,
      D => s_axi_lite_araddr(5),
      Q => araddr_q(5),
      R => \rdata_q[31]_i_1_n_0\
    );
\araddr_q_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \araddr_q[7]_i_1_n_0\,
      D => s_axi_lite_araddr(6),
      Q => araddr_q(6),
      R => \rdata_q[31]_i_1_n_0\
    );
\araddr_q_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \araddr_q[7]_i_1_n_0\,
      D => s_axi_lite_araddr(7),
      Q => araddr_q(7),
      R => \rdata_q[31]_i_1_n_0\
    );
arready_q_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"882A"
    )
        port map (
      I0 => aresetn,
      I1 => \^arready_q_reg_0\,
      I2 => s_axi_lite_arvalid,
      I3 => ar_done_reg_n_0,
      O => arready_q_i_1_n_0
    );
arready_q_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => arready_q_i_1_n_0,
      Q => \^arready_q_reg_0\,
      R => '0'
    );
arvalid_q2_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F8F8F8FFF8F8F800"
    )
        port map (
      I0 => m_axi_hp_rlast,
      I1 => arvalid_q2_i_2_n_0,
      I2 => f_line(0),
      I3 => \f_addr[31]_i_3_n_0\,
      I4 => arvalid_q2_i_4_n_0,
      I5 => \^m_axi_hp_arvalid\,
      O => arvalid_q2_i_1_n_0
    );
arvalid_q2_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => fstate(1),
      I1 => fstate(0),
      O => arvalid_q2_i_2_n_0
    );
arvalid_q2_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000600000000"
    )
        port map (
      I0 => t_s3,
      I1 => t_s2,
      I2 => fstate(0),
      I3 => fstate(1),
      I4 => p_3_in(3),
      I5 => p_3_in(0),
      O => f_line(0)
    );
arvalid_q2_i_4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAEAAA"
    )
        port map (
      I0 => arvalid_q2_i_5_n_0,
      I1 => \^m_axi_hp_arvalid\,
      I2 => m_axi_hp_arready,
      I3 => fstate(0),
      I4 => fstate(1),
      O => arvalid_q2_i_4_n_0
    );
arvalid_q2_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000028"
    )
        port map (
      I0 => p_3_in(0),
      I1 => t_s2,
      I2 => t_s3,
      I3 => p_3_in(3),
      I4 => fstate(1),
      I5 => fstate(0),
      O => arvalid_q2_i_5_n_0
    );
arvalid_q2_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => arvalid_q2_i_1_n_0,
      Q => \^m_axi_hp_arvalid\,
      R => \rdata_q[31]_i_1_n_0\
    );
aw_done_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000EA00EA00EA00"
    )
        port map (
      I0 => aw_done_reg_n_0,
      I1 => s_axi_lite_awvalid,
      I2 => \^awready_q_reg_0\,
      I3 => aresetn,
      I4 => \^bvalid_q_reg_0\,
      I5 => s_axi_lite_bready,
      O => aw_done_i_1_n_0
    );
aw_done_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => aw_done_i_1_n_0,
      Q => aw_done_reg_n_0,
      R => '0'
    );
\awaddr_q[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => \^awready_q_reg_0\,
      I1 => s_axi_lite_awvalid,
      I2 => aw_done_reg_n_0,
      O => \awaddr_q[7]_i_1_n_0\
    );
\awaddr_q_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \awaddr_q[7]_i_1_n_0\,
      D => s_axi_lite_awaddr(0),
      Q => \awaddr_q_reg_n_0_[0]\,
      R => \rdata_q[31]_i_1_n_0\
    );
\awaddr_q_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \awaddr_q[7]_i_1_n_0\,
      D => s_axi_lite_awaddr(1),
      Q => \awaddr_q_reg_n_0_[1]\,
      R => \rdata_q[31]_i_1_n_0\
    );
\awaddr_q_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \awaddr_q[7]_i_1_n_0\,
      D => s_axi_lite_awaddr(2),
      Q => \awaddr_q_reg_n_0_[2]\,
      R => \rdata_q[31]_i_1_n_0\
    );
\awaddr_q_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \awaddr_q[7]_i_1_n_0\,
      D => s_axi_lite_awaddr(3),
      Q => \awaddr_q_reg_n_0_[3]\,
      R => \rdata_q[31]_i_1_n_0\
    );
\awaddr_q_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \awaddr_q[7]_i_1_n_0\,
      D => s_axi_lite_awaddr(4),
      Q => p_0_in0,
      R => \rdata_q[31]_i_1_n_0\
    );
\awaddr_q_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \awaddr_q[7]_i_1_n_0\,
      D => s_axi_lite_awaddr(5),
      Q => \awaddr_q_reg_n_0_[5]\,
      R => \rdata_q[31]_i_1_n_0\
    );
\awaddr_q_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \awaddr_q[7]_i_1_n_0\,
      D => s_axi_lite_awaddr(6),
      Q => \awaddr_q_reg_n_0_[6]\,
      R => \rdata_q[31]_i_1_n_0\
    );
\awaddr_q_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \awaddr_q[7]_i_1_n_0\,
      D => s_axi_lite_awaddr(7),
      Q => \awaddr_q_reg_n_0_[7]\,
      R => \rdata_q[31]_i_1_n_0\
    );
awready_q_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"882A"
    )
        port map (
      I0 => aresetn,
      I1 => \^awready_q_reg_0\,
      I2 => s_axi_lite_awvalid,
      I3 => aw_done_reg_n_0,
      O => awready_q_i_1_n_0
    );
awready_q_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => awready_q_i_1_n_0,
      Q => \^awready_q_reg_0\,
      R => '0'
    );
bvalid_q_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0080F080"
    )
        port map (
      I0 => aw_done_reg_n_0,
      I1 => w_done_reg_n_0,
      I2 => aresetn,
      I3 => \^bvalid_q_reg_0\,
      I4 => s_axi_lite_bready,
      O => bvalid_q_i_1_n_0
    );
bvalid_q_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => bvalid_q_i_1_n_0,
      Q => \^bvalid_q_reg_0\,
      R => '0'
    );
ccs_p1_reg: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => ctrl_cbcr_swap,
      Q => ccs_p1,
      R => '0'
    );
ccs_p2_reg: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => ccs_p1,
      Q => ccs_p2,
      R => '0'
    );
ctrl_cbcr_swap_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => ctrl_enable,
      D => \wdata_q_reg_n_0_[2]\,
      Q => ctrl_cbcr_swap,
      R => \rdata_q[31]_i_1_n_0\
    );
ctrl_enable_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000002"
    )
        port map (
      I0 => ctrl_enable1,
      I1 => ctrl_enable_i_3_n_0,
      I2 => \awaddr_q_reg_n_0_[3]\,
      I3 => \awaddr_q_reg_n_0_[2]\,
      I4 => \awaddr_q_reg_n_0_[0]\,
      I5 => \awaddr_q_reg_n_0_[1]\,
      O => ctrl_enable
    );
ctrl_enable_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => aw_done_reg_n_0,
      I1 => \^bvalid_q_reg_0\,
      I2 => w_done_reg_n_0,
      O => ctrl_enable1
    );
ctrl_enable_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \awaddr_q_reg_n_0_[6]\,
      I1 => \awaddr_q_reg_n_0_[7]\,
      I2 => p_0_in0,
      I3 => \awaddr_q_reg_n_0_[5]\,
      O => ctrl_enable_i_3_n_0
    );
ctrl_enable_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => ctrl_enable,
      D => \wdata_q_reg_n_0_[0]\,
      Q => p_3_in(0),
      R => \rdata_q[31]_i_1_n_0\
    );
ctrl_mono_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => ctrl_enable,
      D => p_1_in,
      Q => ctrl_mono,
      R => \rdata_q[31]_i_1_n_0\
    );
ctrl_testpat_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => ctrl_enable,
      D => \wdata_q_reg_n_0_[3]\,
      Q => p_3_in(3),
      R => \rdata_q[31]_i_1_n_0\
    );
ctrl_yc_swap_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => ctrl_enable,
      D => \wdata_q_reg_n_0_[1]\,
      Q => ctrl_yc_swap,
      R => \rdata_q[31]_i_1_n_0\
    );
en_p1_reg: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => p_3_in(0),
      Q => en_p1,
      R => '0'
    );
en_p2_reg: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => en_p1,
      Q => en_p2,
      R => '0'
    );
f_addr0: unisim.vcomponents.DSP48E1
    generic map(
      ACASCREG => 1,
      ADREG => 1,
      ALUMODEREG => 0,
      AREG => 1,
      AUTORESET_PATDET => "NO_RESET",
      A_INPUT => "DIRECT",
      BCASCREG => 0,
      BREG => 0,
      B_INPUT => "DIRECT",
      CARRYINREG => 0,
      CARRYINSELREG => 0,
      CREG => 0,
      DREG => 1,
      INMODEREG => 0,
      MASK => X"3FFFFFFFFFFF",
      MREG => 0,
      OPMODEREG => 0,
      PATTERN => X"000000000000",
      PREG => 0,
      SEL_MASK => "MASK",
      SEL_PATTERN => "PATTERN",
      USE_DPORT => false,
      USE_MULT => "MULTIPLY",
      USE_PATTERN_DETECT => "NO_PATDET",
      USE_SIMD => "ONE48"
    )
        port map (
      A(29 downto 10) => B"00000000000000000000",
      A(9 downto 0) => \vcnt__0\(9 downto 0),
      ACIN(29 downto 0) => B"000000000000000000000000000000",
      ACOUT(29 downto 0) => NLW_f_addr0_ACOUT_UNCONNECTED(29 downto 0),
      ALUMODE(3 downto 0) => B"0000",
      B(17 downto 0) => B"000000010100000000",
      BCIN(17 downto 0) => B"000000000000000000",
      BCOUT(17 downto 0) => NLW_f_addr0_BCOUT_UNCONNECTED(17 downto 0),
      C(47 downto 32) => B"0000000000000000",
      C(31 downto 0) => fb_base(31 downto 0),
      CARRYCASCIN => '0',
      CARRYCASCOUT => NLW_f_addr0_CARRYCASCOUT_UNCONNECTED,
      CARRYIN => '0',
      CARRYINSEL(2 downto 0) => B"000",
      CARRYOUT(3 downto 0) => NLW_f_addr0_CARRYOUT_UNCONNECTED(3 downto 0),
      CEA1 => '0',
      CEA2 => line_req_tgl0,
      CEAD => '0',
      CEALUMODE => '0',
      CEB1 => '0',
      CEB2 => '0',
      CEC => '0',
      CECARRYIN => '0',
      CECTRL => '0',
      CED => '0',
      CEINMODE => '0',
      CEM => '0',
      CEP => '0',
      CLK => pixel_clk,
      D(24 downto 0) => B"0000000000000000000000000",
      INMODE(4 downto 0) => B"00000",
      MULTSIGNIN => '0',
      MULTSIGNOUT => NLW_f_addr0_MULTSIGNOUT_UNCONNECTED,
      OPMODE(6 downto 0) => B"0110101",
      OVERFLOW => NLW_f_addr0_OVERFLOW_UNCONNECTED,
      P(47 downto 32) => NLW_f_addr0_P_UNCONNECTED(47 downto 32),
      P(31) => f_addr0_n_74,
      P(30) => f_addr0_n_75,
      P(29) => f_addr0_n_76,
      P(28) => f_addr0_n_77,
      P(27) => f_addr0_n_78,
      P(26) => f_addr0_n_79,
      P(25) => f_addr0_n_80,
      P(24) => f_addr0_n_81,
      P(23) => f_addr0_n_82,
      P(22) => f_addr0_n_83,
      P(21) => f_addr0_n_84,
      P(20) => f_addr0_n_85,
      P(19) => f_addr0_n_86,
      P(18) => f_addr0_n_87,
      P(17) => f_addr0_n_88,
      P(16) => f_addr0_n_89,
      P(15) => f_addr0_n_90,
      P(14) => f_addr0_n_91,
      P(13) => f_addr0_n_92,
      P(12) => f_addr0_n_93,
      P(11) => f_addr0_n_94,
      P(10) => f_addr0_n_95,
      P(9) => f_addr0_n_96,
      P(8) => f_addr0_n_97,
      P(7) => f_addr0_n_98,
      P(6) => f_addr0_n_99,
      P(5) => f_addr0_n_100,
      P(4) => f_addr0_n_101,
      P(3) => f_addr0_n_102,
      P(2) => f_addr0_n_103,
      P(1) => f_addr0_n_104,
      P(0) => f_addr0_n_105,
      PATTERNBDETECT => NLW_f_addr0_PATTERNBDETECT_UNCONNECTED,
      PATTERNDETECT => NLW_f_addr0_PATTERNDETECT_UNCONNECTED,
      PCIN(47 downto 0) => B"000000000000000000000000000000000000000000000000",
      PCOUT(47 downto 0) => NLW_f_addr0_PCOUT_UNCONNECTED(47 downto 0),
      RSTA => \vcnt[9]_i_1_n_0\,
      RSTALLCARRYIN => '0',
      RSTALUMODE => '0',
      RSTB => '0',
      RSTC => '0',
      RSTCTRL => '0',
      RSTD => '0',
      RSTINMODE => '0',
      RSTM => '0',
      RSTP => '0',
      UNDERFLOW => NLW_f_addr0_UNDERFLOW_UNCONNECTED
    );
f_addr0_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => f_addr0_carry_n_0,
      CO(2) => f_addr0_carry_n_1,
      CO(1) => f_addr0_carry_n_2,
      CO(0) => f_addr0_carry_n_3,
      CYINIT => '0',
      DI(3 downto 2) => B"00",
      DI(1) => \^m_axi_hp_araddr\(6),
      DI(0) => '0',
      O(3 downto 0) => in10(8 downto 5),
      S(3 downto 2) => \^m_axi_hp_araddr\(8 downto 7),
      S(1) => f_addr0_carry_i_1_n_0,
      S(0) => \^m_axi_hp_araddr\(5)
    );
\f_addr0_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => f_addr0_carry_n_0,
      CO(3) => \f_addr0_carry__0_n_0\,
      CO(2) => \f_addr0_carry__0_n_1\,
      CO(1) => \f_addr0_carry__0_n_2\,
      CO(0) => \f_addr0_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => in10(12 downto 9),
      S(3 downto 0) => \^m_axi_hp_araddr\(12 downto 9)
    );
\f_addr0_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \f_addr0_carry__0_n_0\,
      CO(3) => \f_addr0_carry__1_n_0\,
      CO(2) => \f_addr0_carry__1_n_1\,
      CO(1) => \f_addr0_carry__1_n_2\,
      CO(0) => \f_addr0_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => in10(16 downto 13),
      S(3 downto 0) => \^m_axi_hp_araddr\(16 downto 13)
    );
\f_addr0_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \f_addr0_carry__1_n_0\,
      CO(3) => \f_addr0_carry__2_n_0\,
      CO(2) => \f_addr0_carry__2_n_1\,
      CO(1) => \f_addr0_carry__2_n_2\,
      CO(0) => \f_addr0_carry__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => in10(20 downto 17),
      S(3 downto 0) => \^m_axi_hp_araddr\(20 downto 17)
    );
\f_addr0_carry__3\: unisim.vcomponents.CARRY4
     port map (
      CI => \f_addr0_carry__2_n_0\,
      CO(3) => \f_addr0_carry__3_n_0\,
      CO(2) => \f_addr0_carry__3_n_1\,
      CO(1) => \f_addr0_carry__3_n_2\,
      CO(0) => \f_addr0_carry__3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => in10(24 downto 21),
      S(3 downto 0) => \^m_axi_hp_araddr\(24 downto 21)
    );
\f_addr0_carry__4\: unisim.vcomponents.CARRY4
     port map (
      CI => \f_addr0_carry__3_n_0\,
      CO(3) => \f_addr0_carry__4_n_0\,
      CO(2) => \f_addr0_carry__4_n_1\,
      CO(1) => \f_addr0_carry__4_n_2\,
      CO(0) => \f_addr0_carry__4_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => in10(28 downto 25),
      S(3 downto 0) => \^m_axi_hp_araddr\(28 downto 25)
    );
\f_addr0_carry__5\: unisim.vcomponents.CARRY4
     port map (
      CI => \f_addr0_carry__4_n_0\,
      CO(3 downto 2) => \NLW_f_addr0_carry__5_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \f_addr0_carry__5_n_2\,
      CO(0) => \f_addr0_carry__5_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_f_addr0_carry__5_O_UNCONNECTED\(3),
      O(2 downto 0) => in10(31 downto 29),
      S(3) => '0',
      S(2 downto 0) => \^m_axi_hp_araddr\(31 downto 29)
    );
f_addr0_carry_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^m_axi_hp_araddr\(6),
      O => f_addr0_carry_i_1_n_0
    );
f_addr0_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0080808080800080"
    )
        port map (
      I0 => f_addr0_i_2_n_0,
      I1 => f_addr0_i_3_n_0,
      I2 => f_addr0_i_4_n_0,
      I3 => f_addr0_i_5_n_0,
      I4 => \vcnt_reg_n_0_[9]\,
      I5 => \vcnt[9]_i_6_n_0\,
      O => line_req_tgl0
    );
f_addr0_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F77FFFFF"
    )
        port map (
      I0 => \vcnt_reg_n_0_[8]\,
      I1 => \vcnt_reg_n_0_[6]\,
      I2 => \vcnt[8]_i_2_n_0\,
      I3 => \vcnt_reg_n_0_[5]\,
      I4 => \vcnt_reg_n_0_[7]\,
      O => f_addr0_i_2_n_0
    );
f_addr0_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => p_0_in_2(5),
      I1 => p_0_in_2(4),
      I2 => p_0_in_2(3),
      O => f_addr0_i_3_n_0
    );
f_addr0_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000100"
    )
        port map (
      I0 => p_0_in_2(1),
      I1 => p_0_in_2(8),
      I2 => p_0_in_2(2),
      I3 => \vga_q[1]_i_2_n_0\,
      I4 => p_0_in_2(0),
      I5 => \hcnt_reg_n_0_[0]\,
      O => f_addr0_i_4_n_0
    );
f_addr0_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFEFF"
    )
        port map (
      I0 => rd_addr_next(9),
      I1 => \vcnt[9]_i_8_n_0\,
      I2 => \vcnt_reg_n_0_[1]\,
      I3 => \vcnt_reg_n_0_[2]\,
      I4 => f_addr0_i_6_n_0,
      I5 => f_addr0_i_7_n_0,
      O => f_addr0_i_5_n_0
    );
f_addr0_i_6: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \vcnt_reg_n_0_[6]\,
      I1 => \vcnt_reg_n_0_[7]\,
      O => f_addr0_i_6_n_0
    );
f_addr0_i_7: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EF"
    )
        port map (
      I0 => \vcnt_reg_n_0_[7]\,
      I1 => \vcnt_reg_n_0_[8]\,
      I2 => \vcnt_reg_n_0_[9]\,
      O => f_addr0_i_7_n_0
    );
\f_addr[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00CA"
    )
        port map (
      I0 => f_addr0_n_105,
      I1 => \^m_axi_hp_araddr\(0),
      I2 => fstate(1),
      I3 => fstate(0),
      O => f_addr(0)
    );
\f_addr[10]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0A0C"
    )
        port map (
      I0 => in10(10),
      I1 => f_addr0_n_95,
      I2 => fstate(0),
      I3 => fstate(1),
      O => f_addr(10)
    );
\f_addr[11]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0A0C"
    )
        port map (
      I0 => in10(11),
      I1 => f_addr0_n_94,
      I2 => fstate(0),
      I3 => fstate(1),
      O => f_addr(11)
    );
\f_addr[12]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0A0C"
    )
        port map (
      I0 => in10(12),
      I1 => f_addr0_n_93,
      I2 => fstate(0),
      I3 => fstate(1),
      O => f_addr(12)
    );
\f_addr[13]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0A0C"
    )
        port map (
      I0 => in10(13),
      I1 => f_addr0_n_92,
      I2 => fstate(0),
      I3 => fstate(1),
      O => f_addr(13)
    );
\f_addr[14]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0A0C"
    )
        port map (
      I0 => in10(14),
      I1 => f_addr0_n_91,
      I2 => fstate(0),
      I3 => fstate(1),
      O => f_addr(14)
    );
\f_addr[15]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0A0C"
    )
        port map (
      I0 => in10(15),
      I1 => f_addr0_n_90,
      I2 => fstate(0),
      I3 => fstate(1),
      O => f_addr(15)
    );
\f_addr[16]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0A0C"
    )
        port map (
      I0 => in10(16),
      I1 => f_addr0_n_89,
      I2 => fstate(0),
      I3 => fstate(1),
      O => f_addr(16)
    );
\f_addr[17]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0A0C"
    )
        port map (
      I0 => in10(17),
      I1 => f_addr0_n_88,
      I2 => fstate(0),
      I3 => fstate(1),
      O => f_addr(17)
    );
\f_addr[18]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0A0C"
    )
        port map (
      I0 => in10(18),
      I1 => f_addr0_n_87,
      I2 => fstate(0),
      I3 => fstate(1),
      O => f_addr(18)
    );
\f_addr[19]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0A0C"
    )
        port map (
      I0 => in10(19),
      I1 => f_addr0_n_86,
      I2 => fstate(0),
      I3 => fstate(1),
      O => f_addr(19)
    );
\f_addr[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00CA"
    )
        port map (
      I0 => f_addr0_n_104,
      I1 => \^m_axi_hp_araddr\(1),
      I2 => fstate(1),
      I3 => fstate(0),
      O => f_addr(1)
    );
\f_addr[20]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0A0C"
    )
        port map (
      I0 => in10(20),
      I1 => f_addr0_n_85,
      I2 => fstate(0),
      I3 => fstate(1),
      O => f_addr(20)
    );
\f_addr[21]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0A0C"
    )
        port map (
      I0 => in10(21),
      I1 => f_addr0_n_84,
      I2 => fstate(0),
      I3 => fstate(1),
      O => f_addr(21)
    );
\f_addr[22]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0A0C"
    )
        port map (
      I0 => in10(22),
      I1 => f_addr0_n_83,
      I2 => fstate(0),
      I3 => fstate(1),
      O => f_addr(22)
    );
\f_addr[23]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0A0C"
    )
        port map (
      I0 => in10(23),
      I1 => f_addr0_n_82,
      I2 => fstate(0),
      I3 => fstate(1),
      O => f_addr(23)
    );
\f_addr[24]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0A0C"
    )
        port map (
      I0 => in10(24),
      I1 => f_addr0_n_81,
      I2 => fstate(0),
      I3 => fstate(1),
      O => f_addr(24)
    );
\f_addr[25]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0A0C"
    )
        port map (
      I0 => in10(25),
      I1 => f_addr0_n_80,
      I2 => fstate(0),
      I3 => fstate(1),
      O => f_addr(25)
    );
\f_addr[26]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0A0C"
    )
        port map (
      I0 => in10(26),
      I1 => f_addr0_n_79,
      I2 => fstate(0),
      I3 => fstate(1),
      O => f_addr(26)
    );
\f_addr[27]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0A0C"
    )
        port map (
      I0 => in10(27),
      I1 => f_addr0_n_78,
      I2 => fstate(0),
      I3 => fstate(1),
      O => f_addr(27)
    );
\f_addr[28]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0A0C"
    )
        port map (
      I0 => in10(28),
      I1 => f_addr0_n_77,
      I2 => fstate(0),
      I3 => fstate(1),
      O => f_addr(28)
    );
\f_addr[29]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0A0C"
    )
        port map (
      I0 => in10(29),
      I1 => f_addr0_n_76,
      I2 => fstate(0),
      I3 => fstate(1),
      O => f_addr(29)
    );
\f_addr[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00CA"
    )
        port map (
      I0 => f_addr0_n_103,
      I1 => \^m_axi_hp_araddr\(2),
      I2 => fstate(1),
      I3 => fstate(0),
      O => f_addr(2)
    );
\f_addr[30]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0A0C"
    )
        port map (
      I0 => in10(30),
      I1 => f_addr0_n_75,
      I2 => fstate(0),
      I3 => fstate(1),
      O => f_addr(30)
    );
\f_addr[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAEAAAEAAAAAA"
    )
        port map (
      I0 => \f_addr[31]_i_3_n_0\,
      I1 => p_3_in(0),
      I2 => p_3_in(3),
      I3 => \f_addr[31]_i_4_n_0\,
      I4 => t_s2,
      I5 => t_s3,
      O => f_burst(0)
    );
\f_addr[31]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0A0C"
    )
        port map (
      I0 => in10(31),
      I1 => f_addr0_n_74,
      I2 => fstate(0),
      I3 => fstate(1),
      O => f_addr(31)
    );
\f_addr[31]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFB000000000000"
    )
        port map (
      I0 => \f_burst_reg_n_0_[3]\,
      I1 => \f_burst_reg_n_0_[4]\,
      I2 => \f_addr[31]_i_5_n_0\,
      I3 => \f_burst_reg_n_0_[2]\,
      I4 => m_axi_hp_rlast,
      I5 => lb_waddr(0),
      O => \f_addr[31]_i_3_n_0\
    );
\f_addr[31]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => fstate(0),
      I1 => fstate(1),
      O => \f_addr[31]_i_4_n_0\
    );
\f_addr[31]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \f_burst_reg_n_0_[0]\,
      I1 => \f_burst_reg_n_0_[1]\,
      O => \f_addr[31]_i_5_n_0\
    );
\f_addr[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00CA"
    )
        port map (
      I0 => f_addr0_n_102,
      I1 => \^m_axi_hp_araddr\(3),
      I2 => fstate(1),
      I3 => fstate(0),
      O => f_addr(3)
    );
\f_addr[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00CA"
    )
        port map (
      I0 => f_addr0_n_101,
      I1 => \^m_axi_hp_araddr\(4),
      I2 => fstate(1),
      I3 => fstate(0),
      O => f_addr(4)
    );
\f_addr[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0A0C"
    )
        port map (
      I0 => in10(5),
      I1 => f_addr0_n_100,
      I2 => fstate(0),
      I3 => fstate(1),
      O => f_addr(5)
    );
\f_addr[6]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0A0C"
    )
        port map (
      I0 => in10(6),
      I1 => f_addr0_n_99,
      I2 => fstate(0),
      I3 => fstate(1),
      O => f_addr(6)
    );
\f_addr[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0A0C"
    )
        port map (
      I0 => in10(7),
      I1 => f_addr0_n_98,
      I2 => fstate(0),
      I3 => fstate(1),
      O => f_addr(7)
    );
\f_addr[8]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0A0C"
    )
        port map (
      I0 => in10(8),
      I1 => f_addr0_n_97,
      I2 => fstate(0),
      I3 => fstate(1),
      O => f_addr(8)
    );
\f_addr[9]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0A0C"
    )
        port map (
      I0 => in10(9),
      I1 => f_addr0_n_96,
      I2 => fstate(0),
      I3 => fstate(1),
      O => f_addr(9)
    );
\f_addr_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => f_burst(0),
      D => f_addr(0),
      Q => \^m_axi_hp_araddr\(0),
      R => \rdata_q[31]_i_1_n_0\
    );
\f_addr_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => f_burst(0),
      D => f_addr(10),
      Q => \^m_axi_hp_araddr\(10),
      R => \rdata_q[31]_i_1_n_0\
    );
\f_addr_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => f_burst(0),
      D => f_addr(11),
      Q => \^m_axi_hp_araddr\(11),
      R => \rdata_q[31]_i_1_n_0\
    );
\f_addr_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => f_burst(0),
      D => f_addr(12),
      Q => \^m_axi_hp_araddr\(12),
      R => \rdata_q[31]_i_1_n_0\
    );
\f_addr_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => f_burst(0),
      D => f_addr(13),
      Q => \^m_axi_hp_araddr\(13),
      R => \rdata_q[31]_i_1_n_0\
    );
\f_addr_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => f_burst(0),
      D => f_addr(14),
      Q => \^m_axi_hp_araddr\(14),
      R => \rdata_q[31]_i_1_n_0\
    );
\f_addr_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => f_burst(0),
      D => f_addr(15),
      Q => \^m_axi_hp_araddr\(15),
      R => \rdata_q[31]_i_1_n_0\
    );
\f_addr_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => f_burst(0),
      D => f_addr(16),
      Q => \^m_axi_hp_araddr\(16),
      R => \rdata_q[31]_i_1_n_0\
    );
\f_addr_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => f_burst(0),
      D => f_addr(17),
      Q => \^m_axi_hp_araddr\(17),
      R => \rdata_q[31]_i_1_n_0\
    );
\f_addr_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => f_burst(0),
      D => f_addr(18),
      Q => \^m_axi_hp_araddr\(18),
      R => \rdata_q[31]_i_1_n_0\
    );
\f_addr_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => f_burst(0),
      D => f_addr(19),
      Q => \^m_axi_hp_araddr\(19),
      R => \rdata_q[31]_i_1_n_0\
    );
\f_addr_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => f_burst(0),
      D => f_addr(1),
      Q => \^m_axi_hp_araddr\(1),
      R => \rdata_q[31]_i_1_n_0\
    );
\f_addr_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => f_burst(0),
      D => f_addr(20),
      Q => \^m_axi_hp_araddr\(20),
      R => \rdata_q[31]_i_1_n_0\
    );
\f_addr_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => f_burst(0),
      D => f_addr(21),
      Q => \^m_axi_hp_araddr\(21),
      R => \rdata_q[31]_i_1_n_0\
    );
\f_addr_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => f_burst(0),
      D => f_addr(22),
      Q => \^m_axi_hp_araddr\(22),
      R => \rdata_q[31]_i_1_n_0\
    );
\f_addr_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => f_burst(0),
      D => f_addr(23),
      Q => \^m_axi_hp_araddr\(23),
      R => \rdata_q[31]_i_1_n_0\
    );
\f_addr_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => f_burst(0),
      D => f_addr(24),
      Q => \^m_axi_hp_araddr\(24),
      R => \rdata_q[31]_i_1_n_0\
    );
\f_addr_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => f_burst(0),
      D => f_addr(25),
      Q => \^m_axi_hp_araddr\(25),
      R => \rdata_q[31]_i_1_n_0\
    );
\f_addr_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => f_burst(0),
      D => f_addr(26),
      Q => \^m_axi_hp_araddr\(26),
      R => \rdata_q[31]_i_1_n_0\
    );
\f_addr_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => f_burst(0),
      D => f_addr(27),
      Q => \^m_axi_hp_araddr\(27),
      R => \rdata_q[31]_i_1_n_0\
    );
\f_addr_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => f_burst(0),
      D => f_addr(28),
      Q => \^m_axi_hp_araddr\(28),
      R => \rdata_q[31]_i_1_n_0\
    );
\f_addr_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => f_burst(0),
      D => f_addr(29),
      Q => \^m_axi_hp_araddr\(29),
      R => \rdata_q[31]_i_1_n_0\
    );
\f_addr_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => f_burst(0),
      D => f_addr(2),
      Q => \^m_axi_hp_araddr\(2),
      R => \rdata_q[31]_i_1_n_0\
    );
\f_addr_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => f_burst(0),
      D => f_addr(30),
      Q => \^m_axi_hp_araddr\(30),
      R => \rdata_q[31]_i_1_n_0\
    );
\f_addr_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => f_burst(0),
      D => f_addr(31),
      Q => \^m_axi_hp_araddr\(31),
      R => \rdata_q[31]_i_1_n_0\
    );
\f_addr_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => f_burst(0),
      D => f_addr(3),
      Q => \^m_axi_hp_araddr\(3),
      R => \rdata_q[31]_i_1_n_0\
    );
\f_addr_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => f_burst(0),
      D => f_addr(4),
      Q => \^m_axi_hp_araddr\(4),
      R => \rdata_q[31]_i_1_n_0\
    );
\f_addr_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => f_burst(0),
      D => f_addr(5),
      Q => \^m_axi_hp_araddr\(5),
      R => \rdata_q[31]_i_1_n_0\
    );
\f_addr_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => f_burst(0),
      D => f_addr(6),
      Q => \^m_axi_hp_araddr\(6),
      R => \rdata_q[31]_i_1_n_0\
    );
\f_addr_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => f_burst(0),
      D => f_addr(7),
      Q => \^m_axi_hp_araddr\(7),
      R => \rdata_q[31]_i_1_n_0\
    );
\f_addr_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => f_burst(0),
      D => f_addr(8),
      Q => \^m_axi_hp_araddr\(8),
      R => \rdata_q[31]_i_1_n_0\
    );
\f_addr_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => f_burst(0),
      D => f_addr(9),
      Q => \^m_axi_hp_araddr\(9),
      R => \rdata_q[31]_i_1_n_0\
    );
\f_burst[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => fstate(0),
      I1 => fstate(1),
      I2 => \f_burst_reg_n_0_[0]\,
      O => \f_burst[0]_i_1_n_0\
    );
\f_burst[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0440"
    )
        port map (
      I0 => fstate(0),
      I1 => fstate(1),
      I2 => \f_burst_reg_n_0_[1]\,
      I3 => \f_burst_reg_n_0_[0]\,
      O => \f_burst[1]_i_1_n_0\
    );
\f_burst[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"04404040"
    )
        port map (
      I0 => fstate(0),
      I1 => fstate(1),
      I2 => \f_burst_reg_n_0_[2]\,
      I3 => \f_burst_reg_n_0_[0]\,
      I4 => \f_burst_reg_n_0_[1]\,
      O => \f_burst[2]_i_1_n_0\
    );
\f_burst[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0440404040404040"
    )
        port map (
      I0 => fstate(0),
      I1 => fstate(1),
      I2 => \f_burst_reg_n_0_[3]\,
      I3 => \f_burst_reg_n_0_[2]\,
      I4 => \f_burst_reg_n_0_[1]\,
      I5 => \f_burst_reg_n_0_[0]\,
      O => \f_burst[3]_i_1_n_0\
    );
\f_burst[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2888888888888888"
    )
        port map (
      I0 => arvalid_q2_i_2_n_0,
      I1 => \f_burst_reg_n_0_[4]\,
      I2 => \f_burst_reg_n_0_[3]\,
      I3 => \f_burst_reg_n_0_[2]\,
      I4 => \f_burst_reg_n_0_[1]\,
      I5 => \f_burst_reg_n_0_[0]\,
      O => \f_burst[4]_i_1_n_0\
    );
\f_burst_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => f_burst(0),
      D => \f_burst[0]_i_1_n_0\,
      Q => \f_burst_reg_n_0_[0]\,
      R => \rdata_q[31]_i_1_n_0\
    );
\f_burst_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => f_burst(0),
      D => \f_burst[1]_i_1_n_0\,
      Q => \f_burst_reg_n_0_[1]\,
      R => \rdata_q[31]_i_1_n_0\
    );
\f_burst_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => f_burst(0),
      D => \f_burst[2]_i_1_n_0\,
      Q => \f_burst_reg_n_0_[2]\,
      R => \rdata_q[31]_i_1_n_0\
    );
\f_burst_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => f_burst(0),
      D => \f_burst[3]_i_1_n_0\,
      Q => \f_burst_reg_n_0_[3]\,
      R => \rdata_q[31]_i_1_n_0\
    );
\f_burst_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => f_burst(0),
      D => \f_burst[4]_i_1_n_0\,
      Q => \f_burst_reg_n_0_[4]\,
      R => \rdata_q[31]_i_1_n_0\
    );
\f_line[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => line_req_num(0),
      I1 => f_line(0),
      I2 => \f_line_reg_n_0_[0]\,
      O => \f_line[0]_i_1_n_0\
    );
\f_line_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \f_line[0]_i_1_n_0\,
      Q => \f_line_reg_n_0_[0]\,
      R => \rdata_q[31]_i_1_n_0\
    );
\f_word[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => fstate(0),
      I1 => fstate(1),
      I2 => \f_word_reg_n_0_[0]\,
      O => f_word(0)
    );
\f_word[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0440"
    )
        port map (
      I0 => fstate(0),
      I1 => fstate(1),
      I2 => \f_word_reg_n_0_[1]\,
      I3 => \f_word_reg_n_0_[0]\,
      O => f_word(1)
    );
\f_word[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"04404040"
    )
        port map (
      I0 => fstate(0),
      I1 => fstate(1),
      I2 => \f_word_reg_n_0_[2]\,
      I3 => \f_word_reg_n_0_[0]\,
      I4 => \f_word_reg_n_0_[1]\,
      O => f_word(2)
    );
\f_word[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0440404040404040"
    )
        port map (
      I0 => fstate(0),
      I1 => fstate(1),
      I2 => \f_word_reg_n_0_[3]\,
      I3 => \f_word_reg_n_0_[1]\,
      I4 => \f_word_reg_n_0_[0]\,
      I5 => \f_word_reg_n_0_[2]\,
      O => f_word(3)
    );
\f_word[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2888888888888888"
    )
        port map (
      I0 => arvalid_q2_i_2_n_0,
      I1 => \f_word_reg_n_0_[4]\,
      I2 => \f_word_reg_n_0_[2]\,
      I3 => \f_word_reg_n_0_[0]\,
      I4 => \f_word_reg_n_0_[1]\,
      I5 => \f_word_reg_n_0_[3]\,
      O => f_word(4)
    );
\f_word[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0440"
    )
        port map (
      I0 => fstate(0),
      I1 => fstate(1),
      I2 => \f_word_reg_n_0_[5]\,
      I3 => \f_word[8]_i_3_n_0\,
      O => f_word(5)
    );
\f_word[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"04404040"
    )
        port map (
      I0 => fstate(0),
      I1 => fstate(1),
      I2 => \f_word_reg_n_0_[6]\,
      I3 => \f_word[8]_i_3_n_0\,
      I4 => \f_word_reg_n_0_[5]\,
      O => f_word(6)
    );
\f_word[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0440404040404040"
    )
        port map (
      I0 => fstate(0),
      I1 => fstate(1),
      I2 => \f_word_reg_n_0_[7]\,
      I3 => \f_word_reg_n_0_[6]\,
      I4 => \f_word_reg_n_0_[5]\,
      I5 => \f_word[8]_i_3_n_0\,
      O => f_word(7)
    );
\f_word[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00202000"
    )
        port map (
      I0 => p_3_in(0),
      I1 => p_3_in(3),
      I2 => \f_addr[31]_i_4_n_0\,
      I3 => t_s2,
      I4 => t_s3,
      I5 => lb_waddr(0),
      O => f_word_3(0)
    );
\f_word[8]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2888888888888888"
    )
        port map (
      I0 => arvalid_q2_i_2_n_0,
      I1 => \f_word_reg_n_0_[8]\,
      I2 => \f_word_reg_n_0_[5]\,
      I3 => \f_word_reg_n_0_[6]\,
      I4 => \f_word_reg_n_0_[7]\,
      I5 => \f_word[8]_i_3_n_0\,
      O => f_word(8)
    );
\f_word[8]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => \f_word_reg_n_0_[3]\,
      I1 => \f_word_reg_n_0_[1]\,
      I2 => \f_word_reg_n_0_[0]\,
      I3 => \f_word_reg_n_0_[2]\,
      I4 => \f_word_reg_n_0_[4]\,
      O => \f_word[8]_i_3_n_0\
    );
\f_word_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => f_word_3(0),
      D => f_word(0),
      Q => \f_word_reg_n_0_[0]\,
      R => \rdata_q[31]_i_1_n_0\
    );
\f_word_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => f_word_3(0),
      D => f_word(1),
      Q => \f_word_reg_n_0_[1]\,
      R => \rdata_q[31]_i_1_n_0\
    );
\f_word_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => f_word_3(0),
      D => f_word(2),
      Q => \f_word_reg_n_0_[2]\,
      R => \rdata_q[31]_i_1_n_0\
    );
\f_word_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => f_word_3(0),
      D => f_word(3),
      Q => \f_word_reg_n_0_[3]\,
      R => \rdata_q[31]_i_1_n_0\
    );
\f_word_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => f_word_3(0),
      D => f_word(4),
      Q => \f_word_reg_n_0_[4]\,
      R => \rdata_q[31]_i_1_n_0\
    );
\f_word_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => f_word_3(0),
      D => f_word(5),
      Q => \f_word_reg_n_0_[5]\,
      R => \rdata_q[31]_i_1_n_0\
    );
\f_word_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => f_word_3(0),
      D => f_word(6),
      Q => \f_word_reg_n_0_[6]\,
      R => \rdata_q[31]_i_1_n_0\
    );
\f_word_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => f_word_3(0),
      D => f_word(7),
      Q => \f_word_reg_n_0_[7]\,
      R => \rdata_q[31]_i_1_n_0\
    );
\f_word_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => f_word_3(0),
      D => f_word(8),
      Q => \f_word_reg_n_0_[8]\,
      R => \rdata_q[31]_i_1_n_0\
    );
\fb_base[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000020000"
    )
        port map (
      I0 => ctrl_enable1,
      I1 => ctrl_enable_i_3_n_0,
      I2 => \awaddr_q_reg_n_0_[3]\,
      I3 => \awaddr_q_reg_n_0_[0]\,
      I4 => \awaddr_q_reg_n_0_[2]\,
      I5 => \awaddr_q_reg_n_0_[1]\,
      O => fb_base_0(0)
    );
\fb_base_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fb_base_0(0),
      D => \wdata_q_reg_n_0_[0]\,
      Q => fb_base(0),
      R => \rdata_q[31]_i_1_n_0\
    );
\fb_base_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fb_base_0(0),
      D => \wdata_q_reg_n_0_[10]\,
      Q => fb_base(10),
      R => \rdata_q[31]_i_1_n_0\
    );
\fb_base_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fb_base_0(0),
      D => \wdata_q_reg_n_0_[11]\,
      Q => fb_base(11),
      R => \rdata_q[31]_i_1_n_0\
    );
\fb_base_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fb_base_0(0),
      D => \wdata_q_reg_n_0_[12]\,
      Q => fb_base(12),
      R => \rdata_q[31]_i_1_n_0\
    );
\fb_base_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fb_base_0(0),
      D => \wdata_q_reg_n_0_[13]\,
      Q => fb_base(13),
      R => \rdata_q[31]_i_1_n_0\
    );
\fb_base_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fb_base_0(0),
      D => \wdata_q_reg_n_0_[14]\,
      Q => fb_base(14),
      R => \rdata_q[31]_i_1_n_0\
    );
\fb_base_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fb_base_0(0),
      D => \wdata_q_reg_n_0_[15]\,
      Q => fb_base(15),
      R => \rdata_q[31]_i_1_n_0\
    );
\fb_base_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fb_base_0(0),
      D => \wdata_q_reg_n_0_[16]\,
      Q => fb_base(16),
      R => \rdata_q[31]_i_1_n_0\
    );
\fb_base_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fb_base_0(0),
      D => \wdata_q_reg_n_0_[17]\,
      Q => fb_base(17),
      R => \rdata_q[31]_i_1_n_0\
    );
\fb_base_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fb_base_0(0),
      D => \wdata_q_reg_n_0_[18]\,
      Q => fb_base(18),
      R => \rdata_q[31]_i_1_n_0\
    );
\fb_base_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fb_base_0(0),
      D => \wdata_q_reg_n_0_[19]\,
      Q => fb_base(19),
      R => \rdata_q[31]_i_1_n_0\
    );
\fb_base_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fb_base_0(0),
      D => \wdata_q_reg_n_0_[1]\,
      Q => fb_base(1),
      R => \rdata_q[31]_i_1_n_0\
    );
\fb_base_reg[20]\: unisim.vcomponents.FDSE
     port map (
      C => aclk,
      CE => fb_base_0(0),
      D => \wdata_q_reg_n_0_[20]\,
      Q => fb_base(20),
      S => \rdata_q[31]_i_1_n_0\
    );
\fb_base_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fb_base_0(0),
      D => \wdata_q_reg_n_0_[21]\,
      Q => fb_base(21),
      R => \rdata_q[31]_i_1_n_0\
    );
\fb_base_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fb_base_0(0),
      D => \wdata_q_reg_n_0_[22]\,
      Q => fb_base(22),
      R => \rdata_q[31]_i_1_n_0\
    );
\fb_base_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fb_base_0(0),
      D => \wdata_q_reg_n_0_[23]\,
      Q => fb_base(23),
      R => \rdata_q[31]_i_1_n_0\
    );
\fb_base_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fb_base_0(0),
      D => \wdata_q_reg_n_0_[24]\,
      Q => fb_base(24),
      R => \rdata_q[31]_i_1_n_0\
    );
\fb_base_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fb_base_0(0),
      D => \wdata_q_reg_n_0_[25]\,
      Q => fb_base(25),
      R => \rdata_q[31]_i_1_n_0\
    );
\fb_base_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fb_base_0(0),
      D => \wdata_q_reg_n_0_[26]\,
      Q => fb_base(26),
      R => \rdata_q[31]_i_1_n_0\
    );
\fb_base_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fb_base_0(0),
      D => \wdata_q_reg_n_0_[27]\,
      Q => fb_base(27),
      R => \rdata_q[31]_i_1_n_0\
    );
\fb_base_reg[28]\: unisim.vcomponents.FDSE
     port map (
      C => aclk,
      CE => fb_base_0(0),
      D => \wdata_q_reg_n_0_[28]\,
      Q => fb_base(28),
      S => \rdata_q[31]_i_1_n_0\
    );
\fb_base_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fb_base_0(0),
      D => \wdata_q_reg_n_0_[29]\,
      Q => fb_base(29),
      R => \rdata_q[31]_i_1_n_0\
    );
\fb_base_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fb_base_0(0),
      D => \wdata_q_reg_n_0_[2]\,
      Q => fb_base(2),
      R => \rdata_q[31]_i_1_n_0\
    );
\fb_base_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fb_base_0(0),
      D => \wdata_q_reg_n_0_[30]\,
      Q => fb_base(30),
      R => \rdata_q[31]_i_1_n_0\
    );
\fb_base_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fb_base_0(0),
      D => \wdata_q_reg_n_0_[31]\,
      Q => fb_base(31),
      R => \rdata_q[31]_i_1_n_0\
    );
\fb_base_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fb_base_0(0),
      D => \wdata_q_reg_n_0_[3]\,
      Q => fb_base(3),
      R => \rdata_q[31]_i_1_n_0\
    );
\fb_base_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fb_base_0(0),
      D => \wdata_q_reg_n_0_[4]\,
      Q => fb_base(4),
      R => \rdata_q[31]_i_1_n_0\
    );
\fb_base_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fb_base_0(0),
      D => p_1_in,
      Q => fb_base(5),
      R => \rdata_q[31]_i_1_n_0\
    );
\fb_base_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fb_base_0(0),
      D => \wdata_q_reg_n_0_[6]\,
      Q => fb_base(6),
      R => \rdata_q[31]_i_1_n_0\
    );
\fb_base_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fb_base_0(0),
      D => \wdata_q_reg_n_0_[7]\,
      Q => fb_base(7),
      R => \rdata_q[31]_i_1_n_0\
    );
\fb_base_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fb_base_0(0),
      D => \wdata_q_reg_n_0_[8]\,
      Q => fb_base(8),
      R => \rdata_q[31]_i_1_n_0\
    );
\fb_base_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fb_base_0(0),
      D => \wdata_q_reg_n_0_[9]\,
      Q => fb_base(9),
      R => \rdata_q[31]_i_1_n_0\
    );
fetch_overrun_set_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0660"
    )
        port map (
      I0 => fstate(1),
      I1 => fstate(0),
      I2 => t_s2,
      I3 => t_s3,
      O => fetch_overrun_set_4
    );
fetch_overrun_set_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => fetch_overrun_set_4,
      Q => fetch_overrun_set,
      R => \rdata_q[31]_i_1_n_0\
    );
\frame_cnt_pix[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"82"
    )
        port map (
      I0 => en_p2,
      I1 => \frame_cnt_pix[5]_i_2_n_0\,
      I2 => frame_cnt_pix_reg(0),
      O => \frame_cnt_pix[0]_i_1_n_0\
    );
\frame_cnt_pix[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A6"
    )
        port map (
      I0 => frame_cnt_pix_reg(1),
      I1 => frame_cnt_pix_reg(0),
      I2 => \frame_cnt_pix[7]_i_3_n_0\,
      O => \frame_cnt_pix[1]_i_1_n_0\
    );
\frame_cnt_pix[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9AAA"
    )
        port map (
      I0 => frame_cnt_pix_reg(2),
      I1 => \frame_cnt_pix[7]_i_3_n_0\,
      I2 => frame_cnt_pix_reg(1),
      I3 => frame_cnt_pix_reg(0),
      O => \frame_cnt_pix[2]_i_1_n_0\
    );
\frame_cnt_pix[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"9AAAAAAA"
    )
        port map (
      I0 => frame_cnt_pix_reg(3),
      I1 => \frame_cnt_pix[7]_i_3_n_0\,
      I2 => frame_cnt_pix_reg(0),
      I3 => frame_cnt_pix_reg(1),
      I4 => frame_cnt_pix_reg(2),
      O => \frame_cnt_pix[3]_i_1_n_0\
    );
\frame_cnt_pix[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAA6AAAAAAA"
    )
        port map (
      I0 => frame_cnt_pix_reg(4),
      I1 => frame_cnt_pix_reg(3),
      I2 => frame_cnt_pix_reg(2),
      I3 => frame_cnt_pix_reg(1),
      I4 => frame_cnt_pix_reg(0),
      I5 => \frame_cnt_pix[7]_i_3_n_0\,
      O => \frame_cnt_pix[4]_i_1_n_0\
    );
\frame_cnt_pix[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CCC00404"
    )
        port map (
      I0 => \frame_cnt_pix[7]_i_3_n_0\,
      I1 => en_p2,
      I2 => \frame_cnt_pix[7]_i_2_n_0\,
      I3 => \frame_cnt_pix[5]_i_2_n_0\,
      I4 => frame_cnt_pix_reg(5),
      O => \frame_cnt_pix[5]_i_1_n_0\
    );
\frame_cnt_pix[5]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BAFFFFFF"
    )
        port map (
      I0 => \vcnt[9]_i_5_n_0\,
      I1 => \vcnt_reg_n_0_[1]\,
      I2 => rd_addr_next(9),
      I3 => \vcnt_reg_n_0_[2]\,
      I4 => vcnt(0),
      O => \frame_cnt_pix[5]_i_2_n_0\
    );
\frame_cnt_pix[6]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A9AA"
    )
        port map (
      I0 => frame_cnt_pix_reg(6),
      I1 => \frame_cnt_pix[7]_i_2_n_0\,
      I2 => \frame_cnt_pix[7]_i_3_n_0\,
      I3 => frame_cnt_pix_reg(5),
      O => \frame_cnt_pix[6]_i_1_n_0\
    );
\frame_cnt_pix[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EFFF100000000000"
    )
        port map (
      I0 => \frame_cnt_pix[7]_i_2_n_0\,
      I1 => \frame_cnt_pix[7]_i_3_n_0\,
      I2 => frame_cnt_pix_reg(5),
      I3 => frame_cnt_pix_reg(6),
      I4 => frame_cnt_pix_reg(7),
      I5 => en_p2,
      O => \frame_cnt_pix[7]_i_1_n_0\
    );
\frame_cnt_pix[7]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFFFFFF"
    )
        port map (
      I0 => frame_cnt_pix_reg(4),
      I1 => frame_cnt_pix_reg(0),
      I2 => frame_cnt_pix_reg(1),
      I3 => frame_cnt_pix_reg(2),
      I4 => frame_cnt_pix_reg(3),
      O => \frame_cnt_pix[7]_i_2_n_0\
    );
\frame_cnt_pix[7]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"DF"
    )
        port map (
      I0 => \vcnt_reg_n_0_[9]\,
      I1 => \frame_cnt_pix[7]_i_4_n_0\,
      I2 => vcnt(0),
      O => \frame_cnt_pix[7]_i_3_n_0\
    );
\frame_cnt_pix[7]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFEFFFF"
    )
        port map (
      I0 => \frame_cnt_pix[7]_i_5_n_0\,
      I1 => \vcnt_reg_n_0_[6]\,
      I2 => \vcnt_reg_n_0_[7]\,
      I3 => \vcnt_reg_n_0_[8]\,
      I4 => \vcnt_reg_n_0_[2]\,
      I5 => \frame_cnt_pix[7]_i_6_n_0\,
      O => \frame_cnt_pix[7]_i_4_n_0\
    );
\frame_cnt_pix[7]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEFFFFFF"
    )
        port map (
      I0 => \vcnt_reg_n_0_[5]\,
      I1 => \vcnt_reg_n_0_[4]\,
      I2 => \vcnt_reg_n_0_[1]\,
      I3 => \vcnt_reg_n_0_[2]\,
      I4 => \vcnt_reg_n_0_[3]\,
      O => \frame_cnt_pix[7]_i_5_n_0\
    );
\frame_cnt_pix[7]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => rd_addr_next(9),
      I1 => \vcnt_reg_n_0_[1]\,
      O => \frame_cnt_pix[7]_i_6_n_0\
    );
\frame_cnt_pix_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => \frame_cnt_pix[0]_i_1_n_0\,
      Q => frame_cnt_pix_reg(0),
      R => '0'
    );
\frame_cnt_pix_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => \frame_cnt_pix[1]_i_1_n_0\,
      Q => frame_cnt_pix_reg(1),
      R => \vcnt[9]_i_1_n_0\
    );
\frame_cnt_pix_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => \frame_cnt_pix[2]_i_1_n_0\,
      Q => frame_cnt_pix_reg(2),
      R => \vcnt[9]_i_1_n_0\
    );
\frame_cnt_pix_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => \frame_cnt_pix[3]_i_1_n_0\,
      Q => frame_cnt_pix_reg(3),
      R => \vcnt[9]_i_1_n_0\
    );
\frame_cnt_pix_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => \frame_cnt_pix[4]_i_1_n_0\,
      Q => frame_cnt_pix_reg(4),
      R => \vcnt[9]_i_1_n_0\
    );
\frame_cnt_pix_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => \frame_cnt_pix[5]_i_1_n_0\,
      Q => frame_cnt_pix_reg(5),
      R => '0'
    );
\frame_cnt_pix_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => \frame_cnt_pix[6]_i_1_n_0\,
      Q => frame_cnt_pix_reg(6),
      R => \vcnt[9]_i_1_n_0\
    );
\frame_cnt_pix_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => \frame_cnt_pix[7]_i_1_n_0\,
      Q => frame_cnt_pix_reg(7),
      R => '0'
    );
\frame_cnt_s1_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => frame_cnt_pix_reg(0),
      Q => frame_cnt_s1(0),
      R => \rdata_q[31]_i_1_n_0\
    );
\frame_cnt_s1_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => frame_cnt_pix_reg(1),
      Q => frame_cnt_s1(1),
      R => \rdata_q[31]_i_1_n_0\
    );
\frame_cnt_s1_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => frame_cnt_pix_reg(2),
      Q => frame_cnt_s1(2),
      R => \rdata_q[31]_i_1_n_0\
    );
\frame_cnt_s1_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => frame_cnt_pix_reg(3),
      Q => frame_cnt_s1(3),
      R => \rdata_q[31]_i_1_n_0\
    );
\frame_cnt_s1_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => frame_cnt_pix_reg(4),
      Q => frame_cnt_s1(4),
      R => \rdata_q[31]_i_1_n_0\
    );
\frame_cnt_s1_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => frame_cnt_pix_reg(5),
      Q => frame_cnt_s1(5),
      R => \rdata_q[31]_i_1_n_0\
    );
\frame_cnt_s1_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => frame_cnt_pix_reg(6),
      Q => frame_cnt_s1(6),
      R => \rdata_q[31]_i_1_n_0\
    );
\frame_cnt_s1_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => frame_cnt_pix_reg(7),
      Q => frame_cnt_s1(7),
      R => \rdata_q[31]_i_1_n_0\
    );
\frame_cnt_s2_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => frame_cnt_s1(0),
      Q => data2(8),
      R => \rdata_q[31]_i_1_n_0\
    );
\frame_cnt_s2_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => frame_cnt_s1(1),
      Q => data2(9),
      R => \rdata_q[31]_i_1_n_0\
    );
\frame_cnt_s2_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => frame_cnt_s1(2),
      Q => data2(10),
      R => \rdata_q[31]_i_1_n_0\
    );
\frame_cnt_s2_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => frame_cnt_s1(3),
      Q => data2(11),
      R => \rdata_q[31]_i_1_n_0\
    );
\frame_cnt_s2_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => frame_cnt_s1(4),
      Q => data2(12),
      R => \rdata_q[31]_i_1_n_0\
    );
\frame_cnt_s2_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => frame_cnt_s1(5),
      Q => data2(13),
      R => \rdata_q[31]_i_1_n_0\
    );
\frame_cnt_s2_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => frame_cnt_s1(6),
      Q => data2(14),
      R => \rdata_q[31]_i_1_n_0\
    );
\frame_cnt_s2_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => frame_cnt_s1(7),
      Q => data2(15),
      R => \rdata_q[31]_i_1_n_0\
    );
\hcnt[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \hcnt_reg_n_0_[0]\,
      O => \hcnt[0]_i_1_n_0\
    );
\hcnt[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => p_0_in_2(0),
      I1 => \hcnt_reg_n_0_[0]\,
      O => \hcnt[1]_i_1_n_0\
    );
\hcnt[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => p_0_in_2(1),
      I1 => \hcnt_reg_n_0_[0]\,
      I2 => p_0_in_2(0),
      O => \hcnt[2]_i_1_n_0\
    );
\hcnt[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => p_0_in_2(2),
      I1 => p_0_in_2(0),
      I2 => \hcnt_reg_n_0_[0]\,
      I3 => p_0_in_2(1),
      O => \hcnt[3]_i_1_n_0\
    );
\hcnt[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => p_0_in_2(3),
      I1 => \hcnt_reg_n_0_[0]\,
      I2 => p_0_in_2(1),
      I3 => p_0_in_2(0),
      I4 => p_0_in_2(2),
      O => \hcnt[4]_i_1_n_0\
    );
\hcnt[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => \hcnt_reg_n_0_[0]\,
      I1 => p_0_in_2(1),
      I2 => p_0_in_2(0),
      I3 => p_0_in_2(2),
      I4 => p_0_in_2(3),
      I5 => p_0_in_2(4),
      O => \hcnt[5]_i_1_n_0\
    );
\hcnt[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"9AAAAAAA"
    )
        port map (
      I0 => p_0_in_2(5),
      I1 => \hcnt[7]_i_2_n_0\,
      I2 => \hcnt_reg_n_0_[0]\,
      I3 => p_0_in_2(3),
      I4 => p_0_in_2(4),
      O => \hcnt[6]_i_1_n_0\
    );
\hcnt[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAA6AAAAAAA"
    )
        port map (
      I0 => p_0_in_2(6),
      I1 => \hcnt_reg_n_0_[0]\,
      I2 => p_0_in_2(3),
      I3 => p_0_in_2(4),
      I4 => p_0_in_2(5),
      I5 => \hcnt[7]_i_2_n_0\,
      O => \hcnt[7]_i_1_n_0\
    );
\hcnt[7]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7F"
    )
        port map (
      I0 => p_0_in_2(1),
      I1 => p_0_in_2(0),
      I2 => p_0_in_2(2),
      O => \hcnt[7]_i_2_n_0\
    );
\hcnt[8]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => p_0_in_2(7),
      I1 => \hcnt_reg_n_0_[0]\,
      I2 => p_0_in_2(6),
      I3 => \hcnt[9]_i_3_n_0\,
      O => \hcnt[8]_i_1_n_0\
    );
\hcnt[9]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => vcnt(0),
      I1 => en_p2,
      O => \hcnt[9]_i_1_n_0\
    );
\hcnt[9]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => p_0_in_2(8),
      I1 => p_0_in_2(6),
      I2 => p_0_in_2(7),
      I3 => \hcnt[9]_i_3_n_0\,
      I4 => \hcnt_reg_n_0_[0]\,
      O => \hcnt[9]_i_2_n_0\
    );
\hcnt[9]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => p_0_in_2(3),
      I1 => p_0_in_2(4),
      I2 => p_0_in_2(5),
      I3 => p_0_in_2(2),
      I4 => p_0_in_2(0),
      I5 => p_0_in_2(1),
      O => \hcnt[9]_i_3_n_0\
    );
\hcnt_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => \hcnt[0]_i_1_n_0\,
      Q => \hcnt_reg_n_0_[0]\,
      R => \hcnt[9]_i_1_n_0\
    );
\hcnt_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => \hcnt[1]_i_1_n_0\,
      Q => p_0_in_2(0),
      R => \hcnt[9]_i_1_n_0\
    );
\hcnt_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => \hcnt[2]_i_1_n_0\,
      Q => p_0_in_2(1),
      R => \hcnt[9]_i_1_n_0\
    );
\hcnt_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => \hcnt[3]_i_1_n_0\,
      Q => p_0_in_2(2),
      R => \hcnt[9]_i_1_n_0\
    );
\hcnt_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => \hcnt[4]_i_1_n_0\,
      Q => p_0_in_2(3),
      R => \hcnt[9]_i_1_n_0\
    );
\hcnt_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => \hcnt[5]_i_1_n_0\,
      Q => p_0_in_2(4),
      R => \hcnt[9]_i_1_n_0\
    );
\hcnt_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => \hcnt[6]_i_1_n_0\,
      Q => p_0_in_2(5),
      R => \hcnt[9]_i_1_n_0\
    );
\hcnt_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => \hcnt[7]_i_1_n_0\,
      Q => p_0_in_2(6),
      R => \hcnt[9]_i_1_n_0\
    );
\hcnt_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => \hcnt[8]_i_1_n_0\,
      Q => p_0_in_2(7),
      R => \hcnt[9]_i_1_n_0\
    );
\hcnt_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => \hcnt[9]_i_2_n_0\,
      Q => p_0_in_2(8),
      R => \hcnt[9]_i_1_n_0\
    );
\hdmi_d_q[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \hdmi_d_q[8]_i_3_n_0\,
      I1 => ycs_p2,
      I2 => \hdmi_d_q[8]_i_2_n_0\,
      O => \hdmi_d_q[0]_i_1_n_0\
    );
\hdmi_d_q[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88888888BBB888B8"
    )
        port map (
      I0 => \hdmi_d_q[10]_i_2_n_0\,
      I1 => ycs_p2,
      I2 => \lb_rdata_reg_n_0_[2]\,
      I3 => \hcnt_reg_n_0_[0]\,
      I4 => \lb_rdata_reg_n_0_[18]\,
      I5 => tp_p2,
      O => \hdmi_d_q[10]_i_1_n_0\
    );
\hdmi_d_q[10]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => \lb_rdata_reg_n_0_[2]\,
      I1 => \hcnt_reg_n_0_[0]\,
      I2 => \lb_rdata_reg_n_0_[18]\,
      I3 => tp_p2,
      I4 => mono_p2,
      I5 => \hdmi_d_q[10]_i_3_n_0\,
      O => \hdmi_d_q[10]_i_2_n_0\
    );
\hdmi_d_q[10]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CC10FFFFCC100000"
    )
        port map (
      I0 => p_0_in_2(6),
      I1 => p_0_in_2(8),
      I2 => p_0_in_2(7),
      I3 => \hcnt_reg_n_0_[0]\,
      I4 => tp_p2,
      I5 => \hdmi_d_q[10]_i_4_n_0\,
      O => \hdmi_d_q[10]_i_3_n_0\
    );
\hdmi_d_q[10]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EB28"
    )
        port map (
      I0 => \lb_rdata_reg_n_0_[26]\,
      I1 => \hcnt_reg_n_0_[0]\,
      I2 => ccs_p2,
      I3 => \lb_rdata_reg_n_0_[10]\,
      O => \hdmi_d_q[10]_i_4_n_0\
    );
\hdmi_d_q[11]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B8AA"
    )
        port map (
      I0 => \hdmi_d_q[11]_i_2_n_0\,
      I1 => mono_p2,
      I2 => \hdmi_d_q[11]_i_3_n_0\,
      I3 => ycs_p2,
      O => \hdmi_d_q[11]_i_1_n_0\
    );
\hdmi_d_q[11]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEEEEEEEF0FFF000"
    )
        port map (
      I0 => \vga_q[1]_i_2_n_0\,
      I1 => p_0_in_2(8),
      I2 => \lb_rdata_reg_n_0_[19]\,
      I3 => \hcnt_reg_n_0_[0]\,
      I4 => \lb_rdata_reg_n_0_[3]\,
      I5 => tp_p2,
      O => \hdmi_d_q[11]_i_2_n_0\
    );
\hdmi_d_q[11]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA40FFFFAA400000"
    )
        port map (
      I0 => p_0_in_2(8),
      I1 => p_0_in_2(7),
      I2 => p_0_in_2(6),
      I3 => \hcnt_reg_n_0_[0]\,
      I4 => tp_p2,
      I5 => \hdmi_d_q[11]_i_4_n_0\,
      O => \hdmi_d_q[11]_i_3_n_0\
    );
\hdmi_d_q[11]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EB28"
    )
        port map (
      I0 => \lb_rdata_reg_n_0_[27]\,
      I1 => \hcnt_reg_n_0_[0]\,
      I2 => ccs_p2,
      I3 => \lb_rdata_reg_n_0_[11]\,
      O => \hdmi_d_q[11]_i_4_n_0\
    );
\hdmi_d_q[12]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B8AA"
    )
        port map (
      I0 => \vga_q[0]_i_1_n_0\,
      I1 => mono_p2,
      I2 => \hdmi_d_q[12]_i_2_n_0\,
      I3 => ycs_p2,
      O => \hdmi_d_q[12]_i_1_n_0\
    );
\hdmi_d_q[12]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF54450440"
    )
        port map (
      I0 => tp_p2,
      I1 => \lb_rdata_reg_n_0_[28]\,
      I2 => \hcnt_reg_n_0_[0]\,
      I3 => ccs_p2,
      I4 => \lb_rdata_reg_n_0_[12]\,
      I5 => \hdmi_d_q[12]_i_3_n_0\,
      O => \hdmi_d_q[12]_i_2_n_0\
    );
\hdmi_d_q[12]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0808AAA8"
    )
        port map (
      I0 => tp_p2,
      I1 => p_0_in_2(6),
      I2 => p_0_in_2(8),
      I3 => p_0_in_2(7),
      I4 => \hcnt_reg_n_0_[0]\,
      O => \hdmi_d_q[12]_i_3_n_0\
    );
\hdmi_d_q[13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \hdmi_d_q[13]_i_2_n_0\,
      I1 => ycs_p2,
      I2 => \vga_q[1]_i_1_n_0\,
      O => \hdmi_d_q[13]_i_1_n_0\
    );
\hdmi_d_q[13]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88888888BBBB88B8"
    )
        port map (
      I0 => \vga_q[1]_i_1_n_0\,
      I1 => mono_p2,
      I2 => p_0_in_2(7),
      I3 => \hdmi_d_q[13]_i_3_n_0\,
      I4 => \hdmi_d_q[14]_i_4_n_0\,
      I5 => \hdmi_d_q[13]_i_4_n_0\,
      O => \hdmi_d_q[13]_i_2_n_0\
    );
\hdmi_d_q[13]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => p_0_in_2(6),
      I1 => \hcnt_reg_n_0_[0]\,
      O => \hdmi_d_q[13]_i_3_n_0\
    );
\hdmi_d_q[13]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"10011551"
    )
        port map (
      I0 => tp_p2,
      I1 => \lb_rdata_reg_n_0_[13]\,
      I2 => ccs_p2,
      I3 => \hcnt_reg_n_0_[0]\,
      I4 => \lb_rdata_reg_n_0_[29]\,
      O => \hdmi_d_q[13]_i_4_n_0\
    );
\hdmi_d_q[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \hdmi_d_q[14]_i_2_n_0\,
      I1 => ycs_p2,
      I2 => \vga_q[2]_i_1_n_0\,
      O => \hdmi_d_q[14]_i_1_n_0\
    );
\hdmi_d_q[14]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8B8B888B888B888"
    )
        port map (
      I0 => \vga_q[2]_i_1_n_0\,
      I1 => mono_p2,
      I2 => \hdmi_d_q[14]_i_3_n_0\,
      I3 => \hdmi_d_q[14]_i_4_n_0\,
      I4 => p_0_in_2(6),
      I5 => p_0_in_2(7),
      O => \hdmi_d_q[14]_i_2_n_0\
    );
\hdmi_d_q[14]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EFFEEAAE"
    )
        port map (
      I0 => tp_p2,
      I1 => \lb_rdata_reg_n_0_[14]\,
      I2 => ccs_p2,
      I3 => \hcnt_reg_n_0_[0]\,
      I4 => \lb_rdata_reg_n_0_[30]\,
      O => \hdmi_d_q[14]_i_3_n_0\
    );
\hdmi_d_q[14]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => p_0_in_2(8),
      I1 => tp_p2,
      O => \hdmi_d_q[14]_i_4_n_0\
    );
\hdmi_d_q[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFDFFFDFFFDFDFDF"
    )
        port map (
      I0 => \hdmi_d_q[15]_i_3_n_0\,
      I1 => \vcnt_reg_n_0_[9]\,
      I2 => en_p2,
      I3 => p_0_in_2(8),
      I4 => p_0_in_2(7),
      I5 => p_0_in_2(6),
      O => \hdmi_d_q[15]_i_1_n_0\
    );
\hdmi_d_q[15]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4755"
    )
        port map (
      I0 => \hdmi_d_q[15]_i_4_n_0\,
      I1 => mono_p2,
      I2 => \hdmi_d_q[15]_i_5_n_0\,
      I3 => ycs_p2,
      O => \hdmi_d_q[15]_i_2_n_0\
    );
\hdmi_d_q[15]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => \vcnt_reg_n_0_[5]\,
      I1 => \vcnt_reg_n_0_[7]\,
      I2 => \vcnt_reg_n_0_[6]\,
      I3 => \vcnt_reg_n_0_[8]\,
      O => \hdmi_d_q[15]_i_3_n_0\
    );
\hdmi_d_q[15]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF4747FF004747"
    )
        port map (
      I0 => \lb_rdata_reg_n_0_[23]\,
      I1 => \hcnt_reg_n_0_[0]\,
      I2 => \lb_rdata_reg_n_0_[7]\,
      I3 => p_0_in_2(8),
      I4 => tp_p2,
      I5 => \vga_q[3]_i_2_n_0\,
      O => \hdmi_d_q[15]_i_4_n_0\
    );
\hdmi_d_q[15]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000AA74FFFF"
    )
        port map (
      I0 => \hcnt_reg_n_0_[0]\,
      I1 => p_0_in_2(6),
      I2 => p_0_in_2(7),
      I3 => p_0_in_2(8),
      I4 => tp_p2,
      I5 => \hdmi_d_q[15]_i_6_n_0\,
      O => \hdmi_d_q[15]_i_5_n_0\
    );
\hdmi_d_q[15]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000BE82"
    )
        port map (
      I0 => \lb_rdata_reg_n_0_[15]\,
      I1 => ccs_p2,
      I2 => \hcnt_reg_n_0_[0]\,
      I3 => \lb_rdata_reg_n_0_[31]\,
      I4 => tp_p2,
      O => \hdmi_d_q[15]_i_6_n_0\
    );
\hdmi_d_q[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAB8BBB888"
    )
        port map (
      I0 => \hdmi_d_q[9]_i_2_n_0\,
      I1 => mono_p2,
      I2 => \hdmi_d_q[9]_i_3_n_0\,
      I3 => tp_p2,
      I4 => \hdmi_d_q[9]_i_4_n_0\,
      I5 => ycs_p2,
      O => \hdmi_d_q[1]_i_1_n_0\
    );
\hdmi_d_q[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => \lb_rdata_reg_n_0_[2]\,
      I1 => \hcnt_reg_n_0_[0]\,
      I2 => \lb_rdata_reg_n_0_[18]\,
      I3 => tp_p2,
      I4 => ycs_p2,
      I5 => \hdmi_d_q[10]_i_2_n_0\,
      O => \hdmi_d_q[2]_i_1_n_0\
    );
\hdmi_d_q[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AAB8"
    )
        port map (
      I0 => \hdmi_d_q[11]_i_2_n_0\,
      I1 => mono_p2,
      I2 => \hdmi_d_q[11]_i_3_n_0\,
      I3 => ycs_p2,
      O => \hdmi_d_q[3]_i_1_n_0\
    );
\hdmi_d_q[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AAB8"
    )
        port map (
      I0 => \vga_q[0]_i_1_n_0\,
      I1 => mono_p2,
      I2 => \hdmi_d_q[12]_i_2_n_0\,
      I3 => ycs_p2,
      O => \hdmi_d_q[4]_i_1_n_0\
    );
\hdmi_d_q[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \vga_q[1]_i_1_n_0\,
      I1 => ycs_p2,
      I2 => \hdmi_d_q[13]_i_2_n_0\,
      O => \hdmi_d_q[5]_i_1_n_0\
    );
\hdmi_d_q[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \vga_q[2]_i_1_n_0\,
      I1 => ycs_p2,
      I2 => \hdmi_d_q[14]_i_2_n_0\,
      O => \hdmi_d_q[6]_i_1_n_0\
    );
\hdmi_d_q[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"5547FFFF"
    )
        port map (
      I0 => \hdmi_d_q[15]_i_4_n_0\,
      I1 => mono_p2,
      I2 => \hdmi_d_q[15]_i_5_n_0\,
      I3 => ycs_p2,
      I4 => hdmi_de_i_1_n_0,
      O => \hdmi_d_q[7]_i_1_n_0\
    );
\hdmi_d_q[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \hdmi_d_q[8]_i_2_n_0\,
      I1 => ycs_p2,
      I2 => \hdmi_d_q[8]_i_3_n_0\,
      O => \hdmi_d_q[8]_i_1_n_0\
    );
\hdmi_d_q[8]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88888888BBB888B8"
    )
        port map (
      I0 => \hdmi_d_q[8]_i_3_n_0\,
      I1 => mono_p2,
      I2 => \lb_rdata_reg_n_0_[8]\,
      I3 => \hdmi_d_q[8]_i_4_n_0\,
      I4 => \lb_rdata_reg_n_0_[24]\,
      I5 => tp_p2,
      O => \hdmi_d_q[8]_i_2_n_0\
    );
\hdmi_d_q[8]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DDDDDDDDD0DDD000"
    )
        port map (
      I0 => p_0_in_2(6),
      I1 => \hdmi_d_q[8]_i_5_n_0\,
      I2 => \lb_rdata_reg_n_0_[16]\,
      I3 => \hcnt_reg_n_0_[0]\,
      I4 => \lb_rdata_reg_n_0_[0]\,
      I5 => tp_p2,
      O => \hdmi_d_q[8]_i_3_n_0\
    );
\hdmi_d_q[8]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \hcnt_reg_n_0_[0]\,
      I1 => ccs_p2,
      O => \hdmi_d_q[8]_i_4_n_0\
    );
\hdmi_d_q[8]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FB"
    )
        port map (
      I0 => p_0_in_2(7),
      I1 => tp_p2,
      I2 => p_0_in_2(8),
      O => \hdmi_d_q[8]_i_5_n_0\
    );
\hdmi_d_q[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8BBB888AAAAAAAA"
    )
        port map (
      I0 => \hdmi_d_q[9]_i_2_n_0\,
      I1 => mono_p2,
      I2 => \hdmi_d_q[9]_i_3_n_0\,
      I3 => tp_p2,
      I4 => \hdmi_d_q[9]_i_4_n_0\,
      I5 => ycs_p2,
      O => \hdmi_d_q[9]_i_1_n_0\
    );
\hdmi_d_q[9]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"11111111F0FFF000"
    )
        port map (
      I0 => p_0_in_2(8),
      I1 => p_0_in_2(7),
      I2 => \lb_rdata_reg_n_0_[17]\,
      I3 => \hcnt_reg_n_0_[0]\,
      I4 => \lb_rdata_reg_n_0_[1]\,
      I5 => tp_p2,
      O => \hdmi_d_q[9]_i_2_n_0\
    );
\hdmi_d_q[9]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B5E0"
    )
        port map (
      I0 => p_0_in_2(8),
      I1 => p_0_in_2(6),
      I2 => \hcnt_reg_n_0_[0]\,
      I3 => p_0_in_2(7),
      O => \hdmi_d_q[9]_i_3_n_0\
    );
\hdmi_d_q[9]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EB28"
    )
        port map (
      I0 => \lb_rdata_reg_n_0_[25]\,
      I1 => \hcnt_reg_n_0_[0]\,
      I2 => ccs_p2,
      I3 => \lb_rdata_reg_n_0_[9]\,
      O => \hdmi_d_q[9]_i_4_n_0\
    );
\hdmi_d_q_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => \hdmi_d_q[0]_i_1_n_0\,
      Q => hdmi_d(0),
      R => \hdmi_d_q[15]_i_1_n_0\
    );
\hdmi_d_q_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => \hdmi_d_q[10]_i_1_n_0\,
      Q => hdmi_d(10),
      R => \hdmi_d_q[15]_i_1_n_0\
    );
\hdmi_d_q_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => \hdmi_d_q[11]_i_1_n_0\,
      Q => hdmi_d(11),
      R => \hdmi_d_q[15]_i_1_n_0\
    );
\hdmi_d_q_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => \hdmi_d_q[12]_i_1_n_0\,
      Q => hdmi_d(12),
      R => \hdmi_d_q[15]_i_1_n_0\
    );
\hdmi_d_q_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => \hdmi_d_q[13]_i_1_n_0\,
      Q => hdmi_d(13),
      R => \hdmi_d_q[15]_i_1_n_0\
    );
\hdmi_d_q_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => \hdmi_d_q[14]_i_1_n_0\,
      Q => hdmi_d(14),
      R => \hdmi_d_q[15]_i_1_n_0\
    );
\hdmi_d_q_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => \hdmi_d_q[15]_i_2_n_0\,
      Q => hdmi_d(15),
      R => \hdmi_d_q[15]_i_1_n_0\
    );
\hdmi_d_q_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => \hdmi_d_q[1]_i_1_n_0\,
      Q => hdmi_d(1),
      R => \hdmi_d_q[15]_i_1_n_0\
    );
\hdmi_d_q_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => \hdmi_d_q[2]_i_1_n_0\,
      Q => hdmi_d(2),
      R => \hdmi_d_q[15]_i_1_n_0\
    );
\hdmi_d_q_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => \hdmi_d_q[3]_i_1_n_0\,
      Q => hdmi_d(3),
      R => \hdmi_d_q[15]_i_1_n_0\
    );
\hdmi_d_q_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => \hdmi_d_q[4]_i_1_n_0\,
      Q => hdmi_d(4),
      R => \hdmi_d_q[15]_i_1_n_0\
    );
\hdmi_d_q_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => \hdmi_d_q[5]_i_1_n_0\,
      Q => hdmi_d(5),
      R => \hdmi_d_q[15]_i_1_n_0\
    );
\hdmi_d_q_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => \hdmi_d_q[6]_i_1_n_0\,
      Q => hdmi_d(6),
      R => \hdmi_d_q[15]_i_1_n_0\
    );
\hdmi_d_q_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => \hdmi_d_q[7]_i_1_n_0\,
      Q => hdmi_d(7),
      R => '0'
    );
\hdmi_d_q_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => \hdmi_d_q[8]_i_1_n_0\,
      Q => hdmi_d(8),
      R => \hdmi_d_q[15]_i_1_n_0\
    );
\hdmi_d_q_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => \hdmi_d_q[9]_i_1_n_0\,
      Q => hdmi_d(9),
      R => \hdmi_d_q[15]_i_1_n_0\
    );
hdmi_de_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00001F0000000000"
    )
        port map (
      I0 => p_0_in_2(6),
      I1 => p_0_in_2(7),
      I2 => p_0_in_2(8),
      I3 => en_p2,
      I4 => \vcnt_reg_n_0_[9]\,
      I5 => \hdmi_d_q[15]_i_3_n_0\,
      O => hdmi_de_i_1_n_0
    );
hdmi_de_reg: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => hdmi_de_i_1_n_0,
      Q => hdmi_de,
      R => '0'
    );
hdmi_hsync_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFDFDFDFDFDFDFFF"
    )
        port map (
      I0 => p_0_in_2(6),
      I1 => p_0_in_2(7),
      I2 => p_0_in_2(8),
      I3 => p_0_in_2(5),
      I4 => p_0_in_2(4),
      I5 => p_0_in_2(3),
      O => hdmi_hsync_i_1_n_0
    );
hdmi_hsync_reg: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => hdmi_hsync_i_1_n_0,
      Q => vga_hsync,
      R => '0'
    );
hdmi_vsync_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFEFFFFFFFFF"
    )
        port map (
      I0 => \hdmi_d_q[15]_i_3_n_0\,
      I1 => \vcnt_reg_n_0_[2]\,
      I2 => \vcnt_reg_n_0_[1]\,
      I3 => \vcnt_reg_n_0_[9]\,
      I4 => \vcnt_reg_n_0_[4]\,
      I5 => \vcnt_reg_n_0_[3]\,
      O => hdmi_vsync_i_1_n_0
    );
hdmi_vsync_reg: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => hdmi_vsync_i_1_n_0,
      Q => vga_vsync,
      R => '0'
    );
i2c_scl_low_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \wdata_q_reg_n_0_[1]\,
      I1 => i2c_sda_low_1,
      I2 => i2c_scl_low,
      O => i2c_scl_low_i_1_n_0
    );
i2c_scl_low_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => i2c_scl_low_i_1_n_0,
      Q => i2c_scl_low,
      R => \rdata_q[31]_i_1_n_0\
    );
i2c_sda_low_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \wdata_q_reg_n_0_[0]\,
      I1 => i2c_sda_low_1,
      I2 => i2c_sda_low,
      O => i2c_sda_low_i_1_n_0
    );
i2c_sda_low_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0002000000000000"
    )
        port map (
      I0 => ctrl_enable1,
      I1 => ctrl_enable_i_3_n_0,
      I2 => \awaddr_q_reg_n_0_[0]\,
      I3 => \awaddr_q_reg_n_0_[1]\,
      I4 => \awaddr_q_reg_n_0_[3]\,
      I5 => \awaddr_q_reg_n_0_[2]\,
      O => i2c_sda_low_1
    );
i2c_sda_low_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => i2c_sda_low_i_1_n_0,
      Q => i2c_sda_low,
      R => \rdata_q[31]_i_1_n_0\
    );
\lb_rdata[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => lb_rdata0(0),
      I1 => \lb_rdata[31]_i_4_n_0\,
      I2 => \lb_rdata_reg[0]_i_3_n_0\,
      I3 => rd_addr_next(9),
      I4 => \lb_rdata_reg[0]_i_4_n_0\,
      O => \lb_rdata[0]_i_1_n_0\
    );
\lb_rdata[0]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => linebuf_reg_r1_512_575_0_2_n_0,
      I1 => \vcnt[9]_i_5_n_0\,
      I2 => rd_addr_next(9),
      I3 => linebuf_reg_r1_0_63_0_2_n_0,
      O => lb_rdata0(0)
    );
\lb_rdata[0]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_704_767_0_2_n_0,
      I1 => linebuf_reg_r2_640_703_0_2_n_0,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_576_639_0_2_n_0,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_512_575_0_2_n_0,
      O => \lb_rdata[0]_i_5_n_0\
    );
\lb_rdata[0]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_960_1023_0_2_n_0,
      I1 => linebuf_reg_r2_896_959_0_2_n_0,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_832_895_0_2_n_0,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_768_831_0_2_n_0,
      O => \lb_rdata[0]_i_6_n_0\
    );
\lb_rdata[0]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_192_255_0_2_n_0,
      I1 => linebuf_reg_r2_128_191_0_2_n_0,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_64_127_0_2_n_0,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_0_63_0_2_n_0,
      O => \lb_rdata[0]_i_7_n_0\
    );
\lb_rdata[0]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_448_511_0_2_n_0,
      I1 => linebuf_reg_r2_384_447_0_2_n_0,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_320_383_0_2_n_0,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_256_319_0_2_n_0,
      O => \lb_rdata[0]_i_8_n_0\
    );
\lb_rdata[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => lb_rdata0(10),
      I1 => \lb_rdata[31]_i_4_n_0\,
      I2 => \lb_rdata_reg[10]_i_3_n_0\,
      I3 => rd_addr_next(9),
      I4 => \lb_rdata_reg[10]_i_4_n_0\,
      O => \lb_rdata[10]_i_1_n_0\
    );
\lb_rdata[10]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => linebuf_reg_r1_512_575_9_11_n_1,
      I1 => \vcnt[9]_i_5_n_0\,
      I2 => rd_addr_next(9),
      I3 => linebuf_reg_r1_0_63_9_11_n_1,
      O => lb_rdata0(10)
    );
\lb_rdata[10]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_704_767_9_11_n_1,
      I1 => linebuf_reg_r2_640_703_9_11_n_1,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_576_639_9_11_n_1,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_512_575_9_11_n_1,
      O => \lb_rdata[10]_i_5_n_0\
    );
\lb_rdata[10]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_960_1023_9_11_n_1,
      I1 => linebuf_reg_r2_896_959_9_11_n_1,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_832_895_9_11_n_1,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_768_831_9_11_n_1,
      O => \lb_rdata[10]_i_6_n_0\
    );
\lb_rdata[10]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_192_255_9_11_n_1,
      I1 => linebuf_reg_r2_128_191_9_11_n_1,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_64_127_9_11_n_1,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_0_63_9_11_n_1,
      O => \lb_rdata[10]_i_7_n_0\
    );
\lb_rdata[10]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_448_511_9_11_n_1,
      I1 => linebuf_reg_r2_384_447_9_11_n_1,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_320_383_9_11_n_1,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_256_319_9_11_n_1,
      O => \lb_rdata[10]_i_8_n_0\
    );
\lb_rdata[11]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => lb_rdata0(11),
      I1 => \lb_rdata[31]_i_4_n_0\,
      I2 => \lb_rdata_reg[11]_i_3_n_0\,
      I3 => rd_addr_next(9),
      I4 => \lb_rdata_reg[11]_i_4_n_0\,
      O => \lb_rdata[11]_i_1_n_0\
    );
\lb_rdata[11]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => linebuf_reg_r1_512_575_9_11_n_2,
      I1 => \vcnt[9]_i_5_n_0\,
      I2 => rd_addr_next(9),
      I3 => linebuf_reg_r1_0_63_9_11_n_2,
      O => lb_rdata0(11)
    );
\lb_rdata[11]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_704_767_9_11_n_2,
      I1 => linebuf_reg_r2_640_703_9_11_n_2,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_576_639_9_11_n_2,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_512_575_9_11_n_2,
      O => \lb_rdata[11]_i_5_n_0\
    );
\lb_rdata[11]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_960_1023_9_11_n_2,
      I1 => linebuf_reg_r2_896_959_9_11_n_2,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_832_895_9_11_n_2,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_768_831_9_11_n_2,
      O => \lb_rdata[11]_i_6_n_0\
    );
\lb_rdata[11]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_192_255_9_11_n_2,
      I1 => linebuf_reg_r2_128_191_9_11_n_2,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_64_127_9_11_n_2,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_0_63_9_11_n_2,
      O => \lb_rdata[11]_i_7_n_0\
    );
\lb_rdata[11]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_448_511_9_11_n_2,
      I1 => linebuf_reg_r2_384_447_9_11_n_2,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_320_383_9_11_n_2,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_256_319_9_11_n_2,
      O => \lb_rdata[11]_i_8_n_0\
    );
\lb_rdata[12]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => lb_rdata0(12),
      I1 => \lb_rdata[31]_i_4_n_0\,
      I2 => \lb_rdata_reg[12]_i_3_n_0\,
      I3 => rd_addr_next(9),
      I4 => \lb_rdata_reg[12]_i_4_n_0\,
      O => \lb_rdata[12]_i_1_n_0\
    );
\lb_rdata[12]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => linebuf_reg_r1_512_575_12_14_n_0,
      I1 => \vcnt[9]_i_5_n_0\,
      I2 => rd_addr_next(9),
      I3 => linebuf_reg_r1_0_63_12_14_n_0,
      O => lb_rdata0(12)
    );
\lb_rdata[12]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_704_767_12_14_n_0,
      I1 => linebuf_reg_r2_640_703_12_14_n_0,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_576_639_12_14_n_0,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_512_575_12_14_n_0,
      O => \lb_rdata[12]_i_5_n_0\
    );
\lb_rdata[12]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_960_1023_12_14_n_0,
      I1 => linebuf_reg_r2_896_959_12_14_n_0,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_832_895_12_14_n_0,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_768_831_12_14_n_0,
      O => \lb_rdata[12]_i_6_n_0\
    );
\lb_rdata[12]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_192_255_12_14_n_0,
      I1 => linebuf_reg_r2_128_191_12_14_n_0,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_64_127_12_14_n_0,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_0_63_12_14_n_0,
      O => \lb_rdata[12]_i_7_n_0\
    );
\lb_rdata[12]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_448_511_12_14_n_0,
      I1 => linebuf_reg_r2_384_447_12_14_n_0,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_320_383_12_14_n_0,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_256_319_12_14_n_0,
      O => \lb_rdata[12]_i_8_n_0\
    );
\lb_rdata[13]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => lb_rdata0(13),
      I1 => \lb_rdata[31]_i_4_n_0\,
      I2 => \lb_rdata_reg[13]_i_3_n_0\,
      I3 => rd_addr_next(9),
      I4 => \lb_rdata_reg[13]_i_4_n_0\,
      O => \lb_rdata[13]_i_1_n_0\
    );
\lb_rdata[13]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => linebuf_reg_r1_512_575_12_14_n_1,
      I1 => \vcnt[9]_i_5_n_0\,
      I2 => rd_addr_next(9),
      I3 => linebuf_reg_r1_0_63_12_14_n_1,
      O => lb_rdata0(13)
    );
\lb_rdata[13]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_704_767_12_14_n_1,
      I1 => linebuf_reg_r2_640_703_12_14_n_1,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_576_639_12_14_n_1,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_512_575_12_14_n_1,
      O => \lb_rdata[13]_i_5_n_0\
    );
\lb_rdata[13]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_960_1023_12_14_n_1,
      I1 => linebuf_reg_r2_896_959_12_14_n_1,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_832_895_12_14_n_1,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_768_831_12_14_n_1,
      O => \lb_rdata[13]_i_6_n_0\
    );
\lb_rdata[13]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_192_255_12_14_n_1,
      I1 => linebuf_reg_r2_128_191_12_14_n_1,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_64_127_12_14_n_1,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_0_63_12_14_n_1,
      O => \lb_rdata[13]_i_7_n_0\
    );
\lb_rdata[13]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_448_511_12_14_n_1,
      I1 => linebuf_reg_r2_384_447_12_14_n_1,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_320_383_12_14_n_1,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_256_319_12_14_n_1,
      O => \lb_rdata[13]_i_8_n_0\
    );
\lb_rdata[14]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => lb_rdata0(14),
      I1 => \lb_rdata[31]_i_4_n_0\,
      I2 => \lb_rdata_reg[14]_i_3_n_0\,
      I3 => rd_addr_next(9),
      I4 => \lb_rdata_reg[14]_i_4_n_0\,
      O => \lb_rdata[14]_i_1_n_0\
    );
\lb_rdata[14]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => linebuf_reg_r1_512_575_12_14_n_2,
      I1 => \vcnt[9]_i_5_n_0\,
      I2 => rd_addr_next(9),
      I3 => linebuf_reg_r1_0_63_12_14_n_2,
      O => lb_rdata0(14)
    );
\lb_rdata[14]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_704_767_12_14_n_2,
      I1 => linebuf_reg_r2_640_703_12_14_n_2,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_576_639_12_14_n_2,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_512_575_12_14_n_2,
      O => \lb_rdata[14]_i_5_n_0\
    );
\lb_rdata[14]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_960_1023_12_14_n_2,
      I1 => linebuf_reg_r2_896_959_12_14_n_2,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_832_895_12_14_n_2,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_768_831_12_14_n_2,
      O => \lb_rdata[14]_i_6_n_0\
    );
\lb_rdata[14]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_192_255_12_14_n_2,
      I1 => linebuf_reg_r2_128_191_12_14_n_2,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_64_127_12_14_n_2,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_0_63_12_14_n_2,
      O => \lb_rdata[14]_i_7_n_0\
    );
\lb_rdata[14]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_448_511_12_14_n_2,
      I1 => linebuf_reg_r2_384_447_12_14_n_2,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_320_383_12_14_n_2,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_256_319_12_14_n_2,
      O => \lb_rdata[14]_i_8_n_0\
    );
\lb_rdata[15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => lb_rdata0(15),
      I1 => \lb_rdata[31]_i_4_n_0\,
      I2 => \lb_rdata_reg[15]_i_3_n_0\,
      I3 => rd_addr_next(9),
      I4 => \lb_rdata_reg[15]_i_4_n_0\,
      O => \lb_rdata[15]_i_1_n_0\
    );
\lb_rdata[15]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => linebuf_reg_r1_512_575_15_17_n_0,
      I1 => \vcnt[9]_i_5_n_0\,
      I2 => rd_addr_next(9),
      I3 => linebuf_reg_r1_0_63_15_17_n_0,
      O => lb_rdata0(15)
    );
\lb_rdata[15]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_704_767_15_17_n_0,
      I1 => linebuf_reg_r2_640_703_15_17_n_0,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_576_639_15_17_n_0,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_512_575_15_17_n_0,
      O => \lb_rdata[15]_i_5_n_0\
    );
\lb_rdata[15]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_960_1023_15_17_n_0,
      I1 => linebuf_reg_r2_896_959_15_17_n_0,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_832_895_15_17_n_0,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_768_831_15_17_n_0,
      O => \lb_rdata[15]_i_6_n_0\
    );
\lb_rdata[15]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_192_255_15_17_n_0,
      I1 => linebuf_reg_r2_128_191_15_17_n_0,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_64_127_15_17_n_0,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_0_63_15_17_n_0,
      O => \lb_rdata[15]_i_7_n_0\
    );
\lb_rdata[15]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_448_511_15_17_n_0,
      I1 => linebuf_reg_r2_384_447_15_17_n_0,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_320_383_15_17_n_0,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_256_319_15_17_n_0,
      O => \lb_rdata[15]_i_8_n_0\
    );
\lb_rdata[16]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => lb_rdata0(16),
      I1 => \lb_rdata[31]_i_4_n_0\,
      I2 => \lb_rdata_reg[16]_i_3_n_0\,
      I3 => rd_addr_next(9),
      I4 => \lb_rdata_reg[16]_i_4_n_0\,
      O => \lb_rdata[16]_i_1_n_0\
    );
\lb_rdata[16]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => linebuf_reg_r1_512_575_15_17_n_1,
      I1 => \vcnt[9]_i_5_n_0\,
      I2 => rd_addr_next(9),
      I3 => linebuf_reg_r1_0_63_15_17_n_1,
      O => lb_rdata0(16)
    );
\lb_rdata[16]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_704_767_15_17_n_1,
      I1 => linebuf_reg_r2_640_703_15_17_n_1,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_576_639_15_17_n_1,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_512_575_15_17_n_1,
      O => \lb_rdata[16]_i_5_n_0\
    );
\lb_rdata[16]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_960_1023_15_17_n_1,
      I1 => linebuf_reg_r2_896_959_15_17_n_1,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_832_895_15_17_n_1,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_768_831_15_17_n_1,
      O => \lb_rdata[16]_i_6_n_0\
    );
\lb_rdata[16]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_192_255_15_17_n_1,
      I1 => linebuf_reg_r2_128_191_15_17_n_1,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_64_127_15_17_n_1,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_0_63_15_17_n_1,
      O => \lb_rdata[16]_i_7_n_0\
    );
\lb_rdata[16]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_448_511_15_17_n_1,
      I1 => linebuf_reg_r2_384_447_15_17_n_1,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_320_383_15_17_n_1,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_256_319_15_17_n_1,
      O => \lb_rdata[16]_i_8_n_0\
    );
\lb_rdata[17]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => lb_rdata0(17),
      I1 => \lb_rdata[31]_i_4_n_0\,
      I2 => \lb_rdata_reg[17]_i_3_n_0\,
      I3 => rd_addr_next(9),
      I4 => \lb_rdata_reg[17]_i_4_n_0\,
      O => \lb_rdata[17]_i_1_n_0\
    );
\lb_rdata[17]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => linebuf_reg_r1_512_575_15_17_n_2,
      I1 => \vcnt[9]_i_5_n_0\,
      I2 => rd_addr_next(9),
      I3 => linebuf_reg_r1_0_63_15_17_n_2,
      O => lb_rdata0(17)
    );
\lb_rdata[17]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_704_767_15_17_n_2,
      I1 => linebuf_reg_r2_640_703_15_17_n_2,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_576_639_15_17_n_2,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_512_575_15_17_n_2,
      O => \lb_rdata[17]_i_5_n_0\
    );
\lb_rdata[17]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_960_1023_15_17_n_2,
      I1 => linebuf_reg_r2_896_959_15_17_n_2,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_832_895_15_17_n_2,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_768_831_15_17_n_2,
      O => \lb_rdata[17]_i_6_n_0\
    );
\lb_rdata[17]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_192_255_15_17_n_2,
      I1 => linebuf_reg_r2_128_191_15_17_n_2,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_64_127_15_17_n_2,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_0_63_15_17_n_2,
      O => \lb_rdata[17]_i_7_n_0\
    );
\lb_rdata[17]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_448_511_15_17_n_2,
      I1 => linebuf_reg_r2_384_447_15_17_n_2,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_320_383_15_17_n_2,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_256_319_15_17_n_2,
      O => \lb_rdata[17]_i_8_n_0\
    );
\lb_rdata[18]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => lb_rdata0(18),
      I1 => \lb_rdata[31]_i_4_n_0\,
      I2 => \lb_rdata_reg[18]_i_3_n_0\,
      I3 => rd_addr_next(9),
      I4 => \lb_rdata_reg[18]_i_4_n_0\,
      O => \lb_rdata[18]_i_1_n_0\
    );
\lb_rdata[18]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => linebuf_reg_r1_512_575_18_20_n_0,
      I1 => \vcnt[9]_i_5_n_0\,
      I2 => rd_addr_next(9),
      I3 => linebuf_reg_r1_0_63_18_20_n_0,
      O => lb_rdata0(18)
    );
\lb_rdata[18]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_704_767_18_20_n_0,
      I1 => linebuf_reg_r2_640_703_18_20_n_0,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_576_639_18_20_n_0,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_512_575_18_20_n_0,
      O => \lb_rdata[18]_i_5_n_0\
    );
\lb_rdata[18]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_960_1023_18_20_n_0,
      I1 => linebuf_reg_r2_896_959_18_20_n_0,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_832_895_18_20_n_0,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_768_831_18_20_n_0,
      O => \lb_rdata[18]_i_6_n_0\
    );
\lb_rdata[18]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_192_255_18_20_n_0,
      I1 => linebuf_reg_r2_128_191_18_20_n_0,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_64_127_18_20_n_0,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_0_63_18_20_n_0,
      O => \lb_rdata[18]_i_7_n_0\
    );
\lb_rdata[18]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_448_511_18_20_n_0,
      I1 => linebuf_reg_r2_384_447_18_20_n_0,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_320_383_18_20_n_0,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_256_319_18_20_n_0,
      O => \lb_rdata[18]_i_8_n_0\
    );
\lb_rdata[19]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => lb_rdata0(19),
      I1 => \lb_rdata[31]_i_4_n_0\,
      I2 => \lb_rdata_reg[19]_i_3_n_0\,
      I3 => rd_addr_next(9),
      I4 => \lb_rdata_reg[19]_i_4_n_0\,
      O => \lb_rdata[19]_i_1_n_0\
    );
\lb_rdata[19]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => linebuf_reg_r1_512_575_18_20_n_1,
      I1 => \vcnt[9]_i_5_n_0\,
      I2 => rd_addr_next(9),
      I3 => linebuf_reg_r1_0_63_18_20_n_1,
      O => lb_rdata0(19)
    );
\lb_rdata[19]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_704_767_18_20_n_1,
      I1 => linebuf_reg_r2_640_703_18_20_n_1,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_576_639_18_20_n_1,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_512_575_18_20_n_1,
      O => \lb_rdata[19]_i_5_n_0\
    );
\lb_rdata[19]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_960_1023_18_20_n_1,
      I1 => linebuf_reg_r2_896_959_18_20_n_1,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_832_895_18_20_n_1,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_768_831_18_20_n_1,
      O => \lb_rdata[19]_i_6_n_0\
    );
\lb_rdata[19]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_192_255_18_20_n_1,
      I1 => linebuf_reg_r2_128_191_18_20_n_1,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_64_127_18_20_n_1,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_0_63_18_20_n_1,
      O => \lb_rdata[19]_i_7_n_0\
    );
\lb_rdata[19]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_448_511_18_20_n_1,
      I1 => linebuf_reg_r2_384_447_18_20_n_1,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_320_383_18_20_n_1,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_256_319_18_20_n_1,
      O => \lb_rdata[19]_i_8_n_0\
    );
\lb_rdata[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => lb_rdata0(1),
      I1 => \lb_rdata[31]_i_4_n_0\,
      I2 => \lb_rdata_reg[1]_i_3_n_0\,
      I3 => rd_addr_next(9),
      I4 => \lb_rdata_reg[1]_i_4_n_0\,
      O => \lb_rdata[1]_i_1_n_0\
    );
\lb_rdata[1]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => linebuf_reg_r1_512_575_0_2_n_1,
      I1 => \vcnt[9]_i_5_n_0\,
      I2 => rd_addr_next(9),
      I3 => linebuf_reg_r1_0_63_0_2_n_1,
      O => lb_rdata0(1)
    );
\lb_rdata[1]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_704_767_0_2_n_1,
      I1 => linebuf_reg_r2_640_703_0_2_n_1,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_576_639_0_2_n_1,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_512_575_0_2_n_1,
      O => \lb_rdata[1]_i_5_n_0\
    );
\lb_rdata[1]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_960_1023_0_2_n_1,
      I1 => linebuf_reg_r2_896_959_0_2_n_1,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_832_895_0_2_n_1,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_768_831_0_2_n_1,
      O => \lb_rdata[1]_i_6_n_0\
    );
\lb_rdata[1]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_192_255_0_2_n_1,
      I1 => linebuf_reg_r2_128_191_0_2_n_1,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_64_127_0_2_n_1,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_0_63_0_2_n_1,
      O => \lb_rdata[1]_i_7_n_0\
    );
\lb_rdata[1]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_448_511_0_2_n_1,
      I1 => linebuf_reg_r2_384_447_0_2_n_1,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_320_383_0_2_n_1,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_256_319_0_2_n_1,
      O => \lb_rdata[1]_i_8_n_0\
    );
\lb_rdata[20]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => lb_rdata0(20),
      I1 => \lb_rdata[31]_i_4_n_0\,
      I2 => \lb_rdata_reg[20]_i_3_n_0\,
      I3 => rd_addr_next(9),
      I4 => \lb_rdata_reg[20]_i_4_n_0\,
      O => \lb_rdata[20]_i_1_n_0\
    );
\lb_rdata[20]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => linebuf_reg_r1_512_575_18_20_n_2,
      I1 => \vcnt[9]_i_5_n_0\,
      I2 => rd_addr_next(9),
      I3 => linebuf_reg_r1_0_63_18_20_n_2,
      O => lb_rdata0(20)
    );
\lb_rdata[20]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_704_767_18_20_n_2,
      I1 => linebuf_reg_r2_640_703_18_20_n_2,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_576_639_18_20_n_2,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_512_575_18_20_n_2,
      O => \lb_rdata[20]_i_5_n_0\
    );
\lb_rdata[20]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_960_1023_18_20_n_2,
      I1 => linebuf_reg_r2_896_959_18_20_n_2,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_832_895_18_20_n_2,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_768_831_18_20_n_2,
      O => \lb_rdata[20]_i_6_n_0\
    );
\lb_rdata[20]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_192_255_18_20_n_2,
      I1 => linebuf_reg_r2_128_191_18_20_n_2,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_64_127_18_20_n_2,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_0_63_18_20_n_2,
      O => \lb_rdata[20]_i_7_n_0\
    );
\lb_rdata[20]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_448_511_18_20_n_2,
      I1 => linebuf_reg_r2_384_447_18_20_n_2,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_320_383_18_20_n_2,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_256_319_18_20_n_2,
      O => \lb_rdata[20]_i_8_n_0\
    );
\lb_rdata[21]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => lb_rdata0(21),
      I1 => \lb_rdata[31]_i_4_n_0\,
      I2 => \lb_rdata_reg[21]_i_3_n_0\,
      I3 => rd_addr_next(9),
      I4 => \lb_rdata_reg[21]_i_4_n_0\,
      O => \lb_rdata[21]_i_1_n_0\
    );
\lb_rdata[21]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => linebuf_reg_r1_512_575_21_23_n_0,
      I1 => \vcnt[9]_i_5_n_0\,
      I2 => rd_addr_next(9),
      I3 => linebuf_reg_r1_0_63_21_23_n_0,
      O => lb_rdata0(21)
    );
\lb_rdata[21]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_704_767_21_23_n_0,
      I1 => linebuf_reg_r2_640_703_21_23_n_0,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_576_639_21_23_n_0,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_512_575_21_23_n_0,
      O => \lb_rdata[21]_i_5_n_0\
    );
\lb_rdata[21]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_960_1023_21_23_n_0,
      I1 => linebuf_reg_r2_896_959_21_23_n_0,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_832_895_21_23_n_0,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_768_831_21_23_n_0,
      O => \lb_rdata[21]_i_6_n_0\
    );
\lb_rdata[21]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_192_255_21_23_n_0,
      I1 => linebuf_reg_r2_128_191_21_23_n_0,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_64_127_21_23_n_0,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_0_63_21_23_n_0,
      O => \lb_rdata[21]_i_7_n_0\
    );
\lb_rdata[21]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_448_511_21_23_n_0,
      I1 => linebuf_reg_r2_384_447_21_23_n_0,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_320_383_21_23_n_0,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_256_319_21_23_n_0,
      O => \lb_rdata[21]_i_8_n_0\
    );
\lb_rdata[22]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => lb_rdata0(22),
      I1 => \lb_rdata[31]_i_4_n_0\,
      I2 => \lb_rdata_reg[22]_i_3_n_0\,
      I3 => rd_addr_next(9),
      I4 => \lb_rdata_reg[22]_i_4_n_0\,
      O => \lb_rdata[22]_i_1_n_0\
    );
\lb_rdata[22]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => linebuf_reg_r1_512_575_21_23_n_1,
      I1 => \vcnt[9]_i_5_n_0\,
      I2 => rd_addr_next(9),
      I3 => linebuf_reg_r1_0_63_21_23_n_1,
      O => lb_rdata0(22)
    );
\lb_rdata[22]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_704_767_21_23_n_1,
      I1 => linebuf_reg_r2_640_703_21_23_n_1,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_576_639_21_23_n_1,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_512_575_21_23_n_1,
      O => \lb_rdata[22]_i_5_n_0\
    );
\lb_rdata[22]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_960_1023_21_23_n_1,
      I1 => linebuf_reg_r2_896_959_21_23_n_1,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_832_895_21_23_n_1,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_768_831_21_23_n_1,
      O => \lb_rdata[22]_i_6_n_0\
    );
\lb_rdata[22]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_192_255_21_23_n_1,
      I1 => linebuf_reg_r2_128_191_21_23_n_1,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_64_127_21_23_n_1,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_0_63_21_23_n_1,
      O => \lb_rdata[22]_i_7_n_0\
    );
\lb_rdata[22]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_448_511_21_23_n_1,
      I1 => linebuf_reg_r2_384_447_21_23_n_1,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_320_383_21_23_n_1,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_256_319_21_23_n_1,
      O => \lb_rdata[22]_i_8_n_0\
    );
\lb_rdata[23]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => lb_rdata0(23),
      I1 => \lb_rdata[31]_i_4_n_0\,
      I2 => \lb_rdata_reg[23]_i_3_n_0\,
      I3 => rd_addr_next(9),
      I4 => \lb_rdata_reg[23]_i_4_n_0\,
      O => \lb_rdata[23]_i_1_n_0\
    );
\lb_rdata[23]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => linebuf_reg_r1_512_575_21_23_n_2,
      I1 => \vcnt[9]_i_5_n_0\,
      I2 => rd_addr_next(9),
      I3 => linebuf_reg_r1_0_63_21_23_n_2,
      O => lb_rdata0(23)
    );
\lb_rdata[23]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_704_767_21_23_n_2,
      I1 => linebuf_reg_r2_640_703_21_23_n_2,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_576_639_21_23_n_2,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_512_575_21_23_n_2,
      O => \lb_rdata[23]_i_5_n_0\
    );
\lb_rdata[23]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_960_1023_21_23_n_2,
      I1 => linebuf_reg_r2_896_959_21_23_n_2,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_832_895_21_23_n_2,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_768_831_21_23_n_2,
      O => \lb_rdata[23]_i_6_n_0\
    );
\lb_rdata[23]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_192_255_21_23_n_2,
      I1 => linebuf_reg_r2_128_191_21_23_n_2,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_64_127_21_23_n_2,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_0_63_21_23_n_2,
      O => \lb_rdata[23]_i_7_n_0\
    );
\lb_rdata[23]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_448_511_21_23_n_2,
      I1 => linebuf_reg_r2_384_447_21_23_n_2,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_320_383_21_23_n_2,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_256_319_21_23_n_2,
      O => \lb_rdata[23]_i_8_n_0\
    );
\lb_rdata[24]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => lb_rdata0(24),
      I1 => \lb_rdata[31]_i_4_n_0\,
      I2 => \lb_rdata_reg[24]_i_3_n_0\,
      I3 => rd_addr_next(9),
      I4 => \lb_rdata_reg[24]_i_4_n_0\,
      O => \lb_rdata[24]_i_1_n_0\
    );
\lb_rdata[24]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => linebuf_reg_r1_512_575_24_26_n_0,
      I1 => \vcnt[9]_i_5_n_0\,
      I2 => rd_addr_next(9),
      I3 => linebuf_reg_r1_0_63_24_26_n_0,
      O => lb_rdata0(24)
    );
\lb_rdata[24]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_704_767_24_26_n_0,
      I1 => linebuf_reg_r2_640_703_24_26_n_0,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_576_639_24_26_n_0,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_512_575_24_26_n_0,
      O => \lb_rdata[24]_i_5_n_0\
    );
\lb_rdata[24]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_960_1023_24_26_n_0,
      I1 => linebuf_reg_r2_896_959_24_26_n_0,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_832_895_24_26_n_0,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_768_831_24_26_n_0,
      O => \lb_rdata[24]_i_6_n_0\
    );
\lb_rdata[24]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_192_255_24_26_n_0,
      I1 => linebuf_reg_r2_128_191_24_26_n_0,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_64_127_24_26_n_0,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_0_63_24_26_n_0,
      O => \lb_rdata[24]_i_7_n_0\
    );
\lb_rdata[24]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_448_511_24_26_n_0,
      I1 => linebuf_reg_r2_384_447_24_26_n_0,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_320_383_24_26_n_0,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_256_319_24_26_n_0,
      O => \lb_rdata[24]_i_8_n_0\
    );
\lb_rdata[25]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => lb_rdata0(25),
      I1 => \lb_rdata[31]_i_4_n_0\,
      I2 => \lb_rdata_reg[25]_i_3_n_0\,
      I3 => rd_addr_next(9),
      I4 => \lb_rdata_reg[25]_i_4_n_0\,
      O => \lb_rdata[25]_i_1_n_0\
    );
\lb_rdata[25]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => linebuf_reg_r1_512_575_24_26_n_1,
      I1 => \vcnt[9]_i_5_n_0\,
      I2 => rd_addr_next(9),
      I3 => linebuf_reg_r1_0_63_24_26_n_1,
      O => lb_rdata0(25)
    );
\lb_rdata[25]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_704_767_24_26_n_1,
      I1 => linebuf_reg_r2_640_703_24_26_n_1,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_576_639_24_26_n_1,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_512_575_24_26_n_1,
      O => \lb_rdata[25]_i_5_n_0\
    );
\lb_rdata[25]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_960_1023_24_26_n_1,
      I1 => linebuf_reg_r2_896_959_24_26_n_1,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_832_895_24_26_n_1,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_768_831_24_26_n_1,
      O => \lb_rdata[25]_i_6_n_0\
    );
\lb_rdata[25]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_192_255_24_26_n_1,
      I1 => linebuf_reg_r2_128_191_24_26_n_1,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_64_127_24_26_n_1,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_0_63_24_26_n_1,
      O => \lb_rdata[25]_i_7_n_0\
    );
\lb_rdata[25]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_448_511_24_26_n_1,
      I1 => linebuf_reg_r2_384_447_24_26_n_1,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_320_383_24_26_n_1,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_256_319_24_26_n_1,
      O => \lb_rdata[25]_i_8_n_0\
    );
\lb_rdata[26]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => lb_rdata0(26),
      I1 => \lb_rdata[31]_i_4_n_0\,
      I2 => \lb_rdata_reg[26]_i_3_n_0\,
      I3 => rd_addr_next(9),
      I4 => \lb_rdata_reg[26]_i_4_n_0\,
      O => \lb_rdata[26]_i_1_n_0\
    );
\lb_rdata[26]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => linebuf_reg_r1_512_575_24_26_n_2,
      I1 => \vcnt[9]_i_5_n_0\,
      I2 => rd_addr_next(9),
      I3 => linebuf_reg_r1_0_63_24_26_n_2,
      O => lb_rdata0(26)
    );
\lb_rdata[26]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_704_767_24_26_n_2,
      I1 => linebuf_reg_r2_640_703_24_26_n_2,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_576_639_24_26_n_2,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_512_575_24_26_n_2,
      O => \lb_rdata[26]_i_5_n_0\
    );
\lb_rdata[26]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_960_1023_24_26_n_2,
      I1 => linebuf_reg_r2_896_959_24_26_n_2,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_832_895_24_26_n_2,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_768_831_24_26_n_2,
      O => \lb_rdata[26]_i_6_n_0\
    );
\lb_rdata[26]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_192_255_24_26_n_2,
      I1 => linebuf_reg_r2_128_191_24_26_n_2,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_64_127_24_26_n_2,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_0_63_24_26_n_2,
      O => \lb_rdata[26]_i_7_n_0\
    );
\lb_rdata[26]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_448_511_24_26_n_2,
      I1 => linebuf_reg_r2_384_447_24_26_n_2,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_320_383_24_26_n_2,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_256_319_24_26_n_2,
      O => \lb_rdata[26]_i_8_n_0\
    );
\lb_rdata[27]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => lb_rdata0(27),
      I1 => \lb_rdata[31]_i_4_n_0\,
      I2 => \lb_rdata_reg[27]_i_3_n_0\,
      I3 => rd_addr_next(9),
      I4 => \lb_rdata_reg[27]_i_4_n_0\,
      O => \lb_rdata[27]_i_1_n_0\
    );
\lb_rdata[27]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => linebuf_reg_r1_512_575_27_29_n_0,
      I1 => \vcnt[9]_i_5_n_0\,
      I2 => rd_addr_next(9),
      I3 => linebuf_reg_r1_0_63_27_29_n_0,
      O => lb_rdata0(27)
    );
\lb_rdata[27]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_704_767_27_29_n_0,
      I1 => linebuf_reg_r2_640_703_27_29_n_0,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_576_639_27_29_n_0,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_512_575_27_29_n_0,
      O => \lb_rdata[27]_i_5_n_0\
    );
\lb_rdata[27]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_960_1023_27_29_n_0,
      I1 => linebuf_reg_r2_896_959_27_29_n_0,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_832_895_27_29_n_0,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_768_831_27_29_n_0,
      O => \lb_rdata[27]_i_6_n_0\
    );
\lb_rdata[27]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_192_255_27_29_n_0,
      I1 => linebuf_reg_r2_128_191_27_29_n_0,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_64_127_27_29_n_0,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_0_63_27_29_n_0,
      O => \lb_rdata[27]_i_7_n_0\
    );
\lb_rdata[27]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_448_511_27_29_n_0,
      I1 => linebuf_reg_r2_384_447_27_29_n_0,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_320_383_27_29_n_0,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_256_319_27_29_n_0,
      O => \lb_rdata[27]_i_8_n_0\
    );
\lb_rdata[28]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => lb_rdata0(28),
      I1 => \lb_rdata[31]_i_4_n_0\,
      I2 => \lb_rdata_reg[28]_i_3_n_0\,
      I3 => rd_addr_next(9),
      I4 => \lb_rdata_reg[28]_i_4_n_0\,
      O => \lb_rdata[28]_i_1_n_0\
    );
\lb_rdata[28]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => linebuf_reg_r1_512_575_27_29_n_1,
      I1 => \vcnt[9]_i_5_n_0\,
      I2 => rd_addr_next(9),
      I3 => linebuf_reg_r1_0_63_27_29_n_1,
      O => lb_rdata0(28)
    );
\lb_rdata[28]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_704_767_27_29_n_1,
      I1 => linebuf_reg_r2_640_703_27_29_n_1,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_576_639_27_29_n_1,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_512_575_27_29_n_1,
      O => \lb_rdata[28]_i_5_n_0\
    );
\lb_rdata[28]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_960_1023_27_29_n_1,
      I1 => linebuf_reg_r2_896_959_27_29_n_1,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_832_895_27_29_n_1,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_768_831_27_29_n_1,
      O => \lb_rdata[28]_i_6_n_0\
    );
\lb_rdata[28]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_192_255_27_29_n_1,
      I1 => linebuf_reg_r2_128_191_27_29_n_1,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_64_127_27_29_n_1,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_0_63_27_29_n_1,
      O => \lb_rdata[28]_i_7_n_0\
    );
\lb_rdata[28]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_448_511_27_29_n_1,
      I1 => linebuf_reg_r2_384_447_27_29_n_1,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_320_383_27_29_n_1,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_256_319_27_29_n_1,
      O => \lb_rdata[28]_i_8_n_0\
    );
\lb_rdata[29]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => lb_rdata0(29),
      I1 => \lb_rdata[31]_i_4_n_0\,
      I2 => \lb_rdata_reg[29]_i_3_n_0\,
      I3 => rd_addr_next(9),
      I4 => \lb_rdata_reg[29]_i_4_n_0\,
      O => \lb_rdata[29]_i_1_n_0\
    );
\lb_rdata[29]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => linebuf_reg_r1_512_575_27_29_n_2,
      I1 => \vcnt[9]_i_5_n_0\,
      I2 => rd_addr_next(9),
      I3 => linebuf_reg_r1_0_63_27_29_n_2,
      O => lb_rdata0(29)
    );
\lb_rdata[29]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_704_767_27_29_n_2,
      I1 => linebuf_reg_r2_640_703_27_29_n_2,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_576_639_27_29_n_2,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_512_575_27_29_n_2,
      O => \lb_rdata[29]_i_5_n_0\
    );
\lb_rdata[29]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_960_1023_27_29_n_2,
      I1 => linebuf_reg_r2_896_959_27_29_n_2,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_832_895_27_29_n_2,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_768_831_27_29_n_2,
      O => \lb_rdata[29]_i_6_n_0\
    );
\lb_rdata[29]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_192_255_27_29_n_2,
      I1 => linebuf_reg_r2_128_191_27_29_n_2,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_64_127_27_29_n_2,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_0_63_27_29_n_2,
      O => \lb_rdata[29]_i_7_n_0\
    );
\lb_rdata[29]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_448_511_27_29_n_2,
      I1 => linebuf_reg_r2_384_447_27_29_n_2,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_320_383_27_29_n_2,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_256_319_27_29_n_2,
      O => \lb_rdata[29]_i_8_n_0\
    );
\lb_rdata[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => lb_rdata0(2),
      I1 => \lb_rdata[31]_i_4_n_0\,
      I2 => \lb_rdata_reg[2]_i_3_n_0\,
      I3 => rd_addr_next(9),
      I4 => \lb_rdata_reg[2]_i_4_n_0\,
      O => \lb_rdata[2]_i_1_n_0\
    );
\lb_rdata[2]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => linebuf_reg_r1_512_575_0_2_n_2,
      I1 => \vcnt[9]_i_5_n_0\,
      I2 => rd_addr_next(9),
      I3 => linebuf_reg_r1_0_63_0_2_n_2,
      O => lb_rdata0(2)
    );
\lb_rdata[2]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_704_767_0_2_n_2,
      I1 => linebuf_reg_r2_640_703_0_2_n_2,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_576_639_0_2_n_2,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_512_575_0_2_n_2,
      O => \lb_rdata[2]_i_5_n_0\
    );
\lb_rdata[2]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_960_1023_0_2_n_2,
      I1 => linebuf_reg_r2_896_959_0_2_n_2,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_832_895_0_2_n_2,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_768_831_0_2_n_2,
      O => \lb_rdata[2]_i_6_n_0\
    );
\lb_rdata[2]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_192_255_0_2_n_2,
      I1 => linebuf_reg_r2_128_191_0_2_n_2,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_64_127_0_2_n_2,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_0_63_0_2_n_2,
      O => \lb_rdata[2]_i_7_n_0\
    );
\lb_rdata[2]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_448_511_0_2_n_2,
      I1 => linebuf_reg_r2_384_447_0_2_n_2,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_320_383_0_2_n_2,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_256_319_0_2_n_2,
      O => \lb_rdata[2]_i_8_n_0\
    );
\lb_rdata[30]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => lb_rdata0(30),
      I1 => \lb_rdata[31]_i_4_n_0\,
      I2 => \lb_rdata_reg[30]_i_3_n_0\,
      I3 => rd_addr_next(9),
      I4 => \lb_rdata_reg[30]_i_4_n_0\,
      O => \lb_rdata[30]_i_1_n_0\
    );
\lb_rdata[30]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => linebuf_reg_r1_512_575_30_31_n_0,
      I1 => \vcnt[9]_i_5_n_0\,
      I2 => rd_addr_next(9),
      I3 => linebuf_reg_r1_0_63_30_31_n_0,
      O => lb_rdata0(30)
    );
\lb_rdata[30]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_704_767_30_31_n_0,
      I1 => linebuf_reg_r2_640_703_30_31_n_0,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_576_639_30_31_n_0,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_512_575_30_31_n_0,
      O => \lb_rdata[30]_i_5_n_0\
    );
\lb_rdata[30]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_960_1023_30_31_n_0,
      I1 => linebuf_reg_r2_896_959_30_31_n_0,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_832_895_30_31_n_0,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_768_831_30_31_n_0,
      O => \lb_rdata[30]_i_6_n_0\
    );
\lb_rdata[30]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_192_255_30_31_n_0,
      I1 => linebuf_reg_r2_128_191_30_31_n_0,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_64_127_30_31_n_0,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_0_63_30_31_n_0,
      O => \lb_rdata[30]_i_7_n_0\
    );
\lb_rdata[30]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_448_511_30_31_n_0,
      I1 => linebuf_reg_r2_384_447_30_31_n_0,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_320_383_30_31_n_0,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_256_319_30_31_n_0,
      O => \lb_rdata[30]_i_8_n_0\
    );
\lb_rdata[31]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FEAA"
    )
        port map (
      I0 => \hcnt_reg_n_0_[0]\,
      I1 => p_0_in_2(6),
      I2 => p_0_in_2(7),
      I3 => p_0_in_2(8),
      O => \lb_rdata[31]_i_1_n_0\
    );
\lb_rdata[31]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_192_255_30_31_n_1,
      I1 => linebuf_reg_r2_128_191_30_31_n_1,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_64_127_30_31_n_1,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_0_63_30_31_n_1,
      O => \lb_rdata[31]_i_10_n_0\
    );
\lb_rdata[31]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_448_511_30_31_n_1,
      I1 => linebuf_reg_r2_384_447_30_31_n_1,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_320_383_30_31_n_1,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_256_319_30_31_n_1,
      O => \lb_rdata[31]_i_11_n_0\
    );
\lb_rdata[31]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAA6AAAAAAA"
    )
        port map (
      I0 => p_0_in_2(7),
      I1 => p_0_in_2(6),
      I2 => p_0_in_2(3),
      I3 => p_0_in_2(4),
      I4 => p_0_in_2(5),
      I5 => \hcnt[7]_i_2_n_0\,
      O => rd_addr_next0(7)
    );
\lb_rdata[31]_i_13\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"9AAAAAAA"
    )
        port map (
      I0 => p_0_in_2(6),
      I1 => \hcnt[7]_i_2_n_0\,
      I2 => p_0_in_2(5),
      I3 => p_0_in_2(4),
      I4 => p_0_in_2(3),
      O => rd_addr_next0(6)
    );
\lb_rdata[31]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => lb_rdata0(31),
      I1 => \lb_rdata[31]_i_4_n_0\,
      I2 => \lb_rdata_reg[31]_i_5_n_0\,
      I3 => rd_addr_next(9),
      I4 => \lb_rdata_reg[31]_i_6_n_0\,
      O => \lb_rdata[31]_i_2_n_0\
    );
\lb_rdata[31]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => linebuf_reg_r1_512_575_30_31_n_1,
      I1 => \vcnt[9]_i_5_n_0\,
      I2 => rd_addr_next(9),
      I3 => linebuf_reg_r1_0_63_30_31_n_1,
      O => lb_rdata0(31)
    );
\lb_rdata[31]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A8"
    )
        port map (
      I0 => p_0_in_2(8),
      I1 => p_0_in_2(7),
      I2 => p_0_in_2(6),
      O => \lb_rdata[31]_i_4_n_0\
    );
\lb_rdata[31]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => p_0_in_2(8),
      I1 => p_0_in_2(6),
      I2 => p_0_in_2(7),
      I3 => \hcnt[9]_i_3_n_0\,
      O => rd_addr_next0(8)
    );
\lb_rdata[31]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_704_767_30_31_n_1,
      I1 => linebuf_reg_r2_640_703_30_31_n_1,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_576_639_30_31_n_1,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_512_575_30_31_n_1,
      O => \lb_rdata[31]_i_8_n_0\
    );
\lb_rdata[31]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_960_1023_30_31_n_1,
      I1 => linebuf_reg_r2_896_959_30_31_n_1,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_832_895_30_31_n_1,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_768_831_30_31_n_1,
      O => \lb_rdata[31]_i_9_n_0\
    );
\lb_rdata[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => lb_rdata0(3),
      I1 => \lb_rdata[31]_i_4_n_0\,
      I2 => \lb_rdata_reg[3]_i_3_n_0\,
      I3 => rd_addr_next(9),
      I4 => \lb_rdata_reg[3]_i_4_n_0\,
      O => \lb_rdata[3]_i_1_n_0\
    );
\lb_rdata[3]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => linebuf_reg_r1_512_575_3_5_n_0,
      I1 => \vcnt[9]_i_5_n_0\,
      I2 => rd_addr_next(9),
      I3 => linebuf_reg_r1_0_63_3_5_n_0,
      O => lb_rdata0(3)
    );
\lb_rdata[3]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_704_767_3_5_n_0,
      I1 => linebuf_reg_r2_640_703_3_5_n_0,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_576_639_3_5_n_0,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_512_575_3_5_n_0,
      O => \lb_rdata[3]_i_5_n_0\
    );
\lb_rdata[3]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_960_1023_3_5_n_0,
      I1 => linebuf_reg_r2_896_959_3_5_n_0,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_832_895_3_5_n_0,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_768_831_3_5_n_0,
      O => \lb_rdata[3]_i_6_n_0\
    );
\lb_rdata[3]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_192_255_3_5_n_0,
      I1 => linebuf_reg_r2_128_191_3_5_n_0,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_64_127_3_5_n_0,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_0_63_3_5_n_0,
      O => \lb_rdata[3]_i_7_n_0\
    );
\lb_rdata[3]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_448_511_3_5_n_0,
      I1 => linebuf_reg_r2_384_447_3_5_n_0,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_320_383_3_5_n_0,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_256_319_3_5_n_0,
      O => \lb_rdata[3]_i_8_n_0\
    );
\lb_rdata[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => lb_rdata0(4),
      I1 => \lb_rdata[31]_i_4_n_0\,
      I2 => \lb_rdata_reg[4]_i_3_n_0\,
      I3 => rd_addr_next(9),
      I4 => \lb_rdata_reg[4]_i_4_n_0\,
      O => \lb_rdata[4]_i_1_n_0\
    );
\lb_rdata[4]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => linebuf_reg_r1_512_575_3_5_n_1,
      I1 => \vcnt[9]_i_5_n_0\,
      I2 => rd_addr_next(9),
      I3 => linebuf_reg_r1_0_63_3_5_n_1,
      O => lb_rdata0(4)
    );
\lb_rdata[4]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_704_767_3_5_n_1,
      I1 => linebuf_reg_r2_640_703_3_5_n_1,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_576_639_3_5_n_1,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_512_575_3_5_n_1,
      O => \lb_rdata[4]_i_5_n_0\
    );
\lb_rdata[4]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_960_1023_3_5_n_1,
      I1 => linebuf_reg_r2_896_959_3_5_n_1,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_832_895_3_5_n_1,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_768_831_3_5_n_1,
      O => \lb_rdata[4]_i_6_n_0\
    );
\lb_rdata[4]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_192_255_3_5_n_1,
      I1 => linebuf_reg_r2_128_191_3_5_n_1,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_64_127_3_5_n_1,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_0_63_3_5_n_1,
      O => \lb_rdata[4]_i_7_n_0\
    );
\lb_rdata[4]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_448_511_3_5_n_1,
      I1 => linebuf_reg_r2_384_447_3_5_n_1,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_320_383_3_5_n_1,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_256_319_3_5_n_1,
      O => \lb_rdata[4]_i_8_n_0\
    );
\lb_rdata[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => lb_rdata0(5),
      I1 => \lb_rdata[31]_i_4_n_0\,
      I2 => \lb_rdata_reg[5]_i_3_n_0\,
      I3 => rd_addr_next(9),
      I4 => \lb_rdata_reg[5]_i_4_n_0\,
      O => \lb_rdata[5]_i_1_n_0\
    );
\lb_rdata[5]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => linebuf_reg_r1_512_575_3_5_n_2,
      I1 => \vcnt[9]_i_5_n_0\,
      I2 => rd_addr_next(9),
      I3 => linebuf_reg_r1_0_63_3_5_n_2,
      O => lb_rdata0(5)
    );
\lb_rdata[5]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_704_767_3_5_n_2,
      I1 => linebuf_reg_r2_640_703_3_5_n_2,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_576_639_3_5_n_2,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_512_575_3_5_n_2,
      O => \lb_rdata[5]_i_5_n_0\
    );
\lb_rdata[5]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_960_1023_3_5_n_2,
      I1 => linebuf_reg_r2_896_959_3_5_n_2,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_832_895_3_5_n_2,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_768_831_3_5_n_2,
      O => \lb_rdata[5]_i_6_n_0\
    );
\lb_rdata[5]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_192_255_3_5_n_2,
      I1 => linebuf_reg_r2_128_191_3_5_n_2,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_64_127_3_5_n_2,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_0_63_3_5_n_2,
      O => \lb_rdata[5]_i_7_n_0\
    );
\lb_rdata[5]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_448_511_3_5_n_2,
      I1 => linebuf_reg_r2_384_447_3_5_n_2,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_320_383_3_5_n_2,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_256_319_3_5_n_2,
      O => \lb_rdata[5]_i_8_n_0\
    );
\lb_rdata[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => lb_rdata0(6),
      I1 => \lb_rdata[31]_i_4_n_0\,
      I2 => \lb_rdata_reg[6]_i_3_n_0\,
      I3 => rd_addr_next(9),
      I4 => \lb_rdata_reg[6]_i_4_n_0\,
      O => \lb_rdata[6]_i_1_n_0\
    );
\lb_rdata[6]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => linebuf_reg_r1_512_575_6_8_n_0,
      I1 => \vcnt[9]_i_5_n_0\,
      I2 => rd_addr_next(9),
      I3 => linebuf_reg_r1_0_63_6_8_n_0,
      O => lb_rdata0(6)
    );
\lb_rdata[6]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_704_767_6_8_n_0,
      I1 => linebuf_reg_r2_640_703_6_8_n_0,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_576_639_6_8_n_0,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_512_575_6_8_n_0,
      O => \lb_rdata[6]_i_5_n_0\
    );
\lb_rdata[6]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_960_1023_6_8_n_0,
      I1 => linebuf_reg_r2_896_959_6_8_n_0,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_832_895_6_8_n_0,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_768_831_6_8_n_0,
      O => \lb_rdata[6]_i_6_n_0\
    );
\lb_rdata[6]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_192_255_6_8_n_0,
      I1 => linebuf_reg_r2_128_191_6_8_n_0,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_64_127_6_8_n_0,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_0_63_6_8_n_0,
      O => \lb_rdata[6]_i_7_n_0\
    );
\lb_rdata[6]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_448_511_6_8_n_0,
      I1 => linebuf_reg_r2_384_447_6_8_n_0,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_320_383_6_8_n_0,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_256_319_6_8_n_0,
      O => \lb_rdata[6]_i_8_n_0\
    );
\lb_rdata[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => lb_rdata0(7),
      I1 => \lb_rdata[31]_i_4_n_0\,
      I2 => \lb_rdata_reg[7]_i_3_n_0\,
      I3 => rd_addr_next(9),
      I4 => \lb_rdata_reg[7]_i_4_n_0\,
      O => \lb_rdata[7]_i_1_n_0\
    );
\lb_rdata[7]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => linebuf_reg_r1_512_575_6_8_n_1,
      I1 => \vcnt[9]_i_5_n_0\,
      I2 => rd_addr_next(9),
      I3 => linebuf_reg_r1_0_63_6_8_n_1,
      O => lb_rdata0(7)
    );
\lb_rdata[7]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_704_767_6_8_n_1,
      I1 => linebuf_reg_r2_640_703_6_8_n_1,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_576_639_6_8_n_1,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_512_575_6_8_n_1,
      O => \lb_rdata[7]_i_5_n_0\
    );
\lb_rdata[7]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_960_1023_6_8_n_1,
      I1 => linebuf_reg_r2_896_959_6_8_n_1,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_832_895_6_8_n_1,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_768_831_6_8_n_1,
      O => \lb_rdata[7]_i_6_n_0\
    );
\lb_rdata[7]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_192_255_6_8_n_1,
      I1 => linebuf_reg_r2_128_191_6_8_n_1,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_64_127_6_8_n_1,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_0_63_6_8_n_1,
      O => \lb_rdata[7]_i_7_n_0\
    );
\lb_rdata[7]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_448_511_6_8_n_1,
      I1 => linebuf_reg_r2_384_447_6_8_n_1,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_320_383_6_8_n_1,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_256_319_6_8_n_1,
      O => \lb_rdata[7]_i_8_n_0\
    );
\lb_rdata[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => lb_rdata0(8),
      I1 => \lb_rdata[31]_i_4_n_0\,
      I2 => \lb_rdata_reg[8]_i_3_n_0\,
      I3 => rd_addr_next(9),
      I4 => \lb_rdata_reg[8]_i_4_n_0\,
      O => \lb_rdata[8]_i_1_n_0\
    );
\lb_rdata[8]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => linebuf_reg_r1_512_575_6_8_n_2,
      I1 => \vcnt[9]_i_5_n_0\,
      I2 => rd_addr_next(9),
      I3 => linebuf_reg_r1_0_63_6_8_n_2,
      O => lb_rdata0(8)
    );
\lb_rdata[8]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_704_767_6_8_n_2,
      I1 => linebuf_reg_r2_640_703_6_8_n_2,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_576_639_6_8_n_2,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_512_575_6_8_n_2,
      O => \lb_rdata[8]_i_5_n_0\
    );
\lb_rdata[8]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_960_1023_6_8_n_2,
      I1 => linebuf_reg_r2_896_959_6_8_n_2,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_832_895_6_8_n_2,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_768_831_6_8_n_2,
      O => \lb_rdata[8]_i_6_n_0\
    );
\lb_rdata[8]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_192_255_6_8_n_2,
      I1 => linebuf_reg_r2_128_191_6_8_n_2,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_64_127_6_8_n_2,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_0_63_6_8_n_2,
      O => \lb_rdata[8]_i_7_n_0\
    );
\lb_rdata[8]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_448_511_6_8_n_2,
      I1 => linebuf_reg_r2_384_447_6_8_n_2,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_320_383_6_8_n_2,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_256_319_6_8_n_2,
      O => \lb_rdata[8]_i_8_n_0\
    );
\lb_rdata[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => lb_rdata0(9),
      I1 => \lb_rdata[31]_i_4_n_0\,
      I2 => \lb_rdata_reg[9]_i_3_n_0\,
      I3 => rd_addr_next(9),
      I4 => \lb_rdata_reg[9]_i_4_n_0\,
      O => \lb_rdata[9]_i_1_n_0\
    );
\lb_rdata[9]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => linebuf_reg_r1_512_575_9_11_n_0,
      I1 => \vcnt[9]_i_5_n_0\,
      I2 => rd_addr_next(9),
      I3 => linebuf_reg_r1_0_63_9_11_n_0,
      O => lb_rdata0(9)
    );
\lb_rdata[9]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_704_767_9_11_n_0,
      I1 => linebuf_reg_r2_640_703_9_11_n_0,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_576_639_9_11_n_0,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_512_575_9_11_n_0,
      O => \lb_rdata[9]_i_5_n_0\
    );
\lb_rdata[9]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_960_1023_9_11_n_0,
      I1 => linebuf_reg_r2_896_959_9_11_n_0,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_832_895_9_11_n_0,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_768_831_9_11_n_0,
      O => \lb_rdata[9]_i_6_n_0\
    );
\lb_rdata[9]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_192_255_9_11_n_0,
      I1 => linebuf_reg_r2_128_191_9_11_n_0,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_64_127_9_11_n_0,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_0_63_9_11_n_0,
      O => \lb_rdata[9]_i_7_n_0\
    );
\lb_rdata[9]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => linebuf_reg_r2_448_511_9_11_n_0,
      I1 => linebuf_reg_r2_384_447_9_11_n_0,
      I2 => rd_addr_next0(7),
      I3 => linebuf_reg_r2_320_383_9_11_n_0,
      I4 => rd_addr_next0(6),
      I5 => linebuf_reg_r2_256_319_9_11_n_0,
      O => \lb_rdata[9]_i_8_n_0\
    );
\lb_rdata_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => \lb_rdata[31]_i_1_n_0\,
      D => \lb_rdata[0]_i_1_n_0\,
      Q => \lb_rdata_reg_n_0_[0]\,
      R => '0'
    );
\lb_rdata_reg[0]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \lb_rdata[0]_i_5_n_0\,
      I1 => \lb_rdata[0]_i_6_n_0\,
      O => \lb_rdata_reg[0]_i_3_n_0\,
      S => rd_addr_next0(8)
    );
\lb_rdata_reg[0]_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \lb_rdata[0]_i_7_n_0\,
      I1 => \lb_rdata[0]_i_8_n_0\,
      O => \lb_rdata_reg[0]_i_4_n_0\,
      S => rd_addr_next0(8)
    );
\lb_rdata_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => \lb_rdata[31]_i_1_n_0\,
      D => \lb_rdata[10]_i_1_n_0\,
      Q => \lb_rdata_reg_n_0_[10]\,
      R => '0'
    );
\lb_rdata_reg[10]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \lb_rdata[10]_i_5_n_0\,
      I1 => \lb_rdata[10]_i_6_n_0\,
      O => \lb_rdata_reg[10]_i_3_n_0\,
      S => rd_addr_next0(8)
    );
\lb_rdata_reg[10]_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \lb_rdata[10]_i_7_n_0\,
      I1 => \lb_rdata[10]_i_8_n_0\,
      O => \lb_rdata_reg[10]_i_4_n_0\,
      S => rd_addr_next0(8)
    );
\lb_rdata_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => \lb_rdata[31]_i_1_n_0\,
      D => \lb_rdata[11]_i_1_n_0\,
      Q => \lb_rdata_reg_n_0_[11]\,
      R => '0'
    );
\lb_rdata_reg[11]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \lb_rdata[11]_i_5_n_0\,
      I1 => \lb_rdata[11]_i_6_n_0\,
      O => \lb_rdata_reg[11]_i_3_n_0\,
      S => rd_addr_next0(8)
    );
\lb_rdata_reg[11]_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \lb_rdata[11]_i_7_n_0\,
      I1 => \lb_rdata[11]_i_8_n_0\,
      O => \lb_rdata_reg[11]_i_4_n_0\,
      S => rd_addr_next0(8)
    );
\lb_rdata_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => \lb_rdata[31]_i_1_n_0\,
      D => \lb_rdata[12]_i_1_n_0\,
      Q => \lb_rdata_reg_n_0_[12]\,
      R => '0'
    );
\lb_rdata_reg[12]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \lb_rdata[12]_i_5_n_0\,
      I1 => \lb_rdata[12]_i_6_n_0\,
      O => \lb_rdata_reg[12]_i_3_n_0\,
      S => rd_addr_next0(8)
    );
\lb_rdata_reg[12]_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \lb_rdata[12]_i_7_n_0\,
      I1 => \lb_rdata[12]_i_8_n_0\,
      O => \lb_rdata_reg[12]_i_4_n_0\,
      S => rd_addr_next0(8)
    );
\lb_rdata_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => \lb_rdata[31]_i_1_n_0\,
      D => \lb_rdata[13]_i_1_n_0\,
      Q => \lb_rdata_reg_n_0_[13]\,
      R => '0'
    );
\lb_rdata_reg[13]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \lb_rdata[13]_i_5_n_0\,
      I1 => \lb_rdata[13]_i_6_n_0\,
      O => \lb_rdata_reg[13]_i_3_n_0\,
      S => rd_addr_next0(8)
    );
\lb_rdata_reg[13]_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \lb_rdata[13]_i_7_n_0\,
      I1 => \lb_rdata[13]_i_8_n_0\,
      O => \lb_rdata_reg[13]_i_4_n_0\,
      S => rd_addr_next0(8)
    );
\lb_rdata_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => \lb_rdata[31]_i_1_n_0\,
      D => \lb_rdata[14]_i_1_n_0\,
      Q => \lb_rdata_reg_n_0_[14]\,
      R => '0'
    );
\lb_rdata_reg[14]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \lb_rdata[14]_i_5_n_0\,
      I1 => \lb_rdata[14]_i_6_n_0\,
      O => \lb_rdata_reg[14]_i_3_n_0\,
      S => rd_addr_next0(8)
    );
\lb_rdata_reg[14]_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \lb_rdata[14]_i_7_n_0\,
      I1 => \lb_rdata[14]_i_8_n_0\,
      O => \lb_rdata_reg[14]_i_4_n_0\,
      S => rd_addr_next0(8)
    );
\lb_rdata_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => \lb_rdata[31]_i_1_n_0\,
      D => \lb_rdata[15]_i_1_n_0\,
      Q => \lb_rdata_reg_n_0_[15]\,
      R => '0'
    );
\lb_rdata_reg[15]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \lb_rdata[15]_i_5_n_0\,
      I1 => \lb_rdata[15]_i_6_n_0\,
      O => \lb_rdata_reg[15]_i_3_n_0\,
      S => rd_addr_next0(8)
    );
\lb_rdata_reg[15]_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \lb_rdata[15]_i_7_n_0\,
      I1 => \lb_rdata[15]_i_8_n_0\,
      O => \lb_rdata_reg[15]_i_4_n_0\,
      S => rd_addr_next0(8)
    );
\lb_rdata_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => \lb_rdata[31]_i_1_n_0\,
      D => \lb_rdata[16]_i_1_n_0\,
      Q => \lb_rdata_reg_n_0_[16]\,
      R => '0'
    );
\lb_rdata_reg[16]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \lb_rdata[16]_i_5_n_0\,
      I1 => \lb_rdata[16]_i_6_n_0\,
      O => \lb_rdata_reg[16]_i_3_n_0\,
      S => rd_addr_next0(8)
    );
\lb_rdata_reg[16]_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \lb_rdata[16]_i_7_n_0\,
      I1 => \lb_rdata[16]_i_8_n_0\,
      O => \lb_rdata_reg[16]_i_4_n_0\,
      S => rd_addr_next0(8)
    );
\lb_rdata_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => \lb_rdata[31]_i_1_n_0\,
      D => \lb_rdata[17]_i_1_n_0\,
      Q => \lb_rdata_reg_n_0_[17]\,
      R => '0'
    );
\lb_rdata_reg[17]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \lb_rdata[17]_i_5_n_0\,
      I1 => \lb_rdata[17]_i_6_n_0\,
      O => \lb_rdata_reg[17]_i_3_n_0\,
      S => rd_addr_next0(8)
    );
\lb_rdata_reg[17]_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \lb_rdata[17]_i_7_n_0\,
      I1 => \lb_rdata[17]_i_8_n_0\,
      O => \lb_rdata_reg[17]_i_4_n_0\,
      S => rd_addr_next0(8)
    );
\lb_rdata_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => \lb_rdata[31]_i_1_n_0\,
      D => \lb_rdata[18]_i_1_n_0\,
      Q => \lb_rdata_reg_n_0_[18]\,
      R => '0'
    );
\lb_rdata_reg[18]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \lb_rdata[18]_i_5_n_0\,
      I1 => \lb_rdata[18]_i_6_n_0\,
      O => \lb_rdata_reg[18]_i_3_n_0\,
      S => rd_addr_next0(8)
    );
\lb_rdata_reg[18]_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \lb_rdata[18]_i_7_n_0\,
      I1 => \lb_rdata[18]_i_8_n_0\,
      O => \lb_rdata_reg[18]_i_4_n_0\,
      S => rd_addr_next0(8)
    );
\lb_rdata_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => \lb_rdata[31]_i_1_n_0\,
      D => \lb_rdata[19]_i_1_n_0\,
      Q => \lb_rdata_reg_n_0_[19]\,
      R => '0'
    );
\lb_rdata_reg[19]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \lb_rdata[19]_i_5_n_0\,
      I1 => \lb_rdata[19]_i_6_n_0\,
      O => \lb_rdata_reg[19]_i_3_n_0\,
      S => rd_addr_next0(8)
    );
\lb_rdata_reg[19]_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \lb_rdata[19]_i_7_n_0\,
      I1 => \lb_rdata[19]_i_8_n_0\,
      O => \lb_rdata_reg[19]_i_4_n_0\,
      S => rd_addr_next0(8)
    );
\lb_rdata_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => \lb_rdata[31]_i_1_n_0\,
      D => \lb_rdata[1]_i_1_n_0\,
      Q => \lb_rdata_reg_n_0_[1]\,
      R => '0'
    );
\lb_rdata_reg[1]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \lb_rdata[1]_i_5_n_0\,
      I1 => \lb_rdata[1]_i_6_n_0\,
      O => \lb_rdata_reg[1]_i_3_n_0\,
      S => rd_addr_next0(8)
    );
\lb_rdata_reg[1]_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \lb_rdata[1]_i_7_n_0\,
      I1 => \lb_rdata[1]_i_8_n_0\,
      O => \lb_rdata_reg[1]_i_4_n_0\,
      S => rd_addr_next0(8)
    );
\lb_rdata_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => \lb_rdata[31]_i_1_n_0\,
      D => \lb_rdata[20]_i_1_n_0\,
      Q => \lb_rdata_reg_n_0_[20]\,
      R => '0'
    );
\lb_rdata_reg[20]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \lb_rdata[20]_i_5_n_0\,
      I1 => \lb_rdata[20]_i_6_n_0\,
      O => \lb_rdata_reg[20]_i_3_n_0\,
      S => rd_addr_next0(8)
    );
\lb_rdata_reg[20]_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \lb_rdata[20]_i_7_n_0\,
      I1 => \lb_rdata[20]_i_8_n_0\,
      O => \lb_rdata_reg[20]_i_4_n_0\,
      S => rd_addr_next0(8)
    );
\lb_rdata_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => \lb_rdata[31]_i_1_n_0\,
      D => \lb_rdata[21]_i_1_n_0\,
      Q => \lb_rdata_reg_n_0_[21]\,
      R => '0'
    );
\lb_rdata_reg[21]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \lb_rdata[21]_i_5_n_0\,
      I1 => \lb_rdata[21]_i_6_n_0\,
      O => \lb_rdata_reg[21]_i_3_n_0\,
      S => rd_addr_next0(8)
    );
\lb_rdata_reg[21]_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \lb_rdata[21]_i_7_n_0\,
      I1 => \lb_rdata[21]_i_8_n_0\,
      O => \lb_rdata_reg[21]_i_4_n_0\,
      S => rd_addr_next0(8)
    );
\lb_rdata_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => \lb_rdata[31]_i_1_n_0\,
      D => \lb_rdata[22]_i_1_n_0\,
      Q => \lb_rdata_reg_n_0_[22]\,
      R => '0'
    );
\lb_rdata_reg[22]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \lb_rdata[22]_i_5_n_0\,
      I1 => \lb_rdata[22]_i_6_n_0\,
      O => \lb_rdata_reg[22]_i_3_n_0\,
      S => rd_addr_next0(8)
    );
\lb_rdata_reg[22]_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \lb_rdata[22]_i_7_n_0\,
      I1 => \lb_rdata[22]_i_8_n_0\,
      O => \lb_rdata_reg[22]_i_4_n_0\,
      S => rd_addr_next0(8)
    );
\lb_rdata_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => \lb_rdata[31]_i_1_n_0\,
      D => \lb_rdata[23]_i_1_n_0\,
      Q => \lb_rdata_reg_n_0_[23]\,
      R => '0'
    );
\lb_rdata_reg[23]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \lb_rdata[23]_i_5_n_0\,
      I1 => \lb_rdata[23]_i_6_n_0\,
      O => \lb_rdata_reg[23]_i_3_n_0\,
      S => rd_addr_next0(8)
    );
\lb_rdata_reg[23]_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \lb_rdata[23]_i_7_n_0\,
      I1 => \lb_rdata[23]_i_8_n_0\,
      O => \lb_rdata_reg[23]_i_4_n_0\,
      S => rd_addr_next0(8)
    );
\lb_rdata_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => \lb_rdata[31]_i_1_n_0\,
      D => \lb_rdata[24]_i_1_n_0\,
      Q => \lb_rdata_reg_n_0_[24]\,
      R => '0'
    );
\lb_rdata_reg[24]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \lb_rdata[24]_i_5_n_0\,
      I1 => \lb_rdata[24]_i_6_n_0\,
      O => \lb_rdata_reg[24]_i_3_n_0\,
      S => rd_addr_next0(8)
    );
\lb_rdata_reg[24]_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \lb_rdata[24]_i_7_n_0\,
      I1 => \lb_rdata[24]_i_8_n_0\,
      O => \lb_rdata_reg[24]_i_4_n_0\,
      S => rd_addr_next0(8)
    );
\lb_rdata_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => \lb_rdata[31]_i_1_n_0\,
      D => \lb_rdata[25]_i_1_n_0\,
      Q => \lb_rdata_reg_n_0_[25]\,
      R => '0'
    );
\lb_rdata_reg[25]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \lb_rdata[25]_i_5_n_0\,
      I1 => \lb_rdata[25]_i_6_n_0\,
      O => \lb_rdata_reg[25]_i_3_n_0\,
      S => rd_addr_next0(8)
    );
\lb_rdata_reg[25]_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \lb_rdata[25]_i_7_n_0\,
      I1 => \lb_rdata[25]_i_8_n_0\,
      O => \lb_rdata_reg[25]_i_4_n_0\,
      S => rd_addr_next0(8)
    );
\lb_rdata_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => \lb_rdata[31]_i_1_n_0\,
      D => \lb_rdata[26]_i_1_n_0\,
      Q => \lb_rdata_reg_n_0_[26]\,
      R => '0'
    );
\lb_rdata_reg[26]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \lb_rdata[26]_i_5_n_0\,
      I1 => \lb_rdata[26]_i_6_n_0\,
      O => \lb_rdata_reg[26]_i_3_n_0\,
      S => rd_addr_next0(8)
    );
\lb_rdata_reg[26]_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \lb_rdata[26]_i_7_n_0\,
      I1 => \lb_rdata[26]_i_8_n_0\,
      O => \lb_rdata_reg[26]_i_4_n_0\,
      S => rd_addr_next0(8)
    );
\lb_rdata_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => \lb_rdata[31]_i_1_n_0\,
      D => \lb_rdata[27]_i_1_n_0\,
      Q => \lb_rdata_reg_n_0_[27]\,
      R => '0'
    );
\lb_rdata_reg[27]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \lb_rdata[27]_i_5_n_0\,
      I1 => \lb_rdata[27]_i_6_n_0\,
      O => \lb_rdata_reg[27]_i_3_n_0\,
      S => rd_addr_next0(8)
    );
\lb_rdata_reg[27]_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \lb_rdata[27]_i_7_n_0\,
      I1 => \lb_rdata[27]_i_8_n_0\,
      O => \lb_rdata_reg[27]_i_4_n_0\,
      S => rd_addr_next0(8)
    );
\lb_rdata_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => \lb_rdata[31]_i_1_n_0\,
      D => \lb_rdata[28]_i_1_n_0\,
      Q => \lb_rdata_reg_n_0_[28]\,
      R => '0'
    );
\lb_rdata_reg[28]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \lb_rdata[28]_i_5_n_0\,
      I1 => \lb_rdata[28]_i_6_n_0\,
      O => \lb_rdata_reg[28]_i_3_n_0\,
      S => rd_addr_next0(8)
    );
\lb_rdata_reg[28]_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \lb_rdata[28]_i_7_n_0\,
      I1 => \lb_rdata[28]_i_8_n_0\,
      O => \lb_rdata_reg[28]_i_4_n_0\,
      S => rd_addr_next0(8)
    );
\lb_rdata_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => \lb_rdata[31]_i_1_n_0\,
      D => \lb_rdata[29]_i_1_n_0\,
      Q => \lb_rdata_reg_n_0_[29]\,
      R => '0'
    );
\lb_rdata_reg[29]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \lb_rdata[29]_i_5_n_0\,
      I1 => \lb_rdata[29]_i_6_n_0\,
      O => \lb_rdata_reg[29]_i_3_n_0\,
      S => rd_addr_next0(8)
    );
\lb_rdata_reg[29]_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \lb_rdata[29]_i_7_n_0\,
      I1 => \lb_rdata[29]_i_8_n_0\,
      O => \lb_rdata_reg[29]_i_4_n_0\,
      S => rd_addr_next0(8)
    );
\lb_rdata_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => \lb_rdata[31]_i_1_n_0\,
      D => \lb_rdata[2]_i_1_n_0\,
      Q => \lb_rdata_reg_n_0_[2]\,
      R => '0'
    );
\lb_rdata_reg[2]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \lb_rdata[2]_i_5_n_0\,
      I1 => \lb_rdata[2]_i_6_n_0\,
      O => \lb_rdata_reg[2]_i_3_n_0\,
      S => rd_addr_next0(8)
    );
\lb_rdata_reg[2]_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \lb_rdata[2]_i_7_n_0\,
      I1 => \lb_rdata[2]_i_8_n_0\,
      O => \lb_rdata_reg[2]_i_4_n_0\,
      S => rd_addr_next0(8)
    );
\lb_rdata_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => \lb_rdata[31]_i_1_n_0\,
      D => \lb_rdata[30]_i_1_n_0\,
      Q => \lb_rdata_reg_n_0_[30]\,
      R => '0'
    );
\lb_rdata_reg[30]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \lb_rdata[30]_i_5_n_0\,
      I1 => \lb_rdata[30]_i_6_n_0\,
      O => \lb_rdata_reg[30]_i_3_n_0\,
      S => rd_addr_next0(8)
    );
\lb_rdata_reg[30]_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \lb_rdata[30]_i_7_n_0\,
      I1 => \lb_rdata[30]_i_8_n_0\,
      O => \lb_rdata_reg[30]_i_4_n_0\,
      S => rd_addr_next0(8)
    );
\lb_rdata_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => \lb_rdata[31]_i_1_n_0\,
      D => \lb_rdata[31]_i_2_n_0\,
      Q => \lb_rdata_reg_n_0_[31]\,
      R => '0'
    );
\lb_rdata_reg[31]_i_5\: unisim.vcomponents.MUXF7
     port map (
      I0 => \lb_rdata[31]_i_8_n_0\,
      I1 => \lb_rdata[31]_i_9_n_0\,
      O => \lb_rdata_reg[31]_i_5_n_0\,
      S => rd_addr_next0(8)
    );
\lb_rdata_reg[31]_i_6\: unisim.vcomponents.MUXF7
     port map (
      I0 => \lb_rdata[31]_i_10_n_0\,
      I1 => \lb_rdata[31]_i_11_n_0\,
      O => \lb_rdata_reg[31]_i_6_n_0\,
      S => rd_addr_next0(8)
    );
\lb_rdata_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => \lb_rdata[31]_i_1_n_0\,
      D => \lb_rdata[3]_i_1_n_0\,
      Q => \lb_rdata_reg_n_0_[3]\,
      R => '0'
    );
\lb_rdata_reg[3]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \lb_rdata[3]_i_5_n_0\,
      I1 => \lb_rdata[3]_i_6_n_0\,
      O => \lb_rdata_reg[3]_i_3_n_0\,
      S => rd_addr_next0(8)
    );
\lb_rdata_reg[3]_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \lb_rdata[3]_i_7_n_0\,
      I1 => \lb_rdata[3]_i_8_n_0\,
      O => \lb_rdata_reg[3]_i_4_n_0\,
      S => rd_addr_next0(8)
    );
\lb_rdata_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => \lb_rdata[31]_i_1_n_0\,
      D => \lb_rdata[4]_i_1_n_0\,
      Q => \lb_rdata_reg_n_0_[4]\,
      R => '0'
    );
\lb_rdata_reg[4]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \lb_rdata[4]_i_5_n_0\,
      I1 => \lb_rdata[4]_i_6_n_0\,
      O => \lb_rdata_reg[4]_i_3_n_0\,
      S => rd_addr_next0(8)
    );
\lb_rdata_reg[4]_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \lb_rdata[4]_i_7_n_0\,
      I1 => \lb_rdata[4]_i_8_n_0\,
      O => \lb_rdata_reg[4]_i_4_n_0\,
      S => rd_addr_next0(8)
    );
\lb_rdata_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => \lb_rdata[31]_i_1_n_0\,
      D => \lb_rdata[5]_i_1_n_0\,
      Q => \lb_rdata_reg_n_0_[5]\,
      R => '0'
    );
\lb_rdata_reg[5]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \lb_rdata[5]_i_5_n_0\,
      I1 => \lb_rdata[5]_i_6_n_0\,
      O => \lb_rdata_reg[5]_i_3_n_0\,
      S => rd_addr_next0(8)
    );
\lb_rdata_reg[5]_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \lb_rdata[5]_i_7_n_0\,
      I1 => \lb_rdata[5]_i_8_n_0\,
      O => \lb_rdata_reg[5]_i_4_n_0\,
      S => rd_addr_next0(8)
    );
\lb_rdata_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => \lb_rdata[31]_i_1_n_0\,
      D => \lb_rdata[6]_i_1_n_0\,
      Q => \lb_rdata_reg_n_0_[6]\,
      R => '0'
    );
\lb_rdata_reg[6]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \lb_rdata[6]_i_5_n_0\,
      I1 => \lb_rdata[6]_i_6_n_0\,
      O => \lb_rdata_reg[6]_i_3_n_0\,
      S => rd_addr_next0(8)
    );
\lb_rdata_reg[6]_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \lb_rdata[6]_i_7_n_0\,
      I1 => \lb_rdata[6]_i_8_n_0\,
      O => \lb_rdata_reg[6]_i_4_n_0\,
      S => rd_addr_next0(8)
    );
\lb_rdata_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => \lb_rdata[31]_i_1_n_0\,
      D => \lb_rdata[7]_i_1_n_0\,
      Q => \lb_rdata_reg_n_0_[7]\,
      R => '0'
    );
\lb_rdata_reg[7]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \lb_rdata[7]_i_5_n_0\,
      I1 => \lb_rdata[7]_i_6_n_0\,
      O => \lb_rdata_reg[7]_i_3_n_0\,
      S => rd_addr_next0(8)
    );
\lb_rdata_reg[7]_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \lb_rdata[7]_i_7_n_0\,
      I1 => \lb_rdata[7]_i_8_n_0\,
      O => \lb_rdata_reg[7]_i_4_n_0\,
      S => rd_addr_next0(8)
    );
\lb_rdata_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => \lb_rdata[31]_i_1_n_0\,
      D => \lb_rdata[8]_i_1_n_0\,
      Q => \lb_rdata_reg_n_0_[8]\,
      R => '0'
    );
\lb_rdata_reg[8]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \lb_rdata[8]_i_5_n_0\,
      I1 => \lb_rdata[8]_i_6_n_0\,
      O => \lb_rdata_reg[8]_i_3_n_0\,
      S => rd_addr_next0(8)
    );
\lb_rdata_reg[8]_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \lb_rdata[8]_i_7_n_0\,
      I1 => \lb_rdata[8]_i_8_n_0\,
      O => \lb_rdata_reg[8]_i_4_n_0\,
      S => rd_addr_next0(8)
    );
\lb_rdata_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => \lb_rdata[31]_i_1_n_0\,
      D => \lb_rdata[9]_i_1_n_0\,
      Q => \lb_rdata_reg_n_0_[9]\,
      R => '0'
    );
\lb_rdata_reg[9]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \lb_rdata[9]_i_5_n_0\,
      I1 => \lb_rdata[9]_i_6_n_0\,
      O => \lb_rdata_reg[9]_i_3_n_0\,
      S => rd_addr_next0(8)
    );
\lb_rdata_reg[9]_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \lb_rdata[9]_i_7_n_0\,
      I1 => \lb_rdata[9]_i_8_n_0\,
      O => \lb_rdata_reg[9]_i_4_n_0\,
      S => rd_addr_next0(8)
    );
\lb_waddr_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => lb_waddr(0),
      D => \f_word_reg_n_0_[0]\,
      Q => \lb_waddr__0\(0),
      R => \rdata_q[31]_i_1_n_0\
    );
\lb_waddr_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => lb_waddr(0),
      D => \f_word_reg_n_0_[1]\,
      Q => \lb_waddr__0\(1),
      R => \rdata_q[31]_i_1_n_0\
    );
\lb_waddr_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => lb_waddr(0),
      D => \f_word_reg_n_0_[2]\,
      Q => \lb_waddr__0\(2),
      R => \rdata_q[31]_i_1_n_0\
    );
\lb_waddr_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => lb_waddr(0),
      D => \f_word_reg_n_0_[3]\,
      Q => \lb_waddr__0\(3),
      R => \rdata_q[31]_i_1_n_0\
    );
\lb_waddr_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => lb_waddr(0),
      D => \f_word_reg_n_0_[4]\,
      Q => \lb_waddr__0\(4),
      R => \rdata_q[31]_i_1_n_0\
    );
\lb_waddr_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => lb_waddr(0),
      D => \f_word_reg_n_0_[5]\,
      Q => \lb_waddr__0\(5),
      R => \rdata_q[31]_i_1_n_0\
    );
\lb_waddr_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => lb_waddr(0),
      D => \f_word_reg_n_0_[6]\,
      Q => \lb_waddr__0\(6),
      R => \rdata_q[31]_i_1_n_0\
    );
\lb_waddr_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => lb_waddr(0),
      D => \f_word_reg_n_0_[7]\,
      Q => \lb_waddr__0\(7),
      R => \rdata_q[31]_i_1_n_0\
    );
\lb_waddr_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => lb_waddr(0),
      D => \f_word_reg_n_0_[8]\,
      Q => \lb_waddr__0\(8),
      R => \rdata_q[31]_i_1_n_0\
    );
\lb_waddr_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => lb_waddr(0),
      D => \f_line_reg_n_0_[0]\,
      Q => \lb_waddr__0\(9),
      R => \rdata_q[31]_i_1_n_0\
    );
\lb_wdata[31]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => fstate(0),
      I1 => fstate(1),
      I2 => m_axi_hp_rvalid,
      O => lb_waddr(0)
    );
\lb_wdata_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => lb_waddr(0),
      D => m_axi_hp_rdata(0),
      Q => lb_wdata(0),
      R => \rdata_q[31]_i_1_n_0\
    );
\lb_wdata_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => lb_waddr(0),
      D => m_axi_hp_rdata(10),
      Q => lb_wdata(10),
      R => \rdata_q[31]_i_1_n_0\
    );
\lb_wdata_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => lb_waddr(0),
      D => m_axi_hp_rdata(11),
      Q => lb_wdata(11),
      R => \rdata_q[31]_i_1_n_0\
    );
\lb_wdata_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => lb_waddr(0),
      D => m_axi_hp_rdata(12),
      Q => lb_wdata(12),
      R => \rdata_q[31]_i_1_n_0\
    );
\lb_wdata_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => lb_waddr(0),
      D => m_axi_hp_rdata(13),
      Q => lb_wdata(13),
      R => \rdata_q[31]_i_1_n_0\
    );
\lb_wdata_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => lb_waddr(0),
      D => m_axi_hp_rdata(14),
      Q => lb_wdata(14),
      R => \rdata_q[31]_i_1_n_0\
    );
\lb_wdata_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => lb_waddr(0),
      D => m_axi_hp_rdata(15),
      Q => lb_wdata(15),
      R => \rdata_q[31]_i_1_n_0\
    );
\lb_wdata_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => lb_waddr(0),
      D => m_axi_hp_rdata(16),
      Q => lb_wdata(16),
      R => \rdata_q[31]_i_1_n_0\
    );
\lb_wdata_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => lb_waddr(0),
      D => m_axi_hp_rdata(17),
      Q => lb_wdata(17),
      R => \rdata_q[31]_i_1_n_0\
    );
\lb_wdata_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => lb_waddr(0),
      D => m_axi_hp_rdata(18),
      Q => lb_wdata(18),
      R => \rdata_q[31]_i_1_n_0\
    );
\lb_wdata_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => lb_waddr(0),
      D => m_axi_hp_rdata(19),
      Q => lb_wdata(19),
      R => \rdata_q[31]_i_1_n_0\
    );
\lb_wdata_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => lb_waddr(0),
      D => m_axi_hp_rdata(1),
      Q => lb_wdata(1),
      R => \rdata_q[31]_i_1_n_0\
    );
\lb_wdata_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => lb_waddr(0),
      D => m_axi_hp_rdata(20),
      Q => lb_wdata(20),
      R => \rdata_q[31]_i_1_n_0\
    );
\lb_wdata_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => lb_waddr(0),
      D => m_axi_hp_rdata(21),
      Q => lb_wdata(21),
      R => \rdata_q[31]_i_1_n_0\
    );
\lb_wdata_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => lb_waddr(0),
      D => m_axi_hp_rdata(22),
      Q => lb_wdata(22),
      R => \rdata_q[31]_i_1_n_0\
    );
\lb_wdata_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => lb_waddr(0),
      D => m_axi_hp_rdata(23),
      Q => lb_wdata(23),
      R => \rdata_q[31]_i_1_n_0\
    );
\lb_wdata_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => lb_waddr(0),
      D => m_axi_hp_rdata(24),
      Q => lb_wdata(24),
      R => \rdata_q[31]_i_1_n_0\
    );
\lb_wdata_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => lb_waddr(0),
      D => m_axi_hp_rdata(25),
      Q => lb_wdata(25),
      R => \rdata_q[31]_i_1_n_0\
    );
\lb_wdata_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => lb_waddr(0),
      D => m_axi_hp_rdata(26),
      Q => lb_wdata(26),
      R => \rdata_q[31]_i_1_n_0\
    );
\lb_wdata_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => lb_waddr(0),
      D => m_axi_hp_rdata(27),
      Q => lb_wdata(27),
      R => \rdata_q[31]_i_1_n_0\
    );
\lb_wdata_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => lb_waddr(0),
      D => m_axi_hp_rdata(28),
      Q => lb_wdata(28),
      R => \rdata_q[31]_i_1_n_0\
    );
\lb_wdata_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => lb_waddr(0),
      D => m_axi_hp_rdata(29),
      Q => lb_wdata(29),
      R => \rdata_q[31]_i_1_n_0\
    );
\lb_wdata_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => lb_waddr(0),
      D => m_axi_hp_rdata(2),
      Q => lb_wdata(2),
      R => \rdata_q[31]_i_1_n_0\
    );
\lb_wdata_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => lb_waddr(0),
      D => m_axi_hp_rdata(30),
      Q => lb_wdata(30),
      R => \rdata_q[31]_i_1_n_0\
    );
\lb_wdata_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => lb_waddr(0),
      D => m_axi_hp_rdata(31),
      Q => lb_wdata(31),
      R => \rdata_q[31]_i_1_n_0\
    );
\lb_wdata_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => lb_waddr(0),
      D => m_axi_hp_rdata(3),
      Q => lb_wdata(3),
      R => \rdata_q[31]_i_1_n_0\
    );
\lb_wdata_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => lb_waddr(0),
      D => m_axi_hp_rdata(4),
      Q => lb_wdata(4),
      R => \rdata_q[31]_i_1_n_0\
    );
\lb_wdata_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => lb_waddr(0),
      D => m_axi_hp_rdata(5),
      Q => lb_wdata(5),
      R => \rdata_q[31]_i_1_n_0\
    );
\lb_wdata_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => lb_waddr(0),
      D => m_axi_hp_rdata(6),
      Q => lb_wdata(6),
      R => \rdata_q[31]_i_1_n_0\
    );
\lb_wdata_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => lb_waddr(0),
      D => m_axi_hp_rdata(7),
      Q => lb_wdata(7),
      R => \rdata_q[31]_i_1_n_0\
    );
\lb_wdata_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => lb_waddr(0),
      D => m_axi_hp_rdata(8),
      Q => lb_wdata(8),
      R => \rdata_q[31]_i_1_n_0\
    );
\lb_wdata_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => lb_waddr(0),
      D => m_axi_hp_rdata(9),
      Q => lb_wdata(9),
      R => \rdata_q[31]_i_1_n_0\
    );
lb_we_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => lb_waddr(0),
      Q => lb_we,
      R => \rdata_q[31]_i_1_n_0\
    );
\line_req_num[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F20"
    )
        port map (
      I0 => \vcnt[9]_i_5_n_0\,
      I1 => rd_addr_next(9),
      I2 => line_req_tgl0,
      I3 => line_req_num(0),
      O => \line_req_num[0]_i_1_n_0\
    );
\line_req_num_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => \line_req_num[0]_i_1_n_0\,
      Q => line_req_num(0),
      R => \vcnt[9]_i_1_n_0\
    );
line_req_tgl_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => line_req_tgl0,
      I1 => line_req_tgl,
      O => line_req_tgl_i_1_n_0
    );
line_req_tgl_reg: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => line_req_tgl_i_1_n_0,
      Q => line_req_tgl,
      R => \vcnt[9]_i_1_n_0\
    );
linebuf_reg_r1_0_63_0_2: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => B"000000",
      ADDRB(5 downto 0) => B"000000",
      ADDRC(5 downto 0) => B"000000",
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(0),
      DIB => lb_wdata(1),
      DIC => lb_wdata(2),
      DID => '0',
      DOA => linebuf_reg_r1_0_63_0_2_n_0,
      DOB => linebuf_reg_r1_0_63_0_2_n_1,
      DOC => linebuf_reg_r1_0_63_0_2_n_2,
      DOD => NLW_linebuf_reg_r1_0_63_0_2_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r1_0_63_0_2_i_1_n_0
    );
linebuf_reg_r1_0_63_0_2_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000002"
    )
        port map (
      I0 => lb_we,
      I1 => \lb_waddr__0\(7),
      I2 => \lb_waddr__0\(6),
      I3 => \lb_waddr__0\(9),
      I4 => \lb_waddr__0\(8),
      O => linebuf_reg_r1_0_63_0_2_i_1_n_0
    );
linebuf_reg_r1_0_63_12_14: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => B"000000",
      ADDRB(5 downto 0) => B"000000",
      ADDRC(5 downto 0) => B"000000",
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(12),
      DIB => lb_wdata(13),
      DIC => lb_wdata(14),
      DID => '0',
      DOA => linebuf_reg_r1_0_63_12_14_n_0,
      DOB => linebuf_reg_r1_0_63_12_14_n_1,
      DOC => linebuf_reg_r1_0_63_12_14_n_2,
      DOD => NLW_linebuf_reg_r1_0_63_12_14_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r1_0_63_0_2_i_1_n_0
    );
linebuf_reg_r1_0_63_15_17: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => B"000000",
      ADDRB(5 downto 0) => B"000000",
      ADDRC(5 downto 0) => B"000000",
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(15),
      DIB => lb_wdata(16),
      DIC => lb_wdata(17),
      DID => '0',
      DOA => linebuf_reg_r1_0_63_15_17_n_0,
      DOB => linebuf_reg_r1_0_63_15_17_n_1,
      DOC => linebuf_reg_r1_0_63_15_17_n_2,
      DOD => NLW_linebuf_reg_r1_0_63_15_17_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r1_0_63_0_2_i_1_n_0
    );
linebuf_reg_r1_0_63_18_20: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => B"000000",
      ADDRB(5 downto 0) => B"000000",
      ADDRC(5 downto 0) => B"000000",
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(18),
      DIB => lb_wdata(19),
      DIC => lb_wdata(20),
      DID => '0',
      DOA => linebuf_reg_r1_0_63_18_20_n_0,
      DOB => linebuf_reg_r1_0_63_18_20_n_1,
      DOC => linebuf_reg_r1_0_63_18_20_n_2,
      DOD => NLW_linebuf_reg_r1_0_63_18_20_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r1_0_63_0_2_i_1_n_0
    );
linebuf_reg_r1_0_63_21_23: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => B"000000",
      ADDRB(5 downto 0) => B"000000",
      ADDRC(5 downto 0) => B"000000",
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(21),
      DIB => lb_wdata(22),
      DIC => lb_wdata(23),
      DID => '0',
      DOA => linebuf_reg_r1_0_63_21_23_n_0,
      DOB => linebuf_reg_r1_0_63_21_23_n_1,
      DOC => linebuf_reg_r1_0_63_21_23_n_2,
      DOD => NLW_linebuf_reg_r1_0_63_21_23_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r1_0_63_0_2_i_1_n_0
    );
linebuf_reg_r1_0_63_24_26: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => B"000000",
      ADDRB(5 downto 0) => B"000000",
      ADDRC(5 downto 0) => B"000000",
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(24),
      DIB => lb_wdata(25),
      DIC => lb_wdata(26),
      DID => '0',
      DOA => linebuf_reg_r1_0_63_24_26_n_0,
      DOB => linebuf_reg_r1_0_63_24_26_n_1,
      DOC => linebuf_reg_r1_0_63_24_26_n_2,
      DOD => NLW_linebuf_reg_r1_0_63_24_26_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r1_0_63_0_2_i_1_n_0
    );
linebuf_reg_r1_0_63_27_29: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => B"000000",
      ADDRB(5 downto 0) => B"000000",
      ADDRC(5 downto 0) => B"000000",
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(27),
      DIB => lb_wdata(28),
      DIC => lb_wdata(29),
      DID => '0',
      DOA => linebuf_reg_r1_0_63_27_29_n_0,
      DOB => linebuf_reg_r1_0_63_27_29_n_1,
      DOC => linebuf_reg_r1_0_63_27_29_n_2,
      DOD => NLW_linebuf_reg_r1_0_63_27_29_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r1_0_63_0_2_i_1_n_0
    );
linebuf_reg_r1_0_63_30_31: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => B"000000",
      ADDRB(5 downto 0) => B"000000",
      ADDRC(5 downto 0) => B"000000",
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(30),
      DIB => lb_wdata(31),
      DIC => '0',
      DID => '0',
      DOA => linebuf_reg_r1_0_63_30_31_n_0,
      DOB => linebuf_reg_r1_0_63_30_31_n_1,
      DOC => NLW_linebuf_reg_r1_0_63_30_31_DOC_UNCONNECTED,
      DOD => NLW_linebuf_reg_r1_0_63_30_31_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r1_0_63_0_2_i_1_n_0
    );
linebuf_reg_r1_0_63_3_5: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => B"000000",
      ADDRB(5 downto 0) => B"000000",
      ADDRC(5 downto 0) => B"000000",
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(3),
      DIB => lb_wdata(4),
      DIC => lb_wdata(5),
      DID => '0',
      DOA => linebuf_reg_r1_0_63_3_5_n_0,
      DOB => linebuf_reg_r1_0_63_3_5_n_1,
      DOC => linebuf_reg_r1_0_63_3_5_n_2,
      DOD => NLW_linebuf_reg_r1_0_63_3_5_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r1_0_63_0_2_i_1_n_0
    );
linebuf_reg_r1_0_63_6_8: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => B"000000",
      ADDRB(5 downto 0) => B"000000",
      ADDRC(5 downto 0) => B"000000",
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(6),
      DIB => lb_wdata(7),
      DIC => lb_wdata(8),
      DID => '0',
      DOA => linebuf_reg_r1_0_63_6_8_n_0,
      DOB => linebuf_reg_r1_0_63_6_8_n_1,
      DOC => linebuf_reg_r1_0_63_6_8_n_2,
      DOD => NLW_linebuf_reg_r1_0_63_6_8_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r1_0_63_0_2_i_1_n_0
    );
linebuf_reg_r1_0_63_9_11: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => B"000000",
      ADDRB(5 downto 0) => B"000000",
      ADDRC(5 downto 0) => B"000000",
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(9),
      DIB => lb_wdata(10),
      DIC => lb_wdata(11),
      DID => '0',
      DOA => linebuf_reg_r1_0_63_9_11_n_0,
      DOB => linebuf_reg_r1_0_63_9_11_n_1,
      DOC => linebuf_reg_r1_0_63_9_11_n_2,
      DOD => NLW_linebuf_reg_r1_0_63_9_11_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r1_0_63_0_2_i_1_n_0
    );
linebuf_reg_r1_512_575_0_2: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => B"000000",
      ADDRB(5 downto 0) => B"000000",
      ADDRC(5 downto 0) => B"000000",
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(0),
      DIB => lb_wdata(1),
      DIC => lb_wdata(2),
      DID => '0',
      DOA => linebuf_reg_r1_512_575_0_2_n_0,
      DOB => linebuf_reg_r1_512_575_0_2_n_1,
      DOC => linebuf_reg_r1_512_575_0_2_n_2,
      DOD => NLW_linebuf_reg_r1_512_575_0_2_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r1_512_575_0_2_i_1_n_0
    );
linebuf_reg_r1_512_575_0_2_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00020000"
    )
        port map (
      I0 => lb_we,
      I1 => \lb_waddr__0\(7),
      I2 => \lb_waddr__0\(6),
      I3 => \lb_waddr__0\(8),
      I4 => \lb_waddr__0\(9),
      O => linebuf_reg_r1_512_575_0_2_i_1_n_0
    );
linebuf_reg_r1_512_575_12_14: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => B"000000",
      ADDRB(5 downto 0) => B"000000",
      ADDRC(5 downto 0) => B"000000",
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(12),
      DIB => lb_wdata(13),
      DIC => lb_wdata(14),
      DID => '0',
      DOA => linebuf_reg_r1_512_575_12_14_n_0,
      DOB => linebuf_reg_r1_512_575_12_14_n_1,
      DOC => linebuf_reg_r1_512_575_12_14_n_2,
      DOD => NLW_linebuf_reg_r1_512_575_12_14_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r1_512_575_0_2_i_1_n_0
    );
linebuf_reg_r1_512_575_15_17: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => B"000000",
      ADDRB(5 downto 0) => B"000000",
      ADDRC(5 downto 0) => B"000000",
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(15),
      DIB => lb_wdata(16),
      DIC => lb_wdata(17),
      DID => '0',
      DOA => linebuf_reg_r1_512_575_15_17_n_0,
      DOB => linebuf_reg_r1_512_575_15_17_n_1,
      DOC => linebuf_reg_r1_512_575_15_17_n_2,
      DOD => NLW_linebuf_reg_r1_512_575_15_17_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r1_512_575_0_2_i_1_n_0
    );
linebuf_reg_r1_512_575_18_20: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => B"000000",
      ADDRB(5 downto 0) => B"000000",
      ADDRC(5 downto 0) => B"000000",
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(18),
      DIB => lb_wdata(19),
      DIC => lb_wdata(20),
      DID => '0',
      DOA => linebuf_reg_r1_512_575_18_20_n_0,
      DOB => linebuf_reg_r1_512_575_18_20_n_1,
      DOC => linebuf_reg_r1_512_575_18_20_n_2,
      DOD => NLW_linebuf_reg_r1_512_575_18_20_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r1_512_575_0_2_i_1_n_0
    );
linebuf_reg_r1_512_575_21_23: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => B"000000",
      ADDRB(5 downto 0) => B"000000",
      ADDRC(5 downto 0) => B"000000",
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(21),
      DIB => lb_wdata(22),
      DIC => lb_wdata(23),
      DID => '0',
      DOA => linebuf_reg_r1_512_575_21_23_n_0,
      DOB => linebuf_reg_r1_512_575_21_23_n_1,
      DOC => linebuf_reg_r1_512_575_21_23_n_2,
      DOD => NLW_linebuf_reg_r1_512_575_21_23_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r1_512_575_0_2_i_1_n_0
    );
linebuf_reg_r1_512_575_24_26: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => B"000000",
      ADDRB(5 downto 0) => B"000000",
      ADDRC(5 downto 0) => B"000000",
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(24),
      DIB => lb_wdata(25),
      DIC => lb_wdata(26),
      DID => '0',
      DOA => linebuf_reg_r1_512_575_24_26_n_0,
      DOB => linebuf_reg_r1_512_575_24_26_n_1,
      DOC => linebuf_reg_r1_512_575_24_26_n_2,
      DOD => NLW_linebuf_reg_r1_512_575_24_26_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r1_512_575_0_2_i_1_n_0
    );
linebuf_reg_r1_512_575_27_29: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => B"000000",
      ADDRB(5 downto 0) => B"000000",
      ADDRC(5 downto 0) => B"000000",
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(27),
      DIB => lb_wdata(28),
      DIC => lb_wdata(29),
      DID => '0',
      DOA => linebuf_reg_r1_512_575_27_29_n_0,
      DOB => linebuf_reg_r1_512_575_27_29_n_1,
      DOC => linebuf_reg_r1_512_575_27_29_n_2,
      DOD => NLW_linebuf_reg_r1_512_575_27_29_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r1_512_575_0_2_i_1_n_0
    );
linebuf_reg_r1_512_575_30_31: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => B"000000",
      ADDRB(5 downto 0) => B"000000",
      ADDRC(5 downto 0) => B"000000",
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(30),
      DIB => lb_wdata(31),
      DIC => '0',
      DID => '0',
      DOA => linebuf_reg_r1_512_575_30_31_n_0,
      DOB => linebuf_reg_r1_512_575_30_31_n_1,
      DOC => NLW_linebuf_reg_r1_512_575_30_31_DOC_UNCONNECTED,
      DOD => NLW_linebuf_reg_r1_512_575_30_31_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r1_512_575_0_2_i_1_n_0
    );
linebuf_reg_r1_512_575_3_5: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => B"000000",
      ADDRB(5 downto 0) => B"000000",
      ADDRC(5 downto 0) => B"000000",
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(3),
      DIB => lb_wdata(4),
      DIC => lb_wdata(5),
      DID => '0',
      DOA => linebuf_reg_r1_512_575_3_5_n_0,
      DOB => linebuf_reg_r1_512_575_3_5_n_1,
      DOC => linebuf_reg_r1_512_575_3_5_n_2,
      DOD => NLW_linebuf_reg_r1_512_575_3_5_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r1_512_575_0_2_i_1_n_0
    );
linebuf_reg_r1_512_575_6_8: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => B"000000",
      ADDRB(5 downto 0) => B"000000",
      ADDRC(5 downto 0) => B"000000",
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(6),
      DIB => lb_wdata(7),
      DIC => lb_wdata(8),
      DID => '0',
      DOA => linebuf_reg_r1_512_575_6_8_n_0,
      DOB => linebuf_reg_r1_512_575_6_8_n_1,
      DOC => linebuf_reg_r1_512_575_6_8_n_2,
      DOD => NLW_linebuf_reg_r1_512_575_6_8_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r1_512_575_0_2_i_1_n_0
    );
linebuf_reg_r1_512_575_9_11: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => B"000000",
      ADDRB(5 downto 0) => B"000000",
      ADDRC(5 downto 0) => B"000000",
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(9),
      DIB => lb_wdata(10),
      DIC => lb_wdata(11),
      DID => '0',
      DOA => linebuf_reg_r1_512_575_9_11_n_0,
      DOB => linebuf_reg_r1_512_575_9_11_n_1,
      DOC => linebuf_reg_r1_512_575_9_11_n_2,
      DOD => NLW_linebuf_reg_r1_512_575_9_11_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r1_512_575_0_2_i_1_n_0
    );
linebuf_reg_r2_0_63_0_2: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRA(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRA(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRB(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRB(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRB(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRC(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRC(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRC(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(0),
      DIB => lb_wdata(1),
      DIC => lb_wdata(2),
      DID => '0',
      DOA => linebuf_reg_r2_0_63_0_2_n_0,
      DOB => linebuf_reg_r2_0_63_0_2_n_1,
      DOC => linebuf_reg_r2_0_63_0_2_n_2,
      DOD => NLW_linebuf_reg_r2_0_63_0_2_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r1_0_63_0_2_i_1_n_0
    );
linebuf_reg_r2_0_63_0_2_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => p_0_in_2(5),
      I1 => p_0_in_2(3),
      I2 => p_0_in_2(4),
      I3 => p_0_in_2(1),
      I4 => p_0_in_2(0),
      I5 => p_0_in_2(2),
      O => rd_addr_next0(5)
    );
linebuf_reg_r2_0_63_0_2_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => p_0_in_2(4),
      I1 => p_0_in_2(1),
      I2 => p_0_in_2(0),
      I3 => p_0_in_2(2),
      I4 => p_0_in_2(3),
      O => rd_addr_next0(4)
    );
linebuf_reg_r2_0_63_0_2_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => p_0_in_2(3),
      I1 => p_0_in_2(2),
      I2 => p_0_in_2(0),
      I3 => p_0_in_2(1),
      O => linebuf_reg_r2_0_63_0_2_i_3_n_0
    );
linebuf_reg_r2_0_63_0_2_i_4: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => p_0_in_2(2),
      I1 => p_0_in_2(0),
      I2 => p_0_in_2(1),
      O => rd_addr_next0(2)
    );
linebuf_reg_r2_0_63_0_2_i_5: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => p_0_in_2(0),
      I1 => p_0_in_2(1),
      O => rd_addr_next0(1)
    );
linebuf_reg_r2_0_63_0_2_i_6: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_0_in_2(0),
      O => rd_addr_next0(0)
    );
linebuf_reg_r2_0_63_12_14: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(12),
      DIB => lb_wdata(13),
      DIC => lb_wdata(14),
      DID => '0',
      DOA => linebuf_reg_r2_0_63_12_14_n_0,
      DOB => linebuf_reg_r2_0_63_12_14_n_1,
      DOC => linebuf_reg_r2_0_63_12_14_n_2,
      DOD => NLW_linebuf_reg_r2_0_63_12_14_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r1_0_63_0_2_i_1_n_0
    );
linebuf_reg_r2_0_63_15_17: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(15),
      DIB => lb_wdata(16),
      DIC => lb_wdata(17),
      DID => '0',
      DOA => linebuf_reg_r2_0_63_15_17_n_0,
      DOB => linebuf_reg_r2_0_63_15_17_n_1,
      DOC => linebuf_reg_r2_0_63_15_17_n_2,
      DOD => NLW_linebuf_reg_r2_0_63_15_17_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r1_0_63_0_2_i_1_n_0
    );
linebuf_reg_r2_0_63_15_17_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => p_0_in_2(3),
      I1 => p_0_in_2(2),
      I2 => p_0_in_2(0),
      I3 => p_0_in_2(1),
      O => linebuf_reg_r2_0_63_15_17_i_1_n_0
    );
linebuf_reg_r2_0_63_18_20: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(18),
      DIB => lb_wdata(19),
      DIC => lb_wdata(20),
      DID => '0',
      DOA => linebuf_reg_r2_0_63_18_20_n_0,
      DOB => linebuf_reg_r2_0_63_18_20_n_1,
      DOC => linebuf_reg_r2_0_63_18_20_n_2,
      DOD => NLW_linebuf_reg_r2_0_63_18_20_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r1_0_63_0_2_i_1_n_0
    );
linebuf_reg_r2_0_63_18_20_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => p_0_in_2(5),
      I1 => p_0_in_2(3),
      I2 => p_0_in_2(4),
      I3 => p_0_in_2(1),
      I4 => p_0_in_2(0),
      I5 => p_0_in_2(2),
      O => linebuf_reg_r2_0_63_18_20_i_1_n_0
    );
linebuf_reg_r2_0_63_18_20_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => p_0_in_2(4),
      I1 => p_0_in_2(1),
      I2 => p_0_in_2(0),
      I3 => p_0_in_2(2),
      I4 => p_0_in_2(3),
      O => linebuf_reg_r2_0_63_18_20_i_2_n_0
    );
linebuf_reg_r2_0_63_18_20_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => p_0_in_2(2),
      I1 => p_0_in_2(0),
      I2 => p_0_in_2(1),
      O => linebuf_reg_r2_0_63_18_20_i_3_n_0
    );
linebuf_reg_r2_0_63_18_20_i_4: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => p_0_in_2(0),
      I1 => p_0_in_2(1),
      O => linebuf_reg_r2_0_63_18_20_i_4_n_0
    );
linebuf_reg_r2_0_63_18_20_i_5: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_0_in_2(0),
      O => linebuf_reg_r2_0_63_18_20_i_5_n_0
    );
linebuf_reg_r2_0_63_21_23: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(21),
      DIB => lb_wdata(22),
      DIC => lb_wdata(23),
      DID => '0',
      DOA => linebuf_reg_r2_0_63_21_23_n_0,
      DOB => linebuf_reg_r2_0_63_21_23_n_1,
      DOC => linebuf_reg_r2_0_63_21_23_n_2,
      DOD => NLW_linebuf_reg_r2_0_63_21_23_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r1_0_63_0_2_i_1_n_0
    );
linebuf_reg_r2_0_63_24_26: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(24),
      DIB => lb_wdata(25),
      DIC => lb_wdata(26),
      DID => '0',
      DOA => linebuf_reg_r2_0_63_24_26_n_0,
      DOB => linebuf_reg_r2_0_63_24_26_n_1,
      DOC => linebuf_reg_r2_0_63_24_26_n_2,
      DOD => NLW_linebuf_reg_r2_0_63_24_26_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r1_0_63_0_2_i_1_n_0
    );
linebuf_reg_r2_0_63_24_26_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => p_0_in_2(3),
      I1 => p_0_in_2(2),
      I2 => p_0_in_2(0),
      I3 => p_0_in_2(1),
      O => linebuf_reg_r2_0_63_24_26_i_1_n_0
    );
linebuf_reg_r2_0_63_27_29: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(27),
      DIB => lb_wdata(28),
      DIC => lb_wdata(29),
      DID => '0',
      DOA => linebuf_reg_r2_0_63_27_29_n_0,
      DOB => linebuf_reg_r2_0_63_27_29_n_1,
      DOC => linebuf_reg_r2_0_63_27_29_n_2,
      DOD => NLW_linebuf_reg_r2_0_63_27_29_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r1_0_63_0_2_i_1_n_0
    );
linebuf_reg_r2_0_63_27_29_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => p_0_in_2(5),
      I1 => p_0_in_2(3),
      I2 => p_0_in_2(4),
      I3 => p_0_in_2(1),
      I4 => p_0_in_2(0),
      I5 => p_0_in_2(2),
      O => linebuf_reg_r2_0_63_27_29_i_1_n_0
    );
linebuf_reg_r2_0_63_27_29_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => p_0_in_2(4),
      I1 => p_0_in_2(1),
      I2 => p_0_in_2(0),
      I3 => p_0_in_2(2),
      I4 => p_0_in_2(3),
      O => linebuf_reg_r2_0_63_27_29_i_2_n_0
    );
linebuf_reg_r2_0_63_27_29_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => p_0_in_2(2),
      I1 => p_0_in_2(0),
      I2 => p_0_in_2(1),
      O => linebuf_reg_r2_0_63_27_29_i_3_n_0
    );
linebuf_reg_r2_0_63_27_29_i_4: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => p_0_in_2(0),
      I1 => p_0_in_2(1),
      O => linebuf_reg_r2_0_63_27_29_i_4_n_0
    );
linebuf_reg_r2_0_63_27_29_i_5: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_0_in_2(0),
      O => linebuf_reg_r2_0_63_27_29_i_5_n_0
    );
linebuf_reg_r2_0_63_30_31: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(30),
      DIB => lb_wdata(31),
      DIC => '0',
      DID => '0',
      DOA => linebuf_reg_r2_0_63_30_31_n_0,
      DOB => linebuf_reg_r2_0_63_30_31_n_1,
      DOC => NLW_linebuf_reg_r2_0_63_30_31_DOC_UNCONNECTED,
      DOD => NLW_linebuf_reg_r2_0_63_30_31_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r1_0_63_0_2_i_1_n_0
    );
linebuf_reg_r2_0_63_3_5: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRA(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRA(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRB(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRB(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRB(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRC(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRC(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRC(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(3),
      DIB => lb_wdata(4),
      DIC => lb_wdata(5),
      DID => '0',
      DOA => linebuf_reg_r2_0_63_3_5_n_0,
      DOB => linebuf_reg_r2_0_63_3_5_n_1,
      DOC => linebuf_reg_r2_0_63_3_5_n_2,
      DOD => NLW_linebuf_reg_r2_0_63_3_5_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r1_0_63_0_2_i_1_n_0
    );
linebuf_reg_r2_0_63_6_8: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRA(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRA(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRB(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRB(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRB(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRC(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRC(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRC(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(6),
      DIB => lb_wdata(7),
      DIC => lb_wdata(8),
      DID => '0',
      DOA => linebuf_reg_r2_0_63_6_8_n_0,
      DOB => linebuf_reg_r2_0_63_6_8_n_1,
      DOC => linebuf_reg_r2_0_63_6_8_n_2,
      DOD => NLW_linebuf_reg_r2_0_63_6_8_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r1_0_63_0_2_i_1_n_0
    );
linebuf_reg_r2_0_63_6_8_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => p_0_in_2(3),
      I1 => p_0_in_2(2),
      I2 => p_0_in_2(0),
      I3 => p_0_in_2(1),
      O => linebuf_reg_r2_0_63_6_8_i_1_n_0
    );
linebuf_reg_r2_0_63_9_11: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(9),
      DIB => lb_wdata(10),
      DIC => lb_wdata(11),
      DID => '0',
      DOA => linebuf_reg_r2_0_63_9_11_n_0,
      DOB => linebuf_reg_r2_0_63_9_11_n_1,
      DOC => linebuf_reg_r2_0_63_9_11_n_2,
      DOD => NLW_linebuf_reg_r2_0_63_9_11_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r1_0_63_0_2_i_1_n_0
    );
linebuf_reg_r2_0_63_9_11_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => p_0_in_2(5),
      I1 => p_0_in_2(3),
      I2 => p_0_in_2(4),
      I3 => p_0_in_2(1),
      I4 => p_0_in_2(0),
      I5 => p_0_in_2(2),
      O => linebuf_reg_r2_0_63_9_11_i_1_n_0
    );
linebuf_reg_r2_0_63_9_11_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => p_0_in_2(4),
      I1 => p_0_in_2(1),
      I2 => p_0_in_2(0),
      I3 => p_0_in_2(2),
      I4 => p_0_in_2(3),
      O => linebuf_reg_r2_0_63_9_11_i_2_n_0
    );
linebuf_reg_r2_0_63_9_11_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => p_0_in_2(2),
      I1 => p_0_in_2(0),
      I2 => p_0_in_2(1),
      O => linebuf_reg_r2_0_63_9_11_i_3_n_0
    );
linebuf_reg_r2_0_63_9_11_i_4: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => p_0_in_2(0),
      I1 => p_0_in_2(1),
      O => linebuf_reg_r2_0_63_9_11_i_4_n_0
    );
linebuf_reg_r2_0_63_9_11_i_5: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_0_in_2(0),
      O => linebuf_reg_r2_0_63_9_11_i_5_n_0
    );
linebuf_reg_r2_128_191_0_2: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRA(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRA(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRB(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRB(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRB(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRC(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRC(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRC(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(0),
      DIB => lb_wdata(1),
      DIC => lb_wdata(2),
      DID => '0',
      DOA => linebuf_reg_r2_128_191_0_2_n_0,
      DOB => linebuf_reg_r2_128_191_0_2_n_1,
      DOC => linebuf_reg_r2_128_191_0_2_n_2,
      DOD => NLW_linebuf_reg_r2_128_191_0_2_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_128_191_0_2_i_1_n_0
    );
linebuf_reg_r2_128_191_0_2_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00020000"
    )
        port map (
      I0 => lb_we,
      I1 => \lb_waddr__0\(8),
      I2 => \lb_waddr__0\(6),
      I3 => \lb_waddr__0\(9),
      I4 => \lb_waddr__0\(7),
      O => linebuf_reg_r2_128_191_0_2_i_1_n_0
    );
linebuf_reg_r2_128_191_12_14: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(12),
      DIB => lb_wdata(13),
      DIC => lb_wdata(14),
      DID => '0',
      DOA => linebuf_reg_r2_128_191_12_14_n_0,
      DOB => linebuf_reg_r2_128_191_12_14_n_1,
      DOC => linebuf_reg_r2_128_191_12_14_n_2,
      DOD => NLW_linebuf_reg_r2_128_191_12_14_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_128_191_0_2_i_1_n_0
    );
linebuf_reg_r2_128_191_15_17: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(15),
      DIB => lb_wdata(16),
      DIC => lb_wdata(17),
      DID => '0',
      DOA => linebuf_reg_r2_128_191_15_17_n_0,
      DOB => linebuf_reg_r2_128_191_15_17_n_1,
      DOC => linebuf_reg_r2_128_191_15_17_n_2,
      DOD => NLW_linebuf_reg_r2_128_191_15_17_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_128_191_0_2_i_1_n_0
    );
linebuf_reg_r2_128_191_18_20: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(18),
      DIB => lb_wdata(19),
      DIC => lb_wdata(20),
      DID => '0',
      DOA => linebuf_reg_r2_128_191_18_20_n_0,
      DOB => linebuf_reg_r2_128_191_18_20_n_1,
      DOC => linebuf_reg_r2_128_191_18_20_n_2,
      DOD => NLW_linebuf_reg_r2_128_191_18_20_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_128_191_0_2_i_1_n_0
    );
linebuf_reg_r2_128_191_21_23: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(21),
      DIB => lb_wdata(22),
      DIC => lb_wdata(23),
      DID => '0',
      DOA => linebuf_reg_r2_128_191_21_23_n_0,
      DOB => linebuf_reg_r2_128_191_21_23_n_1,
      DOC => linebuf_reg_r2_128_191_21_23_n_2,
      DOD => NLW_linebuf_reg_r2_128_191_21_23_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_128_191_0_2_i_1_n_0
    );
linebuf_reg_r2_128_191_24_26: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(24),
      DIB => lb_wdata(25),
      DIC => lb_wdata(26),
      DID => '0',
      DOA => linebuf_reg_r2_128_191_24_26_n_0,
      DOB => linebuf_reg_r2_128_191_24_26_n_1,
      DOC => linebuf_reg_r2_128_191_24_26_n_2,
      DOD => NLW_linebuf_reg_r2_128_191_24_26_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_128_191_0_2_i_1_n_0
    );
linebuf_reg_r2_128_191_27_29: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(27),
      DIB => lb_wdata(28),
      DIC => lb_wdata(29),
      DID => '0',
      DOA => linebuf_reg_r2_128_191_27_29_n_0,
      DOB => linebuf_reg_r2_128_191_27_29_n_1,
      DOC => linebuf_reg_r2_128_191_27_29_n_2,
      DOD => NLW_linebuf_reg_r2_128_191_27_29_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_128_191_0_2_i_1_n_0
    );
linebuf_reg_r2_128_191_30_31: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(30),
      DIB => lb_wdata(31),
      DIC => '0',
      DID => '0',
      DOA => linebuf_reg_r2_128_191_30_31_n_0,
      DOB => linebuf_reg_r2_128_191_30_31_n_1,
      DOC => NLW_linebuf_reg_r2_128_191_30_31_DOC_UNCONNECTED,
      DOD => NLW_linebuf_reg_r2_128_191_30_31_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_128_191_0_2_i_1_n_0
    );
linebuf_reg_r2_128_191_3_5: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRA(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRA(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRB(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRB(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRB(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRC(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRC(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRC(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(3),
      DIB => lb_wdata(4),
      DIC => lb_wdata(5),
      DID => '0',
      DOA => linebuf_reg_r2_128_191_3_5_n_0,
      DOB => linebuf_reg_r2_128_191_3_5_n_1,
      DOC => linebuf_reg_r2_128_191_3_5_n_2,
      DOD => NLW_linebuf_reg_r2_128_191_3_5_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_128_191_0_2_i_1_n_0
    );
linebuf_reg_r2_128_191_6_8: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRA(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRA(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRB(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRB(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRB(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRC(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRC(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRC(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(6),
      DIB => lb_wdata(7),
      DIC => lb_wdata(8),
      DID => '0',
      DOA => linebuf_reg_r2_128_191_6_8_n_0,
      DOB => linebuf_reg_r2_128_191_6_8_n_1,
      DOC => linebuf_reg_r2_128_191_6_8_n_2,
      DOD => NLW_linebuf_reg_r2_128_191_6_8_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_128_191_0_2_i_1_n_0
    );
linebuf_reg_r2_128_191_9_11: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(9),
      DIB => lb_wdata(10),
      DIC => lb_wdata(11),
      DID => '0',
      DOA => linebuf_reg_r2_128_191_9_11_n_0,
      DOB => linebuf_reg_r2_128_191_9_11_n_1,
      DOC => linebuf_reg_r2_128_191_9_11_n_2,
      DOD => NLW_linebuf_reg_r2_128_191_9_11_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_128_191_0_2_i_1_n_0
    );
linebuf_reg_r2_192_255_0_2: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRA(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRA(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRB(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRB(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRB(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRC(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRC(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRC(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(0),
      DIB => lb_wdata(1),
      DIC => lb_wdata(2),
      DID => '0',
      DOA => linebuf_reg_r2_192_255_0_2_n_0,
      DOB => linebuf_reg_r2_192_255_0_2_n_1,
      DOC => linebuf_reg_r2_192_255_0_2_n_2,
      DOD => NLW_linebuf_reg_r2_192_255_0_2_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_192_255_0_2_i_1_n_0
    );
linebuf_reg_r2_192_255_0_2_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00400000"
    )
        port map (
      I0 => \lb_waddr__0\(9),
      I1 => \lb_waddr__0\(7),
      I2 => \lb_waddr__0\(6),
      I3 => \lb_waddr__0\(8),
      I4 => lb_we,
      O => linebuf_reg_r2_192_255_0_2_i_1_n_0
    );
linebuf_reg_r2_192_255_12_14: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(12),
      DIB => lb_wdata(13),
      DIC => lb_wdata(14),
      DID => '0',
      DOA => linebuf_reg_r2_192_255_12_14_n_0,
      DOB => linebuf_reg_r2_192_255_12_14_n_1,
      DOC => linebuf_reg_r2_192_255_12_14_n_2,
      DOD => NLW_linebuf_reg_r2_192_255_12_14_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_192_255_0_2_i_1_n_0
    );
linebuf_reg_r2_192_255_15_17: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(15),
      DIB => lb_wdata(16),
      DIC => lb_wdata(17),
      DID => '0',
      DOA => linebuf_reg_r2_192_255_15_17_n_0,
      DOB => linebuf_reg_r2_192_255_15_17_n_1,
      DOC => linebuf_reg_r2_192_255_15_17_n_2,
      DOD => NLW_linebuf_reg_r2_192_255_15_17_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_192_255_0_2_i_1_n_0
    );
linebuf_reg_r2_192_255_18_20: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(18),
      DIB => lb_wdata(19),
      DIC => lb_wdata(20),
      DID => '0',
      DOA => linebuf_reg_r2_192_255_18_20_n_0,
      DOB => linebuf_reg_r2_192_255_18_20_n_1,
      DOC => linebuf_reg_r2_192_255_18_20_n_2,
      DOD => NLW_linebuf_reg_r2_192_255_18_20_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_192_255_0_2_i_1_n_0
    );
linebuf_reg_r2_192_255_21_23: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(21),
      DIB => lb_wdata(22),
      DIC => lb_wdata(23),
      DID => '0',
      DOA => linebuf_reg_r2_192_255_21_23_n_0,
      DOB => linebuf_reg_r2_192_255_21_23_n_1,
      DOC => linebuf_reg_r2_192_255_21_23_n_2,
      DOD => NLW_linebuf_reg_r2_192_255_21_23_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_192_255_0_2_i_1_n_0
    );
linebuf_reg_r2_192_255_24_26: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(24),
      DIB => lb_wdata(25),
      DIC => lb_wdata(26),
      DID => '0',
      DOA => linebuf_reg_r2_192_255_24_26_n_0,
      DOB => linebuf_reg_r2_192_255_24_26_n_1,
      DOC => linebuf_reg_r2_192_255_24_26_n_2,
      DOD => NLW_linebuf_reg_r2_192_255_24_26_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_192_255_0_2_i_1_n_0
    );
linebuf_reg_r2_192_255_27_29: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(27),
      DIB => lb_wdata(28),
      DIC => lb_wdata(29),
      DID => '0',
      DOA => linebuf_reg_r2_192_255_27_29_n_0,
      DOB => linebuf_reg_r2_192_255_27_29_n_1,
      DOC => linebuf_reg_r2_192_255_27_29_n_2,
      DOD => NLW_linebuf_reg_r2_192_255_27_29_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_192_255_0_2_i_1_n_0
    );
linebuf_reg_r2_192_255_30_31: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(30),
      DIB => lb_wdata(31),
      DIC => '0',
      DID => '0',
      DOA => linebuf_reg_r2_192_255_30_31_n_0,
      DOB => linebuf_reg_r2_192_255_30_31_n_1,
      DOC => NLW_linebuf_reg_r2_192_255_30_31_DOC_UNCONNECTED,
      DOD => NLW_linebuf_reg_r2_192_255_30_31_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_192_255_0_2_i_1_n_0
    );
linebuf_reg_r2_192_255_3_5: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRA(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRA(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRB(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRB(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRB(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRC(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRC(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRC(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(3),
      DIB => lb_wdata(4),
      DIC => lb_wdata(5),
      DID => '0',
      DOA => linebuf_reg_r2_192_255_3_5_n_0,
      DOB => linebuf_reg_r2_192_255_3_5_n_1,
      DOC => linebuf_reg_r2_192_255_3_5_n_2,
      DOD => NLW_linebuf_reg_r2_192_255_3_5_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_192_255_0_2_i_1_n_0
    );
linebuf_reg_r2_192_255_6_8: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRA(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRA(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRB(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRB(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRB(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRC(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRC(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRC(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(6),
      DIB => lb_wdata(7),
      DIC => lb_wdata(8),
      DID => '0',
      DOA => linebuf_reg_r2_192_255_6_8_n_0,
      DOB => linebuf_reg_r2_192_255_6_8_n_1,
      DOC => linebuf_reg_r2_192_255_6_8_n_2,
      DOD => NLW_linebuf_reg_r2_192_255_6_8_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_192_255_0_2_i_1_n_0
    );
linebuf_reg_r2_192_255_9_11: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(9),
      DIB => lb_wdata(10),
      DIC => lb_wdata(11),
      DID => '0',
      DOA => linebuf_reg_r2_192_255_9_11_n_0,
      DOB => linebuf_reg_r2_192_255_9_11_n_1,
      DOC => linebuf_reg_r2_192_255_9_11_n_2,
      DOD => NLW_linebuf_reg_r2_192_255_9_11_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_192_255_0_2_i_1_n_0
    );
linebuf_reg_r2_256_319_0_2: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRA(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRA(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRB(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRB(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRB(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRC(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRC(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRC(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(0),
      DIB => lb_wdata(1),
      DIC => lb_wdata(2),
      DID => '0',
      DOA => linebuf_reg_r2_256_319_0_2_n_0,
      DOB => linebuf_reg_r2_256_319_0_2_n_1,
      DOC => linebuf_reg_r2_256_319_0_2_n_2,
      DOD => NLW_linebuf_reg_r2_256_319_0_2_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_256_319_0_2_i_1_n_0
    );
linebuf_reg_r2_256_319_0_2_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00020000"
    )
        port map (
      I0 => lb_we,
      I1 => \lb_waddr__0\(7),
      I2 => \lb_waddr__0\(6),
      I3 => \lb_waddr__0\(9),
      I4 => \lb_waddr__0\(8),
      O => linebuf_reg_r2_256_319_0_2_i_1_n_0
    );
linebuf_reg_r2_256_319_12_14: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(12),
      DIB => lb_wdata(13),
      DIC => lb_wdata(14),
      DID => '0',
      DOA => linebuf_reg_r2_256_319_12_14_n_0,
      DOB => linebuf_reg_r2_256_319_12_14_n_1,
      DOC => linebuf_reg_r2_256_319_12_14_n_2,
      DOD => NLW_linebuf_reg_r2_256_319_12_14_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_256_319_0_2_i_1_n_0
    );
linebuf_reg_r2_256_319_15_17: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(15),
      DIB => lb_wdata(16),
      DIC => lb_wdata(17),
      DID => '0',
      DOA => linebuf_reg_r2_256_319_15_17_n_0,
      DOB => linebuf_reg_r2_256_319_15_17_n_1,
      DOC => linebuf_reg_r2_256_319_15_17_n_2,
      DOD => NLW_linebuf_reg_r2_256_319_15_17_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_256_319_0_2_i_1_n_0
    );
linebuf_reg_r2_256_319_18_20: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(18),
      DIB => lb_wdata(19),
      DIC => lb_wdata(20),
      DID => '0',
      DOA => linebuf_reg_r2_256_319_18_20_n_0,
      DOB => linebuf_reg_r2_256_319_18_20_n_1,
      DOC => linebuf_reg_r2_256_319_18_20_n_2,
      DOD => NLW_linebuf_reg_r2_256_319_18_20_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_256_319_0_2_i_1_n_0
    );
linebuf_reg_r2_256_319_21_23: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(21),
      DIB => lb_wdata(22),
      DIC => lb_wdata(23),
      DID => '0',
      DOA => linebuf_reg_r2_256_319_21_23_n_0,
      DOB => linebuf_reg_r2_256_319_21_23_n_1,
      DOC => linebuf_reg_r2_256_319_21_23_n_2,
      DOD => NLW_linebuf_reg_r2_256_319_21_23_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_256_319_0_2_i_1_n_0
    );
linebuf_reg_r2_256_319_24_26: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(24),
      DIB => lb_wdata(25),
      DIC => lb_wdata(26),
      DID => '0',
      DOA => linebuf_reg_r2_256_319_24_26_n_0,
      DOB => linebuf_reg_r2_256_319_24_26_n_1,
      DOC => linebuf_reg_r2_256_319_24_26_n_2,
      DOD => NLW_linebuf_reg_r2_256_319_24_26_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_256_319_0_2_i_1_n_0
    );
linebuf_reg_r2_256_319_27_29: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(27),
      DIB => lb_wdata(28),
      DIC => lb_wdata(29),
      DID => '0',
      DOA => linebuf_reg_r2_256_319_27_29_n_0,
      DOB => linebuf_reg_r2_256_319_27_29_n_1,
      DOC => linebuf_reg_r2_256_319_27_29_n_2,
      DOD => NLW_linebuf_reg_r2_256_319_27_29_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_256_319_0_2_i_1_n_0
    );
linebuf_reg_r2_256_319_30_31: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(30),
      DIB => lb_wdata(31),
      DIC => '0',
      DID => '0',
      DOA => linebuf_reg_r2_256_319_30_31_n_0,
      DOB => linebuf_reg_r2_256_319_30_31_n_1,
      DOC => NLW_linebuf_reg_r2_256_319_30_31_DOC_UNCONNECTED,
      DOD => NLW_linebuf_reg_r2_256_319_30_31_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_256_319_0_2_i_1_n_0
    );
linebuf_reg_r2_256_319_3_5: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRA(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRA(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRB(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRB(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRB(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRC(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRC(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRC(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(3),
      DIB => lb_wdata(4),
      DIC => lb_wdata(5),
      DID => '0',
      DOA => linebuf_reg_r2_256_319_3_5_n_0,
      DOB => linebuf_reg_r2_256_319_3_5_n_1,
      DOC => linebuf_reg_r2_256_319_3_5_n_2,
      DOD => NLW_linebuf_reg_r2_256_319_3_5_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_256_319_0_2_i_1_n_0
    );
linebuf_reg_r2_256_319_6_8: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRA(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRA(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRB(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRB(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRB(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRC(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRC(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRC(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(6),
      DIB => lb_wdata(7),
      DIC => lb_wdata(8),
      DID => '0',
      DOA => linebuf_reg_r2_256_319_6_8_n_0,
      DOB => linebuf_reg_r2_256_319_6_8_n_1,
      DOC => linebuf_reg_r2_256_319_6_8_n_2,
      DOD => NLW_linebuf_reg_r2_256_319_6_8_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_256_319_0_2_i_1_n_0
    );
linebuf_reg_r2_256_319_9_11: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(9),
      DIB => lb_wdata(10),
      DIC => lb_wdata(11),
      DID => '0',
      DOA => linebuf_reg_r2_256_319_9_11_n_0,
      DOB => linebuf_reg_r2_256_319_9_11_n_1,
      DOC => linebuf_reg_r2_256_319_9_11_n_2,
      DOD => NLW_linebuf_reg_r2_256_319_9_11_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_256_319_0_2_i_1_n_0
    );
linebuf_reg_r2_320_383_0_2: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRA(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRA(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRB(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRB(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRB(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRC(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRC(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRC(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(0),
      DIB => lb_wdata(1),
      DIC => lb_wdata(2),
      DID => '0',
      DOA => linebuf_reg_r2_320_383_0_2_n_0,
      DOB => linebuf_reg_r2_320_383_0_2_n_1,
      DOC => linebuf_reg_r2_320_383_0_2_n_2,
      DOD => NLW_linebuf_reg_r2_320_383_0_2_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_320_383_0_2_i_1_n_0
    );
linebuf_reg_r2_320_383_0_2_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00400000"
    )
        port map (
      I0 => \lb_waddr__0\(9),
      I1 => \lb_waddr__0\(8),
      I2 => \lb_waddr__0\(6),
      I3 => \lb_waddr__0\(7),
      I4 => lb_we,
      O => linebuf_reg_r2_320_383_0_2_i_1_n_0
    );
linebuf_reg_r2_320_383_12_14: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(12),
      DIB => lb_wdata(13),
      DIC => lb_wdata(14),
      DID => '0',
      DOA => linebuf_reg_r2_320_383_12_14_n_0,
      DOB => linebuf_reg_r2_320_383_12_14_n_1,
      DOC => linebuf_reg_r2_320_383_12_14_n_2,
      DOD => NLW_linebuf_reg_r2_320_383_12_14_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_320_383_0_2_i_1_n_0
    );
linebuf_reg_r2_320_383_15_17: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(15),
      DIB => lb_wdata(16),
      DIC => lb_wdata(17),
      DID => '0',
      DOA => linebuf_reg_r2_320_383_15_17_n_0,
      DOB => linebuf_reg_r2_320_383_15_17_n_1,
      DOC => linebuf_reg_r2_320_383_15_17_n_2,
      DOD => NLW_linebuf_reg_r2_320_383_15_17_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_320_383_0_2_i_1_n_0
    );
linebuf_reg_r2_320_383_18_20: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(18),
      DIB => lb_wdata(19),
      DIC => lb_wdata(20),
      DID => '0',
      DOA => linebuf_reg_r2_320_383_18_20_n_0,
      DOB => linebuf_reg_r2_320_383_18_20_n_1,
      DOC => linebuf_reg_r2_320_383_18_20_n_2,
      DOD => NLW_linebuf_reg_r2_320_383_18_20_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_320_383_0_2_i_1_n_0
    );
linebuf_reg_r2_320_383_21_23: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(21),
      DIB => lb_wdata(22),
      DIC => lb_wdata(23),
      DID => '0',
      DOA => linebuf_reg_r2_320_383_21_23_n_0,
      DOB => linebuf_reg_r2_320_383_21_23_n_1,
      DOC => linebuf_reg_r2_320_383_21_23_n_2,
      DOD => NLW_linebuf_reg_r2_320_383_21_23_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_320_383_0_2_i_1_n_0
    );
linebuf_reg_r2_320_383_24_26: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(24),
      DIB => lb_wdata(25),
      DIC => lb_wdata(26),
      DID => '0',
      DOA => linebuf_reg_r2_320_383_24_26_n_0,
      DOB => linebuf_reg_r2_320_383_24_26_n_1,
      DOC => linebuf_reg_r2_320_383_24_26_n_2,
      DOD => NLW_linebuf_reg_r2_320_383_24_26_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_320_383_0_2_i_1_n_0
    );
linebuf_reg_r2_320_383_27_29: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(27),
      DIB => lb_wdata(28),
      DIC => lb_wdata(29),
      DID => '0',
      DOA => linebuf_reg_r2_320_383_27_29_n_0,
      DOB => linebuf_reg_r2_320_383_27_29_n_1,
      DOC => linebuf_reg_r2_320_383_27_29_n_2,
      DOD => NLW_linebuf_reg_r2_320_383_27_29_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_320_383_0_2_i_1_n_0
    );
linebuf_reg_r2_320_383_30_31: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(30),
      DIB => lb_wdata(31),
      DIC => '0',
      DID => '0',
      DOA => linebuf_reg_r2_320_383_30_31_n_0,
      DOB => linebuf_reg_r2_320_383_30_31_n_1,
      DOC => NLW_linebuf_reg_r2_320_383_30_31_DOC_UNCONNECTED,
      DOD => NLW_linebuf_reg_r2_320_383_30_31_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_320_383_0_2_i_1_n_0
    );
linebuf_reg_r2_320_383_3_5: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRA(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRA(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRB(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRB(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRB(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRC(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRC(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRC(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(3),
      DIB => lb_wdata(4),
      DIC => lb_wdata(5),
      DID => '0',
      DOA => linebuf_reg_r2_320_383_3_5_n_0,
      DOB => linebuf_reg_r2_320_383_3_5_n_1,
      DOC => linebuf_reg_r2_320_383_3_5_n_2,
      DOD => NLW_linebuf_reg_r2_320_383_3_5_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_320_383_0_2_i_1_n_0
    );
linebuf_reg_r2_320_383_6_8: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRA(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRA(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRB(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRB(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRB(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRC(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRC(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRC(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(6),
      DIB => lb_wdata(7),
      DIC => lb_wdata(8),
      DID => '0',
      DOA => linebuf_reg_r2_320_383_6_8_n_0,
      DOB => linebuf_reg_r2_320_383_6_8_n_1,
      DOC => linebuf_reg_r2_320_383_6_8_n_2,
      DOD => NLW_linebuf_reg_r2_320_383_6_8_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_320_383_0_2_i_1_n_0
    );
linebuf_reg_r2_320_383_9_11: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(9),
      DIB => lb_wdata(10),
      DIC => lb_wdata(11),
      DID => '0',
      DOA => linebuf_reg_r2_320_383_9_11_n_0,
      DOB => linebuf_reg_r2_320_383_9_11_n_1,
      DOC => linebuf_reg_r2_320_383_9_11_n_2,
      DOD => NLW_linebuf_reg_r2_320_383_9_11_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_320_383_0_2_i_1_n_0
    );
linebuf_reg_r2_384_447_0_2: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRA(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRA(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRB(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRB(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRB(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRC(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRC(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRC(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(0),
      DIB => lb_wdata(1),
      DIC => lb_wdata(2),
      DID => '0',
      DOA => linebuf_reg_r2_384_447_0_2_n_0,
      DOB => linebuf_reg_r2_384_447_0_2_n_1,
      DOC => linebuf_reg_r2_384_447_0_2_n_2,
      DOD => NLW_linebuf_reg_r2_384_447_0_2_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_384_447_0_2_i_1_n_0
    );
linebuf_reg_r2_384_447_0_2_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00400000"
    )
        port map (
      I0 => \lb_waddr__0\(9),
      I1 => \lb_waddr__0\(8),
      I2 => \lb_waddr__0\(7),
      I3 => \lb_waddr__0\(6),
      I4 => lb_we,
      O => linebuf_reg_r2_384_447_0_2_i_1_n_0
    );
linebuf_reg_r2_384_447_12_14: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(12),
      DIB => lb_wdata(13),
      DIC => lb_wdata(14),
      DID => '0',
      DOA => linebuf_reg_r2_384_447_12_14_n_0,
      DOB => linebuf_reg_r2_384_447_12_14_n_1,
      DOC => linebuf_reg_r2_384_447_12_14_n_2,
      DOD => NLW_linebuf_reg_r2_384_447_12_14_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_384_447_0_2_i_1_n_0
    );
linebuf_reg_r2_384_447_15_17: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(15),
      DIB => lb_wdata(16),
      DIC => lb_wdata(17),
      DID => '0',
      DOA => linebuf_reg_r2_384_447_15_17_n_0,
      DOB => linebuf_reg_r2_384_447_15_17_n_1,
      DOC => linebuf_reg_r2_384_447_15_17_n_2,
      DOD => NLW_linebuf_reg_r2_384_447_15_17_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_384_447_0_2_i_1_n_0
    );
linebuf_reg_r2_384_447_18_20: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(18),
      DIB => lb_wdata(19),
      DIC => lb_wdata(20),
      DID => '0',
      DOA => linebuf_reg_r2_384_447_18_20_n_0,
      DOB => linebuf_reg_r2_384_447_18_20_n_1,
      DOC => linebuf_reg_r2_384_447_18_20_n_2,
      DOD => NLW_linebuf_reg_r2_384_447_18_20_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_384_447_0_2_i_1_n_0
    );
linebuf_reg_r2_384_447_21_23: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(21),
      DIB => lb_wdata(22),
      DIC => lb_wdata(23),
      DID => '0',
      DOA => linebuf_reg_r2_384_447_21_23_n_0,
      DOB => linebuf_reg_r2_384_447_21_23_n_1,
      DOC => linebuf_reg_r2_384_447_21_23_n_2,
      DOD => NLW_linebuf_reg_r2_384_447_21_23_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_384_447_0_2_i_1_n_0
    );
linebuf_reg_r2_384_447_24_26: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(24),
      DIB => lb_wdata(25),
      DIC => lb_wdata(26),
      DID => '0',
      DOA => linebuf_reg_r2_384_447_24_26_n_0,
      DOB => linebuf_reg_r2_384_447_24_26_n_1,
      DOC => linebuf_reg_r2_384_447_24_26_n_2,
      DOD => NLW_linebuf_reg_r2_384_447_24_26_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_384_447_0_2_i_1_n_0
    );
linebuf_reg_r2_384_447_27_29: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(27),
      DIB => lb_wdata(28),
      DIC => lb_wdata(29),
      DID => '0',
      DOA => linebuf_reg_r2_384_447_27_29_n_0,
      DOB => linebuf_reg_r2_384_447_27_29_n_1,
      DOC => linebuf_reg_r2_384_447_27_29_n_2,
      DOD => NLW_linebuf_reg_r2_384_447_27_29_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_384_447_0_2_i_1_n_0
    );
linebuf_reg_r2_384_447_30_31: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(30),
      DIB => lb_wdata(31),
      DIC => '0',
      DID => '0',
      DOA => linebuf_reg_r2_384_447_30_31_n_0,
      DOB => linebuf_reg_r2_384_447_30_31_n_1,
      DOC => NLW_linebuf_reg_r2_384_447_30_31_DOC_UNCONNECTED,
      DOD => NLW_linebuf_reg_r2_384_447_30_31_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_384_447_0_2_i_1_n_0
    );
linebuf_reg_r2_384_447_3_5: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRA(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRA(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRB(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRB(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRB(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRC(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRC(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRC(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(3),
      DIB => lb_wdata(4),
      DIC => lb_wdata(5),
      DID => '0',
      DOA => linebuf_reg_r2_384_447_3_5_n_0,
      DOB => linebuf_reg_r2_384_447_3_5_n_1,
      DOC => linebuf_reg_r2_384_447_3_5_n_2,
      DOD => NLW_linebuf_reg_r2_384_447_3_5_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_384_447_0_2_i_1_n_0
    );
linebuf_reg_r2_384_447_6_8: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRA(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRA(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRB(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRB(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRB(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRC(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRC(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRC(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(6),
      DIB => lb_wdata(7),
      DIC => lb_wdata(8),
      DID => '0',
      DOA => linebuf_reg_r2_384_447_6_8_n_0,
      DOB => linebuf_reg_r2_384_447_6_8_n_1,
      DOC => linebuf_reg_r2_384_447_6_8_n_2,
      DOD => NLW_linebuf_reg_r2_384_447_6_8_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_384_447_0_2_i_1_n_0
    );
linebuf_reg_r2_384_447_9_11: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(9),
      DIB => lb_wdata(10),
      DIC => lb_wdata(11),
      DID => '0',
      DOA => linebuf_reg_r2_384_447_9_11_n_0,
      DOB => linebuf_reg_r2_384_447_9_11_n_1,
      DOC => linebuf_reg_r2_384_447_9_11_n_2,
      DOD => NLW_linebuf_reg_r2_384_447_9_11_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_384_447_0_2_i_1_n_0
    );
linebuf_reg_r2_448_511_0_2: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRA(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRA(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRB(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRB(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRB(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRC(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRC(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRC(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(0),
      DIB => lb_wdata(1),
      DIC => lb_wdata(2),
      DID => '0',
      DOA => linebuf_reg_r2_448_511_0_2_n_0,
      DOB => linebuf_reg_r2_448_511_0_2_n_1,
      DOC => linebuf_reg_r2_448_511_0_2_n_2,
      DOD => NLW_linebuf_reg_r2_448_511_0_2_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_448_511_0_2_i_1_n_0
    );
linebuf_reg_r2_448_511_0_2_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"40000000"
    )
        port map (
      I0 => \lb_waddr__0\(9),
      I1 => \lb_waddr__0\(7),
      I2 => \lb_waddr__0\(6),
      I3 => lb_we,
      I4 => \lb_waddr__0\(8),
      O => linebuf_reg_r2_448_511_0_2_i_1_n_0
    );
linebuf_reg_r2_448_511_12_14: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(12),
      DIB => lb_wdata(13),
      DIC => lb_wdata(14),
      DID => '0',
      DOA => linebuf_reg_r2_448_511_12_14_n_0,
      DOB => linebuf_reg_r2_448_511_12_14_n_1,
      DOC => linebuf_reg_r2_448_511_12_14_n_2,
      DOD => NLW_linebuf_reg_r2_448_511_12_14_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_448_511_0_2_i_1_n_0
    );
linebuf_reg_r2_448_511_15_17: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(15),
      DIB => lb_wdata(16),
      DIC => lb_wdata(17),
      DID => '0',
      DOA => linebuf_reg_r2_448_511_15_17_n_0,
      DOB => linebuf_reg_r2_448_511_15_17_n_1,
      DOC => linebuf_reg_r2_448_511_15_17_n_2,
      DOD => NLW_linebuf_reg_r2_448_511_15_17_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_448_511_0_2_i_1_n_0
    );
linebuf_reg_r2_448_511_18_20: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(18),
      DIB => lb_wdata(19),
      DIC => lb_wdata(20),
      DID => '0',
      DOA => linebuf_reg_r2_448_511_18_20_n_0,
      DOB => linebuf_reg_r2_448_511_18_20_n_1,
      DOC => linebuf_reg_r2_448_511_18_20_n_2,
      DOD => NLW_linebuf_reg_r2_448_511_18_20_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_448_511_0_2_i_1_n_0
    );
linebuf_reg_r2_448_511_21_23: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(21),
      DIB => lb_wdata(22),
      DIC => lb_wdata(23),
      DID => '0',
      DOA => linebuf_reg_r2_448_511_21_23_n_0,
      DOB => linebuf_reg_r2_448_511_21_23_n_1,
      DOC => linebuf_reg_r2_448_511_21_23_n_2,
      DOD => NLW_linebuf_reg_r2_448_511_21_23_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_448_511_0_2_i_1_n_0
    );
linebuf_reg_r2_448_511_24_26: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(24),
      DIB => lb_wdata(25),
      DIC => lb_wdata(26),
      DID => '0',
      DOA => linebuf_reg_r2_448_511_24_26_n_0,
      DOB => linebuf_reg_r2_448_511_24_26_n_1,
      DOC => linebuf_reg_r2_448_511_24_26_n_2,
      DOD => NLW_linebuf_reg_r2_448_511_24_26_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_448_511_0_2_i_1_n_0
    );
linebuf_reg_r2_448_511_27_29: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(27),
      DIB => lb_wdata(28),
      DIC => lb_wdata(29),
      DID => '0',
      DOA => linebuf_reg_r2_448_511_27_29_n_0,
      DOB => linebuf_reg_r2_448_511_27_29_n_1,
      DOC => linebuf_reg_r2_448_511_27_29_n_2,
      DOD => NLW_linebuf_reg_r2_448_511_27_29_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_448_511_0_2_i_1_n_0
    );
linebuf_reg_r2_448_511_30_31: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(30),
      DIB => lb_wdata(31),
      DIC => '0',
      DID => '0',
      DOA => linebuf_reg_r2_448_511_30_31_n_0,
      DOB => linebuf_reg_r2_448_511_30_31_n_1,
      DOC => NLW_linebuf_reg_r2_448_511_30_31_DOC_UNCONNECTED,
      DOD => NLW_linebuf_reg_r2_448_511_30_31_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_448_511_0_2_i_1_n_0
    );
linebuf_reg_r2_448_511_3_5: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRA(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRA(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRB(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRB(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRB(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRC(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRC(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRC(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(3),
      DIB => lb_wdata(4),
      DIC => lb_wdata(5),
      DID => '0',
      DOA => linebuf_reg_r2_448_511_3_5_n_0,
      DOB => linebuf_reg_r2_448_511_3_5_n_1,
      DOC => linebuf_reg_r2_448_511_3_5_n_2,
      DOD => NLW_linebuf_reg_r2_448_511_3_5_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_448_511_0_2_i_1_n_0
    );
linebuf_reg_r2_448_511_6_8: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRA(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRA(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRB(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRB(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRB(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRC(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRC(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRC(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(6),
      DIB => lb_wdata(7),
      DIC => lb_wdata(8),
      DID => '0',
      DOA => linebuf_reg_r2_448_511_6_8_n_0,
      DOB => linebuf_reg_r2_448_511_6_8_n_1,
      DOC => linebuf_reg_r2_448_511_6_8_n_2,
      DOD => NLW_linebuf_reg_r2_448_511_6_8_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_448_511_0_2_i_1_n_0
    );
linebuf_reg_r2_448_511_9_11: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(9),
      DIB => lb_wdata(10),
      DIC => lb_wdata(11),
      DID => '0',
      DOA => linebuf_reg_r2_448_511_9_11_n_0,
      DOB => linebuf_reg_r2_448_511_9_11_n_1,
      DOC => linebuf_reg_r2_448_511_9_11_n_2,
      DOD => NLW_linebuf_reg_r2_448_511_9_11_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_448_511_0_2_i_1_n_0
    );
linebuf_reg_r2_512_575_0_2: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRA(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRA(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRB(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRB(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRB(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRC(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRC(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRC(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(0),
      DIB => lb_wdata(1),
      DIC => lb_wdata(2),
      DID => '0',
      DOA => linebuf_reg_r2_512_575_0_2_n_0,
      DOB => linebuf_reg_r2_512_575_0_2_n_1,
      DOC => linebuf_reg_r2_512_575_0_2_n_2,
      DOD => NLW_linebuf_reg_r2_512_575_0_2_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r1_512_575_0_2_i_1_n_0
    );
linebuf_reg_r2_512_575_12_14: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(12),
      DIB => lb_wdata(13),
      DIC => lb_wdata(14),
      DID => '0',
      DOA => linebuf_reg_r2_512_575_12_14_n_0,
      DOB => linebuf_reg_r2_512_575_12_14_n_1,
      DOC => linebuf_reg_r2_512_575_12_14_n_2,
      DOD => NLW_linebuf_reg_r2_512_575_12_14_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r1_512_575_0_2_i_1_n_0
    );
linebuf_reg_r2_512_575_15_17: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(15),
      DIB => lb_wdata(16),
      DIC => lb_wdata(17),
      DID => '0',
      DOA => linebuf_reg_r2_512_575_15_17_n_0,
      DOB => linebuf_reg_r2_512_575_15_17_n_1,
      DOC => linebuf_reg_r2_512_575_15_17_n_2,
      DOD => NLW_linebuf_reg_r2_512_575_15_17_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r1_512_575_0_2_i_1_n_0
    );
linebuf_reg_r2_512_575_18_20: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(18),
      DIB => lb_wdata(19),
      DIC => lb_wdata(20),
      DID => '0',
      DOA => linebuf_reg_r2_512_575_18_20_n_0,
      DOB => linebuf_reg_r2_512_575_18_20_n_1,
      DOC => linebuf_reg_r2_512_575_18_20_n_2,
      DOD => NLW_linebuf_reg_r2_512_575_18_20_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r1_512_575_0_2_i_1_n_0
    );
linebuf_reg_r2_512_575_21_23: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(21),
      DIB => lb_wdata(22),
      DIC => lb_wdata(23),
      DID => '0',
      DOA => linebuf_reg_r2_512_575_21_23_n_0,
      DOB => linebuf_reg_r2_512_575_21_23_n_1,
      DOC => linebuf_reg_r2_512_575_21_23_n_2,
      DOD => NLW_linebuf_reg_r2_512_575_21_23_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r1_512_575_0_2_i_1_n_0
    );
linebuf_reg_r2_512_575_24_26: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(24),
      DIB => lb_wdata(25),
      DIC => lb_wdata(26),
      DID => '0',
      DOA => linebuf_reg_r2_512_575_24_26_n_0,
      DOB => linebuf_reg_r2_512_575_24_26_n_1,
      DOC => linebuf_reg_r2_512_575_24_26_n_2,
      DOD => NLW_linebuf_reg_r2_512_575_24_26_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r1_512_575_0_2_i_1_n_0
    );
linebuf_reg_r2_512_575_27_29: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(27),
      DIB => lb_wdata(28),
      DIC => lb_wdata(29),
      DID => '0',
      DOA => linebuf_reg_r2_512_575_27_29_n_0,
      DOB => linebuf_reg_r2_512_575_27_29_n_1,
      DOC => linebuf_reg_r2_512_575_27_29_n_2,
      DOD => NLW_linebuf_reg_r2_512_575_27_29_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r1_512_575_0_2_i_1_n_0
    );
linebuf_reg_r2_512_575_30_31: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(30),
      DIB => lb_wdata(31),
      DIC => '0',
      DID => '0',
      DOA => linebuf_reg_r2_512_575_30_31_n_0,
      DOB => linebuf_reg_r2_512_575_30_31_n_1,
      DOC => NLW_linebuf_reg_r2_512_575_30_31_DOC_UNCONNECTED,
      DOD => NLW_linebuf_reg_r2_512_575_30_31_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r1_512_575_0_2_i_1_n_0
    );
linebuf_reg_r2_512_575_3_5: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRA(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRA(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRB(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRB(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRB(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRC(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRC(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRC(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(3),
      DIB => lb_wdata(4),
      DIC => lb_wdata(5),
      DID => '0',
      DOA => linebuf_reg_r2_512_575_3_5_n_0,
      DOB => linebuf_reg_r2_512_575_3_5_n_1,
      DOC => linebuf_reg_r2_512_575_3_5_n_2,
      DOD => NLW_linebuf_reg_r2_512_575_3_5_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r1_512_575_0_2_i_1_n_0
    );
linebuf_reg_r2_512_575_6_8: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRA(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRA(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRB(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRB(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRB(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRC(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRC(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRC(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(6),
      DIB => lb_wdata(7),
      DIC => lb_wdata(8),
      DID => '0',
      DOA => linebuf_reg_r2_512_575_6_8_n_0,
      DOB => linebuf_reg_r2_512_575_6_8_n_1,
      DOC => linebuf_reg_r2_512_575_6_8_n_2,
      DOD => NLW_linebuf_reg_r2_512_575_6_8_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r1_512_575_0_2_i_1_n_0
    );
linebuf_reg_r2_512_575_9_11: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(9),
      DIB => lb_wdata(10),
      DIC => lb_wdata(11),
      DID => '0',
      DOA => linebuf_reg_r2_512_575_9_11_n_0,
      DOB => linebuf_reg_r2_512_575_9_11_n_1,
      DOC => linebuf_reg_r2_512_575_9_11_n_2,
      DOD => NLW_linebuf_reg_r2_512_575_9_11_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r1_512_575_0_2_i_1_n_0
    );
linebuf_reg_r2_576_639_0_2: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRA(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRA(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRB(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRB(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRB(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRC(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRC(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRC(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(0),
      DIB => lb_wdata(1),
      DIC => lb_wdata(2),
      DID => '0',
      DOA => linebuf_reg_r2_576_639_0_2_n_0,
      DOB => linebuf_reg_r2_576_639_0_2_n_1,
      DOC => linebuf_reg_r2_576_639_0_2_n_2,
      DOD => NLW_linebuf_reg_r2_576_639_0_2_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_576_639_0_2_i_1_n_0
    );
linebuf_reg_r2_576_639_0_2_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00400000"
    )
        port map (
      I0 => \lb_waddr__0\(8),
      I1 => \lb_waddr__0\(9),
      I2 => \lb_waddr__0\(6),
      I3 => \lb_waddr__0\(7),
      I4 => lb_we,
      O => linebuf_reg_r2_576_639_0_2_i_1_n_0
    );
linebuf_reg_r2_576_639_12_14: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(12),
      DIB => lb_wdata(13),
      DIC => lb_wdata(14),
      DID => '0',
      DOA => linebuf_reg_r2_576_639_12_14_n_0,
      DOB => linebuf_reg_r2_576_639_12_14_n_1,
      DOC => linebuf_reg_r2_576_639_12_14_n_2,
      DOD => NLW_linebuf_reg_r2_576_639_12_14_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_576_639_0_2_i_1_n_0
    );
linebuf_reg_r2_576_639_15_17: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(15),
      DIB => lb_wdata(16),
      DIC => lb_wdata(17),
      DID => '0',
      DOA => linebuf_reg_r2_576_639_15_17_n_0,
      DOB => linebuf_reg_r2_576_639_15_17_n_1,
      DOC => linebuf_reg_r2_576_639_15_17_n_2,
      DOD => NLW_linebuf_reg_r2_576_639_15_17_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_576_639_0_2_i_1_n_0
    );
linebuf_reg_r2_576_639_18_20: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(18),
      DIB => lb_wdata(19),
      DIC => lb_wdata(20),
      DID => '0',
      DOA => linebuf_reg_r2_576_639_18_20_n_0,
      DOB => linebuf_reg_r2_576_639_18_20_n_1,
      DOC => linebuf_reg_r2_576_639_18_20_n_2,
      DOD => NLW_linebuf_reg_r2_576_639_18_20_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_576_639_0_2_i_1_n_0
    );
linebuf_reg_r2_576_639_21_23: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(21),
      DIB => lb_wdata(22),
      DIC => lb_wdata(23),
      DID => '0',
      DOA => linebuf_reg_r2_576_639_21_23_n_0,
      DOB => linebuf_reg_r2_576_639_21_23_n_1,
      DOC => linebuf_reg_r2_576_639_21_23_n_2,
      DOD => NLW_linebuf_reg_r2_576_639_21_23_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_576_639_0_2_i_1_n_0
    );
linebuf_reg_r2_576_639_24_26: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(24),
      DIB => lb_wdata(25),
      DIC => lb_wdata(26),
      DID => '0',
      DOA => linebuf_reg_r2_576_639_24_26_n_0,
      DOB => linebuf_reg_r2_576_639_24_26_n_1,
      DOC => linebuf_reg_r2_576_639_24_26_n_2,
      DOD => NLW_linebuf_reg_r2_576_639_24_26_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_576_639_0_2_i_1_n_0
    );
linebuf_reg_r2_576_639_27_29: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(27),
      DIB => lb_wdata(28),
      DIC => lb_wdata(29),
      DID => '0',
      DOA => linebuf_reg_r2_576_639_27_29_n_0,
      DOB => linebuf_reg_r2_576_639_27_29_n_1,
      DOC => linebuf_reg_r2_576_639_27_29_n_2,
      DOD => NLW_linebuf_reg_r2_576_639_27_29_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_576_639_0_2_i_1_n_0
    );
linebuf_reg_r2_576_639_30_31: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(30),
      DIB => lb_wdata(31),
      DIC => '0',
      DID => '0',
      DOA => linebuf_reg_r2_576_639_30_31_n_0,
      DOB => linebuf_reg_r2_576_639_30_31_n_1,
      DOC => NLW_linebuf_reg_r2_576_639_30_31_DOC_UNCONNECTED,
      DOD => NLW_linebuf_reg_r2_576_639_30_31_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_576_639_0_2_i_1_n_0
    );
linebuf_reg_r2_576_639_3_5: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRA(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRA(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRB(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRB(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRB(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRC(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRC(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRC(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(3),
      DIB => lb_wdata(4),
      DIC => lb_wdata(5),
      DID => '0',
      DOA => linebuf_reg_r2_576_639_3_5_n_0,
      DOB => linebuf_reg_r2_576_639_3_5_n_1,
      DOC => linebuf_reg_r2_576_639_3_5_n_2,
      DOD => NLW_linebuf_reg_r2_576_639_3_5_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_576_639_0_2_i_1_n_0
    );
linebuf_reg_r2_576_639_6_8: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRA(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRA(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRB(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRB(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRB(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRC(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRC(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRC(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(6),
      DIB => lb_wdata(7),
      DIC => lb_wdata(8),
      DID => '0',
      DOA => linebuf_reg_r2_576_639_6_8_n_0,
      DOB => linebuf_reg_r2_576_639_6_8_n_1,
      DOC => linebuf_reg_r2_576_639_6_8_n_2,
      DOD => NLW_linebuf_reg_r2_576_639_6_8_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_576_639_0_2_i_1_n_0
    );
linebuf_reg_r2_576_639_9_11: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(9),
      DIB => lb_wdata(10),
      DIC => lb_wdata(11),
      DID => '0',
      DOA => linebuf_reg_r2_576_639_9_11_n_0,
      DOB => linebuf_reg_r2_576_639_9_11_n_1,
      DOC => linebuf_reg_r2_576_639_9_11_n_2,
      DOD => NLW_linebuf_reg_r2_576_639_9_11_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_576_639_0_2_i_1_n_0
    );
linebuf_reg_r2_640_703_0_2: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRA(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRA(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRB(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRB(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRB(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRC(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRC(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRC(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(0),
      DIB => lb_wdata(1),
      DIC => lb_wdata(2),
      DID => '0',
      DOA => linebuf_reg_r2_640_703_0_2_n_0,
      DOB => linebuf_reg_r2_640_703_0_2_n_1,
      DOC => linebuf_reg_r2_640_703_0_2_n_2,
      DOD => NLW_linebuf_reg_r2_640_703_0_2_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_640_703_0_2_i_1_n_0
    );
linebuf_reg_r2_640_703_0_2_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00400000"
    )
        port map (
      I0 => \lb_waddr__0\(8),
      I1 => \lb_waddr__0\(9),
      I2 => \lb_waddr__0\(7),
      I3 => \lb_waddr__0\(6),
      I4 => lb_we,
      O => linebuf_reg_r2_640_703_0_2_i_1_n_0
    );
linebuf_reg_r2_640_703_12_14: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(12),
      DIB => lb_wdata(13),
      DIC => lb_wdata(14),
      DID => '0',
      DOA => linebuf_reg_r2_640_703_12_14_n_0,
      DOB => linebuf_reg_r2_640_703_12_14_n_1,
      DOC => linebuf_reg_r2_640_703_12_14_n_2,
      DOD => NLW_linebuf_reg_r2_640_703_12_14_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_640_703_0_2_i_1_n_0
    );
linebuf_reg_r2_640_703_15_17: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(15),
      DIB => lb_wdata(16),
      DIC => lb_wdata(17),
      DID => '0',
      DOA => linebuf_reg_r2_640_703_15_17_n_0,
      DOB => linebuf_reg_r2_640_703_15_17_n_1,
      DOC => linebuf_reg_r2_640_703_15_17_n_2,
      DOD => NLW_linebuf_reg_r2_640_703_15_17_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_640_703_0_2_i_1_n_0
    );
linebuf_reg_r2_640_703_18_20: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(18),
      DIB => lb_wdata(19),
      DIC => lb_wdata(20),
      DID => '0',
      DOA => linebuf_reg_r2_640_703_18_20_n_0,
      DOB => linebuf_reg_r2_640_703_18_20_n_1,
      DOC => linebuf_reg_r2_640_703_18_20_n_2,
      DOD => NLW_linebuf_reg_r2_640_703_18_20_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_640_703_0_2_i_1_n_0
    );
linebuf_reg_r2_640_703_21_23: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(21),
      DIB => lb_wdata(22),
      DIC => lb_wdata(23),
      DID => '0',
      DOA => linebuf_reg_r2_640_703_21_23_n_0,
      DOB => linebuf_reg_r2_640_703_21_23_n_1,
      DOC => linebuf_reg_r2_640_703_21_23_n_2,
      DOD => NLW_linebuf_reg_r2_640_703_21_23_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_640_703_0_2_i_1_n_0
    );
linebuf_reg_r2_640_703_24_26: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(24),
      DIB => lb_wdata(25),
      DIC => lb_wdata(26),
      DID => '0',
      DOA => linebuf_reg_r2_640_703_24_26_n_0,
      DOB => linebuf_reg_r2_640_703_24_26_n_1,
      DOC => linebuf_reg_r2_640_703_24_26_n_2,
      DOD => NLW_linebuf_reg_r2_640_703_24_26_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_640_703_0_2_i_1_n_0
    );
linebuf_reg_r2_640_703_27_29: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(27),
      DIB => lb_wdata(28),
      DIC => lb_wdata(29),
      DID => '0',
      DOA => linebuf_reg_r2_640_703_27_29_n_0,
      DOB => linebuf_reg_r2_640_703_27_29_n_1,
      DOC => linebuf_reg_r2_640_703_27_29_n_2,
      DOD => NLW_linebuf_reg_r2_640_703_27_29_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_640_703_0_2_i_1_n_0
    );
linebuf_reg_r2_640_703_30_31: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(30),
      DIB => lb_wdata(31),
      DIC => '0',
      DID => '0',
      DOA => linebuf_reg_r2_640_703_30_31_n_0,
      DOB => linebuf_reg_r2_640_703_30_31_n_1,
      DOC => NLW_linebuf_reg_r2_640_703_30_31_DOC_UNCONNECTED,
      DOD => NLW_linebuf_reg_r2_640_703_30_31_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_640_703_0_2_i_1_n_0
    );
linebuf_reg_r2_640_703_3_5: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRA(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRA(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRB(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRB(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRB(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRC(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRC(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRC(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(3),
      DIB => lb_wdata(4),
      DIC => lb_wdata(5),
      DID => '0',
      DOA => linebuf_reg_r2_640_703_3_5_n_0,
      DOB => linebuf_reg_r2_640_703_3_5_n_1,
      DOC => linebuf_reg_r2_640_703_3_5_n_2,
      DOD => NLW_linebuf_reg_r2_640_703_3_5_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_640_703_0_2_i_1_n_0
    );
linebuf_reg_r2_640_703_6_8: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRA(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRA(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRB(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRB(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRB(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRC(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRC(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRC(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(6),
      DIB => lb_wdata(7),
      DIC => lb_wdata(8),
      DID => '0',
      DOA => linebuf_reg_r2_640_703_6_8_n_0,
      DOB => linebuf_reg_r2_640_703_6_8_n_1,
      DOC => linebuf_reg_r2_640_703_6_8_n_2,
      DOD => NLW_linebuf_reg_r2_640_703_6_8_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_640_703_0_2_i_1_n_0
    );
linebuf_reg_r2_640_703_9_11: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(9),
      DIB => lb_wdata(10),
      DIC => lb_wdata(11),
      DID => '0',
      DOA => linebuf_reg_r2_640_703_9_11_n_0,
      DOB => linebuf_reg_r2_640_703_9_11_n_1,
      DOC => linebuf_reg_r2_640_703_9_11_n_2,
      DOD => NLW_linebuf_reg_r2_640_703_9_11_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_640_703_0_2_i_1_n_0
    );
linebuf_reg_r2_64_127_0_2: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRA(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRA(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRB(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRB(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRB(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRC(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRC(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRC(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(0),
      DIB => lb_wdata(1),
      DIC => lb_wdata(2),
      DID => '0',
      DOA => linebuf_reg_r2_64_127_0_2_n_0,
      DOB => linebuf_reg_r2_64_127_0_2_n_1,
      DOC => linebuf_reg_r2_64_127_0_2_n_2,
      DOD => NLW_linebuf_reg_r2_64_127_0_2_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_64_127_0_2_i_1_n_0
    );
linebuf_reg_r2_64_127_0_2_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00020000"
    )
        port map (
      I0 => lb_we,
      I1 => \lb_waddr__0\(8),
      I2 => \lb_waddr__0\(7),
      I3 => \lb_waddr__0\(9),
      I4 => \lb_waddr__0\(6),
      O => linebuf_reg_r2_64_127_0_2_i_1_n_0
    );
linebuf_reg_r2_64_127_12_14: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(12),
      DIB => lb_wdata(13),
      DIC => lb_wdata(14),
      DID => '0',
      DOA => linebuf_reg_r2_64_127_12_14_n_0,
      DOB => linebuf_reg_r2_64_127_12_14_n_1,
      DOC => linebuf_reg_r2_64_127_12_14_n_2,
      DOD => NLW_linebuf_reg_r2_64_127_12_14_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_64_127_0_2_i_1_n_0
    );
linebuf_reg_r2_64_127_15_17: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(15),
      DIB => lb_wdata(16),
      DIC => lb_wdata(17),
      DID => '0',
      DOA => linebuf_reg_r2_64_127_15_17_n_0,
      DOB => linebuf_reg_r2_64_127_15_17_n_1,
      DOC => linebuf_reg_r2_64_127_15_17_n_2,
      DOD => NLW_linebuf_reg_r2_64_127_15_17_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_64_127_0_2_i_1_n_0
    );
linebuf_reg_r2_64_127_18_20: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(18),
      DIB => lb_wdata(19),
      DIC => lb_wdata(20),
      DID => '0',
      DOA => linebuf_reg_r2_64_127_18_20_n_0,
      DOB => linebuf_reg_r2_64_127_18_20_n_1,
      DOC => linebuf_reg_r2_64_127_18_20_n_2,
      DOD => NLW_linebuf_reg_r2_64_127_18_20_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_64_127_0_2_i_1_n_0
    );
linebuf_reg_r2_64_127_21_23: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(21),
      DIB => lb_wdata(22),
      DIC => lb_wdata(23),
      DID => '0',
      DOA => linebuf_reg_r2_64_127_21_23_n_0,
      DOB => linebuf_reg_r2_64_127_21_23_n_1,
      DOC => linebuf_reg_r2_64_127_21_23_n_2,
      DOD => NLW_linebuf_reg_r2_64_127_21_23_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_64_127_0_2_i_1_n_0
    );
linebuf_reg_r2_64_127_24_26: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(24),
      DIB => lb_wdata(25),
      DIC => lb_wdata(26),
      DID => '0',
      DOA => linebuf_reg_r2_64_127_24_26_n_0,
      DOB => linebuf_reg_r2_64_127_24_26_n_1,
      DOC => linebuf_reg_r2_64_127_24_26_n_2,
      DOD => NLW_linebuf_reg_r2_64_127_24_26_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_64_127_0_2_i_1_n_0
    );
linebuf_reg_r2_64_127_27_29: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(27),
      DIB => lb_wdata(28),
      DIC => lb_wdata(29),
      DID => '0',
      DOA => linebuf_reg_r2_64_127_27_29_n_0,
      DOB => linebuf_reg_r2_64_127_27_29_n_1,
      DOC => linebuf_reg_r2_64_127_27_29_n_2,
      DOD => NLW_linebuf_reg_r2_64_127_27_29_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_64_127_0_2_i_1_n_0
    );
linebuf_reg_r2_64_127_30_31: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(30),
      DIB => lb_wdata(31),
      DIC => '0',
      DID => '0',
      DOA => linebuf_reg_r2_64_127_30_31_n_0,
      DOB => linebuf_reg_r2_64_127_30_31_n_1,
      DOC => NLW_linebuf_reg_r2_64_127_30_31_DOC_UNCONNECTED,
      DOD => NLW_linebuf_reg_r2_64_127_30_31_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_64_127_0_2_i_1_n_0
    );
linebuf_reg_r2_64_127_3_5: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRA(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRA(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRB(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRB(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRB(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRC(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRC(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRC(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(3),
      DIB => lb_wdata(4),
      DIC => lb_wdata(5),
      DID => '0',
      DOA => linebuf_reg_r2_64_127_3_5_n_0,
      DOB => linebuf_reg_r2_64_127_3_5_n_1,
      DOC => linebuf_reg_r2_64_127_3_5_n_2,
      DOD => NLW_linebuf_reg_r2_64_127_3_5_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_64_127_0_2_i_1_n_0
    );
linebuf_reg_r2_64_127_6_8: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRA(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRA(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRB(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRB(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRB(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRC(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRC(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRC(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(6),
      DIB => lb_wdata(7),
      DIC => lb_wdata(8),
      DID => '0',
      DOA => linebuf_reg_r2_64_127_6_8_n_0,
      DOB => linebuf_reg_r2_64_127_6_8_n_1,
      DOC => linebuf_reg_r2_64_127_6_8_n_2,
      DOD => NLW_linebuf_reg_r2_64_127_6_8_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_64_127_0_2_i_1_n_0
    );
linebuf_reg_r2_64_127_9_11: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(9),
      DIB => lb_wdata(10),
      DIC => lb_wdata(11),
      DID => '0',
      DOA => linebuf_reg_r2_64_127_9_11_n_0,
      DOB => linebuf_reg_r2_64_127_9_11_n_1,
      DOC => linebuf_reg_r2_64_127_9_11_n_2,
      DOD => NLW_linebuf_reg_r2_64_127_9_11_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_64_127_0_2_i_1_n_0
    );
linebuf_reg_r2_704_767_0_2: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRA(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRA(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRB(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRB(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRB(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRC(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRC(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRC(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(0),
      DIB => lb_wdata(1),
      DIC => lb_wdata(2),
      DID => '0',
      DOA => linebuf_reg_r2_704_767_0_2_n_0,
      DOB => linebuf_reg_r2_704_767_0_2_n_1,
      DOC => linebuf_reg_r2_704_767_0_2_n_2,
      DOD => NLW_linebuf_reg_r2_704_767_0_2_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_704_767_0_2_i_1_n_0
    );
linebuf_reg_r2_704_767_0_2_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"40000000"
    )
        port map (
      I0 => \lb_waddr__0\(8),
      I1 => \lb_waddr__0\(7),
      I2 => \lb_waddr__0\(6),
      I3 => lb_we,
      I4 => \lb_waddr__0\(9),
      O => linebuf_reg_r2_704_767_0_2_i_1_n_0
    );
linebuf_reg_r2_704_767_12_14: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(12),
      DIB => lb_wdata(13),
      DIC => lb_wdata(14),
      DID => '0',
      DOA => linebuf_reg_r2_704_767_12_14_n_0,
      DOB => linebuf_reg_r2_704_767_12_14_n_1,
      DOC => linebuf_reg_r2_704_767_12_14_n_2,
      DOD => NLW_linebuf_reg_r2_704_767_12_14_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_704_767_0_2_i_1_n_0
    );
linebuf_reg_r2_704_767_15_17: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(15),
      DIB => lb_wdata(16),
      DIC => lb_wdata(17),
      DID => '0',
      DOA => linebuf_reg_r2_704_767_15_17_n_0,
      DOB => linebuf_reg_r2_704_767_15_17_n_1,
      DOC => linebuf_reg_r2_704_767_15_17_n_2,
      DOD => NLW_linebuf_reg_r2_704_767_15_17_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_704_767_0_2_i_1_n_0
    );
linebuf_reg_r2_704_767_18_20: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(18),
      DIB => lb_wdata(19),
      DIC => lb_wdata(20),
      DID => '0',
      DOA => linebuf_reg_r2_704_767_18_20_n_0,
      DOB => linebuf_reg_r2_704_767_18_20_n_1,
      DOC => linebuf_reg_r2_704_767_18_20_n_2,
      DOD => NLW_linebuf_reg_r2_704_767_18_20_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_704_767_0_2_i_1_n_0
    );
linebuf_reg_r2_704_767_21_23: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(21),
      DIB => lb_wdata(22),
      DIC => lb_wdata(23),
      DID => '0',
      DOA => linebuf_reg_r2_704_767_21_23_n_0,
      DOB => linebuf_reg_r2_704_767_21_23_n_1,
      DOC => linebuf_reg_r2_704_767_21_23_n_2,
      DOD => NLW_linebuf_reg_r2_704_767_21_23_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_704_767_0_2_i_1_n_0
    );
linebuf_reg_r2_704_767_24_26: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(24),
      DIB => lb_wdata(25),
      DIC => lb_wdata(26),
      DID => '0',
      DOA => linebuf_reg_r2_704_767_24_26_n_0,
      DOB => linebuf_reg_r2_704_767_24_26_n_1,
      DOC => linebuf_reg_r2_704_767_24_26_n_2,
      DOD => NLW_linebuf_reg_r2_704_767_24_26_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_704_767_0_2_i_1_n_0
    );
linebuf_reg_r2_704_767_27_29: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(27),
      DIB => lb_wdata(28),
      DIC => lb_wdata(29),
      DID => '0',
      DOA => linebuf_reg_r2_704_767_27_29_n_0,
      DOB => linebuf_reg_r2_704_767_27_29_n_1,
      DOC => linebuf_reg_r2_704_767_27_29_n_2,
      DOD => NLW_linebuf_reg_r2_704_767_27_29_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_704_767_0_2_i_1_n_0
    );
linebuf_reg_r2_704_767_30_31: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(30),
      DIB => lb_wdata(31),
      DIC => '0',
      DID => '0',
      DOA => linebuf_reg_r2_704_767_30_31_n_0,
      DOB => linebuf_reg_r2_704_767_30_31_n_1,
      DOC => NLW_linebuf_reg_r2_704_767_30_31_DOC_UNCONNECTED,
      DOD => NLW_linebuf_reg_r2_704_767_30_31_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_704_767_0_2_i_1_n_0
    );
linebuf_reg_r2_704_767_3_5: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRA(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRA(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRB(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRB(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRB(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRC(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRC(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRC(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(3),
      DIB => lb_wdata(4),
      DIC => lb_wdata(5),
      DID => '0',
      DOA => linebuf_reg_r2_704_767_3_5_n_0,
      DOB => linebuf_reg_r2_704_767_3_5_n_1,
      DOC => linebuf_reg_r2_704_767_3_5_n_2,
      DOD => NLW_linebuf_reg_r2_704_767_3_5_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_704_767_0_2_i_1_n_0
    );
linebuf_reg_r2_704_767_6_8: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRA(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRA(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRB(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRB(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRB(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRC(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRC(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRC(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(6),
      DIB => lb_wdata(7),
      DIC => lb_wdata(8),
      DID => '0',
      DOA => linebuf_reg_r2_704_767_6_8_n_0,
      DOB => linebuf_reg_r2_704_767_6_8_n_1,
      DOC => linebuf_reg_r2_704_767_6_8_n_2,
      DOD => NLW_linebuf_reg_r2_704_767_6_8_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_704_767_0_2_i_1_n_0
    );
linebuf_reg_r2_704_767_9_11: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(9),
      DIB => lb_wdata(10),
      DIC => lb_wdata(11),
      DID => '0',
      DOA => linebuf_reg_r2_704_767_9_11_n_0,
      DOB => linebuf_reg_r2_704_767_9_11_n_1,
      DOC => linebuf_reg_r2_704_767_9_11_n_2,
      DOD => NLW_linebuf_reg_r2_704_767_9_11_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_704_767_0_2_i_1_n_0
    );
linebuf_reg_r2_768_831_0_2: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRA(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRA(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRB(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRB(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRB(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRC(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRC(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRC(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(0),
      DIB => lb_wdata(1),
      DIC => lb_wdata(2),
      DID => '0',
      DOA => linebuf_reg_r2_768_831_0_2_n_0,
      DOB => linebuf_reg_r2_768_831_0_2_n_1,
      DOC => linebuf_reg_r2_768_831_0_2_n_2,
      DOD => NLW_linebuf_reg_r2_768_831_0_2_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_768_831_0_2_i_1_n_0
    );
linebuf_reg_r2_768_831_0_2_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00400000"
    )
        port map (
      I0 => \lb_waddr__0\(7),
      I1 => \lb_waddr__0\(9),
      I2 => \lb_waddr__0\(8),
      I3 => \lb_waddr__0\(6),
      I4 => lb_we,
      O => linebuf_reg_r2_768_831_0_2_i_1_n_0
    );
linebuf_reg_r2_768_831_12_14: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(12),
      DIB => lb_wdata(13),
      DIC => lb_wdata(14),
      DID => '0',
      DOA => linebuf_reg_r2_768_831_12_14_n_0,
      DOB => linebuf_reg_r2_768_831_12_14_n_1,
      DOC => linebuf_reg_r2_768_831_12_14_n_2,
      DOD => NLW_linebuf_reg_r2_768_831_12_14_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_768_831_0_2_i_1_n_0
    );
linebuf_reg_r2_768_831_15_17: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(15),
      DIB => lb_wdata(16),
      DIC => lb_wdata(17),
      DID => '0',
      DOA => linebuf_reg_r2_768_831_15_17_n_0,
      DOB => linebuf_reg_r2_768_831_15_17_n_1,
      DOC => linebuf_reg_r2_768_831_15_17_n_2,
      DOD => NLW_linebuf_reg_r2_768_831_15_17_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_768_831_0_2_i_1_n_0
    );
linebuf_reg_r2_768_831_18_20: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(18),
      DIB => lb_wdata(19),
      DIC => lb_wdata(20),
      DID => '0',
      DOA => linebuf_reg_r2_768_831_18_20_n_0,
      DOB => linebuf_reg_r2_768_831_18_20_n_1,
      DOC => linebuf_reg_r2_768_831_18_20_n_2,
      DOD => NLW_linebuf_reg_r2_768_831_18_20_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_768_831_0_2_i_1_n_0
    );
linebuf_reg_r2_768_831_21_23: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(21),
      DIB => lb_wdata(22),
      DIC => lb_wdata(23),
      DID => '0',
      DOA => linebuf_reg_r2_768_831_21_23_n_0,
      DOB => linebuf_reg_r2_768_831_21_23_n_1,
      DOC => linebuf_reg_r2_768_831_21_23_n_2,
      DOD => NLW_linebuf_reg_r2_768_831_21_23_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_768_831_0_2_i_1_n_0
    );
linebuf_reg_r2_768_831_24_26: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(24),
      DIB => lb_wdata(25),
      DIC => lb_wdata(26),
      DID => '0',
      DOA => linebuf_reg_r2_768_831_24_26_n_0,
      DOB => linebuf_reg_r2_768_831_24_26_n_1,
      DOC => linebuf_reg_r2_768_831_24_26_n_2,
      DOD => NLW_linebuf_reg_r2_768_831_24_26_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_768_831_0_2_i_1_n_0
    );
linebuf_reg_r2_768_831_27_29: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(27),
      DIB => lb_wdata(28),
      DIC => lb_wdata(29),
      DID => '0',
      DOA => linebuf_reg_r2_768_831_27_29_n_0,
      DOB => linebuf_reg_r2_768_831_27_29_n_1,
      DOC => linebuf_reg_r2_768_831_27_29_n_2,
      DOD => NLW_linebuf_reg_r2_768_831_27_29_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_768_831_0_2_i_1_n_0
    );
linebuf_reg_r2_768_831_30_31: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(30),
      DIB => lb_wdata(31),
      DIC => '0',
      DID => '0',
      DOA => linebuf_reg_r2_768_831_30_31_n_0,
      DOB => linebuf_reg_r2_768_831_30_31_n_1,
      DOC => NLW_linebuf_reg_r2_768_831_30_31_DOC_UNCONNECTED,
      DOD => NLW_linebuf_reg_r2_768_831_30_31_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_768_831_0_2_i_1_n_0
    );
linebuf_reg_r2_768_831_3_5: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRA(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRA(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRB(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRB(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRB(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRC(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRC(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRC(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(3),
      DIB => lb_wdata(4),
      DIC => lb_wdata(5),
      DID => '0',
      DOA => linebuf_reg_r2_768_831_3_5_n_0,
      DOB => linebuf_reg_r2_768_831_3_5_n_1,
      DOC => linebuf_reg_r2_768_831_3_5_n_2,
      DOD => NLW_linebuf_reg_r2_768_831_3_5_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_768_831_0_2_i_1_n_0
    );
linebuf_reg_r2_768_831_6_8: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRA(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRA(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRB(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRB(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRB(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRC(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRC(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRC(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(6),
      DIB => lb_wdata(7),
      DIC => lb_wdata(8),
      DID => '0',
      DOA => linebuf_reg_r2_768_831_6_8_n_0,
      DOB => linebuf_reg_r2_768_831_6_8_n_1,
      DOC => linebuf_reg_r2_768_831_6_8_n_2,
      DOD => NLW_linebuf_reg_r2_768_831_6_8_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_768_831_0_2_i_1_n_0
    );
linebuf_reg_r2_768_831_9_11: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(9),
      DIB => lb_wdata(10),
      DIC => lb_wdata(11),
      DID => '0',
      DOA => linebuf_reg_r2_768_831_9_11_n_0,
      DOB => linebuf_reg_r2_768_831_9_11_n_1,
      DOC => linebuf_reg_r2_768_831_9_11_n_2,
      DOD => NLW_linebuf_reg_r2_768_831_9_11_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_768_831_0_2_i_1_n_0
    );
linebuf_reg_r2_832_895_0_2: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRA(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRA(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRB(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRB(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRB(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRC(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRC(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRC(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(0),
      DIB => lb_wdata(1),
      DIC => lb_wdata(2),
      DID => '0',
      DOA => linebuf_reg_r2_832_895_0_2_n_0,
      DOB => linebuf_reg_r2_832_895_0_2_n_1,
      DOC => linebuf_reg_r2_832_895_0_2_n_2,
      DOD => NLW_linebuf_reg_r2_832_895_0_2_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_832_895_0_2_i_1_n_0
    );
linebuf_reg_r2_832_895_0_2_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"40000000"
    )
        port map (
      I0 => \lb_waddr__0\(7),
      I1 => \lb_waddr__0\(8),
      I2 => \lb_waddr__0\(6),
      I3 => lb_we,
      I4 => \lb_waddr__0\(9),
      O => linebuf_reg_r2_832_895_0_2_i_1_n_0
    );
linebuf_reg_r2_832_895_12_14: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(12),
      DIB => lb_wdata(13),
      DIC => lb_wdata(14),
      DID => '0',
      DOA => linebuf_reg_r2_832_895_12_14_n_0,
      DOB => linebuf_reg_r2_832_895_12_14_n_1,
      DOC => linebuf_reg_r2_832_895_12_14_n_2,
      DOD => NLW_linebuf_reg_r2_832_895_12_14_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_832_895_0_2_i_1_n_0
    );
linebuf_reg_r2_832_895_15_17: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(15),
      DIB => lb_wdata(16),
      DIC => lb_wdata(17),
      DID => '0',
      DOA => linebuf_reg_r2_832_895_15_17_n_0,
      DOB => linebuf_reg_r2_832_895_15_17_n_1,
      DOC => linebuf_reg_r2_832_895_15_17_n_2,
      DOD => NLW_linebuf_reg_r2_832_895_15_17_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_832_895_0_2_i_1_n_0
    );
linebuf_reg_r2_832_895_18_20: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(18),
      DIB => lb_wdata(19),
      DIC => lb_wdata(20),
      DID => '0',
      DOA => linebuf_reg_r2_832_895_18_20_n_0,
      DOB => linebuf_reg_r2_832_895_18_20_n_1,
      DOC => linebuf_reg_r2_832_895_18_20_n_2,
      DOD => NLW_linebuf_reg_r2_832_895_18_20_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_832_895_0_2_i_1_n_0
    );
linebuf_reg_r2_832_895_21_23: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(21),
      DIB => lb_wdata(22),
      DIC => lb_wdata(23),
      DID => '0',
      DOA => linebuf_reg_r2_832_895_21_23_n_0,
      DOB => linebuf_reg_r2_832_895_21_23_n_1,
      DOC => linebuf_reg_r2_832_895_21_23_n_2,
      DOD => NLW_linebuf_reg_r2_832_895_21_23_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_832_895_0_2_i_1_n_0
    );
linebuf_reg_r2_832_895_24_26: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(24),
      DIB => lb_wdata(25),
      DIC => lb_wdata(26),
      DID => '0',
      DOA => linebuf_reg_r2_832_895_24_26_n_0,
      DOB => linebuf_reg_r2_832_895_24_26_n_1,
      DOC => linebuf_reg_r2_832_895_24_26_n_2,
      DOD => NLW_linebuf_reg_r2_832_895_24_26_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_832_895_0_2_i_1_n_0
    );
linebuf_reg_r2_832_895_27_29: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(27),
      DIB => lb_wdata(28),
      DIC => lb_wdata(29),
      DID => '0',
      DOA => linebuf_reg_r2_832_895_27_29_n_0,
      DOB => linebuf_reg_r2_832_895_27_29_n_1,
      DOC => linebuf_reg_r2_832_895_27_29_n_2,
      DOD => NLW_linebuf_reg_r2_832_895_27_29_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_832_895_0_2_i_1_n_0
    );
linebuf_reg_r2_832_895_30_31: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(30),
      DIB => lb_wdata(31),
      DIC => '0',
      DID => '0',
      DOA => linebuf_reg_r2_832_895_30_31_n_0,
      DOB => linebuf_reg_r2_832_895_30_31_n_1,
      DOC => NLW_linebuf_reg_r2_832_895_30_31_DOC_UNCONNECTED,
      DOD => NLW_linebuf_reg_r2_832_895_30_31_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_832_895_0_2_i_1_n_0
    );
linebuf_reg_r2_832_895_3_5: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRA(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRA(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRB(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRB(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRB(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRC(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRC(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRC(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(3),
      DIB => lb_wdata(4),
      DIC => lb_wdata(5),
      DID => '0',
      DOA => linebuf_reg_r2_832_895_3_5_n_0,
      DOB => linebuf_reg_r2_832_895_3_5_n_1,
      DOC => linebuf_reg_r2_832_895_3_5_n_2,
      DOD => NLW_linebuf_reg_r2_832_895_3_5_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_832_895_0_2_i_1_n_0
    );
linebuf_reg_r2_832_895_6_8: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRA(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRA(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRB(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRB(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRB(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRC(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRC(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRC(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(6),
      DIB => lb_wdata(7),
      DIC => lb_wdata(8),
      DID => '0',
      DOA => linebuf_reg_r2_832_895_6_8_n_0,
      DOB => linebuf_reg_r2_832_895_6_8_n_1,
      DOC => linebuf_reg_r2_832_895_6_8_n_2,
      DOD => NLW_linebuf_reg_r2_832_895_6_8_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_832_895_0_2_i_1_n_0
    );
linebuf_reg_r2_832_895_9_11: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(9),
      DIB => lb_wdata(10),
      DIC => lb_wdata(11),
      DID => '0',
      DOA => linebuf_reg_r2_832_895_9_11_n_0,
      DOB => linebuf_reg_r2_832_895_9_11_n_1,
      DOC => linebuf_reg_r2_832_895_9_11_n_2,
      DOD => NLW_linebuf_reg_r2_832_895_9_11_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_832_895_0_2_i_1_n_0
    );
linebuf_reg_r2_896_959_0_2: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRA(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRA(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRB(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRB(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRB(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRC(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRC(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRC(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(0),
      DIB => lb_wdata(1),
      DIC => lb_wdata(2),
      DID => '0',
      DOA => linebuf_reg_r2_896_959_0_2_n_0,
      DOB => linebuf_reg_r2_896_959_0_2_n_1,
      DOC => linebuf_reg_r2_896_959_0_2_n_2,
      DOD => NLW_linebuf_reg_r2_896_959_0_2_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_896_959_0_2_i_1_n_0
    );
linebuf_reg_r2_896_959_0_2_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"40000000"
    )
        port map (
      I0 => \lb_waddr__0\(6),
      I1 => \lb_waddr__0\(8),
      I2 => \lb_waddr__0\(7),
      I3 => lb_we,
      I4 => \lb_waddr__0\(9),
      O => linebuf_reg_r2_896_959_0_2_i_1_n_0
    );
linebuf_reg_r2_896_959_12_14: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(12),
      DIB => lb_wdata(13),
      DIC => lb_wdata(14),
      DID => '0',
      DOA => linebuf_reg_r2_896_959_12_14_n_0,
      DOB => linebuf_reg_r2_896_959_12_14_n_1,
      DOC => linebuf_reg_r2_896_959_12_14_n_2,
      DOD => NLW_linebuf_reg_r2_896_959_12_14_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_896_959_0_2_i_1_n_0
    );
linebuf_reg_r2_896_959_15_17: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(15),
      DIB => lb_wdata(16),
      DIC => lb_wdata(17),
      DID => '0',
      DOA => linebuf_reg_r2_896_959_15_17_n_0,
      DOB => linebuf_reg_r2_896_959_15_17_n_1,
      DOC => linebuf_reg_r2_896_959_15_17_n_2,
      DOD => NLW_linebuf_reg_r2_896_959_15_17_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_896_959_0_2_i_1_n_0
    );
linebuf_reg_r2_896_959_18_20: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(18),
      DIB => lb_wdata(19),
      DIC => lb_wdata(20),
      DID => '0',
      DOA => linebuf_reg_r2_896_959_18_20_n_0,
      DOB => linebuf_reg_r2_896_959_18_20_n_1,
      DOC => linebuf_reg_r2_896_959_18_20_n_2,
      DOD => NLW_linebuf_reg_r2_896_959_18_20_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_896_959_0_2_i_1_n_0
    );
linebuf_reg_r2_896_959_21_23: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(21),
      DIB => lb_wdata(22),
      DIC => lb_wdata(23),
      DID => '0',
      DOA => linebuf_reg_r2_896_959_21_23_n_0,
      DOB => linebuf_reg_r2_896_959_21_23_n_1,
      DOC => linebuf_reg_r2_896_959_21_23_n_2,
      DOD => NLW_linebuf_reg_r2_896_959_21_23_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_896_959_0_2_i_1_n_0
    );
linebuf_reg_r2_896_959_24_26: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(24),
      DIB => lb_wdata(25),
      DIC => lb_wdata(26),
      DID => '0',
      DOA => linebuf_reg_r2_896_959_24_26_n_0,
      DOB => linebuf_reg_r2_896_959_24_26_n_1,
      DOC => linebuf_reg_r2_896_959_24_26_n_2,
      DOD => NLW_linebuf_reg_r2_896_959_24_26_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_896_959_0_2_i_1_n_0
    );
linebuf_reg_r2_896_959_27_29: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(27),
      DIB => lb_wdata(28),
      DIC => lb_wdata(29),
      DID => '0',
      DOA => linebuf_reg_r2_896_959_27_29_n_0,
      DOB => linebuf_reg_r2_896_959_27_29_n_1,
      DOC => linebuf_reg_r2_896_959_27_29_n_2,
      DOD => NLW_linebuf_reg_r2_896_959_27_29_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_896_959_0_2_i_1_n_0
    );
linebuf_reg_r2_896_959_30_31: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(30),
      DIB => lb_wdata(31),
      DIC => '0',
      DID => '0',
      DOA => linebuf_reg_r2_896_959_30_31_n_0,
      DOB => linebuf_reg_r2_896_959_30_31_n_1,
      DOC => NLW_linebuf_reg_r2_896_959_30_31_DOC_UNCONNECTED,
      DOD => NLW_linebuf_reg_r2_896_959_30_31_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_896_959_0_2_i_1_n_0
    );
linebuf_reg_r2_896_959_3_5: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRA(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRA(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRB(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRB(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRB(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRC(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRC(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRC(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(3),
      DIB => lb_wdata(4),
      DIC => lb_wdata(5),
      DID => '0',
      DOA => linebuf_reg_r2_896_959_3_5_n_0,
      DOB => linebuf_reg_r2_896_959_3_5_n_1,
      DOC => linebuf_reg_r2_896_959_3_5_n_2,
      DOD => NLW_linebuf_reg_r2_896_959_3_5_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_896_959_0_2_i_1_n_0
    );
linebuf_reg_r2_896_959_6_8: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRA(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRA(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRB(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRB(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRB(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRC(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRC(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRC(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(6),
      DIB => lb_wdata(7),
      DIC => lb_wdata(8),
      DID => '0',
      DOA => linebuf_reg_r2_896_959_6_8_n_0,
      DOB => linebuf_reg_r2_896_959_6_8_n_1,
      DOC => linebuf_reg_r2_896_959_6_8_n_2,
      DOD => NLW_linebuf_reg_r2_896_959_6_8_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_896_959_0_2_i_1_n_0
    );
linebuf_reg_r2_896_959_9_11: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(9),
      DIB => lb_wdata(10),
      DIC => lb_wdata(11),
      DID => '0',
      DOA => linebuf_reg_r2_896_959_9_11_n_0,
      DOB => linebuf_reg_r2_896_959_9_11_n_1,
      DOC => linebuf_reg_r2_896_959_9_11_n_2,
      DOD => NLW_linebuf_reg_r2_896_959_9_11_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_896_959_0_2_i_1_n_0
    );
linebuf_reg_r2_960_1023_0_2: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRA(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRA(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRB(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRB(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRB(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRC(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRC(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRC(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(0),
      DIB => lb_wdata(1),
      DIC => lb_wdata(2),
      DID => '0',
      DOA => linebuf_reg_r2_960_1023_0_2_n_0,
      DOB => linebuf_reg_r2_960_1023_0_2_n_1,
      DOC => linebuf_reg_r2_960_1023_0_2_n_2,
      DOD => NLW_linebuf_reg_r2_960_1023_0_2_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_960_1023_0_2_i_1_n_0
    );
linebuf_reg_r2_960_1023_0_2_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => lb_we,
      I1 => \lb_waddr__0\(7),
      I2 => \lb_waddr__0\(6),
      I3 => \lb_waddr__0\(9),
      I4 => \lb_waddr__0\(8),
      O => linebuf_reg_r2_960_1023_0_2_i_1_n_0
    );
linebuf_reg_r2_960_1023_12_14: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(12),
      DIB => lb_wdata(13),
      DIC => lb_wdata(14),
      DID => '0',
      DOA => linebuf_reg_r2_960_1023_12_14_n_0,
      DOB => linebuf_reg_r2_960_1023_12_14_n_1,
      DOC => linebuf_reg_r2_960_1023_12_14_n_2,
      DOD => NLW_linebuf_reg_r2_960_1023_12_14_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_960_1023_0_2_i_1_n_0
    );
linebuf_reg_r2_960_1023_15_17: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(15),
      DIB => lb_wdata(16),
      DIC => lb_wdata(17),
      DID => '0',
      DOA => linebuf_reg_r2_960_1023_15_17_n_0,
      DOB => linebuf_reg_r2_960_1023_15_17_n_1,
      DOC => linebuf_reg_r2_960_1023_15_17_n_2,
      DOD => NLW_linebuf_reg_r2_960_1023_15_17_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_960_1023_0_2_i_1_n_0
    );
linebuf_reg_r2_960_1023_18_20: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(18),
      DIB => lb_wdata(19),
      DIC => lb_wdata(20),
      DID => '0',
      DOA => linebuf_reg_r2_960_1023_18_20_n_0,
      DOB => linebuf_reg_r2_960_1023_18_20_n_1,
      DOC => linebuf_reg_r2_960_1023_18_20_n_2,
      DOD => NLW_linebuf_reg_r2_960_1023_18_20_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_960_1023_0_2_i_1_n_0
    );
linebuf_reg_r2_960_1023_21_23: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_15_17_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(21),
      DIB => lb_wdata(22),
      DIC => lb_wdata(23),
      DID => '0',
      DOA => linebuf_reg_r2_960_1023_21_23_n_0,
      DOB => linebuf_reg_r2_960_1023_21_23_n_1,
      DOC => linebuf_reg_r2_960_1023_21_23_n_2,
      DOD => NLW_linebuf_reg_r2_960_1023_21_23_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_960_1023_0_2_i_1_n_0
    );
linebuf_reg_r2_960_1023_24_26: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_18_20_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_18_20_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_18_20_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_18_20_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_18_20_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(24),
      DIB => lb_wdata(25),
      DIC => lb_wdata(26),
      DID => '0',
      DOA => linebuf_reg_r2_960_1023_24_26_n_0,
      DOB => linebuf_reg_r2_960_1023_24_26_n_1,
      DOC => linebuf_reg_r2_960_1023_24_26_n_2,
      DOD => NLW_linebuf_reg_r2_960_1023_24_26_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_960_1023_0_2_i_1_n_0
    );
linebuf_reg_r2_960_1023_27_29: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(27),
      DIB => lb_wdata(28),
      DIC => lb_wdata(29),
      DID => '0',
      DOA => linebuf_reg_r2_960_1023_27_29_n_0,
      DOB => linebuf_reg_r2_960_1023_27_29_n_1,
      DOC => linebuf_reg_r2_960_1023_27_29_n_2,
      DOD => NLW_linebuf_reg_r2_960_1023_27_29_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_960_1023_0_2_i_1_n_0
    );
linebuf_reg_r2_960_1023_30_31: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_27_29_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_27_29_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_24_26_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_27_29_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_27_29_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_27_29_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(30),
      DIB => lb_wdata(31),
      DIC => '0',
      DID => '0',
      DOA => linebuf_reg_r2_960_1023_30_31_n_0,
      DOB => linebuf_reg_r2_960_1023_30_31_n_1,
      DOC => NLW_linebuf_reg_r2_960_1023_30_31_DOC_UNCONNECTED,
      DOD => NLW_linebuf_reg_r2_960_1023_30_31_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_960_1023_0_2_i_1_n_0
    );
linebuf_reg_r2_960_1023_3_5: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRA(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRA(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRB(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRB(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRB(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRC(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRC(3) => linebuf_reg_r2_0_63_0_2_i_3_n_0,
      ADDRC(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(3),
      DIB => lb_wdata(4),
      DIC => lb_wdata(5),
      DID => '0',
      DOA => linebuf_reg_r2_960_1023_3_5_n_0,
      DOB => linebuf_reg_r2_960_1023_3_5_n_1,
      DOC => linebuf_reg_r2_960_1023_3_5_n_2,
      DOD => NLW_linebuf_reg_r2_960_1023_3_5_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_960_1023_0_2_i_1_n_0
    );
linebuf_reg_r2_960_1023_6_8: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRA(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRA(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRB(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRB(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRB(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRC(5 downto 4) => rd_addr_next0(5 downto 4),
      ADDRC(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRC(2 downto 0) => rd_addr_next0(2 downto 0),
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(6),
      DIB => lb_wdata(7),
      DIC => lb_wdata(8),
      DID => '0',
      DOA => linebuf_reg_r2_960_1023_6_8_n_0,
      DOB => linebuf_reg_r2_960_1023_6_8_n_1,
      DOC => linebuf_reg_r2_960_1023_6_8_n_2,
      DOD => NLW_linebuf_reg_r2_960_1023_6_8_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_960_1023_0_2_i_1_n_0
    );
linebuf_reg_r2_960_1023_9_11: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRA(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRA(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRA(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRA(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRA(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRB(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRB(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRB(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRB(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRB(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRB(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRC(5) => linebuf_reg_r2_0_63_9_11_i_1_n_0,
      ADDRC(4) => linebuf_reg_r2_0_63_9_11_i_2_n_0,
      ADDRC(3) => linebuf_reg_r2_0_63_6_8_i_1_n_0,
      ADDRC(2) => linebuf_reg_r2_0_63_9_11_i_3_n_0,
      ADDRC(1) => linebuf_reg_r2_0_63_9_11_i_4_n_0,
      ADDRC(0) => linebuf_reg_r2_0_63_9_11_i_5_n_0,
      ADDRD(5 downto 0) => \lb_waddr__0\(5 downto 0),
      DIA => lb_wdata(9),
      DIB => lb_wdata(10),
      DIC => lb_wdata(11),
      DID => '0',
      DOA => linebuf_reg_r2_960_1023_9_11_n_0,
      DOB => linebuf_reg_r2_960_1023_9_11_n_1,
      DOC => linebuf_reg_r2_960_1023_9_11_n_2,
      DOD => NLW_linebuf_reg_r2_960_1023_9_11_DOD_UNCONNECTED,
      WCLK => aclk,
      WE => linebuf_reg_r2_960_1023_0_2_i_1_n_0
    );
mono_p1_reg: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => ctrl_mono,
      Q => mono_p1,
      R => '0'
    );
mono_p2_reg: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => mono_p1,
      Q => mono_p2,
      R => '0'
    );
\pix_alive[0]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \pix_alive_reg_n_0_[0]\,
      O => \pix_alive[0]_i_2_n_0\
    );
\pix_alive_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => \pix_alive_reg[0]_i_1_n_7\,
      Q => \pix_alive_reg_n_0_[0]\,
      R => '0'
    );
\pix_alive_reg[0]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \pix_alive_reg[0]_i_1_n_0\,
      CO(2) => \pix_alive_reg[0]_i_1_n_1\,
      CO(1) => \pix_alive_reg[0]_i_1_n_2\,
      CO(0) => \pix_alive_reg[0]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \pix_alive_reg[0]_i_1_n_4\,
      O(2) => \pix_alive_reg[0]_i_1_n_5\,
      O(1) => \pix_alive_reg[0]_i_1_n_6\,
      O(0) => \pix_alive_reg[0]_i_1_n_7\,
      S(3) => \pix_alive_reg_n_0_[3]\,
      S(2) => \pix_alive_reg_n_0_[2]\,
      S(1) => \pix_alive_reg_n_0_[1]\,
      S(0) => \pix_alive[0]_i_2_n_0\
    );
\pix_alive_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => \pix_alive_reg[8]_i_1_n_5\,
      Q => \pix_alive_reg_n_0_[10]\,
      R => '0'
    );
\pix_alive_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => \pix_alive_reg[8]_i_1_n_4\,
      Q => \pix_alive_reg_n_0_[11]\,
      R => '0'
    );
\pix_alive_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => \pix_alive_reg[12]_i_1_n_7\,
      Q => \pix_alive_reg_n_0_[12]\,
      R => '0'
    );
\pix_alive_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \pix_alive_reg[8]_i_1_n_0\,
      CO(3) => \pix_alive_reg[12]_i_1_n_0\,
      CO(2) => \pix_alive_reg[12]_i_1_n_1\,
      CO(1) => \pix_alive_reg[12]_i_1_n_2\,
      CO(0) => \pix_alive_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \pix_alive_reg[12]_i_1_n_4\,
      O(2) => \pix_alive_reg[12]_i_1_n_5\,
      O(1) => \pix_alive_reg[12]_i_1_n_6\,
      O(0) => \pix_alive_reg[12]_i_1_n_7\,
      S(3) => \pix_alive_reg_n_0_[15]\,
      S(2) => \pix_alive_reg_n_0_[14]\,
      S(1) => \pix_alive_reg_n_0_[13]\,
      S(0) => \pix_alive_reg_n_0_[12]\
    );
\pix_alive_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => \pix_alive_reg[12]_i_1_n_6\,
      Q => \pix_alive_reg_n_0_[13]\,
      R => '0'
    );
\pix_alive_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => \pix_alive_reg[12]_i_1_n_5\,
      Q => \pix_alive_reg_n_0_[14]\,
      R => '0'
    );
\pix_alive_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => \pix_alive_reg[12]_i_1_n_4\,
      Q => \pix_alive_reg_n_0_[15]\,
      R => '0'
    );
\pix_alive_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => \pix_alive_reg[16]_i_1_n_7\,
      Q => p_0_in(0),
      R => '0'
    );
\pix_alive_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \pix_alive_reg[12]_i_1_n_0\,
      CO(3) => \pix_alive_reg[16]_i_1_n_0\,
      CO(2) => \pix_alive_reg[16]_i_1_n_1\,
      CO(1) => \pix_alive_reg[16]_i_1_n_2\,
      CO(0) => \pix_alive_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \pix_alive_reg[16]_i_1_n_4\,
      O(2) => \pix_alive_reg[16]_i_1_n_5\,
      O(1) => \pix_alive_reg[16]_i_1_n_6\,
      O(0) => \pix_alive_reg[16]_i_1_n_7\,
      S(3 downto 0) => p_0_in(3 downto 0)
    );
\pix_alive_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => \pix_alive_reg[16]_i_1_n_6\,
      Q => p_0_in(1),
      R => '0'
    );
\pix_alive_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => \pix_alive_reg[16]_i_1_n_5\,
      Q => p_0_in(2),
      R => '0'
    );
\pix_alive_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => \pix_alive_reg[16]_i_1_n_4\,
      Q => p_0_in(3),
      R => '0'
    );
\pix_alive_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => \pix_alive_reg[0]_i_1_n_6\,
      Q => \pix_alive_reg_n_0_[1]\,
      R => '0'
    );
\pix_alive_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => \pix_alive_reg[20]_i_1_n_7\,
      Q => p_0_in(4),
      R => '0'
    );
\pix_alive_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \pix_alive_reg[16]_i_1_n_0\,
      CO(3) => \NLW_pix_alive_reg[20]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \pix_alive_reg[20]_i_1_n_1\,
      CO(1) => \pix_alive_reg[20]_i_1_n_2\,
      CO(0) => \pix_alive_reg[20]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \pix_alive_reg[20]_i_1_n_4\,
      O(2) => \pix_alive_reg[20]_i_1_n_5\,
      O(1) => \pix_alive_reg[20]_i_1_n_6\,
      O(0) => \pix_alive_reg[20]_i_1_n_7\,
      S(3 downto 0) => p_0_in(7 downto 4)
    );
\pix_alive_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => \pix_alive_reg[20]_i_1_n_6\,
      Q => p_0_in(5),
      R => '0'
    );
\pix_alive_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => \pix_alive_reg[20]_i_1_n_5\,
      Q => p_0_in(6),
      R => '0'
    );
\pix_alive_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => \pix_alive_reg[20]_i_1_n_4\,
      Q => p_0_in(7),
      R => '0'
    );
\pix_alive_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => \pix_alive_reg[0]_i_1_n_5\,
      Q => \pix_alive_reg_n_0_[2]\,
      R => '0'
    );
\pix_alive_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => \pix_alive_reg[0]_i_1_n_4\,
      Q => \pix_alive_reg_n_0_[3]\,
      R => '0'
    );
\pix_alive_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => \pix_alive_reg[4]_i_1_n_7\,
      Q => \pix_alive_reg_n_0_[4]\,
      R => '0'
    );
\pix_alive_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \pix_alive_reg[0]_i_1_n_0\,
      CO(3) => \pix_alive_reg[4]_i_1_n_0\,
      CO(2) => \pix_alive_reg[4]_i_1_n_1\,
      CO(1) => \pix_alive_reg[4]_i_1_n_2\,
      CO(0) => \pix_alive_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \pix_alive_reg[4]_i_1_n_4\,
      O(2) => \pix_alive_reg[4]_i_1_n_5\,
      O(1) => \pix_alive_reg[4]_i_1_n_6\,
      O(0) => \pix_alive_reg[4]_i_1_n_7\,
      S(3) => \pix_alive_reg_n_0_[7]\,
      S(2) => \pix_alive_reg_n_0_[6]\,
      S(1) => \pix_alive_reg_n_0_[5]\,
      S(0) => \pix_alive_reg_n_0_[4]\
    );
\pix_alive_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => \pix_alive_reg[4]_i_1_n_6\,
      Q => \pix_alive_reg_n_0_[5]\,
      R => '0'
    );
\pix_alive_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => \pix_alive_reg[4]_i_1_n_5\,
      Q => \pix_alive_reg_n_0_[6]\,
      R => '0'
    );
\pix_alive_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => \pix_alive_reg[4]_i_1_n_4\,
      Q => \pix_alive_reg_n_0_[7]\,
      R => '0'
    );
\pix_alive_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => \pix_alive_reg[8]_i_1_n_7\,
      Q => \pix_alive_reg_n_0_[8]\,
      R => '0'
    );
\pix_alive_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \pix_alive_reg[4]_i_1_n_0\,
      CO(3) => \pix_alive_reg[8]_i_1_n_0\,
      CO(2) => \pix_alive_reg[8]_i_1_n_1\,
      CO(1) => \pix_alive_reg[8]_i_1_n_2\,
      CO(0) => \pix_alive_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \pix_alive_reg[8]_i_1_n_4\,
      O(2) => \pix_alive_reg[8]_i_1_n_5\,
      O(1) => \pix_alive_reg[8]_i_1_n_6\,
      O(0) => \pix_alive_reg[8]_i_1_n_7\,
      S(3) => \pix_alive_reg_n_0_[11]\,
      S(2) => \pix_alive_reg_n_0_[10]\,
      S(1) => \pix_alive_reg_n_0_[9]\,
      S(0) => \pix_alive_reg_n_0_[8]\
    );
\pix_alive_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => \pix_alive_reg[8]_i_1_n_6\,
      Q => \pix_alive_reg_n_0_[9]\,
      R => '0'
    );
\pix_alive_s1_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => aresetn,
      D => p_0_in(0),
      Q => pix_alive_s1(0),
      R => '0'
    );
\pix_alive_s1_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => aresetn,
      D => p_0_in(1),
      Q => pix_alive_s1(1),
      R => '0'
    );
\pix_alive_s1_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => aresetn,
      D => p_0_in(2),
      Q => pix_alive_s1(2),
      R => '0'
    );
\pix_alive_s1_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => aresetn,
      D => p_0_in(3),
      Q => pix_alive_s1(3),
      R => '0'
    );
\pix_alive_s1_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => aresetn,
      D => p_0_in(4),
      Q => pix_alive_s1(4),
      R => '0'
    );
\pix_alive_s1_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => aresetn,
      D => p_0_in(5),
      Q => pix_alive_s1(5),
      R => '0'
    );
\pix_alive_s1_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => aresetn,
      D => p_0_in(6),
      Q => pix_alive_s1(6),
      R => '0'
    );
\pix_alive_s1_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => aresetn,
      D => p_0_in(7),
      Q => pix_alive_s1(7),
      R => '0'
    );
\pix_alive_s2_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => aresetn,
      D => pix_alive_s1(0),
      Q => data2(16),
      R => '0'
    );
\pix_alive_s2_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => aresetn,
      D => pix_alive_s1(1),
      Q => data2(17),
      R => '0'
    );
\pix_alive_s2_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => aresetn,
      D => pix_alive_s1(2),
      Q => data2(18),
      R => '0'
    );
\pix_alive_s2_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => aresetn,
      D => pix_alive_s1(3),
      Q => data2(19),
      R => '0'
    );
\pix_alive_s2_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => aresetn,
      D => pix_alive_s1(4),
      Q => data2(20),
      R => '0'
    );
\pix_alive_s2_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => aresetn,
      D => pix_alive_s1(5),
      Q => data2(21),
      R => '0'
    );
\pix_alive_s2_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => aresetn,
      D => pix_alive_s1(6),
      Q => data2(22),
      R => '0'
    );
\pix_alive_s2_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => aresetn,
      D => pix_alive_s1(7),
      Q => data2(23),
      R => '0'
    );
\rdata_q[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFBAAA"
    )
        port map (
      I0 => \rdata_q[31]_i_4_n_0\,
      I1 => araddr_q(2),
      I2 => araddr_q(3),
      I3 => data2(0),
      I4 => \rdata_q[0]_i_2_n_0\,
      O => \rdata_q[0]_i_1_n_0\
    );
\rdata_q[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AA00F0CC"
    )
        port map (
      I0 => i2c_sda_low,
      I1 => p_3_in(0),
      I2 => fb_base(0),
      I3 => araddr_q(2),
      I4 => araddr_q(3),
      O => \rdata_q[0]_i_2_n_0\
    );
\rdata_q[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAEEFAAA"
    )
        port map (
      I0 => \rdata_q[31]_i_4_n_0\,
      I1 => fb_base(10),
      I2 => data2(10),
      I3 => araddr_q(3),
      I4 => araddr_q(2),
      O => \rdata_q[10]_i_1_n_0\
    );
\rdata_q[11]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAEEFAAA"
    )
        port map (
      I0 => \rdata_q[31]_i_4_n_0\,
      I1 => fb_base(11),
      I2 => data2(11),
      I3 => araddr_q(3),
      I4 => araddr_q(2),
      O => \rdata_q[11]_i_1_n_0\
    );
\rdata_q[12]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAEEFAAA"
    )
        port map (
      I0 => \rdata_q[31]_i_4_n_0\,
      I1 => fb_base(12),
      I2 => data2(12),
      I3 => araddr_q(3),
      I4 => araddr_q(2),
      O => \rdata_q[12]_i_1_n_0\
    );
\rdata_q[13]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAEEFAAA"
    )
        port map (
      I0 => \rdata_q[31]_i_4_n_0\,
      I1 => fb_base(13),
      I2 => data2(13),
      I3 => araddr_q(3),
      I4 => araddr_q(2),
      O => \rdata_q[13]_i_1_n_0\
    );
\rdata_q[14]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000CA0"
    )
        port map (
      I0 => data2(14),
      I1 => fb_base(14),
      I2 => araddr_q(3),
      I3 => araddr_q(2),
      I4 => \rdata_q[31]_i_4_n_0\,
      O => \rdata_q[14]_i_1_n_0\
    );
\rdata_q[15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAEEFAAA"
    )
        port map (
      I0 => \rdata_q[31]_i_4_n_0\,
      I1 => fb_base(15),
      I2 => data2(15),
      I3 => araddr_q(3),
      I4 => araddr_q(2),
      O => \rdata_q[15]_i_1_n_0\
    );
\rdata_q[16]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAEEFAAA"
    )
        port map (
      I0 => \rdata_q[31]_i_4_n_0\,
      I1 => fb_base(16),
      I2 => data2(16),
      I3 => araddr_q(3),
      I4 => araddr_q(2),
      O => \rdata_q[16]_i_1_n_0\
    );
\rdata_q[17]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000CA0"
    )
        port map (
      I0 => data2(17),
      I1 => fb_base(17),
      I2 => araddr_q(3),
      I3 => araddr_q(2),
      I4 => \rdata_q[31]_i_4_n_0\,
      O => \rdata_q[17]_i_1_n_0\
    );
\rdata_q[18]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAEEFAAA"
    )
        port map (
      I0 => \rdata_q[31]_i_4_n_0\,
      I1 => fb_base(18),
      I2 => data2(18),
      I3 => araddr_q(3),
      I4 => araddr_q(2),
      O => \rdata_q[18]_i_1_n_0\
    );
\rdata_q[19]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAEEFAAA"
    )
        port map (
      I0 => \rdata_q[31]_i_4_n_0\,
      I1 => fb_base(19),
      I2 => data2(19),
      I3 => araddr_q(3),
      I4 => araddr_q(2),
      O => \rdata_q[19]_i_1_n_0\
    );
\rdata_q[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFD9C85140"
    )
        port map (
      I0 => araddr_q(3),
      I1 => araddr_q(2),
      I2 => fb_base(1),
      I3 => ctrl_yc_swap,
      I4 => i2c_scl_low,
      I5 => \rdata_q[31]_i_4_n_0\,
      O => \rdata_q[1]_i_1_n_0\
    );
\rdata_q[20]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000CA0"
    )
        port map (
      I0 => data2(20),
      I1 => fb_base(20),
      I2 => araddr_q(3),
      I3 => araddr_q(2),
      I4 => \rdata_q[31]_i_4_n_0\,
      O => \rdata_q[20]_i_1_n_0\
    );
\rdata_q[21]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAEEFAAA"
    )
        port map (
      I0 => \rdata_q[31]_i_4_n_0\,
      I1 => fb_base(21),
      I2 => data2(21),
      I3 => araddr_q(3),
      I4 => araddr_q(2),
      O => \rdata_q[21]_i_1_n_0\
    );
\rdata_q[22]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000CA0"
    )
        port map (
      I0 => data2(22),
      I1 => fb_base(22),
      I2 => araddr_q(3),
      I3 => araddr_q(2),
      I4 => \rdata_q[31]_i_4_n_0\,
      O => \rdata_q[22]_i_1_n_0\
    );
\rdata_q[23]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAEEFAAA"
    )
        port map (
      I0 => \rdata_q[31]_i_4_n_0\,
      I1 => fb_base(23),
      I2 => data2(23),
      I3 => araddr_q(3),
      I4 => araddr_q(2),
      O => \rdata_q[23]_i_1_n_0\
    );
\rdata_q[24]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0400"
    )
        port map (
      I0 => \rdata_q[31]_i_4_n_0\,
      I1 => araddr_q(2),
      I2 => araddr_q(3),
      I3 => fb_base(24),
      O => \rdata_q[24]_i_1_n_0\
    );
\rdata_q[25]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF08"
    )
        port map (
      I0 => fb_base(25),
      I1 => araddr_q(2),
      I2 => araddr_q(3),
      I3 => \rdata_q[31]_i_4_n_0\,
      O => \rdata_q[25]_i_1_n_0\
    );
\rdata_q[26]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF08"
    )
        port map (
      I0 => fb_base(26),
      I1 => araddr_q(2),
      I2 => araddr_q(3),
      I3 => \rdata_q[31]_i_4_n_0\,
      O => \rdata_q[26]_i_1_n_0\
    );
\rdata_q[27]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF08"
    )
        port map (
      I0 => fb_base(27),
      I1 => araddr_q(2),
      I2 => araddr_q(3),
      I3 => \rdata_q[31]_i_4_n_0\,
      O => \rdata_q[27]_i_1_n_0\
    );
\rdata_q[28]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF08"
    )
        port map (
      I0 => fb_base(28),
      I1 => araddr_q(2),
      I2 => araddr_q(3),
      I3 => \rdata_q[31]_i_4_n_0\,
      O => \rdata_q[28]_i_1_n_0\
    );
\rdata_q[29]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0400"
    )
        port map (
      I0 => \rdata_q[31]_i_4_n_0\,
      I1 => araddr_q(2),
      I2 => araddr_q(3),
      I3 => fb_base(29),
      O => \rdata_q[29]_i_1_n_0\
    );
\rdata_q[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAFAEE"
    )
        port map (
      I0 => \rdata_q[31]_i_4_n_0\,
      I1 => ctrl_cbcr_swap,
      I2 => fb_base(2),
      I3 => araddr_q(2),
      I4 => araddr_q(3),
      O => \rdata_q[2]_i_1_n_0\
    );
\rdata_q[30]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF08"
    )
        port map (
      I0 => fb_base(30),
      I1 => araddr_q(2),
      I2 => araddr_q(3),
      I3 => \rdata_q[31]_i_4_n_0\,
      O => \rdata_q[30]_i_1_n_0\
    );
\rdata_q[31]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => aresetn,
      O => \rdata_q[31]_i_1_n_0\
    );
\rdata_q[31]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => ar_done_reg_n_0,
      I1 => \^rvalid_q_reg_0\,
      O => rvalid_q0
    );
\rdata_q[31]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF08"
    )
        port map (
      I0 => fb_base(31),
      I1 => araddr_q(2),
      I2 => araddr_q(3),
      I3 => \rdata_q[31]_i_4_n_0\,
      O => \rdata_q[31]_i_3_n_0\
    );
\rdata_q[31]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => araddr_q(6),
      I1 => araddr_q(7),
      I2 => araddr_q(4),
      I3 => araddr_q(5),
      I4 => araddr_q(1),
      I5 => araddr_q(0),
      O => \rdata_q[31]_i_4_n_0\
    );
\rdata_q[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAFAEE"
    )
        port map (
      I0 => \rdata_q[31]_i_4_n_0\,
      I1 => p_3_in(3),
      I2 => fb_base(3),
      I3 => araddr_q(2),
      I4 => araddr_q(3),
      O => \rdata_q[3]_i_1_n_0\
    );
\rdata_q[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0400"
    )
        port map (
      I0 => \rdata_q[31]_i_4_n_0\,
      I1 => araddr_q(2),
      I2 => araddr_q(3),
      I3 => fb_base(4),
      O => \rdata_q[4]_i_1_n_0\
    );
\rdata_q[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF08"
    )
        port map (
      I0 => fb_base(5),
      I1 => araddr_q(2),
      I2 => araddr_q(3),
      I3 => \rdata_q[31]_i_4_n_0\,
      O => \rdata_q[5]_i_1_n_0\
    );
\rdata_q[6]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF08"
    )
        port map (
      I0 => fb_base(6),
      I1 => araddr_q(2),
      I2 => araddr_q(3),
      I3 => \rdata_q[31]_i_4_n_0\,
      O => \rdata_q[6]_i_1_n_0\
    );
\rdata_q[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF08"
    )
        port map (
      I0 => fb_base(7),
      I1 => araddr_q(2),
      I2 => araddr_q(3),
      I3 => \rdata_q[31]_i_4_n_0\,
      O => \rdata_q[7]_i_1_n_0\
    );
\rdata_q[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000CAF00000CA00"
    )
        port map (
      I0 => data2(8),
      I1 => sda_in,
      I2 => araddr_q(2),
      I3 => araddr_q(3),
      I4 => \rdata_q[31]_i_4_n_0\,
      I5 => fb_base(8),
      O => \rdata_q[8]_i_1_n_0\
    );
\rdata_q[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFEAC86240"
    )
        port map (
      I0 => araddr_q(2),
      I1 => araddr_q(3),
      I2 => data2(9),
      I3 => fb_base(9),
      I4 => scl_in,
      I5 => \rdata_q[31]_i_4_n_0\,
      O => \rdata_q[9]_i_1_n_0\
    );
\rdata_q_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => rvalid_q0,
      D => \rdata_q[0]_i_1_n_0\,
      Q => s_axi_lite_rdata(0),
      R => \rdata_q[31]_i_1_n_0\
    );
\rdata_q_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => rvalid_q0,
      D => \rdata_q[10]_i_1_n_0\,
      Q => s_axi_lite_rdata(10),
      R => \rdata_q[31]_i_1_n_0\
    );
\rdata_q_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => rvalid_q0,
      D => \rdata_q[11]_i_1_n_0\,
      Q => s_axi_lite_rdata(11),
      R => \rdata_q[31]_i_1_n_0\
    );
\rdata_q_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => rvalid_q0,
      D => \rdata_q[12]_i_1_n_0\,
      Q => s_axi_lite_rdata(12),
      R => \rdata_q[31]_i_1_n_0\
    );
\rdata_q_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => rvalid_q0,
      D => \rdata_q[13]_i_1_n_0\,
      Q => s_axi_lite_rdata(13),
      R => \rdata_q[31]_i_1_n_0\
    );
\rdata_q_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => rvalid_q0,
      D => \rdata_q[14]_i_1_n_0\,
      Q => s_axi_lite_rdata(14),
      R => \rdata_q[31]_i_1_n_0\
    );
\rdata_q_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => rvalid_q0,
      D => \rdata_q[15]_i_1_n_0\,
      Q => s_axi_lite_rdata(15),
      R => \rdata_q[31]_i_1_n_0\
    );
\rdata_q_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => rvalid_q0,
      D => \rdata_q[16]_i_1_n_0\,
      Q => s_axi_lite_rdata(16),
      R => \rdata_q[31]_i_1_n_0\
    );
\rdata_q_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => rvalid_q0,
      D => \rdata_q[17]_i_1_n_0\,
      Q => s_axi_lite_rdata(17),
      R => \rdata_q[31]_i_1_n_0\
    );
\rdata_q_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => rvalid_q0,
      D => \rdata_q[18]_i_1_n_0\,
      Q => s_axi_lite_rdata(18),
      R => \rdata_q[31]_i_1_n_0\
    );
\rdata_q_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => rvalid_q0,
      D => \rdata_q[19]_i_1_n_0\,
      Q => s_axi_lite_rdata(19),
      R => \rdata_q[31]_i_1_n_0\
    );
\rdata_q_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => rvalid_q0,
      D => \rdata_q[1]_i_1_n_0\,
      Q => s_axi_lite_rdata(1),
      R => \rdata_q[31]_i_1_n_0\
    );
\rdata_q_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => rvalid_q0,
      D => \rdata_q[20]_i_1_n_0\,
      Q => s_axi_lite_rdata(20),
      R => \rdata_q[31]_i_1_n_0\
    );
\rdata_q_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => rvalid_q0,
      D => \rdata_q[21]_i_1_n_0\,
      Q => s_axi_lite_rdata(21),
      R => \rdata_q[31]_i_1_n_0\
    );
\rdata_q_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => rvalid_q0,
      D => \rdata_q[22]_i_1_n_0\,
      Q => s_axi_lite_rdata(22),
      R => \rdata_q[31]_i_1_n_0\
    );
\rdata_q_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => rvalid_q0,
      D => \rdata_q[23]_i_1_n_0\,
      Q => s_axi_lite_rdata(23),
      R => \rdata_q[31]_i_1_n_0\
    );
\rdata_q_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => rvalid_q0,
      D => \rdata_q[24]_i_1_n_0\,
      Q => s_axi_lite_rdata(24),
      R => \rdata_q[31]_i_1_n_0\
    );
\rdata_q_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => rvalid_q0,
      D => \rdata_q[25]_i_1_n_0\,
      Q => s_axi_lite_rdata(25),
      R => \rdata_q[31]_i_1_n_0\
    );
\rdata_q_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => rvalid_q0,
      D => \rdata_q[26]_i_1_n_0\,
      Q => s_axi_lite_rdata(26),
      R => \rdata_q[31]_i_1_n_0\
    );
\rdata_q_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => rvalid_q0,
      D => \rdata_q[27]_i_1_n_0\,
      Q => s_axi_lite_rdata(27),
      R => \rdata_q[31]_i_1_n_0\
    );
\rdata_q_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => rvalid_q0,
      D => \rdata_q[28]_i_1_n_0\,
      Q => s_axi_lite_rdata(28),
      R => \rdata_q[31]_i_1_n_0\
    );
\rdata_q_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => rvalid_q0,
      D => \rdata_q[29]_i_1_n_0\,
      Q => s_axi_lite_rdata(29),
      R => \rdata_q[31]_i_1_n_0\
    );
\rdata_q_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => rvalid_q0,
      D => \rdata_q[2]_i_1_n_0\,
      Q => s_axi_lite_rdata(2),
      R => \rdata_q[31]_i_1_n_0\
    );
\rdata_q_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => rvalid_q0,
      D => \rdata_q[30]_i_1_n_0\,
      Q => s_axi_lite_rdata(30),
      R => \rdata_q[31]_i_1_n_0\
    );
\rdata_q_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => rvalid_q0,
      D => \rdata_q[31]_i_3_n_0\,
      Q => s_axi_lite_rdata(31),
      R => \rdata_q[31]_i_1_n_0\
    );
\rdata_q_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => rvalid_q0,
      D => \rdata_q[3]_i_1_n_0\,
      Q => s_axi_lite_rdata(3),
      R => \rdata_q[31]_i_1_n_0\
    );
\rdata_q_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => rvalid_q0,
      D => \rdata_q[4]_i_1_n_0\,
      Q => s_axi_lite_rdata(4),
      R => \rdata_q[31]_i_1_n_0\
    );
\rdata_q_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => rvalid_q0,
      D => \rdata_q[5]_i_1_n_0\,
      Q => s_axi_lite_rdata(5),
      R => \rdata_q[31]_i_1_n_0\
    );
\rdata_q_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => rvalid_q0,
      D => \rdata_q[6]_i_1_n_0\,
      Q => s_axi_lite_rdata(6),
      R => \rdata_q[31]_i_1_n_0\
    );
\rdata_q_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => rvalid_q0,
      D => \rdata_q[7]_i_1_n_0\,
      Q => s_axi_lite_rdata(7),
      R => \rdata_q[31]_i_1_n_0\
    );
\rdata_q_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => rvalid_q0,
      D => \rdata_q[8]_i_1_n_0\,
      Q => s_axi_lite_rdata(8),
      R => \rdata_q[31]_i_1_n_0\
    );
\rdata_q_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => rvalid_q0,
      D => \rdata_q[9]_i_1_n_0\,
      Q => s_axi_lite_rdata(9),
      R => \rdata_q[31]_i_1_n_0\
    );
rvalid_q_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"08C8"
    )
        port map (
      I0 => ar_done_reg_n_0,
      I1 => aresetn,
      I2 => \^rvalid_q_reg_0\,
      I3 => s_axi_lite_rready,
      O => rvalid_q_i_1_n_0
    );
rvalid_q_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => rvalid_q_i_1_n_0,
      Q => \^rvalid_q_reg_0\,
      R => '0'
    );
st_overrun_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF7FFFFFF0000"
    )
        port map (
      I0 => st_overrun_i_2_n_0,
      I1 => aw_done_reg_n_0,
      I2 => \^bvalid_q_reg_0\,
      I3 => w_done_reg_n_0,
      I4 => fetch_overrun_set,
      I5 => data2(0),
      O => st_overrun_i_1_n_0
    );
st_overrun_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000010000"
    )
        port map (
      I0 => \awaddr_q_reg_n_0_[0]\,
      I1 => \awaddr_q_reg_n_0_[3]\,
      I2 => \awaddr_q_reg_n_0_[1]\,
      I3 => \awaddr_q_reg_n_0_[2]\,
      I4 => \wdata_q_reg_n_0_[4]\,
      I5 => ctrl_enable_i_3_n_0,
      O => st_overrun_i_2_n_0
    );
st_overrun_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => st_overrun_i_1_n_0,
      Q => data2(0),
      R => \rdata_q[31]_i_1_n_0\
    );
t_s1_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => line_req_tgl,
      Q => t_s1,
      R => \rdata_q[31]_i_1_n_0\
    );
t_s2_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => t_s1,
      Q => t_s2,
      R => \rdata_q[31]_i_1_n_0\
    );
t_s3_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => t_s2,
      Q => t_s3,
      R => \rdata_q[31]_i_1_n_0\
    );
tp_p1_reg: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => p_3_in(3),
      Q => tp_p1,
      R => '0'
    );
tp_p2_reg: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => tp_p1,
      Q => tp_p2,
      R => '0'
    );
u_clk_fwd: unisim.vcomponents.ODDR
    generic map(
      DDR_CLK_EDGE => "SAME_EDGE",
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D1_INVERTED => '0',
      IS_D2_INVERTED => '0',
      SRTYPE => "SYNC"
    )
        port map (
      C => pixel_clk,
      CE => '1',
      D1 => '0',
      D2 => '1',
      Q => hdmi_clk,
      R => NLW_u_clk_fwd_R_UNCONNECTED,
      S => NLW_u_clk_fwd_S_UNCONNECTED
    );
u_iobuf_scl: unisim.vcomponents.IOBUF
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => '0',
      IO => hdmi_scl,
      O => scl_in,
      T => T0
    );
u_iobuf_scl_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => i2c_scl_low,
      O => T0
    );
u_iobuf_sda: unisim.vcomponents.IOBUF
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => '0',
      IO => hdmi_sda,
      O => sda_in,
      T => u_iobuf_sda_i_1_n_0
    );
u_iobuf_sda_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => i2c_sda_low,
      O => u_iobuf_sda_i_1_n_0
    );
\vcnt[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \vcnt[9]_i_5_n_0\,
      I1 => rd_addr_next(9),
      O => \vcnt__0\(0)
    );
\vcnt[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \vcnt_reg_n_0_[1]\,
      I1 => rd_addr_next(9),
      O => \vcnt__0\(1)
    );
\vcnt[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B4E4"
    )
        port map (
      I0 => \vcnt[3]_i_2_n_0\,
      I1 => \vcnt_reg_n_0_[2]\,
      I2 => rd_addr_next(9),
      I3 => \vcnt_reg_n_0_[1]\,
      O => \vcnt__0\(2)
    );
\vcnt[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BEEE4444"
    )
        port map (
      I0 => \vcnt[3]_i_2_n_0\,
      I1 => \vcnt_reg_n_0_[3]\,
      I2 => \vcnt_reg_n_0_[2]\,
      I3 => \vcnt_reg_n_0_[1]\,
      I4 => rd_addr_next(9),
      O => \vcnt__0\(3)
    );
\vcnt[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000010000"
    )
        port map (
      I0 => \vcnt_reg_n_0_[6]\,
      I1 => \vcnt[9]_i_7_n_0\,
      I2 => \vcnt_reg_n_0_[7]\,
      I3 => \vcnt_reg_n_0_[8]\,
      I4 => \vcnt_reg_n_0_[9]\,
      I5 => \vcnt[9]_i_8_n_0\,
      O => \vcnt[3]_i_2_n_0\
    );
\vcnt[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => \vcnt_reg_n_0_[4]\,
      I1 => \vcnt_reg_n_0_[2]\,
      I2 => \vcnt_reg_n_0_[1]\,
      I3 => rd_addr_next(9),
      I4 => \vcnt_reg_n_0_[3]\,
      O => \vcnt__0\(4)
    );
\vcnt[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => \vcnt_reg_n_0_[4]\,
      I1 => \vcnt_reg_n_0_[3]\,
      I2 => rd_addr_next(9),
      I3 => \vcnt_reg_n_0_[1]\,
      I4 => \vcnt_reg_n_0_[2]\,
      I5 => \vcnt_reg_n_0_[5]\,
      O => \vcnt__0\(5)
    );
\vcnt[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \vcnt_reg_n_0_[5]\,
      I1 => \vcnt[8]_i_2_n_0\,
      I2 => \vcnt_reg_n_0_[6]\,
      O => \vcnt__0\(6)
    );
\vcnt[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \vcnt_reg_n_0_[6]\,
      I1 => \vcnt[8]_i_2_n_0\,
      I2 => \vcnt_reg_n_0_[5]\,
      I3 => \vcnt_reg_n_0_[7]\,
      O => \vcnt__0\(7)
    );
\vcnt[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => \vcnt_reg_n_0_[8]\,
      I1 => \vcnt_reg_n_0_[7]\,
      I2 => \vcnt_reg_n_0_[6]\,
      I3 => \vcnt[8]_i_2_n_0\,
      I4 => \vcnt_reg_n_0_[5]\,
      O => \vcnt__0\(8)
    );
\vcnt[8]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => \vcnt_reg_n_0_[4]\,
      I1 => \vcnt_reg_n_0_[3]\,
      I2 => rd_addr_next(9),
      I3 => \vcnt_reg_n_0_[1]\,
      I4 => \vcnt_reg_n_0_[2]\,
      O => \vcnt[8]_i_2_n_0\
    );
\vcnt[9]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => en_p2,
      O => \vcnt[9]_i_1_n_0\
    );
\vcnt[9]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00200000"
    )
        port map (
      I0 => \vcnt[9]_i_4_n_0\,
      I1 => p_0_in_2(5),
      I2 => p_0_in_2(8),
      I3 => p_0_in_2(6),
      I4 => p_0_in_2(7),
      O => vcnt(0)
    );
\vcnt[9]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF5D00000000FF5D"
    )
        port map (
      I0 => \vcnt_reg_n_0_[2]\,
      I1 => rd_addr_next(9),
      I2 => \vcnt_reg_n_0_[1]\,
      I3 => \vcnt[9]_i_5_n_0\,
      I4 => \vcnt_reg_n_0_[9]\,
      I5 => \vcnt[9]_i_6_n_0\,
      O => \vcnt__0\(9)
    );
\vcnt[9]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4000000000000000"
    )
        port map (
      I0 => p_0_in_2(4),
      I1 => p_0_in_2(3),
      I2 => p_0_in_2(2),
      I3 => p_0_in_2(0),
      I4 => p_0_in_2(1),
      I5 => \hcnt_reg_n_0_[0]\,
      O => \vcnt[9]_i_4_n_0\
    );
\vcnt[9]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFD"
    )
        port map (
      I0 => \vcnt_reg_n_0_[9]\,
      I1 => \vcnt_reg_n_0_[8]\,
      I2 => \vcnt_reg_n_0_[7]\,
      I3 => \vcnt_reg_n_0_[6]\,
      I4 => \vcnt[9]_i_7_n_0\,
      I5 => \vcnt[9]_i_8_n_0\,
      O => \vcnt[9]_i_5_n_0\
    );
\vcnt[9]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFFFFFF"
    )
        port map (
      I0 => \vcnt_reg_n_0_[8]\,
      I1 => \vcnt_reg_n_0_[6]\,
      I2 => \vcnt_reg_n_0_[7]\,
      I3 => \vcnt_reg_n_0_[5]\,
      I4 => \vcnt[8]_i_2_n_0\,
      O => \vcnt[9]_i_6_n_0\
    );
\vcnt[9]_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \vcnt_reg_n_0_[1]\,
      I1 => \vcnt_reg_n_0_[2]\,
      O => \vcnt[9]_i_7_n_0\
    );
\vcnt[9]_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FB"
    )
        port map (
      I0 => \vcnt_reg_n_0_[5]\,
      I1 => \vcnt_reg_n_0_[3]\,
      I2 => \vcnt_reg_n_0_[4]\,
      O => \vcnt[9]_i_8_n_0\
    );
\vcnt_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => vcnt(0),
      D => \vcnt__0\(0),
      Q => rd_addr_next(9),
      R => \vcnt[9]_i_1_n_0\
    );
\vcnt_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => vcnt(0),
      D => \vcnt__0\(1),
      Q => \vcnt_reg_n_0_[1]\,
      R => \vcnt[9]_i_1_n_0\
    );
\vcnt_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => vcnt(0),
      D => \vcnt__0\(2),
      Q => \vcnt_reg_n_0_[2]\,
      R => \vcnt[9]_i_1_n_0\
    );
\vcnt_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => vcnt(0),
      D => \vcnt__0\(3),
      Q => \vcnt_reg_n_0_[3]\,
      R => \vcnt[9]_i_1_n_0\
    );
\vcnt_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => vcnt(0),
      D => \vcnt__0\(4),
      Q => \vcnt_reg_n_0_[4]\,
      R => \vcnt[9]_i_1_n_0\
    );
\vcnt_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => vcnt(0),
      D => \vcnt__0\(5),
      Q => \vcnt_reg_n_0_[5]\,
      R => \vcnt[9]_i_1_n_0\
    );
\vcnt_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => vcnt(0),
      D => \vcnt__0\(6),
      Q => \vcnt_reg_n_0_[6]\,
      R => \vcnt[9]_i_1_n_0\
    );
\vcnt_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => vcnt(0),
      D => \vcnt__0\(7),
      Q => \vcnt_reg_n_0_[7]\,
      R => \vcnt[9]_i_1_n_0\
    );
\vcnt_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => vcnt(0),
      D => \vcnt__0\(8),
      Q => \vcnt_reg_n_0_[8]\,
      R => \vcnt[9]_i_1_n_0\
    );
\vcnt_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => vcnt(0),
      D => \vcnt__0\(9),
      Q => \vcnt_reg_n_0_[9]\,
      R => \vcnt[9]_i_1_n_0\
    );
\vga_q[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1F1F10101F101F10"
    )
        port map (
      I0 => \vga_q[1]_i_2_n_0\,
      I1 => p_0_in_2(8),
      I2 => tp_p2,
      I3 => \lb_rdata_reg_n_0_[4]\,
      I4 => \lb_rdata_reg_n_0_[20]\,
      I5 => \hcnt_reg_n_0_[0]\,
      O => \vga_q[0]_i_1_n_0\
    );
\vga_q[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EFE0EFEFEFE0E0E0"
    )
        port map (
      I0 => p_0_in_2(8),
      I1 => \vga_q[1]_i_2_n_0\,
      I2 => tp_p2,
      I3 => \lb_rdata_reg_n_0_[21]\,
      I4 => \hcnt_reg_n_0_[0]\,
      I5 => \lb_rdata_reg_n_0_[5]\,
      O => \vga_q[1]_i_1_n_0\
    );
\vga_q[1]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_0_in_2(6),
      I1 => p_0_in_2(7),
      O => \vga_q[1]_i_2_n_0\
    );
\vga_q[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00FFB8B80000B8B8"
    )
        port map (
      I0 => \lb_rdata_reg_n_0_[22]\,
      I1 => \hcnt_reg_n_0_[0]\,
      I2 => \lb_rdata_reg_n_0_[6]\,
      I3 => p_0_in_2(8),
      I4 => tp_p2,
      I5 => \vga_q[2]_i_2_n_0\,
      O => \vga_q[2]_i_1_n_0\
    );
\vga_q[2]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => p_0_in_2(6),
      I1 => p_0_in_2(7),
      O => \vga_q[2]_i_2_n_0\
    );
\vga_q[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3737370404043704"
    )
        port map (
      I0 => \vga_q[3]_i_2_n_0\,
      I1 => tp_p2,
      I2 => p_0_in_2(8),
      I3 => \lb_rdata_reg_n_0_[7]\,
      I4 => \hcnt_reg_n_0_[0]\,
      I5 => \lb_rdata_reg_n_0_[23]\,
      O => \vga_q[3]_i_1_n_0\
    );
\vga_q[3]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => p_0_in_2(6),
      I1 => p_0_in_2(7),
      O => \vga_q[3]_i_2_n_0\
    );
\vga_q_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => \vga_q[0]_i_1_n_0\,
      Q => vga_b(0),
      R => \hdmi_d_q[15]_i_1_n_0\
    );
\vga_q_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => \vga_q[1]_i_1_n_0\,
      Q => vga_b(1),
      R => \hdmi_d_q[15]_i_1_n_0\
    );
\vga_q_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => \vga_q[2]_i_1_n_0\,
      Q => vga_b(2),
      R => \hdmi_d_q[15]_i_1_n_0\
    );
\vga_q_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => \vga_q[3]_i_1_n_0\,
      Q => vga_b(3),
      R => \hdmi_d_q[15]_i_1_n_0\
    );
w_done_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000EA00EA00EA00"
    )
        port map (
      I0 => w_done_reg_n_0,
      I1 => s_axi_lite_wvalid,
      I2 => \^wready_q_reg_0\,
      I3 => aresetn,
      I4 => \^bvalid_q_reg_0\,
      I5 => s_axi_lite_bready,
      O => w_done_i_1_n_0
    );
w_done_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => w_done_i_1_n_0,
      Q => w_done_reg_n_0,
      R => '0'
    );
\wdata_q[31]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => \^wready_q_reg_0\,
      I1 => s_axi_lite_wvalid,
      I2 => w_done_reg_n_0,
      O => \wdata_q[31]_i_1_n_0\
    );
\wdata_q_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \wdata_q[31]_i_1_n_0\,
      D => s_axi_lite_wdata(0),
      Q => \wdata_q_reg_n_0_[0]\,
      R => \rdata_q[31]_i_1_n_0\
    );
\wdata_q_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \wdata_q[31]_i_1_n_0\,
      D => s_axi_lite_wdata(10),
      Q => \wdata_q_reg_n_0_[10]\,
      R => \rdata_q[31]_i_1_n_0\
    );
\wdata_q_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \wdata_q[31]_i_1_n_0\,
      D => s_axi_lite_wdata(11),
      Q => \wdata_q_reg_n_0_[11]\,
      R => \rdata_q[31]_i_1_n_0\
    );
\wdata_q_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \wdata_q[31]_i_1_n_0\,
      D => s_axi_lite_wdata(12),
      Q => \wdata_q_reg_n_0_[12]\,
      R => \rdata_q[31]_i_1_n_0\
    );
\wdata_q_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \wdata_q[31]_i_1_n_0\,
      D => s_axi_lite_wdata(13),
      Q => \wdata_q_reg_n_0_[13]\,
      R => \rdata_q[31]_i_1_n_0\
    );
\wdata_q_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \wdata_q[31]_i_1_n_0\,
      D => s_axi_lite_wdata(14),
      Q => \wdata_q_reg_n_0_[14]\,
      R => \rdata_q[31]_i_1_n_0\
    );
\wdata_q_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \wdata_q[31]_i_1_n_0\,
      D => s_axi_lite_wdata(15),
      Q => \wdata_q_reg_n_0_[15]\,
      R => \rdata_q[31]_i_1_n_0\
    );
\wdata_q_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \wdata_q[31]_i_1_n_0\,
      D => s_axi_lite_wdata(16),
      Q => \wdata_q_reg_n_0_[16]\,
      R => \rdata_q[31]_i_1_n_0\
    );
\wdata_q_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \wdata_q[31]_i_1_n_0\,
      D => s_axi_lite_wdata(17),
      Q => \wdata_q_reg_n_0_[17]\,
      R => \rdata_q[31]_i_1_n_0\
    );
\wdata_q_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \wdata_q[31]_i_1_n_0\,
      D => s_axi_lite_wdata(18),
      Q => \wdata_q_reg_n_0_[18]\,
      R => \rdata_q[31]_i_1_n_0\
    );
\wdata_q_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \wdata_q[31]_i_1_n_0\,
      D => s_axi_lite_wdata(19),
      Q => \wdata_q_reg_n_0_[19]\,
      R => \rdata_q[31]_i_1_n_0\
    );
\wdata_q_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \wdata_q[31]_i_1_n_0\,
      D => s_axi_lite_wdata(1),
      Q => \wdata_q_reg_n_0_[1]\,
      R => \rdata_q[31]_i_1_n_0\
    );
\wdata_q_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \wdata_q[31]_i_1_n_0\,
      D => s_axi_lite_wdata(20),
      Q => \wdata_q_reg_n_0_[20]\,
      R => \rdata_q[31]_i_1_n_0\
    );
\wdata_q_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \wdata_q[31]_i_1_n_0\,
      D => s_axi_lite_wdata(21),
      Q => \wdata_q_reg_n_0_[21]\,
      R => \rdata_q[31]_i_1_n_0\
    );
\wdata_q_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \wdata_q[31]_i_1_n_0\,
      D => s_axi_lite_wdata(22),
      Q => \wdata_q_reg_n_0_[22]\,
      R => \rdata_q[31]_i_1_n_0\
    );
\wdata_q_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \wdata_q[31]_i_1_n_0\,
      D => s_axi_lite_wdata(23),
      Q => \wdata_q_reg_n_0_[23]\,
      R => \rdata_q[31]_i_1_n_0\
    );
\wdata_q_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \wdata_q[31]_i_1_n_0\,
      D => s_axi_lite_wdata(24),
      Q => \wdata_q_reg_n_0_[24]\,
      R => \rdata_q[31]_i_1_n_0\
    );
\wdata_q_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \wdata_q[31]_i_1_n_0\,
      D => s_axi_lite_wdata(25),
      Q => \wdata_q_reg_n_0_[25]\,
      R => \rdata_q[31]_i_1_n_0\
    );
\wdata_q_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \wdata_q[31]_i_1_n_0\,
      D => s_axi_lite_wdata(26),
      Q => \wdata_q_reg_n_0_[26]\,
      R => \rdata_q[31]_i_1_n_0\
    );
\wdata_q_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \wdata_q[31]_i_1_n_0\,
      D => s_axi_lite_wdata(27),
      Q => \wdata_q_reg_n_0_[27]\,
      R => \rdata_q[31]_i_1_n_0\
    );
\wdata_q_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \wdata_q[31]_i_1_n_0\,
      D => s_axi_lite_wdata(28),
      Q => \wdata_q_reg_n_0_[28]\,
      R => \rdata_q[31]_i_1_n_0\
    );
\wdata_q_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \wdata_q[31]_i_1_n_0\,
      D => s_axi_lite_wdata(29),
      Q => \wdata_q_reg_n_0_[29]\,
      R => \rdata_q[31]_i_1_n_0\
    );
\wdata_q_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \wdata_q[31]_i_1_n_0\,
      D => s_axi_lite_wdata(2),
      Q => \wdata_q_reg_n_0_[2]\,
      R => \rdata_q[31]_i_1_n_0\
    );
\wdata_q_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \wdata_q[31]_i_1_n_0\,
      D => s_axi_lite_wdata(30),
      Q => \wdata_q_reg_n_0_[30]\,
      R => \rdata_q[31]_i_1_n_0\
    );
\wdata_q_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \wdata_q[31]_i_1_n_0\,
      D => s_axi_lite_wdata(31),
      Q => \wdata_q_reg_n_0_[31]\,
      R => \rdata_q[31]_i_1_n_0\
    );
\wdata_q_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \wdata_q[31]_i_1_n_0\,
      D => s_axi_lite_wdata(3),
      Q => \wdata_q_reg_n_0_[3]\,
      R => \rdata_q[31]_i_1_n_0\
    );
\wdata_q_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \wdata_q[31]_i_1_n_0\,
      D => s_axi_lite_wdata(4),
      Q => \wdata_q_reg_n_0_[4]\,
      R => \rdata_q[31]_i_1_n_0\
    );
\wdata_q_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \wdata_q[31]_i_1_n_0\,
      D => s_axi_lite_wdata(5),
      Q => p_1_in,
      R => \rdata_q[31]_i_1_n_0\
    );
\wdata_q_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \wdata_q[31]_i_1_n_0\,
      D => s_axi_lite_wdata(6),
      Q => \wdata_q_reg_n_0_[6]\,
      R => \rdata_q[31]_i_1_n_0\
    );
\wdata_q_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \wdata_q[31]_i_1_n_0\,
      D => s_axi_lite_wdata(7),
      Q => \wdata_q_reg_n_0_[7]\,
      R => \rdata_q[31]_i_1_n_0\
    );
\wdata_q_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \wdata_q[31]_i_1_n_0\,
      D => s_axi_lite_wdata(8),
      Q => \wdata_q_reg_n_0_[8]\,
      R => \rdata_q[31]_i_1_n_0\
    );
\wdata_q_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \wdata_q[31]_i_1_n_0\,
      D => s_axi_lite_wdata(9),
      Q => \wdata_q_reg_n_0_[9]\,
      R => \rdata_q[31]_i_1_n_0\
    );
wready_q_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"882A"
    )
        port map (
      I0 => aresetn,
      I1 => \^wready_q_reg_0\,
      I2 => s_axi_lite_wvalid,
      I3 => w_done_reg_n_0,
      O => wready_q_i_1_n_0
    );
wready_q_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => wready_q_i_1_n_0,
      Q => \^wready_q_reg_0\,
      R => '0'
    );
ycs_p1_reg: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => ctrl_yc_swap,
      Q => ycs_p1,
      R => '0'
    );
ycs_p2_reg: unisim.vcomponents.FDRE
     port map (
      C => pixel_clk,
      CE => '1',
      D => ycs_p1,
      Q => ycs_p2,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_hdmi_0 is
  port (
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
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of system_hdmi_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of system_hdmi_0 : entity is "system_hdmi_0,hdmi_out,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of system_hdmi_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of system_hdmi_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of system_hdmi_0 : entity is "hdmi_out,Vivado 2025.2";
end system_hdmi_0;

architecture STRUCTURE of system_hdmi_0 is
  signal \<const0>\ : STD_LOGIC;
  signal \<const1>\ : STD_LOGIC;
  signal \^vga_b\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \^vga_hsync\ : STD_LOGIC;
  signal \^vga_vsync\ : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of aclk : signal is "xilinx.com:signal:clock:1.0 aclk CLK";
  attribute X_INTERFACE_MODE : string;
  attribute X_INTERFACE_MODE of aclk : signal is "slave";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of aclk : signal is "XIL_INTERFACENAME aclk, ASSOCIATED_BUSIF m_axi_hp:s_axi_lite, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_ps7_0_FCLK_CLK0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of aresetn : signal is "xilinx.com:signal:reset:1.0 aresetn RST";
  attribute X_INTERFACE_MODE of aresetn : signal is "slave";
  attribute X_INTERFACE_PARAMETER of aresetn : signal is "XIL_INTERFACENAME aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of hdmi_clk : signal is "xilinx.com:signal:clock:1.0 hdmi_clk CLK";
  attribute X_INTERFACE_MODE of hdmi_clk : signal is "master";
  attribute X_INTERFACE_PARAMETER of hdmi_clk : signal is "XIL_INTERFACENAME hdmi_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_hdmi_0_hdmi_clk, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of m_axi_hp_arready : signal is "xilinx.com:interface:aximm:1.0 m_axi_hp ARREADY";
  attribute X_INTERFACE_INFO of m_axi_hp_arvalid : signal is "xilinx.com:interface:aximm:1.0 m_axi_hp ARVALID";
  attribute X_INTERFACE_INFO of m_axi_hp_rlast : signal is "xilinx.com:interface:aximm:1.0 m_axi_hp RLAST";
  attribute X_INTERFACE_INFO of m_axi_hp_rready : signal is "xilinx.com:interface:aximm:1.0 m_axi_hp RREADY";
  attribute X_INTERFACE_INFO of m_axi_hp_rvalid : signal is "xilinx.com:interface:aximm:1.0 m_axi_hp RVALID";
  attribute X_INTERFACE_INFO of pixel_clk : signal is "xilinx.com:signal:clock:1.0 pixel_clk CLK";
  attribute X_INTERFACE_MODE of pixel_clk : signal is "slave";
  attribute X_INTERFACE_PARAMETER of pixel_clk : signal is "XIL_INTERFACENAME pixel_clk, FREQ_HZ 25000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_ps7_0_FCLK_CLK1, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s_axi_lite_arready : signal is "xilinx.com:interface:aximm:1.0 s_axi_lite ARREADY";
  attribute X_INTERFACE_INFO of s_axi_lite_arvalid : signal is "xilinx.com:interface:aximm:1.0 s_axi_lite ARVALID";
  attribute X_INTERFACE_INFO of s_axi_lite_awready : signal is "xilinx.com:interface:aximm:1.0 s_axi_lite AWREADY";
  attribute X_INTERFACE_INFO of s_axi_lite_awvalid : signal is "xilinx.com:interface:aximm:1.0 s_axi_lite AWVALID";
  attribute X_INTERFACE_INFO of s_axi_lite_bready : signal is "xilinx.com:interface:aximm:1.0 s_axi_lite BREADY";
  attribute X_INTERFACE_INFO of s_axi_lite_bvalid : signal is "xilinx.com:interface:aximm:1.0 s_axi_lite BVALID";
  attribute X_INTERFACE_INFO of s_axi_lite_rready : signal is "xilinx.com:interface:aximm:1.0 s_axi_lite RREADY";
  attribute X_INTERFACE_INFO of s_axi_lite_rvalid : signal is "xilinx.com:interface:aximm:1.0 s_axi_lite RVALID";
  attribute X_INTERFACE_INFO of s_axi_lite_wready : signal is "xilinx.com:interface:aximm:1.0 s_axi_lite WREADY";
  attribute X_INTERFACE_INFO of s_axi_lite_wvalid : signal is "xilinx.com:interface:aximm:1.0 s_axi_lite WVALID";
  attribute X_INTERFACE_INFO of m_axi_hp_araddr : signal is "xilinx.com:interface:aximm:1.0 m_axi_hp ARADDR";
  attribute X_INTERFACE_INFO of m_axi_hp_arburst : signal is "xilinx.com:interface:aximm:1.0 m_axi_hp ARBURST";
  attribute X_INTERFACE_INFO of m_axi_hp_arcache : signal is "xilinx.com:interface:aximm:1.0 m_axi_hp ARCACHE";
  attribute X_INTERFACE_INFO of m_axi_hp_arid : signal is "xilinx.com:interface:aximm:1.0 m_axi_hp ARID";
  attribute X_INTERFACE_MODE of m_axi_hp_arid : signal is "master";
  attribute X_INTERFACE_PARAMETER of m_axi_hp_arid : signal is "XIL_INTERFACENAME m_axi_hp, DATA_WIDTH 32, PROTOCOL AXI4, FREQ_HZ 100000000, ID_WIDTH 6, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_ONLY, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 0, HAS_WSTRB 0, HAS_BRESP 0, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 256, PHASE 0.0, CLK_DOMAIN system_ps7_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of m_axi_hp_arlen : signal is "xilinx.com:interface:aximm:1.0 m_axi_hp ARLEN";
  attribute X_INTERFACE_INFO of m_axi_hp_arlock : signal is "xilinx.com:interface:aximm:1.0 m_axi_hp ARLOCK";
  attribute X_INTERFACE_INFO of m_axi_hp_arprot : signal is "xilinx.com:interface:aximm:1.0 m_axi_hp ARPROT";
  attribute X_INTERFACE_INFO of m_axi_hp_arqos : signal is "xilinx.com:interface:aximm:1.0 m_axi_hp ARQOS";
  attribute X_INTERFACE_INFO of m_axi_hp_arsize : signal is "xilinx.com:interface:aximm:1.0 m_axi_hp ARSIZE";
  attribute X_INTERFACE_INFO of m_axi_hp_rdata : signal is "xilinx.com:interface:aximm:1.0 m_axi_hp RDATA";
  attribute X_INTERFACE_INFO of m_axi_hp_rid : signal is "xilinx.com:interface:aximm:1.0 m_axi_hp RID";
  attribute X_INTERFACE_INFO of m_axi_hp_rresp : signal is "xilinx.com:interface:aximm:1.0 m_axi_hp RRESP";
  attribute X_INTERFACE_INFO of s_axi_lite_araddr : signal is "xilinx.com:interface:aximm:1.0 s_axi_lite ARADDR";
  attribute X_INTERFACE_INFO of s_axi_lite_arprot : signal is "xilinx.com:interface:aximm:1.0 s_axi_lite ARPROT";
  attribute X_INTERFACE_INFO of s_axi_lite_awaddr : signal is "xilinx.com:interface:aximm:1.0 s_axi_lite AWADDR";
  attribute X_INTERFACE_MODE of s_axi_lite_awaddr : signal is "slave";
  attribute X_INTERFACE_PARAMETER of s_axi_lite_awaddr : signal is "XIL_INTERFACENAME s_axi_lite, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 16, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN system_ps7_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s_axi_lite_awprot : signal is "xilinx.com:interface:aximm:1.0 s_axi_lite AWPROT";
  attribute X_INTERFACE_INFO of s_axi_lite_bresp : signal is "xilinx.com:interface:aximm:1.0 s_axi_lite BRESP";
  attribute X_INTERFACE_INFO of s_axi_lite_rdata : signal is "xilinx.com:interface:aximm:1.0 s_axi_lite RDATA";
  attribute X_INTERFACE_INFO of s_axi_lite_rresp : signal is "xilinx.com:interface:aximm:1.0 s_axi_lite RRESP";
  attribute X_INTERFACE_INFO of s_axi_lite_wdata : signal is "xilinx.com:interface:aximm:1.0 s_axi_lite WDATA";
  attribute X_INTERFACE_INFO of s_axi_lite_wstrb : signal is "xilinx.com:interface:aximm:1.0 s_axi_lite WSTRB";
begin
  hdmi_hsync <= \^vga_hsync\;
  hdmi_vsync <= \^vga_vsync\;
  m_axi_hp_arburst(1) <= \<const0>\;
  m_axi_hp_arburst(0) <= \<const1>\;
  m_axi_hp_arcache(3) <= \<const0>\;
  m_axi_hp_arcache(2) <= \<const0>\;
  m_axi_hp_arcache(1) <= \<const1>\;
  m_axi_hp_arcache(0) <= \<const1>\;
  m_axi_hp_arid(5) <= \<const0>\;
  m_axi_hp_arid(4) <= \<const0>\;
  m_axi_hp_arid(3) <= \<const0>\;
  m_axi_hp_arid(2) <= \<const0>\;
  m_axi_hp_arid(1) <= \<const0>\;
  m_axi_hp_arid(0) <= \<const0>\;
  m_axi_hp_arlen(7) <= \<const0>\;
  m_axi_hp_arlen(6) <= \<const0>\;
  m_axi_hp_arlen(5) <= \<const0>\;
  m_axi_hp_arlen(4) <= \<const0>\;
  m_axi_hp_arlen(3) <= \<const1>\;
  m_axi_hp_arlen(2) <= \<const1>\;
  m_axi_hp_arlen(1) <= \<const1>\;
  m_axi_hp_arlen(0) <= \<const1>\;
  m_axi_hp_arlock(1) <= \<const0>\;
  m_axi_hp_arlock(0) <= \<const0>\;
  m_axi_hp_arprot(2) <= \<const0>\;
  m_axi_hp_arprot(1) <= \<const0>\;
  m_axi_hp_arprot(0) <= \<const0>\;
  m_axi_hp_arqos(3) <= \<const0>\;
  m_axi_hp_arqos(2) <= \<const0>\;
  m_axi_hp_arqos(1) <= \<const0>\;
  m_axi_hp_arqos(0) <= \<const0>\;
  m_axi_hp_arsize(2) <= \<const0>\;
  m_axi_hp_arsize(1) <= \<const1>\;
  m_axi_hp_arsize(0) <= \<const0>\;
  m_axi_hp_rready <= \<const1>\;
  s_axi_lite_bresp(1) <= \<const0>\;
  s_axi_lite_bresp(0) <= \<const0>\;
  s_axi_lite_rresp(1) <= \<const0>\;
  s_axi_lite_rresp(0) <= \<const0>\;
  vga_b(3 downto 0) <= \^vga_b\(3 downto 0);
  vga_g(3 downto 0) <= \^vga_b\(3 downto 0);
  vga_hsync <= \^vga_hsync\;
  vga_r(3 downto 0) <= \^vga_b\(3 downto 0);
  vga_vsync <= \^vga_vsync\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
VCC: unisim.vcomponents.VCC
     port map (
      P => \<const1>\
    );
inst: entity work.system_hdmi_0_hdmi_out
     port map (
      aclk => aclk,
      aresetn => aresetn,
      arready_q_reg_0 => s_axi_lite_arready,
      awready_q_reg_0 => s_axi_lite_awready,
      bvalid_q_reg_0 => s_axi_lite_bvalid,
      hdmi_clk => hdmi_clk,
      hdmi_d(15 downto 0) => hdmi_d(15 downto 0),
      hdmi_de => hdmi_de,
      hdmi_scl => hdmi_scl,
      hdmi_sda => hdmi_sda,
      m_axi_hp_araddr(31 downto 0) => m_axi_hp_araddr(31 downto 0),
      m_axi_hp_arready => m_axi_hp_arready,
      m_axi_hp_arvalid => m_axi_hp_arvalid,
      m_axi_hp_rdata(31 downto 0) => m_axi_hp_rdata(31 downto 0),
      m_axi_hp_rlast => m_axi_hp_rlast,
      m_axi_hp_rvalid => m_axi_hp_rvalid,
      pixel_clk => pixel_clk,
      rvalid_q_reg_0 => s_axi_lite_rvalid,
      s_axi_lite_araddr(7 downto 0) => s_axi_lite_araddr(7 downto 0),
      s_axi_lite_arvalid => s_axi_lite_arvalid,
      s_axi_lite_awaddr(7 downto 0) => s_axi_lite_awaddr(7 downto 0),
      s_axi_lite_awvalid => s_axi_lite_awvalid,
      s_axi_lite_bready => s_axi_lite_bready,
      s_axi_lite_rdata(31 downto 0) => s_axi_lite_rdata(31 downto 0),
      s_axi_lite_rready => s_axi_lite_rready,
      s_axi_lite_wdata(31 downto 0) => s_axi_lite_wdata(31 downto 0),
      s_axi_lite_wvalid => s_axi_lite_wvalid,
      vga_b(3 downto 0) => \^vga_b\(3 downto 0),
      vga_hsync => \^vga_hsync\,
      vga_vsync => \^vga_vsync\,
      wready_q_reg_0 => s_axi_lite_wready
    );
end STRUCTURE;
