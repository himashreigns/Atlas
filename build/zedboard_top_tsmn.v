// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
// Date        : Fri May 22 11:00:57 2026
// Host        : chathupa-Nitro-AN515-55 running 64-bit Ubuntu 24.04.3 LTS
// Command     : write_verilog -force -mode timesim -sdf_anno true build/zedboard_top_tsmn.v
// Design      : zedboard_top
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

module nn_layer_control_unit
   (done_reg_0,
    \state_reg[0] ,
    rst,
    CLK,
    state,
    win_load_active,
    ctrl_start);
  output done_reg_0;
  output \state_reg[0] ;
  input rst;
  input CLK;
  input [1:0]state;
  input win_load_active;
  input ctrl_start;

  wire CLK;
  wire \FSM_onehot_state[4]_i_1__2_n_0 ;
  wire \FSM_onehot_state[4]_i_2__2_n_0 ;
  wire \FSM_onehot_state_reg_n_0_[0] ;
  wire \FSM_onehot_state_reg_n_0_[3] ;
  wire \FSM_onehot_state_reg_n_0_[4] ;
  wire busy_i_1__0_n_0;
  wire busy_reg_n_0;
  wire [7:0]ch_in_cnt;
  wire ch_in_cnt0;
  wire \ch_in_cnt[0]_i_1__1_n_0 ;
  wire \ch_in_cnt[1]_i_1__1_n_0 ;
  wire \ch_in_cnt[2]_i_1__1_n_0 ;
  wire \ch_in_cnt[3]_i_1__1_n_0 ;
  wire \ch_in_cnt[4]_i_1__1_n_0 ;
  wire \ch_in_cnt[5]_i_1__1_n_0 ;
  wire \ch_in_cnt[5]_i_2__1_n_0 ;
  wire \ch_in_cnt[6]_i_1__1_n_0 ;
  wire \ch_in_cnt[7]_i_10__0_n_0 ;
  wire \ch_in_cnt[7]_i_11__0_n_0 ;
  wire \ch_in_cnt[7]_i_2__1_n_0 ;
  wire \ch_in_cnt[7]_i_3__1_n_0 ;
  wire \ch_in_cnt[7]_i_5__0_n_0 ;
  wire \ch_in_cnt[7]_i_6__0_n_0 ;
  wire \ch_in_cnt[7]_i_7__0_n_0 ;
  wire \ch_in_cnt[7]_i_8__0_n_0 ;
  wire \ch_in_cnt[7]_i_9__0_n_0 ;
  wire \ch_in_cnt_reg[7]_i_4_n_0 ;
  wire [7:0]col_cnt;
  wire col_cnt0;
  wire \col_cnt[0]_i_1__3_n_0 ;
  wire \col_cnt[1]_i_1__3_n_0 ;
  wire \col_cnt[2]_i_1__2_n_0 ;
  wire \col_cnt[3]_i_1__3_n_0 ;
  wire \col_cnt[4]_i_1__2_n_0 ;
  wire \col_cnt[5]_i_1__2_n_0 ;
  wire \col_cnt[5]_i_2__2_n_0 ;
  wire \col_cnt[5]_i_3__0_n_0 ;
  wire \col_cnt[6]_i_1__2_n_0 ;
  wire \col_cnt[7]_i_2__2_n_0 ;
  wire \col_cnt[7]_i_3__2_n_0 ;
  wire computation_done;
  wire computation_done_i_1__0_n_0;
  wire computation_done_i_2__1_n_0;
  wire computation_done_reg_n_0;
  wire ctrl_start;
  wire done_reg_0;
  wire done_reg_n_0;
  wire [3:0]pipe_delay_cnt;
  wire \pipe_delay_cnt[3]_i_1__2_n_0 ;
  wire \pipe_delay_cnt_reg_n_0_[0] ;
  wire \pipe_delay_cnt_reg_n_0_[1] ;
  wire \pipe_delay_cnt_reg_n_0_[2] ;
  wire \pipe_delay_cnt_reg_n_0_[3] ;
  wire [7:0]pool_col_cnt;
  wire pool_col_cnt0;
  wire \pool_col_cnt[0]_i_1__0_n_0 ;
  wire \pool_col_cnt[1]_i_1__0_n_0 ;
  wire \pool_col_cnt[2]_i_1__0_n_0 ;
  wire \pool_col_cnt[3]_i_1__0_n_0 ;
  wire \pool_col_cnt[4]_i_1__0_n_0 ;
  wire \pool_col_cnt[4]_i_2__0_n_0 ;
  wire \pool_col_cnt[5]_i_1__0_n_0 ;
  wire \pool_col_cnt[5]_i_2__0_n_0 ;
  wire \pool_col_cnt[6]_i_1__0_n_0 ;
  wire \pool_col_cnt[7]_i_2__0_n_0 ;
  wire \pool_col_cnt[7]_i_3__0_n_0 ;
  wire [7:0]pool_row_cnt;
  wire pool_row_cnt0;
  wire \pool_row_cnt[0]_i_1__0_n_0 ;
  wire \pool_row_cnt[1]_i_1__0_n_0 ;
  wire \pool_row_cnt[2]_i_1__0_n_0 ;
  wire \pool_row_cnt[3]_i_1__0_n_0 ;
  wire \pool_row_cnt[4]_i_1__0_n_0 ;
  wire \pool_row_cnt[4]_i_2__0_n_0 ;
  wire \pool_row_cnt[5]_i_1__0_n_0 ;
  wire \pool_row_cnt[5]_i_2__0_n_0 ;
  wire \pool_row_cnt[6]_i_1__0_n_0 ;
  wire \pool_row_cnt[7]_i_2__0_n_0 ;
  wire \pool_row_cnt[7]_i_3__0_n_0 ;
  wire [7:0]row_cnt;
  wire row_cnt0;
  wire \row_cnt[0]_i_1__2_n_0 ;
  wire \row_cnt[1]_i_1__2_n_0 ;
  wire \row_cnt[2]_i_1__2_n_0 ;
  wire \row_cnt[3]_i_1__2_n_0 ;
  wire \row_cnt[4]_i_1__2_n_0 ;
  wire \row_cnt[5]_i_1__2_n_0 ;
  wire \row_cnt[5]_i_2__2_n_0 ;
  wire \row_cnt[5]_i_3__0_n_0 ;
  wire \row_cnt[6]_i_1__2_n_0 ;
  wire \row_cnt[7]_i_10__1_n_0 ;
  wire \row_cnt[7]_i_11__1_n_0 ;
  wire \row_cnt[7]_i_12__1_n_0 ;
  wire \row_cnt[7]_i_13__1_n_0 ;
  wire \row_cnt[7]_i_14__1_n_0 ;
  wire \row_cnt[7]_i_15__1_n_0 ;
  wire \row_cnt[7]_i_16__1_n_0 ;
  wire \row_cnt[7]_i_17__1_n_0 ;
  wire \row_cnt[7]_i_18__1_n_0 ;
  wire \row_cnt[7]_i_19__1_n_0 ;
  wire \row_cnt[7]_i_20__1_n_0 ;
  wire \row_cnt[7]_i_21__1_n_0 ;
  wire \row_cnt[7]_i_22__2_n_0 ;
  wire \row_cnt[7]_i_23__2_n_0 ;
  wire \row_cnt[7]_i_24__1_n_0 ;
  wire \row_cnt[7]_i_25__1_n_0 ;
  wire \row_cnt[7]_i_26__2_n_0 ;
  wire \row_cnt[7]_i_27__1_n_0 ;
  wire \row_cnt[7]_i_2__2_n_0 ;
  wire \row_cnt[7]_i_6__1_n_0 ;
  wire \row_cnt[7]_i_8__1_n_0 ;
  wire \row_cnt[7]_i_9__0_n_0 ;
  wire \row_cnt_reg[7]_i_3_n_0 ;
  wire \row_cnt_reg[7]_i_4_n_0 ;
  wire \row_cnt_reg[7]_i_5_n_0 ;
  wire \row_cnt_reg[7]_i_7_n_0 ;
  wire rst;
  wire [1:0]state;
  wire \state_reg[0] ;
  wire wgt_loading_done;
  wire win_load_active;
  wire [2:0]\NLW_ch_in_cnt_reg[7]_i_4_CO_UNCONNECTED ;
  wire [3:0]\NLW_ch_in_cnt_reg[7]_i_4_O_UNCONNECTED ;
  wire [2:0]\NLW_row_cnt_reg[7]_i_3_CO_UNCONNECTED ;
  wire [3:0]\NLW_row_cnt_reg[7]_i_3_O_UNCONNECTED ;
  wire [2:0]\NLW_row_cnt_reg[7]_i_4_CO_UNCONNECTED ;
  wire [3:0]\NLW_row_cnt_reg[7]_i_4_O_UNCONNECTED ;
  wire [2:0]\NLW_row_cnt_reg[7]_i_5_CO_UNCONNECTED ;
  wire [3:0]\NLW_row_cnt_reg[7]_i_5_O_UNCONNECTED ;
  wire [2:0]\NLW_row_cnt_reg[7]_i_7_CO_UNCONNECTED ;
  wire [3:0]\NLW_row_cnt_reg[7]_i_7_O_UNCONNECTED ;

  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \FSM_onehot_state[4]_i_1__2 
       (.I0(\FSM_onehot_state[4]_i_2__2_n_0 ),
        .I1(\FSM_onehot_state_reg_n_0_[0] ),
        .I2(ctrl_start),
        .I3(computation_done),
        .I4(computation_done_reg_n_0),
        .O(\FSM_onehot_state[4]_i_1__2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFEEEEEEEEEEEEE)) 
    \FSM_onehot_state[4]_i_2__2 
       (.I0(wgt_loading_done),
        .I1(\FSM_onehot_state_reg_n_0_[4] ),
        .I2(\pipe_delay_cnt_reg_n_0_[2] ),
        .I3(\pipe_delay_cnt_reg_n_0_[1] ),
        .I4(\pipe_delay_cnt_reg_n_0_[3] ),
        .I5(\FSM_onehot_state_reg_n_0_[3] ),
        .O(\FSM_onehot_state[4]_i_2__2_n_0 ));
  (* FSM_ENCODED_STATES = "IDLE:00001,LOAD_WGT:00010,COMPUTE:00100,WRITE_OUT:01000,DONE_ST:10000," *) 
  FDSE #(
    .INIT(1'b1)) 
    \FSM_onehot_state_reg[0] 
       (.C(CLK),
        .CE(\FSM_onehot_state[4]_i_1__2_n_0 ),
        .D(\FSM_onehot_state_reg_n_0_[4] ),
        .Q(\FSM_onehot_state_reg_n_0_[0] ),
        .S(rst));
  (* FSM_ENCODED_STATES = "IDLE:00001,LOAD_WGT:00010,COMPUTE:00100,WRITE_OUT:01000,DONE_ST:10000," *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[1] 
       (.C(CLK),
        .CE(\FSM_onehot_state[4]_i_1__2_n_0 ),
        .D(\FSM_onehot_state_reg_n_0_[0] ),
        .Q(wgt_loading_done),
        .R(rst));
  (* FSM_ENCODED_STATES = "IDLE:00001,LOAD_WGT:00010,COMPUTE:00100,WRITE_OUT:01000,DONE_ST:10000," *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[2] 
       (.C(CLK),
        .CE(\FSM_onehot_state[4]_i_1__2_n_0 ),
        .D(wgt_loading_done),
        .Q(computation_done),
        .R(rst));
  (* FSM_ENCODED_STATES = "IDLE:00001,LOAD_WGT:00010,COMPUTE:00100,WRITE_OUT:01000,DONE_ST:10000," *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[3] 
       (.C(CLK),
        .CE(\FSM_onehot_state[4]_i_1__2_n_0 ),
        .D(computation_done),
        .Q(\FSM_onehot_state_reg_n_0_[3] ),
        .R(rst));
  (* FSM_ENCODED_STATES = "IDLE:00001,LOAD_WGT:00010,COMPUTE:00100,WRITE_OUT:01000,DONE_ST:10000," *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[4] 
       (.C(CLK),
        .CE(\FSM_onehot_state[4]_i_1__2_n_0 ),
        .D(\FSM_onehot_state_reg_n_0_[3] ),
        .Q(\FSM_onehot_state_reg_n_0_[4] ),
        .R(rst));
  LUT4 #(
    .INIT(16'h8B88)) 
    busy_i_1__0
       (.I0(ctrl_start),
        .I1(\FSM_onehot_state_reg_n_0_[0] ),
        .I2(\FSM_onehot_state_reg_n_0_[4] ),
        .I3(busy_reg_n_0),
        .O(busy_i_1__0_n_0));
  FDRE busy_reg
       (.C(CLK),
        .CE(1'b1),
        .D(busy_i_1__0_n_0),
        .Q(busy_reg_n_0),
        .R(rst));
  (* SOFT_HLUTNM = "soft_lutpair105" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \ch_in_cnt[0]_i_1__1 
       (.I0(computation_done),
        .I1(ch_in_cnt[0]),
        .O(\ch_in_cnt[0]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair105" *) 
  LUT3 #(
    .INIT(8'h48)) 
    \ch_in_cnt[1]_i_1__1 
       (.I0(ch_in_cnt[0]),
        .I1(computation_done),
        .I2(ch_in_cnt[1]),
        .O(\ch_in_cnt[1]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair96" *) 
  LUT4 #(
    .INIT(16'h7080)) 
    \ch_in_cnt[2]_i_1__1 
       (.I0(ch_in_cnt[1]),
        .I1(ch_in_cnt[0]),
        .I2(computation_done),
        .I3(ch_in_cnt[2]),
        .O(\ch_in_cnt[2]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair96" *) 
  LUT5 #(
    .INIT(32'h7F008000)) 
    \ch_in_cnt[3]_i_1__1 
       (.I0(ch_in_cnt[2]),
        .I1(ch_in_cnt[0]),
        .I2(ch_in_cnt[1]),
        .I3(computation_done),
        .I4(ch_in_cnt[3]),
        .O(\ch_in_cnt[3]_i_1__1_n_0 ));
  LUT6 #(
    .INIT(64'h7FFF000080000000)) 
    \ch_in_cnt[4]_i_1__1 
       (.I0(ch_in_cnt[1]),
        .I1(ch_in_cnt[0]),
        .I2(ch_in_cnt[2]),
        .I3(ch_in_cnt[3]),
        .I4(computation_done),
        .I5(ch_in_cnt[4]),
        .O(\ch_in_cnt[4]_i_1__1_n_0 ));
  LUT6 #(
    .INIT(64'hFF7F000000800000)) 
    \ch_in_cnt[5]_i_1__1 
       (.I0(ch_in_cnt[4]),
        .I1(ch_in_cnt[3]),
        .I2(ch_in_cnt[2]),
        .I3(\ch_in_cnt[5]_i_2__1_n_0 ),
        .I4(computation_done),
        .I5(ch_in_cnt[5]),
        .O(\ch_in_cnt[5]_i_1__1_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \ch_in_cnt[5]_i_2__1 
       (.I0(ch_in_cnt[1]),
        .I1(ch_in_cnt[0]),
        .O(\ch_in_cnt[5]_i_2__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair100" *) 
  LUT3 #(
    .INIT(8'h84)) 
    \ch_in_cnt[6]_i_1__1 
       (.I0(\ch_in_cnt[7]_i_5__0_n_0 ),
        .I1(computation_done),
        .I2(ch_in_cnt[6]),
        .O(\ch_in_cnt[6]_i_1__1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \ch_in_cnt[7]_i_10__0 
       (.I0(ch_in_cnt[2]),
        .I1(ch_in_cnt[3]),
        .O(\ch_in_cnt[7]_i_10__0_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \ch_in_cnt[7]_i_11__0 
       (.I0(ch_in_cnt[0]),
        .I1(ch_in_cnt[1]),
        .O(\ch_in_cnt[7]_i_11__0_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF002000200020)) 
    \ch_in_cnt[7]_i_1__1 
       (.I0(\ch_in_cnt[7]_i_3__1_n_0 ),
        .I1(\row_cnt_reg[7]_i_3_n_0 ),
        .I2(\ch_in_cnt_reg[7]_i_4_n_0 ),
        .I3(\row_cnt_reg[7]_i_7_n_0 ),
        .I4(ctrl_start),
        .I5(\FSM_onehot_state_reg_n_0_[0] ),
        .O(ch_in_cnt0));
  (* SOFT_HLUTNM = "soft_lutpair100" *) 
  LUT4 #(
    .INIT(16'hB040)) 
    \ch_in_cnt[7]_i_2__1 
       (.I0(\ch_in_cnt[7]_i_5__0_n_0 ),
        .I1(ch_in_cnt[6]),
        .I2(computation_done),
        .I3(ch_in_cnt[7]),
        .O(\ch_in_cnt[7]_i_2__1_n_0 ));
  LUT3 #(
    .INIT(8'h04)) 
    \ch_in_cnt[7]_i_3__1 
       (.I0(\row_cnt_reg[7]_i_4_n_0 ),
        .I1(computation_done),
        .I2(\row_cnt_reg[7]_i_5_n_0 ),
        .O(\ch_in_cnt[7]_i_3__1_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \ch_in_cnt[7]_i_5__0 
       (.I0(ch_in_cnt[1]),
        .I1(ch_in_cnt[0]),
        .I2(ch_in_cnt[2]),
        .I3(ch_in_cnt[3]),
        .I4(ch_in_cnt[4]),
        .I5(ch_in_cnt[5]),
        .O(\ch_in_cnt[7]_i_5__0_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \ch_in_cnt[7]_i_6__0 
       (.I0(ch_in_cnt[3]),
        .I1(ch_in_cnt[2]),
        .O(\ch_in_cnt[7]_i_6__0_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \ch_in_cnt[7]_i_7__0 
       (.I0(ch_in_cnt[1]),
        .I1(ch_in_cnt[0]),
        .O(\ch_in_cnt[7]_i_7__0_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \ch_in_cnt[7]_i_8__0 
       (.I0(ch_in_cnt[7]),
        .I1(ch_in_cnt[6]),
        .O(\ch_in_cnt[7]_i_8__0_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \ch_in_cnt[7]_i_9__0 
       (.I0(ch_in_cnt[5]),
        .I1(ch_in_cnt[4]),
        .O(\ch_in_cnt[7]_i_9__0_n_0 ));
  FDRE \ch_in_cnt_reg[0] 
       (.C(CLK),
        .CE(ch_in_cnt0),
        .D(\ch_in_cnt[0]_i_1__1_n_0 ),
        .Q(ch_in_cnt[0]),
        .R(rst));
  FDRE \ch_in_cnt_reg[1] 
       (.C(CLK),
        .CE(ch_in_cnt0),
        .D(\ch_in_cnt[1]_i_1__1_n_0 ),
        .Q(ch_in_cnt[1]),
        .R(rst));
  FDRE \ch_in_cnt_reg[2] 
       (.C(CLK),
        .CE(ch_in_cnt0),
        .D(\ch_in_cnt[2]_i_1__1_n_0 ),
        .Q(ch_in_cnt[2]),
        .R(rst));
  FDRE \ch_in_cnt_reg[3] 
       (.C(CLK),
        .CE(ch_in_cnt0),
        .D(\ch_in_cnt[3]_i_1__1_n_0 ),
        .Q(ch_in_cnt[3]),
        .R(rst));
  FDRE \ch_in_cnt_reg[4] 
       (.C(CLK),
        .CE(ch_in_cnt0),
        .D(\ch_in_cnt[4]_i_1__1_n_0 ),
        .Q(ch_in_cnt[4]),
        .R(rst));
  FDRE \ch_in_cnt_reg[5] 
       (.C(CLK),
        .CE(ch_in_cnt0),
        .D(\ch_in_cnt[5]_i_1__1_n_0 ),
        .Q(ch_in_cnt[5]),
        .R(rst));
  FDRE \ch_in_cnt_reg[6] 
       (.C(CLK),
        .CE(ch_in_cnt0),
        .D(\ch_in_cnt[6]_i_1__1_n_0 ),
        .Q(ch_in_cnt[6]),
        .R(rst));
  FDRE \ch_in_cnt_reg[7] 
       (.C(CLK),
        .CE(ch_in_cnt0),
        .D(\ch_in_cnt[7]_i_2__1_n_0 ),
        .Q(ch_in_cnt[7]),
        .R(rst));
  CARRY4 \ch_in_cnt_reg[7]_i_4 
       (.CI(1'b0),
        .CO({\ch_in_cnt_reg[7]_i_4_n_0 ,\NLW_ch_in_cnt_reg[7]_i_4_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,\ch_in_cnt[7]_i_6__0_n_0 ,\ch_in_cnt[7]_i_7__0_n_0 }),
        .O(\NLW_ch_in_cnt_reg[7]_i_4_O_UNCONNECTED [3:0]),
        .S({\ch_in_cnt[7]_i_8__0_n_0 ,\ch_in_cnt[7]_i_9__0_n_0 ,\ch_in_cnt[7]_i_10__0_n_0 ,\ch_in_cnt[7]_i_11__0_n_0 }));
  LUT3 #(
    .INIT(8'h08)) 
    \col_cnt[0]_i_1__3 
       (.I0(computation_done),
        .I1(\row_cnt_reg[7]_i_3_n_0 ),
        .I2(col_cnt[0]),
        .O(\col_cnt[0]_i_1__3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair91" *) 
  LUT4 #(
    .INIT(16'h0880)) 
    \col_cnt[1]_i_1__3 
       (.I0(\row_cnt_reg[7]_i_3_n_0 ),
        .I1(computation_done),
        .I2(col_cnt[0]),
        .I3(col_cnt[1]),
        .O(\col_cnt[1]_i_1__3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair91" *) 
  LUT5 #(
    .INIT(32'h08888000)) 
    \col_cnt[2]_i_1__2 
       (.I0(\row_cnt_reg[7]_i_3_n_0 ),
        .I1(computation_done),
        .I2(col_cnt[0]),
        .I3(col_cnt[1]),
        .I4(col_cnt[2]),
        .O(\col_cnt[2]_i_1__2_n_0 ));
  LUT6 #(
    .INIT(64'h7F00000080000000)) 
    \col_cnt[3]_i_1__3 
       (.I0(col_cnt[2]),
        .I1(col_cnt[0]),
        .I2(col_cnt[1]),
        .I3(computation_done),
        .I4(\row_cnt_reg[7]_i_3_n_0 ),
        .I5(col_cnt[3]),
        .O(\col_cnt[3]_i_1__3_n_0 ));
  LUT6 #(
    .INIT(64'h7FFF000080000000)) 
    \col_cnt[4]_i_1__2 
       (.I0(col_cnt[1]),
        .I1(col_cnt[0]),
        .I2(col_cnt[2]),
        .I3(col_cnt[3]),
        .I4(\col_cnt[5]_i_3__0_n_0 ),
        .I5(col_cnt[4]),
        .O(\col_cnt[4]_i_1__2_n_0 ));
  LUT6 #(
    .INIT(64'hFF7F000000800000)) 
    \col_cnt[5]_i_1__2 
       (.I0(col_cnt[4]),
        .I1(col_cnt[3]),
        .I2(col_cnt[2]),
        .I3(\col_cnt[5]_i_2__2_n_0 ),
        .I4(\col_cnt[5]_i_3__0_n_0 ),
        .I5(col_cnt[5]),
        .O(\col_cnt[5]_i_1__2_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \col_cnt[5]_i_2__2 
       (.I0(col_cnt[1]),
        .I1(col_cnt[0]),
        .O(\col_cnt[5]_i_2__2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \col_cnt[5]_i_3__0 
       (.I0(\row_cnt_reg[7]_i_3_n_0 ),
        .I1(computation_done),
        .O(\col_cnt[5]_i_3__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair90" *) 
  LUT4 #(
    .INIT(16'h8040)) 
    \col_cnt[6]_i_1__2 
       (.I0(\col_cnt[7]_i_3__2_n_0 ),
        .I1(computation_done),
        .I2(\row_cnt_reg[7]_i_3_n_0 ),
        .I3(col_cnt[6]),
        .O(\col_cnt[6]_i_1__2_n_0 ));
  LUT5 #(
    .INIT(32'hFF040404)) 
    \col_cnt[7]_i_1__2 
       (.I0(\row_cnt_reg[7]_i_5_n_0 ),
        .I1(computation_done),
        .I2(\row_cnt_reg[7]_i_4_n_0 ),
        .I3(ctrl_start),
        .I4(\FSM_onehot_state_reg_n_0_[0] ),
        .O(col_cnt0));
  (* SOFT_HLUTNM = "soft_lutpair90" *) 
  LUT5 #(
    .INIT(32'hB0004000)) 
    \col_cnt[7]_i_2__2 
       (.I0(\col_cnt[7]_i_3__2_n_0 ),
        .I1(col_cnt[6]),
        .I2(computation_done),
        .I3(\row_cnt_reg[7]_i_3_n_0 ),
        .I4(col_cnt[7]),
        .O(\col_cnt[7]_i_2__2_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \col_cnt[7]_i_3__2 
       (.I0(col_cnt[1]),
        .I1(col_cnt[0]),
        .I2(col_cnt[2]),
        .I3(col_cnt[3]),
        .I4(col_cnt[4]),
        .I5(col_cnt[5]),
        .O(\col_cnt[7]_i_3__2_n_0 ));
  FDRE \col_cnt_reg[0] 
       (.C(CLK),
        .CE(col_cnt0),
        .D(\col_cnt[0]_i_1__3_n_0 ),
        .Q(col_cnt[0]),
        .R(rst));
  FDRE \col_cnt_reg[1] 
       (.C(CLK),
        .CE(col_cnt0),
        .D(\col_cnt[1]_i_1__3_n_0 ),
        .Q(col_cnt[1]),
        .R(rst));
  FDRE \col_cnt_reg[2] 
       (.C(CLK),
        .CE(col_cnt0),
        .D(\col_cnt[2]_i_1__2_n_0 ),
        .Q(col_cnt[2]),
        .R(rst));
  FDRE \col_cnt_reg[3] 
       (.C(CLK),
        .CE(col_cnt0),
        .D(\col_cnt[3]_i_1__3_n_0 ),
        .Q(col_cnt[3]),
        .R(rst));
  FDRE \col_cnt_reg[4] 
       (.C(CLK),
        .CE(col_cnt0),
        .D(\col_cnt[4]_i_1__2_n_0 ),
        .Q(col_cnt[4]),
        .R(rst));
  FDRE \col_cnt_reg[5] 
       (.C(CLK),
        .CE(col_cnt0),
        .D(\col_cnt[5]_i_1__2_n_0 ),
        .Q(col_cnt[5]),
        .R(rst));
  FDRE \col_cnt_reg[6] 
       (.C(CLK),
        .CE(col_cnt0),
        .D(\col_cnt[6]_i_1__2_n_0 ),
        .Q(col_cnt[6]),
        .R(rst));
  FDRE \col_cnt_reg[7] 
       (.C(CLK),
        .CE(col_cnt0),
        .D(\col_cnt[7]_i_2__2_n_0 ),
        .Q(col_cnt[7]),
        .R(rst));
  LUT5 #(
    .INIT(32'hABBBA888)) 
    computation_done_i_1__0
       (.I0(computation_done),
        .I1(computation_done_i_2__1_n_0),
        .I2(ctrl_start),
        .I3(\FSM_onehot_state_reg_n_0_[0] ),
        .I4(computation_done_reg_n_0),
        .O(computation_done_i_1__0_n_0));
  LUT6 #(
    .INIT(64'h0000000000010000)) 
    computation_done_i_2__1
       (.I0(\row_cnt_reg[7]_i_7_n_0 ),
        .I1(\ch_in_cnt_reg[7]_i_4_n_0 ),
        .I2(\row_cnt_reg[7]_i_3_n_0 ),
        .I3(\row_cnt_reg[7]_i_5_n_0 ),
        .I4(computation_done),
        .I5(\row_cnt_reg[7]_i_4_n_0 ),
        .O(computation_done_i_2__1_n_0));
  FDRE computation_done_reg
       (.C(CLK),
        .CE(1'b1),
        .D(computation_done_i_1__0_n_0),
        .Q(computation_done_reg_n_0),
        .R(rst));
  LUT4 #(
    .INIT(16'h0004)) 
    ctrl_start_i_1__1
       (.I0(state[0]),
        .I1(state[1]),
        .I2(busy_reg_n_0),
        .I3(ctrl_start),
        .O(\state_reg[0] ));
  FDRE done_reg
       (.C(CLK),
        .CE(1'b1),
        .D(\FSM_onehot_state_reg_n_0_[4] ),
        .Q(done_reg_n_0),
        .R(rst));
  (* SOFT_HLUTNM = "soft_lutpair104" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \pipe_delay_cnt[0]_i_1__1 
       (.I0(\FSM_onehot_state_reg_n_0_[3] ),
        .I1(\pipe_delay_cnt_reg_n_0_[0] ),
        .O(pipe_delay_cnt[0]));
  (* SOFT_HLUTNM = "soft_lutpair104" *) 
  LUT3 #(
    .INIT(8'h48)) 
    \pipe_delay_cnt[1]_i_1__1 
       (.I0(\pipe_delay_cnt_reg_n_0_[0] ),
        .I1(\FSM_onehot_state_reg_n_0_[3] ),
        .I2(\pipe_delay_cnt_reg_n_0_[1] ),
        .O(pipe_delay_cnt[1]));
  (* SOFT_HLUTNM = "soft_lutpair97" *) 
  LUT4 #(
    .INIT(16'h7080)) 
    \pipe_delay_cnt[2]_i_1__1 
       (.I0(\pipe_delay_cnt_reg_n_0_[0] ),
        .I1(\pipe_delay_cnt_reg_n_0_[1] ),
        .I2(\FSM_onehot_state_reg_n_0_[3] ),
        .I3(\pipe_delay_cnt_reg_n_0_[2] ),
        .O(pipe_delay_cnt[2]));
  LUT3 #(
    .INIT(8'hF8)) 
    \pipe_delay_cnt[3]_i_1__2 
       (.I0(ctrl_start),
        .I1(\FSM_onehot_state_reg_n_0_[0] ),
        .I2(\FSM_onehot_state_reg_n_0_[3] ),
        .O(\pipe_delay_cnt[3]_i_1__2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair97" *) 
  LUT5 #(
    .INIT(32'h7F008000)) 
    \pipe_delay_cnt[3]_i_2__2 
       (.I0(\pipe_delay_cnt_reg_n_0_[1] ),
        .I1(\pipe_delay_cnt_reg_n_0_[0] ),
        .I2(\pipe_delay_cnt_reg_n_0_[2] ),
        .I3(\FSM_onehot_state_reg_n_0_[3] ),
        .I4(\pipe_delay_cnt_reg_n_0_[3] ),
        .O(pipe_delay_cnt[3]));
  FDRE \pipe_delay_cnt_reg[0] 
       (.C(CLK),
        .CE(\pipe_delay_cnt[3]_i_1__2_n_0 ),
        .D(pipe_delay_cnt[0]),
        .Q(\pipe_delay_cnt_reg_n_0_[0] ),
        .R(rst));
  FDRE \pipe_delay_cnt_reg[1] 
       (.C(CLK),
        .CE(\pipe_delay_cnt[3]_i_1__2_n_0 ),
        .D(pipe_delay_cnt[1]),
        .Q(\pipe_delay_cnt_reg_n_0_[1] ),
        .R(rst));
  FDRE \pipe_delay_cnt_reg[2] 
       (.C(CLK),
        .CE(\pipe_delay_cnt[3]_i_1__2_n_0 ),
        .D(pipe_delay_cnt[2]),
        .Q(\pipe_delay_cnt_reg_n_0_[2] ),
        .R(rst));
  FDRE \pipe_delay_cnt_reg[3] 
       (.C(CLK),
        .CE(\pipe_delay_cnt[3]_i_1__2_n_0 ),
        .D(pipe_delay_cnt[3]),
        .Q(\pipe_delay_cnt_reg_n_0_[3] ),
        .R(rst));
  LUT3 #(
    .INIT(8'h08)) 
    \pool_col_cnt[0]_i_1__0 
       (.I0(computation_done),
        .I1(\row_cnt_reg[7]_i_4_n_0 ),
        .I2(pool_col_cnt[0]),
        .O(\pool_col_cnt[0]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair94" *) 
  LUT4 #(
    .INIT(16'h0880)) 
    \pool_col_cnt[1]_i_1__0 
       (.I0(\row_cnt_reg[7]_i_4_n_0 ),
        .I1(computation_done),
        .I2(pool_col_cnt[0]),
        .I3(pool_col_cnt[1]),
        .O(\pool_col_cnt[1]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair94" *) 
  LUT5 #(
    .INIT(32'h70008000)) 
    \pool_col_cnt[2]_i_1__0 
       (.I0(pool_col_cnt[1]),
        .I1(pool_col_cnt[0]),
        .I2(computation_done),
        .I3(\row_cnt_reg[7]_i_4_n_0 ),
        .I4(pool_col_cnt[2]),
        .O(\pool_col_cnt[2]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h7F00000080000000)) 
    \pool_col_cnt[3]_i_1__0 
       (.I0(pool_col_cnt[2]),
        .I1(pool_col_cnt[0]),
        .I2(pool_col_cnt[1]),
        .I3(computation_done),
        .I4(\row_cnt_reg[7]_i_4_n_0 ),
        .I5(pool_col_cnt[3]),
        .O(\pool_col_cnt[3]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h7FFF000080000000)) 
    \pool_col_cnt[4]_i_1__0 
       (.I0(pool_col_cnt[1]),
        .I1(pool_col_cnt[0]),
        .I2(pool_col_cnt[2]),
        .I3(pool_col_cnt[3]),
        .I4(\pool_col_cnt[4]_i_2__0_n_0 ),
        .I5(pool_col_cnt[4]),
        .O(\pool_col_cnt[4]_i_1__0_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \pool_col_cnt[4]_i_2__0 
       (.I0(\row_cnt_reg[7]_i_4_n_0 ),
        .I1(computation_done),
        .O(\pool_col_cnt[4]_i_2__0_n_0 ));
  LUT4 #(
    .INIT(16'h4080)) 
    \pool_col_cnt[5]_i_1__0 
       (.I0(\pool_col_cnt[5]_i_2__0_n_0 ),
        .I1(computation_done),
        .I2(\row_cnt_reg[7]_i_4_n_0 ),
        .I3(pool_col_cnt[5]),
        .O(\pool_col_cnt[5]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'h80000000)) 
    \pool_col_cnt[5]_i_2__0 
       (.I0(pool_col_cnt[4]),
        .I1(pool_col_cnt[3]),
        .I2(pool_col_cnt[2]),
        .I3(pool_col_cnt[0]),
        .I4(pool_col_cnt[1]),
        .O(\pool_col_cnt[5]_i_2__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair95" *) 
  LUT4 #(
    .INIT(16'h8040)) 
    \pool_col_cnt[6]_i_1__0 
       (.I0(\pool_col_cnt[7]_i_3__0_n_0 ),
        .I1(computation_done),
        .I2(\row_cnt_reg[7]_i_4_n_0 ),
        .I3(pool_col_cnt[6]),
        .O(\pool_col_cnt[6]_i_1__0_n_0 ));
  LUT3 #(
    .INIT(8'hF8)) 
    \pool_col_cnt[7]_i_1__0 
       (.I0(ctrl_start),
        .I1(\FSM_onehot_state_reg_n_0_[0] ),
        .I2(computation_done),
        .O(pool_col_cnt0));
  (* SOFT_HLUTNM = "soft_lutpair95" *) 
  LUT5 #(
    .INIT(32'hB0004000)) 
    \pool_col_cnt[7]_i_2__0 
       (.I0(\pool_col_cnt[7]_i_3__0_n_0 ),
        .I1(pool_col_cnt[6]),
        .I2(computation_done),
        .I3(\row_cnt_reg[7]_i_4_n_0 ),
        .I4(pool_col_cnt[7]),
        .O(\pool_col_cnt[7]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \pool_col_cnt[7]_i_3__0 
       (.I0(pool_col_cnt[1]),
        .I1(pool_col_cnt[0]),
        .I2(pool_col_cnt[2]),
        .I3(pool_col_cnt[3]),
        .I4(pool_col_cnt[4]),
        .I5(pool_col_cnt[5]),
        .O(\pool_col_cnt[7]_i_3__0_n_0 ));
  FDRE \pool_col_cnt_reg[0] 
       (.C(CLK),
        .CE(pool_col_cnt0),
        .D(\pool_col_cnt[0]_i_1__0_n_0 ),
        .Q(pool_col_cnt[0]),
        .R(rst));
  FDRE \pool_col_cnt_reg[1] 
       (.C(CLK),
        .CE(pool_col_cnt0),
        .D(\pool_col_cnt[1]_i_1__0_n_0 ),
        .Q(pool_col_cnt[1]),
        .R(rst));
  FDRE \pool_col_cnt_reg[2] 
       (.C(CLK),
        .CE(pool_col_cnt0),
        .D(\pool_col_cnt[2]_i_1__0_n_0 ),
        .Q(pool_col_cnt[2]),
        .R(rst));
  FDRE \pool_col_cnt_reg[3] 
       (.C(CLK),
        .CE(pool_col_cnt0),
        .D(\pool_col_cnt[3]_i_1__0_n_0 ),
        .Q(pool_col_cnt[3]),
        .R(rst));
  FDRE \pool_col_cnt_reg[4] 
       (.C(CLK),
        .CE(pool_col_cnt0),
        .D(\pool_col_cnt[4]_i_1__0_n_0 ),
        .Q(pool_col_cnt[4]),
        .R(rst));
  FDRE \pool_col_cnt_reg[5] 
       (.C(CLK),
        .CE(pool_col_cnt0),
        .D(\pool_col_cnt[5]_i_1__0_n_0 ),
        .Q(pool_col_cnt[5]),
        .R(rst));
  FDRE \pool_col_cnt_reg[6] 
       (.C(CLK),
        .CE(pool_col_cnt0),
        .D(\pool_col_cnt[6]_i_1__0_n_0 ),
        .Q(pool_col_cnt[6]),
        .R(rst));
  FDRE \pool_col_cnt_reg[7] 
       (.C(CLK),
        .CE(pool_col_cnt0),
        .D(\pool_col_cnt[7]_i_2__0_n_0 ),
        .Q(pool_col_cnt[7]),
        .R(rst));
  LUT3 #(
    .INIT(8'h08)) 
    \pool_row_cnt[0]_i_1__0 
       (.I0(computation_done),
        .I1(\row_cnt_reg[7]_i_5_n_0 ),
        .I2(pool_row_cnt[0]),
        .O(\pool_row_cnt[0]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair92" *) 
  LUT4 #(
    .INIT(16'h0880)) 
    \pool_row_cnt[1]_i_1__0 
       (.I0(\row_cnt_reg[7]_i_5_n_0 ),
        .I1(computation_done),
        .I2(pool_row_cnt[0]),
        .I3(pool_row_cnt[1]),
        .O(\pool_row_cnt[1]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair92" *) 
  LUT5 #(
    .INIT(32'h70008000)) 
    \pool_row_cnt[2]_i_1__0 
       (.I0(pool_row_cnt[1]),
        .I1(pool_row_cnt[0]),
        .I2(computation_done),
        .I3(\row_cnt_reg[7]_i_5_n_0 ),
        .I4(pool_row_cnt[2]),
        .O(\pool_row_cnt[2]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h7F00000080000000)) 
    \pool_row_cnt[3]_i_1__0 
       (.I0(pool_row_cnt[2]),
        .I1(pool_row_cnt[0]),
        .I2(pool_row_cnt[1]),
        .I3(computation_done),
        .I4(\row_cnt_reg[7]_i_5_n_0 ),
        .I5(pool_row_cnt[3]),
        .O(\pool_row_cnt[3]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h7FFF000080000000)) 
    \pool_row_cnt[4]_i_1__0 
       (.I0(pool_row_cnt[1]),
        .I1(pool_row_cnt[0]),
        .I2(pool_row_cnt[2]),
        .I3(pool_row_cnt[3]),
        .I4(\pool_row_cnt[4]_i_2__0_n_0 ),
        .I5(pool_row_cnt[4]),
        .O(\pool_row_cnt[4]_i_1__0_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \pool_row_cnt[4]_i_2__0 
       (.I0(\row_cnt_reg[7]_i_5_n_0 ),
        .I1(computation_done),
        .O(\pool_row_cnt[4]_i_2__0_n_0 ));
  LUT4 #(
    .INIT(16'h4080)) 
    \pool_row_cnt[5]_i_1__0 
       (.I0(\pool_row_cnt[5]_i_2__0_n_0 ),
        .I1(computation_done),
        .I2(\row_cnt_reg[7]_i_5_n_0 ),
        .I3(pool_row_cnt[5]),
        .O(\pool_row_cnt[5]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'h80000000)) 
    \pool_row_cnt[5]_i_2__0 
       (.I0(pool_row_cnt[4]),
        .I1(pool_row_cnt[3]),
        .I2(pool_row_cnt[2]),
        .I3(pool_row_cnt[0]),
        .I4(pool_row_cnt[1]),
        .O(\pool_row_cnt[5]_i_2__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair93" *) 
  LUT4 #(
    .INIT(16'h8040)) 
    \pool_row_cnt[6]_i_1__0 
       (.I0(\pool_row_cnt[7]_i_3__0_n_0 ),
        .I1(computation_done),
        .I2(\row_cnt_reg[7]_i_5_n_0 ),
        .I3(pool_row_cnt[6]),
        .O(\pool_row_cnt[6]_i_1__0_n_0 ));
  LUT4 #(
    .INIT(16'hF444)) 
    \pool_row_cnt[7]_i_1__0 
       (.I0(\row_cnt_reg[7]_i_4_n_0 ),
        .I1(computation_done),
        .I2(ctrl_start),
        .I3(\FSM_onehot_state_reg_n_0_[0] ),
        .O(pool_row_cnt0));
  (* SOFT_HLUTNM = "soft_lutpair93" *) 
  LUT5 #(
    .INIT(32'hB0004000)) 
    \pool_row_cnt[7]_i_2__0 
       (.I0(\pool_row_cnt[7]_i_3__0_n_0 ),
        .I1(pool_row_cnt[6]),
        .I2(computation_done),
        .I3(\row_cnt_reg[7]_i_5_n_0 ),
        .I4(pool_row_cnt[7]),
        .O(\pool_row_cnt[7]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \pool_row_cnt[7]_i_3__0 
       (.I0(pool_row_cnt[1]),
        .I1(pool_row_cnt[0]),
        .I2(pool_row_cnt[2]),
        .I3(pool_row_cnt[3]),
        .I4(pool_row_cnt[4]),
        .I5(pool_row_cnt[5]),
        .O(\pool_row_cnt[7]_i_3__0_n_0 ));
  FDRE \pool_row_cnt_reg[0] 
       (.C(CLK),
        .CE(pool_row_cnt0),
        .D(\pool_row_cnt[0]_i_1__0_n_0 ),
        .Q(pool_row_cnt[0]),
        .R(rst));
  FDRE \pool_row_cnt_reg[1] 
       (.C(CLK),
        .CE(pool_row_cnt0),
        .D(\pool_row_cnt[1]_i_1__0_n_0 ),
        .Q(pool_row_cnt[1]),
        .R(rst));
  FDRE \pool_row_cnt_reg[2] 
       (.C(CLK),
        .CE(pool_row_cnt0),
        .D(\pool_row_cnt[2]_i_1__0_n_0 ),
        .Q(pool_row_cnt[2]),
        .R(rst));
  FDRE \pool_row_cnt_reg[3] 
       (.C(CLK),
        .CE(pool_row_cnt0),
        .D(\pool_row_cnt[3]_i_1__0_n_0 ),
        .Q(pool_row_cnt[3]),
        .R(rst));
  FDRE \pool_row_cnt_reg[4] 
       (.C(CLK),
        .CE(pool_row_cnt0),
        .D(\pool_row_cnt[4]_i_1__0_n_0 ),
        .Q(pool_row_cnt[4]),
        .R(rst));
  FDRE \pool_row_cnt_reg[5] 
       (.C(CLK),
        .CE(pool_row_cnt0),
        .D(\pool_row_cnt[5]_i_1__0_n_0 ),
        .Q(pool_row_cnt[5]),
        .R(rst));
  FDRE \pool_row_cnt_reg[6] 
       (.C(CLK),
        .CE(pool_row_cnt0),
        .D(\pool_row_cnt[6]_i_1__0_n_0 ),
        .Q(pool_row_cnt[6]),
        .R(rst));
  FDRE \pool_row_cnt_reg[7] 
       (.C(CLK),
        .CE(pool_row_cnt0),
        .D(\pool_row_cnt[7]_i_2__0_n_0 ),
        .Q(pool_row_cnt[7]),
        .R(rst));
  LUT3 #(
    .INIT(8'h08)) 
    \row_cnt[0]_i_1__2 
       (.I0(computation_done),
        .I1(\row_cnt_reg[7]_i_7_n_0 ),
        .I2(row_cnt[0]),
        .O(\row_cnt[0]_i_1__2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair88" *) 
  LUT4 #(
    .INIT(16'h0880)) 
    \row_cnt[1]_i_1__2 
       (.I0(\row_cnt_reg[7]_i_7_n_0 ),
        .I1(computation_done),
        .I2(row_cnt[0]),
        .I3(row_cnt[1]),
        .O(\row_cnt[1]_i_1__2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair88" *) 
  LUT5 #(
    .INIT(32'h08888000)) 
    \row_cnt[2]_i_1__2 
       (.I0(\row_cnt_reg[7]_i_7_n_0 ),
        .I1(computation_done),
        .I2(row_cnt[0]),
        .I3(row_cnt[1]),
        .I4(row_cnt[2]),
        .O(\row_cnt[2]_i_1__2_n_0 ));
  LUT6 #(
    .INIT(64'h7F00000080000000)) 
    \row_cnt[3]_i_1__2 
       (.I0(row_cnt[2]),
        .I1(row_cnt[0]),
        .I2(row_cnt[1]),
        .I3(computation_done),
        .I4(\row_cnt_reg[7]_i_7_n_0 ),
        .I5(row_cnt[3]),
        .O(\row_cnt[3]_i_1__2_n_0 ));
  LUT6 #(
    .INIT(64'h7FFF000080000000)) 
    \row_cnt[4]_i_1__2 
       (.I0(row_cnt[1]),
        .I1(row_cnt[0]),
        .I2(row_cnt[2]),
        .I3(row_cnt[3]),
        .I4(\row_cnt[5]_i_3__0_n_0 ),
        .I5(row_cnt[4]),
        .O(\row_cnt[4]_i_1__2_n_0 ));
  LUT6 #(
    .INIT(64'hFF7F000000800000)) 
    \row_cnt[5]_i_1__2 
       (.I0(row_cnt[4]),
        .I1(row_cnt[3]),
        .I2(row_cnt[2]),
        .I3(\row_cnt[5]_i_2__2_n_0 ),
        .I4(\row_cnt[5]_i_3__0_n_0 ),
        .I5(row_cnt[5]),
        .O(\row_cnt[5]_i_1__2_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \row_cnt[5]_i_2__2 
       (.I0(row_cnt[1]),
        .I1(row_cnt[0]),
        .O(\row_cnt[5]_i_2__2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \row_cnt[5]_i_3__0 
       (.I0(\row_cnt_reg[7]_i_7_n_0 ),
        .I1(computation_done),
        .O(\row_cnt[5]_i_3__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair89" *) 
  LUT4 #(
    .INIT(16'h8040)) 
    \row_cnt[6]_i_1__2 
       (.I0(\row_cnt[7]_i_6__1_n_0 ),
        .I1(computation_done),
        .I2(\row_cnt_reg[7]_i_7_n_0 ),
        .I3(row_cnt[6]),
        .O(\row_cnt[6]_i_1__2_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \row_cnt[7]_i_10__1 
       (.I0(col_cnt[5]),
        .I1(col_cnt[4]),
        .O(\row_cnt[7]_i_10__1_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \row_cnt[7]_i_11__1 
       (.I0(col_cnt[3]),
        .I1(col_cnt[2]),
        .O(\row_cnt[7]_i_11__1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \row_cnt[7]_i_12__1 
       (.I0(col_cnt[0]),
        .I1(col_cnt[1]),
        .O(\row_cnt[7]_i_12__1_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \row_cnt[7]_i_13__1 
       (.I0(pool_col_cnt[1]),
        .I1(pool_col_cnt[0]),
        .O(\row_cnt[7]_i_13__1_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \row_cnt[7]_i_14__1 
       (.I0(pool_col_cnt[7]),
        .I1(pool_col_cnt[6]),
        .O(\row_cnt[7]_i_14__1_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \row_cnt[7]_i_15__1 
       (.I0(pool_col_cnt[5]),
        .I1(pool_col_cnt[4]),
        .O(\row_cnt[7]_i_15__1_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \row_cnt[7]_i_16__1 
       (.I0(pool_col_cnt[3]),
        .I1(pool_col_cnt[2]),
        .O(\row_cnt[7]_i_16__1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \row_cnt[7]_i_17__1 
       (.I0(pool_col_cnt[0]),
        .I1(pool_col_cnt[1]),
        .O(\row_cnt[7]_i_17__1_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \row_cnt[7]_i_18__1 
       (.I0(pool_row_cnt[1]),
        .I1(pool_row_cnt[0]),
        .O(\row_cnt[7]_i_18__1_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \row_cnt[7]_i_19__1 
       (.I0(pool_row_cnt[7]),
        .I1(pool_row_cnt[6]),
        .O(\row_cnt[7]_i_19__1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF001000100010)) 
    \row_cnt[7]_i_1__2 
       (.I0(\row_cnt_reg[7]_i_3_n_0 ),
        .I1(\row_cnt_reg[7]_i_4_n_0 ),
        .I2(computation_done),
        .I3(\row_cnt_reg[7]_i_5_n_0 ),
        .I4(ctrl_start),
        .I5(\FSM_onehot_state_reg_n_0_[0] ),
        .O(row_cnt0));
  LUT2 #(
    .INIT(4'h1)) 
    \row_cnt[7]_i_20__1 
       (.I0(pool_row_cnt[5]),
        .I1(pool_row_cnt[4]),
        .O(\row_cnt[7]_i_20__1_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \row_cnt[7]_i_21__1 
       (.I0(pool_row_cnt[3]),
        .I1(pool_row_cnt[2]),
        .O(\row_cnt[7]_i_21__1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \row_cnt[7]_i_22__2 
       (.I0(pool_row_cnt[0]),
        .I1(pool_row_cnt[1]),
        .O(\row_cnt[7]_i_22__2_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \row_cnt[7]_i_23__2 
       (.I0(row_cnt[0]),
        .I1(row_cnt[1]),
        .O(\row_cnt[7]_i_23__2_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \row_cnt[7]_i_24__1 
       (.I0(row_cnt[7]),
        .I1(row_cnt[6]),
        .O(\row_cnt[7]_i_24__1_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \row_cnt[7]_i_25__1 
       (.I0(row_cnt[5]),
        .I1(row_cnt[4]),
        .O(\row_cnt[7]_i_25__1_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \row_cnt[7]_i_26__2 
       (.I0(row_cnt[2]),
        .I1(row_cnt[3]),
        .O(\row_cnt[7]_i_26__2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \row_cnt[7]_i_27__1 
       (.I0(row_cnt[0]),
        .I1(row_cnt[1]),
        .O(\row_cnt[7]_i_27__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair89" *) 
  LUT5 #(
    .INIT(32'hB0004000)) 
    \row_cnt[7]_i_2__2 
       (.I0(\row_cnt[7]_i_6__1_n_0 ),
        .I1(row_cnt[6]),
        .I2(computation_done),
        .I3(\row_cnt_reg[7]_i_7_n_0 ),
        .I4(row_cnt[7]),
        .O(\row_cnt[7]_i_2__2_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \row_cnt[7]_i_6__1 
       (.I0(row_cnt[1]),
        .I1(row_cnt[0]),
        .I2(row_cnt[2]),
        .I3(row_cnt[3]),
        .I4(row_cnt[4]),
        .I5(row_cnt[5]),
        .O(\row_cnt[7]_i_6__1_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \row_cnt[7]_i_8__1 
       (.I0(col_cnt[1]),
        .I1(col_cnt[0]),
        .O(\row_cnt[7]_i_8__1_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \row_cnt[7]_i_9__0 
       (.I0(col_cnt[7]),
        .I1(col_cnt[6]),
        .O(\row_cnt[7]_i_9__0_n_0 ));
  FDRE \row_cnt_reg[0] 
       (.C(CLK),
        .CE(row_cnt0),
        .D(\row_cnt[0]_i_1__2_n_0 ),
        .Q(row_cnt[0]),
        .R(rst));
  FDRE \row_cnt_reg[1] 
       (.C(CLK),
        .CE(row_cnt0),
        .D(\row_cnt[1]_i_1__2_n_0 ),
        .Q(row_cnt[1]),
        .R(rst));
  FDRE \row_cnt_reg[2] 
       (.C(CLK),
        .CE(row_cnt0),
        .D(\row_cnt[2]_i_1__2_n_0 ),
        .Q(row_cnt[2]),
        .R(rst));
  FDRE \row_cnt_reg[3] 
       (.C(CLK),
        .CE(row_cnt0),
        .D(\row_cnt[3]_i_1__2_n_0 ),
        .Q(row_cnt[3]),
        .R(rst));
  FDRE \row_cnt_reg[4] 
       (.C(CLK),
        .CE(row_cnt0),
        .D(\row_cnt[4]_i_1__2_n_0 ),
        .Q(row_cnt[4]),
        .R(rst));
  FDRE \row_cnt_reg[5] 
       (.C(CLK),
        .CE(row_cnt0),
        .D(\row_cnt[5]_i_1__2_n_0 ),
        .Q(row_cnt[5]),
        .R(rst));
  FDRE \row_cnt_reg[6] 
       (.C(CLK),
        .CE(row_cnt0),
        .D(\row_cnt[6]_i_1__2_n_0 ),
        .Q(row_cnt[6]),
        .R(rst));
  FDRE \row_cnt_reg[7] 
       (.C(CLK),
        .CE(row_cnt0),
        .D(\row_cnt[7]_i_2__2_n_0 ),
        .Q(row_cnt[7]),
        .R(rst));
  CARRY4 \row_cnt_reg[7]_i_3 
       (.CI(1'b0),
        .CO({\row_cnt_reg[7]_i_3_n_0 ,\NLW_row_cnt_reg[7]_i_3_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,\row_cnt[7]_i_8__1_n_0 }),
        .O(\NLW_row_cnt_reg[7]_i_3_O_UNCONNECTED [3:0]),
        .S({\row_cnt[7]_i_9__0_n_0 ,\row_cnt[7]_i_10__1_n_0 ,\row_cnt[7]_i_11__1_n_0 ,\row_cnt[7]_i_12__1_n_0 }));
  CARRY4 \row_cnt_reg[7]_i_4 
       (.CI(1'b0),
        .CO({\row_cnt_reg[7]_i_4_n_0 ,\NLW_row_cnt_reg[7]_i_4_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,\row_cnt[7]_i_13__1_n_0 }),
        .O(\NLW_row_cnt_reg[7]_i_4_O_UNCONNECTED [3:0]),
        .S({\row_cnt[7]_i_14__1_n_0 ,\row_cnt[7]_i_15__1_n_0 ,\row_cnt[7]_i_16__1_n_0 ,\row_cnt[7]_i_17__1_n_0 }));
  CARRY4 \row_cnt_reg[7]_i_5 
       (.CI(1'b0),
        .CO({\row_cnt_reg[7]_i_5_n_0 ,\NLW_row_cnt_reg[7]_i_5_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,\row_cnt[7]_i_18__1_n_0 }),
        .O(\NLW_row_cnt_reg[7]_i_5_O_UNCONNECTED [3:0]),
        .S({\row_cnt[7]_i_19__1_n_0 ,\row_cnt[7]_i_20__1_n_0 ,\row_cnt[7]_i_21__1_n_0 ,\row_cnt[7]_i_22__2_n_0 }));
  CARRY4 \row_cnt_reg[7]_i_7 
       (.CI(1'b0),
        .CO({\row_cnt_reg[7]_i_7_n_0 ,\NLW_row_cnt_reg[7]_i_7_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,\row_cnt[7]_i_23__2_n_0 }),
        .O(\NLW_row_cnt_reg[7]_i_7_O_UNCONNECTED [3:0]),
        .S({\row_cnt[7]_i_24__1_n_0 ,\row_cnt[7]_i_25__1_n_0 ,\row_cnt[7]_i_26__2_n_0 ,\row_cnt[7]_i_27__1_n_0 }));
  LUT4 #(
    .INIT(16'hFC88)) 
    \state[0]_i_1__0 
       (.I0(done_reg_n_0),
        .I1(state[1]),
        .I2(win_load_active),
        .I3(state[0]),
        .O(done_reg_0));
endmodule

(* ORIG_REF_NAME = "nn_layer_control_unit" *) 
module nn_layer_control_unit_0
   (\out_ch_cnt_reg[3] ,
    busy_reg_0,
    rst,
    CLK,
    \state_reg[0] ,
    Q,
    state_0,
    \state_reg[0]_0 ,
    ctrl_start);
  output \out_ch_cnt_reg[3] ;
  output busy_reg_0;
  input rst;
  input CLK;
  input \state_reg[0] ;
  input [0:0]Q;
  input [1:0]state_0;
  input \state_reg[0]_0 ;
  input ctrl_start;

  wire CLK;
  wire \FSM_onehot_state[4]_i_1__1_n_0 ;
  wire \FSM_onehot_state[4]_i_2__1_n_0 ;
  wire \FSM_onehot_state_reg_n_0_[0] ;
  wire \FSM_onehot_state_reg_n_0_[3] ;
  wire \FSM_onehot_state_reg_n_0_[4] ;
  wire [0:0]Q;
  wire busy_i_1__2_n_0;
  wire busy_reg_0;
  wire busy_reg_n_0;
  wire [7:0]ch_in_cnt;
  wire ch_in_cnt0;
  wire \ch_in_cnt[0]_i_1__0_n_0 ;
  wire \ch_in_cnt[1]_i_1__0_n_0 ;
  wire \ch_in_cnt[2]_i_1__0_n_0 ;
  wire \ch_in_cnt[3]_i_1__0_n_0 ;
  wire \ch_in_cnt[4]_i_1__0_n_0 ;
  wire \ch_in_cnt[5]_i_1__0_n_0 ;
  wire \ch_in_cnt[5]_i_2__0_n_0 ;
  wire \ch_in_cnt[6]_i_1__0_n_0 ;
  wire \ch_in_cnt[7]_i_2__0_n_0 ;
  wire \ch_in_cnt[7]_i_3__0_n_0 ;
  wire [7:0]ch_out_cnt;
  wire ch_out_cnt0;
  wire \ch_out_cnt[0]_i_1_n_0 ;
  wire \ch_out_cnt[1]_i_1__0_n_0 ;
  wire \ch_out_cnt[2]_i_1__0_n_0 ;
  wire \ch_out_cnt[3]_i_1__0_n_0 ;
  wire \ch_out_cnt[4]_i_1__0_n_0 ;
  wire \ch_out_cnt[5]_i_1__0_n_0 ;
  wire \ch_out_cnt[5]_i_2__0_n_0 ;
  wire \ch_out_cnt[6]_i_1__0_n_0 ;
  wire \ch_out_cnt[7]_i_10_n_0 ;
  wire \ch_out_cnt[7]_i_11_n_0 ;
  wire \ch_out_cnt[7]_i_2__0_n_0 ;
  wire \ch_out_cnt[7]_i_4_n_0 ;
  wire \ch_out_cnt[7]_i_5_n_0 ;
  wire \ch_out_cnt[7]_i_6__0_n_0 ;
  wire \ch_out_cnt[7]_i_7_n_0 ;
  wire \ch_out_cnt[7]_i_8_n_0 ;
  wire \ch_out_cnt[7]_i_9_n_0 ;
  wire \ch_out_cnt_reg[7]_i_3_n_0 ;
  wire [7:0]col_cnt;
  wire col_cnt0;
  wire \col_cnt[0]_i_1__2_n_0 ;
  wire \col_cnt[1]_i_1__2_n_0 ;
  wire \col_cnt[2]_i_1__1_n_0 ;
  wire \col_cnt[3]_i_1__2_n_0 ;
  wire \col_cnt[4]_i_1__1_n_0 ;
  wire \col_cnt[4]_i_2__1_n_0 ;
  wire \col_cnt[5]_i_1__1_n_0 ;
  wire \col_cnt[5]_i_2__1_n_0 ;
  wire \col_cnt[6]_i_1__1_n_0 ;
  wire \col_cnt[7]_i_2__1_n_0 ;
  wire \col_cnt[7]_i_3__1_n_0 ;
  wire computation_done;
  wire computation_done_i_1__2_n_0;
  wire computation_done_reg_n_0;
  wire ctrl_start;
  wire done_reg_n_0;
  wire [7:0]kc_cnt;
  wire kc_cnt0;
  wire \kc_cnt[0]_i_1__0_n_0 ;
  wire \kc_cnt[1]_i_1__0_n_0 ;
  wire \kc_cnt[2]_i_1__0_n_0 ;
  wire \kc_cnt[3]_i_1__0_n_0 ;
  wire \kc_cnt[4]_i_1__0_n_0 ;
  wire \kc_cnt[4]_i_2__0_n_0 ;
  wire \kc_cnt[5]_i_1__0_n_0 ;
  wire \kc_cnt[6]_i_1__0_n_0 ;
  wire \kc_cnt[7]_i_2__0_n_0 ;
  wire \kc_cnt[7]_i_3__0_n_0 ;
  wire [7:0]kr_cnt;
  wire kr_cnt0;
  wire \kr_cnt[0]_i_1__0_n_0 ;
  wire \kr_cnt[1]_i_1__0_n_0 ;
  wire \kr_cnt[2]_i_1__0_n_0 ;
  wire \kr_cnt[3]_i_1__0_n_0 ;
  wire \kr_cnt[4]_i_1__0_n_0 ;
  wire \kr_cnt[4]_i_2__0_n_0 ;
  wire \kr_cnt[5]_i_1__0_n_0 ;
  wire \kr_cnt[5]_i_2__0_n_0 ;
  wire \kr_cnt[6]_i_1__0_n_0 ;
  wire \kr_cnt[7]_i_2__0_n_0 ;
  wire \kr_cnt[7]_i_3__0_n_0 ;
  wire \out_ch_cnt_reg[3] ;
  wire [3:0]pipe_delay_cnt;
  wire \pipe_delay_cnt[1]_i_1__2_n_0 ;
  wire \pipe_delay_cnt[2]_i_1__2_n_0 ;
  wire \pipe_delay_cnt[3]_i_1__1_n_0 ;
  wire \pipe_delay_cnt_reg_n_0_[0] ;
  wire \pipe_delay_cnt_reg_n_0_[1] ;
  wire \pipe_delay_cnt_reg_n_0_[2] ;
  wire \pipe_delay_cnt_reg_n_0_[3] ;
  wire [7:0]row_cnt;
  wire row_cnt0;
  wire \row_cnt[0]_i_1__1_n_0 ;
  wire \row_cnt[1]_i_1__1_n_0 ;
  wire \row_cnt[2]_i_1__1_n_0 ;
  wire \row_cnt[3]_i_1__1_n_0 ;
  wire \row_cnt[4]_i_1__1_n_0 ;
  wire \row_cnt[4]_i_2__0_n_0 ;
  wire \row_cnt[5]_i_1__1_n_0 ;
  wire \row_cnt[5]_i_2__1_n_0 ;
  wire \row_cnt[6]_i_1__1_n_0 ;
  wire \row_cnt[7]_i_10__0_n_0 ;
  wire \row_cnt[7]_i_11__0_n_0 ;
  wire \row_cnt[7]_i_12__0_n_0 ;
  wire \row_cnt[7]_i_13__0_n_0 ;
  wire \row_cnt[7]_i_14__0_n_0 ;
  wire \row_cnt[7]_i_15__0_n_0 ;
  wire \row_cnt[7]_i_16__0_n_0 ;
  wire \row_cnt[7]_i_17__0_n_0 ;
  wire \row_cnt[7]_i_18__0_n_0 ;
  wire \row_cnt[7]_i_19__0_n_0 ;
  wire \row_cnt[7]_i_20__0_n_0 ;
  wire \row_cnt[7]_i_21__0_n_0 ;
  wire \row_cnt[7]_i_22__1_n_0 ;
  wire \row_cnt[7]_i_23__0_n_0 ;
  wire \row_cnt[7]_i_24__0_n_0 ;
  wire \row_cnt[7]_i_25__0_n_0 ;
  wire \row_cnt[7]_i_26__0_n_0 ;
  wire \row_cnt[7]_i_27__0_n_0 ;
  wire \row_cnt[7]_i_28__0_n_0 ;
  wire \row_cnt[7]_i_29__1_n_0 ;
  wire \row_cnt[7]_i_2__1_n_0 ;
  wire \row_cnt[7]_i_30_n_0 ;
  wire \row_cnt[7]_i_31_n_0 ;
  wire \row_cnt[7]_i_32_n_0 ;
  wire \row_cnt[7]_i_33_n_0 ;
  wire \row_cnt[7]_i_34_n_0 ;
  wire \row_cnt[7]_i_35_n_0 ;
  wire \row_cnt[7]_i_3_n_0 ;
  wire \row_cnt[7]_i_8__0_n_0 ;
  wire \row_cnt_reg[7]_i_4_n_0 ;
  wire \row_cnt_reg[7]_i_5_n_1 ;
  wire \row_cnt_reg[7]_i_6_n_1 ;
  wire \row_cnt_reg[7]_i_7_n_0 ;
  wire \row_cnt_reg[7]_i_9_n_0 ;
  wire rst;
  wire [1:0]state_0;
  wire \state_reg[0] ;
  wire \state_reg[0]_0 ;
  wire wgt_loading_done;
  wire wgt_loading_done_i_1__0_n_0;
  wire wgt_loading_done_reg_n_0;
  wire [2:0]\NLW_ch_out_cnt_reg[7]_i_3_CO_UNCONNECTED ;
  wire [3:0]\NLW_ch_out_cnt_reg[7]_i_3_O_UNCONNECTED ;
  wire [2:0]\NLW_row_cnt_reg[7]_i_4_CO_UNCONNECTED ;
  wire [3:0]\NLW_row_cnt_reg[7]_i_4_O_UNCONNECTED ;
  wire [3:0]\NLW_row_cnt_reg[7]_i_5_CO_UNCONNECTED ;
  wire [3:0]\NLW_row_cnt_reg[7]_i_5_O_UNCONNECTED ;
  wire [3:0]\NLW_row_cnt_reg[7]_i_6_CO_UNCONNECTED ;
  wire [3:0]\NLW_row_cnt_reg[7]_i_6_O_UNCONNECTED ;
  wire [2:0]\NLW_row_cnt_reg[7]_i_7_CO_UNCONNECTED ;
  wire [3:0]\NLW_row_cnt_reg[7]_i_7_O_UNCONNECTED ;
  wire [2:0]\NLW_row_cnt_reg[7]_i_9_CO_UNCONNECTED ;
  wire [3:0]\NLW_row_cnt_reg[7]_i_9_O_UNCONNECTED ;

  LUT5 #(
    .INIT(32'hFFFF8880)) 
    \FSM_onehot_state[4]_i_1__1 
       (.I0(\FSM_onehot_state_reg_n_0_[3] ),
        .I1(\pipe_delay_cnt_reg_n_0_[3] ),
        .I2(\pipe_delay_cnt_reg_n_0_[1] ),
        .I3(\pipe_delay_cnt_reg_n_0_[2] ),
        .I4(\FSM_onehot_state[4]_i_2__1_n_0 ),
        .O(\FSM_onehot_state[4]_i_1__1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFF8F8F8)) 
    \FSM_onehot_state[4]_i_2__1 
       (.I0(wgt_loading_done_reg_n_0),
        .I1(wgt_loading_done),
        .I2(\row_cnt[7]_i_3_n_0 ),
        .I3(computation_done_reg_n_0),
        .I4(computation_done),
        .I5(\FSM_onehot_state_reg_n_0_[4] ),
        .O(\FSM_onehot_state[4]_i_2__1_n_0 ));
  (* FSM_ENCODED_STATES = "IDLE:00001,LOAD_WGT:00010,COMPUTE:00100,WRITE_OUT:01000,DONE_ST:10000," *) 
  FDSE #(
    .INIT(1'b1)) 
    \FSM_onehot_state_reg[0] 
       (.C(CLK),
        .CE(\FSM_onehot_state[4]_i_1__1_n_0 ),
        .D(\FSM_onehot_state_reg_n_0_[4] ),
        .Q(\FSM_onehot_state_reg_n_0_[0] ),
        .S(rst));
  (* FSM_ENCODED_STATES = "IDLE:00001,LOAD_WGT:00010,COMPUTE:00100,WRITE_OUT:01000,DONE_ST:10000," *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[1] 
       (.C(CLK),
        .CE(\FSM_onehot_state[4]_i_1__1_n_0 ),
        .D(\FSM_onehot_state_reg_n_0_[0] ),
        .Q(wgt_loading_done),
        .R(rst));
  (* FSM_ENCODED_STATES = "IDLE:00001,LOAD_WGT:00010,COMPUTE:00100,WRITE_OUT:01000,DONE_ST:10000," *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[2] 
       (.C(CLK),
        .CE(\FSM_onehot_state[4]_i_1__1_n_0 ),
        .D(wgt_loading_done),
        .Q(computation_done),
        .R(rst));
  (* FSM_ENCODED_STATES = "IDLE:00001,LOAD_WGT:00010,COMPUTE:00100,WRITE_OUT:01000,DONE_ST:10000," *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[3] 
       (.C(CLK),
        .CE(\FSM_onehot_state[4]_i_1__1_n_0 ),
        .D(computation_done),
        .Q(\FSM_onehot_state_reg_n_0_[3] ),
        .R(rst));
  (* FSM_ENCODED_STATES = "IDLE:00001,LOAD_WGT:00010,COMPUTE:00100,WRITE_OUT:01000,DONE_ST:10000," *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[4] 
       (.C(CLK),
        .CE(\FSM_onehot_state[4]_i_1__1_n_0 ),
        .D(\FSM_onehot_state_reg_n_0_[3] ),
        .Q(\FSM_onehot_state_reg_n_0_[4] ),
        .R(rst));
  LUT4 #(
    .INIT(16'h8B88)) 
    busy_i_1__2
       (.I0(ctrl_start),
        .I1(\FSM_onehot_state_reg_n_0_[0] ),
        .I2(\FSM_onehot_state_reg_n_0_[4] ),
        .I3(busy_reg_n_0),
        .O(busy_i_1__2_n_0));
  FDRE busy_reg
       (.C(CLK),
        .CE(1'b1),
        .D(busy_i_1__2_n_0),
        .Q(busy_reg_n_0),
        .R(rst));
  LUT3 #(
    .INIT(8'h40)) 
    \ch_in_cnt[0]_i_1__0 
       (.I0(ch_in_cnt[0]),
        .I1(computation_done),
        .I2(\row_cnt_reg[7]_i_4_n_0 ),
        .O(\ch_in_cnt[0]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT4 #(
    .INIT(16'h0880)) 
    \ch_in_cnt[1]_i_1__0 
       (.I0(\row_cnt_reg[7]_i_4_n_0 ),
        .I1(computation_done),
        .I2(ch_in_cnt[1]),
        .I3(ch_in_cnt[0]),
        .O(\ch_in_cnt[1]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT5 #(
    .INIT(32'h08808080)) 
    \ch_in_cnt[2]_i_1__0 
       (.I0(computation_done),
        .I1(\row_cnt_reg[7]_i_4_n_0 ),
        .I2(ch_in_cnt[2]),
        .I3(ch_in_cnt[1]),
        .I4(ch_in_cnt[0]),
        .O(\ch_in_cnt[2]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h7F80000000000000)) 
    \ch_in_cnt[3]_i_1__0 
       (.I0(ch_in_cnt[2]),
        .I1(ch_in_cnt[0]),
        .I2(ch_in_cnt[1]),
        .I3(ch_in_cnt[3]),
        .I4(\row_cnt_reg[7]_i_4_n_0 ),
        .I5(computation_done),
        .O(\ch_in_cnt[3]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT4 #(
    .INIT(16'h8008)) 
    \ch_in_cnt[4]_i_1__0 
       (.I0(computation_done),
        .I1(\row_cnt_reg[7]_i_4_n_0 ),
        .I2(ch_in_cnt[4]),
        .I3(\ch_in_cnt[5]_i_2__0_n_0 ),
        .O(\ch_in_cnt[4]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT5 #(
    .INIT(32'hD2000000)) 
    \ch_in_cnt[5]_i_1__0 
       (.I0(ch_in_cnt[4]),
        .I1(\ch_in_cnt[5]_i_2__0_n_0 ),
        .I2(ch_in_cnt[5]),
        .I3(\row_cnt_reg[7]_i_4_n_0 ),
        .I4(computation_done),
        .O(\ch_in_cnt[5]_i_1__0_n_0 ));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \ch_in_cnt[5]_i_2__0 
       (.I0(ch_in_cnt[2]),
        .I1(ch_in_cnt[0]),
        .I2(ch_in_cnt[1]),
        .I3(ch_in_cnt[3]),
        .O(\ch_in_cnt[5]_i_2__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT4 #(
    .INIT(16'h8008)) 
    \ch_in_cnt[6]_i_1__0 
       (.I0(computation_done),
        .I1(\row_cnt_reg[7]_i_4_n_0 ),
        .I2(ch_in_cnt[6]),
        .I3(\ch_in_cnt[7]_i_3__0_n_0 ),
        .O(\ch_in_cnt[6]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'h888888F8)) 
    \ch_in_cnt[7]_i_1__0 
       (.I0(\FSM_onehot_state_reg_n_0_[0] ),
        .I1(ctrl_start),
        .I2(computation_done),
        .I3(\row_cnt_reg[7]_i_5_n_1 ),
        .I4(\row_cnt_reg[7]_i_6_n_1 ),
        .O(ch_in_cnt0));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT5 #(
    .INIT(32'h80800880)) 
    \ch_in_cnt[7]_i_2__0 
       (.I0(computation_done),
        .I1(\row_cnt_reg[7]_i_4_n_0 ),
        .I2(ch_in_cnt[7]),
        .I3(ch_in_cnt[6]),
        .I4(\ch_in_cnt[7]_i_3__0_n_0 ),
        .O(\ch_in_cnt[7]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \ch_in_cnt[7]_i_3__0 
       (.I0(ch_in_cnt[4]),
        .I1(ch_in_cnt[2]),
        .I2(ch_in_cnt[0]),
        .I3(ch_in_cnt[1]),
        .I4(ch_in_cnt[3]),
        .I5(ch_in_cnt[5]),
        .O(\ch_in_cnt[7]_i_3__0_n_0 ));
  FDRE \ch_in_cnt_reg[0] 
       (.C(CLK),
        .CE(ch_in_cnt0),
        .D(\ch_in_cnt[0]_i_1__0_n_0 ),
        .Q(ch_in_cnt[0]),
        .R(rst));
  FDRE \ch_in_cnt_reg[1] 
       (.C(CLK),
        .CE(ch_in_cnt0),
        .D(\ch_in_cnt[1]_i_1__0_n_0 ),
        .Q(ch_in_cnt[1]),
        .R(rst));
  FDRE \ch_in_cnt_reg[2] 
       (.C(CLK),
        .CE(ch_in_cnt0),
        .D(\ch_in_cnt[2]_i_1__0_n_0 ),
        .Q(ch_in_cnt[2]),
        .R(rst));
  FDRE \ch_in_cnt_reg[3] 
       (.C(CLK),
        .CE(ch_in_cnt0),
        .D(\ch_in_cnt[3]_i_1__0_n_0 ),
        .Q(ch_in_cnt[3]),
        .R(rst));
  FDRE \ch_in_cnt_reg[4] 
       (.C(CLK),
        .CE(ch_in_cnt0),
        .D(\ch_in_cnt[4]_i_1__0_n_0 ),
        .Q(ch_in_cnt[4]),
        .R(rst));
  FDRE \ch_in_cnt_reg[5] 
       (.C(CLK),
        .CE(ch_in_cnt0),
        .D(\ch_in_cnt[5]_i_1__0_n_0 ),
        .Q(ch_in_cnt[5]),
        .R(rst));
  FDRE \ch_in_cnt_reg[6] 
       (.C(CLK),
        .CE(ch_in_cnt0),
        .D(\ch_in_cnt[6]_i_1__0_n_0 ),
        .Q(ch_in_cnt[6]),
        .R(rst));
  FDRE \ch_in_cnt_reg[7] 
       (.C(CLK),
        .CE(ch_in_cnt0),
        .D(\ch_in_cnt[7]_i_2__0_n_0 ),
        .Q(ch_in_cnt[7]),
        .R(rst));
  (* SOFT_HLUTNM = "soft_lutpair77" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \ch_out_cnt[0]_i_1 
       (.I0(computation_done),
        .I1(ch_out_cnt[0]),
        .O(\ch_out_cnt[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair77" *) 
  LUT3 #(
    .INIT(8'h60)) 
    \ch_out_cnt[1]_i_1__0 
       (.I0(ch_out_cnt[0]),
        .I1(ch_out_cnt[1]),
        .I2(computation_done),
        .O(\ch_out_cnt[1]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT4 #(
    .INIT(16'h2A80)) 
    \ch_out_cnt[2]_i_1__0 
       (.I0(computation_done),
        .I1(ch_out_cnt[1]),
        .I2(ch_out_cnt[0]),
        .I3(ch_out_cnt[2]),
        .O(\ch_out_cnt[2]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT5 #(
    .INIT(32'h2AAA8000)) 
    \ch_out_cnt[3]_i_1__0 
       (.I0(computation_done),
        .I1(ch_out_cnt[0]),
        .I2(ch_out_cnt[1]),
        .I3(ch_out_cnt[2]),
        .I4(ch_out_cnt[3]),
        .O(\ch_out_cnt[3]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h2AAAAAAA80000000)) 
    \ch_out_cnt[4]_i_1__0 
       (.I0(computation_done),
        .I1(ch_out_cnt[0]),
        .I2(ch_out_cnt[1]),
        .I3(ch_out_cnt[3]),
        .I4(ch_out_cnt[2]),
        .I5(ch_out_cnt[4]),
        .O(\ch_out_cnt[4]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'hAA2AAAAA00800000)) 
    \ch_out_cnt[5]_i_1__0 
       (.I0(computation_done),
        .I1(ch_out_cnt[2]),
        .I2(ch_out_cnt[3]),
        .I3(\ch_out_cnt[5]_i_2__0_n_0 ),
        .I4(ch_out_cnt[4]),
        .I5(ch_out_cnt[5]),
        .O(\ch_out_cnt[5]_i_1__0_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \ch_out_cnt[5]_i_2__0 
       (.I0(ch_out_cnt[1]),
        .I1(ch_out_cnt[0]),
        .O(\ch_out_cnt[5]_i_2__0_n_0 ));
  LUT5 #(
    .INIT(32'hAA2A0080)) 
    \ch_out_cnt[6]_i_1__0 
       (.I0(computation_done),
        .I1(ch_out_cnt[4]),
        .I2(ch_out_cnt[5]),
        .I3(\ch_out_cnt[7]_i_5_n_0 ),
        .I4(ch_out_cnt[6]),
        .O(\ch_out_cnt[6]_i_1__0_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \ch_out_cnt[7]_i_10 
       (.I0(ch_out_cnt[2]),
        .I1(ch_out_cnt[3]),
        .O(\ch_out_cnt[7]_i_10_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \ch_out_cnt[7]_i_11 
       (.I0(ch_out_cnt[0]),
        .I1(ch_out_cnt[1]),
        .O(\ch_out_cnt[7]_i_11_n_0 ));
  LUT5 #(
    .INIT(32'h8F888888)) 
    \ch_out_cnt[7]_i_1__0 
       (.I0(\FSM_onehot_state_reg_n_0_[0] ),
        .I1(ctrl_start),
        .I2(\row_cnt_reg[7]_i_9_n_0 ),
        .I3(\ch_out_cnt_reg[7]_i_3_n_0 ),
        .I4(\ch_out_cnt[7]_i_4_n_0 ),
        .O(ch_out_cnt0));
  LUT6 #(
    .INIT(64'hBFFF400000000000)) 
    \ch_out_cnt[7]_i_2__0 
       (.I0(\ch_out_cnt[7]_i_5_n_0 ),
        .I1(ch_out_cnt[5]),
        .I2(ch_out_cnt[4]),
        .I3(ch_out_cnt[6]),
        .I4(ch_out_cnt[7]),
        .I5(computation_done),
        .O(\ch_out_cnt[7]_i_2__0_n_0 ));
  LUT5 #(
    .INIT(32'h00000100)) 
    \ch_out_cnt[7]_i_4 
       (.I0(\row_cnt_reg[7]_i_7_n_0 ),
        .I1(\row_cnt_reg[7]_i_6_n_1 ),
        .I2(\row_cnt_reg[7]_i_5_n_1 ),
        .I3(computation_done),
        .I4(\row_cnt_reg[7]_i_4_n_0 ),
        .O(\ch_out_cnt[7]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \ch_out_cnt[7]_i_5 
       (.I0(ch_out_cnt[0]),
        .I1(ch_out_cnt[1]),
        .I2(ch_out_cnt[3]),
        .I3(ch_out_cnt[2]),
        .O(\ch_out_cnt[7]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \ch_out_cnt[7]_i_6__0 
       (.I0(ch_out_cnt[3]),
        .I1(ch_out_cnt[2]),
        .O(\ch_out_cnt[7]_i_6__0_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \ch_out_cnt[7]_i_7 
       (.I0(ch_out_cnt[1]),
        .I1(ch_out_cnt[0]),
        .O(\ch_out_cnt[7]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \ch_out_cnt[7]_i_8 
       (.I0(ch_out_cnt[7]),
        .I1(ch_out_cnt[6]),
        .O(\ch_out_cnt[7]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \ch_out_cnt[7]_i_9 
       (.I0(ch_out_cnt[5]),
        .I1(ch_out_cnt[4]),
        .O(\ch_out_cnt[7]_i_9_n_0 ));
  FDRE \ch_out_cnt_reg[0] 
       (.C(CLK),
        .CE(ch_out_cnt0),
        .D(\ch_out_cnt[0]_i_1_n_0 ),
        .Q(ch_out_cnt[0]),
        .R(rst));
  FDRE \ch_out_cnt_reg[1] 
       (.C(CLK),
        .CE(ch_out_cnt0),
        .D(\ch_out_cnt[1]_i_1__0_n_0 ),
        .Q(ch_out_cnt[1]),
        .R(rst));
  FDRE \ch_out_cnt_reg[2] 
       (.C(CLK),
        .CE(ch_out_cnt0),
        .D(\ch_out_cnt[2]_i_1__0_n_0 ),
        .Q(ch_out_cnt[2]),
        .R(rst));
  FDRE \ch_out_cnt_reg[3] 
       (.C(CLK),
        .CE(ch_out_cnt0),
        .D(\ch_out_cnt[3]_i_1__0_n_0 ),
        .Q(ch_out_cnt[3]),
        .R(rst));
  FDRE \ch_out_cnt_reg[4] 
       (.C(CLK),
        .CE(ch_out_cnt0),
        .D(\ch_out_cnt[4]_i_1__0_n_0 ),
        .Q(ch_out_cnt[4]),
        .R(rst));
  FDRE \ch_out_cnt_reg[5] 
       (.C(CLK),
        .CE(ch_out_cnt0),
        .D(\ch_out_cnt[5]_i_1__0_n_0 ),
        .Q(ch_out_cnt[5]),
        .R(rst));
  FDRE \ch_out_cnt_reg[6] 
       (.C(CLK),
        .CE(ch_out_cnt0),
        .D(\ch_out_cnt[6]_i_1__0_n_0 ),
        .Q(ch_out_cnt[6]),
        .R(rst));
  FDRE \ch_out_cnt_reg[7] 
       (.C(CLK),
        .CE(ch_out_cnt0),
        .D(\ch_out_cnt[7]_i_2__0_n_0 ),
        .Q(ch_out_cnt[7]),
        .R(rst));
  CARRY4 \ch_out_cnt_reg[7]_i_3 
       (.CI(1'b0),
        .CO({\ch_out_cnt_reg[7]_i_3_n_0 ,\NLW_ch_out_cnt_reg[7]_i_3_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,\ch_out_cnt[7]_i_6__0_n_0 ,\ch_out_cnt[7]_i_7_n_0 }),
        .O(\NLW_ch_out_cnt_reg[7]_i_3_O_UNCONNECTED [3:0]),
        .S({\ch_out_cnt[7]_i_8_n_0 ,\ch_out_cnt[7]_i_9_n_0 ,\ch_out_cnt[7]_i_10_n_0 ,\ch_out_cnt[7]_i_11_n_0 }));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \col_cnt[0]_i_1__2 
       (.I0(col_cnt[0]),
        .I1(computation_done),
        .I2(\row_cnt_reg[7]_i_7_n_0 ),
        .O(\col_cnt[0]_i_1__2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT4 #(
    .INIT(16'h6000)) 
    \col_cnt[1]_i_1__2 
       (.I0(col_cnt[1]),
        .I1(col_cnt[0]),
        .I2(\row_cnt_reg[7]_i_7_n_0 ),
        .I3(computation_done),
        .O(\col_cnt[1]_i_1__2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT5 #(
    .INIT(32'h08808080)) 
    \col_cnt[2]_i_1__1 
       (.I0(computation_done),
        .I1(\row_cnt_reg[7]_i_7_n_0 ),
        .I2(col_cnt[2]),
        .I3(col_cnt[0]),
        .I4(col_cnt[1]),
        .O(\col_cnt[2]_i_1__1_n_0 ));
  LUT6 #(
    .INIT(64'h0880808080808080)) 
    \col_cnt[3]_i_1__2 
       (.I0(computation_done),
        .I1(\row_cnt_reg[7]_i_7_n_0 ),
        .I2(col_cnt[3]),
        .I3(col_cnt[2]),
        .I4(col_cnt[1]),
        .I5(col_cnt[0]),
        .O(\col_cnt[3]_i_1__2_n_0 ));
  LUT6 #(
    .INIT(64'h8080088080808080)) 
    \col_cnt[4]_i_1__1 
       (.I0(computation_done),
        .I1(\row_cnt_reg[7]_i_7_n_0 ),
        .I2(col_cnt[4]),
        .I3(col_cnt[3]),
        .I4(\col_cnt[4]_i_2__1_n_0 ),
        .I5(col_cnt[2]),
        .O(\col_cnt[4]_i_1__1_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \col_cnt[4]_i_2__1 
       (.I0(col_cnt[1]),
        .I1(col_cnt[0]),
        .O(\col_cnt[4]_i_2__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT4 #(
    .INIT(16'h8008)) 
    \col_cnt[5]_i_1__1 
       (.I0(computation_done),
        .I1(\row_cnt_reg[7]_i_7_n_0 ),
        .I2(col_cnt[5]),
        .I3(\col_cnt[5]_i_2__1_n_0 ),
        .O(\col_cnt[5]_i_1__1_n_0 ));
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    \col_cnt[5]_i_2__1 
       (.I0(col_cnt[3]),
        .I1(col_cnt[0]),
        .I2(col_cnt[1]),
        .I3(col_cnt[2]),
        .I4(col_cnt[4]),
        .O(\col_cnt[5]_i_2__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT4 #(
    .INIT(16'h0880)) 
    \col_cnt[6]_i_1__1 
       (.I0(computation_done),
        .I1(\row_cnt_reg[7]_i_7_n_0 ),
        .I2(col_cnt[6]),
        .I3(\col_cnt[7]_i_3__1_n_0 ),
        .O(\col_cnt[6]_i_1__1_n_0 ));
  LUT6 #(
    .INIT(64'h88888888888F8888)) 
    \col_cnt[7]_i_1__1 
       (.I0(\FSM_onehot_state_reg_n_0_[0] ),
        .I1(ctrl_start),
        .I2(\row_cnt_reg[7]_i_6_n_1 ),
        .I3(\row_cnt_reg[7]_i_5_n_1 ),
        .I4(computation_done),
        .I5(\row_cnt_reg[7]_i_4_n_0 ),
        .O(col_cnt0));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT5 #(
    .INIT(32'h28880000)) 
    \col_cnt[7]_i_2__1 
       (.I0(computation_done),
        .I1(col_cnt[7]),
        .I2(col_cnt[6]),
        .I3(\col_cnt[7]_i_3__1_n_0 ),
        .I4(\row_cnt_reg[7]_i_7_n_0 ),
        .O(\col_cnt[7]_i_2__1_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \col_cnt[7]_i_3__1 
       (.I0(col_cnt[5]),
        .I1(col_cnt[4]),
        .I2(col_cnt[2]),
        .I3(col_cnt[1]),
        .I4(col_cnt[0]),
        .I5(col_cnt[3]),
        .O(\col_cnt[7]_i_3__1_n_0 ));
  FDRE \col_cnt_reg[0] 
       (.C(CLK),
        .CE(col_cnt0),
        .D(\col_cnt[0]_i_1__2_n_0 ),
        .Q(col_cnt[0]),
        .R(rst));
  FDRE \col_cnt_reg[1] 
       (.C(CLK),
        .CE(col_cnt0),
        .D(\col_cnt[1]_i_1__2_n_0 ),
        .Q(col_cnt[1]),
        .R(rst));
  FDRE \col_cnt_reg[2] 
       (.C(CLK),
        .CE(col_cnt0),
        .D(\col_cnt[2]_i_1__1_n_0 ),
        .Q(col_cnt[2]),
        .R(rst));
  FDRE \col_cnt_reg[3] 
       (.C(CLK),
        .CE(col_cnt0),
        .D(\col_cnt[3]_i_1__2_n_0 ),
        .Q(col_cnt[3]),
        .R(rst));
  FDRE \col_cnt_reg[4] 
       (.C(CLK),
        .CE(col_cnt0),
        .D(\col_cnt[4]_i_1__1_n_0 ),
        .Q(col_cnt[4]),
        .R(rst));
  FDRE \col_cnt_reg[5] 
       (.C(CLK),
        .CE(col_cnt0),
        .D(\col_cnt[5]_i_1__1_n_0 ),
        .Q(col_cnt[5]),
        .R(rst));
  FDRE \col_cnt_reg[6] 
       (.C(CLK),
        .CE(col_cnt0),
        .D(\col_cnt[6]_i_1__1_n_0 ),
        .Q(col_cnt[6]),
        .R(rst));
  FDRE \col_cnt_reg[7] 
       (.C(CLK),
        .CE(col_cnt0),
        .D(\col_cnt[7]_i_2__1_n_0 ),
        .Q(col_cnt[7]),
        .R(rst));
  LUT6 #(
    .INIT(64'hBBBBBBAB888888A8)) 
    computation_done_i_1__2
       (.I0(computation_done),
        .I1(\row_cnt[7]_i_3_n_0 ),
        .I2(\ch_out_cnt[7]_i_4_n_0 ),
        .I3(\row_cnt_reg[7]_i_9_n_0 ),
        .I4(\ch_out_cnt_reg[7]_i_3_n_0 ),
        .I5(computation_done_reg_n_0),
        .O(computation_done_i_1__2_n_0));
  FDRE computation_done_reg
       (.C(CLK),
        .CE(1'b1),
        .D(computation_done_i_1__2_n_0),
        .Q(computation_done_reg_n_0),
        .R(rst));
  LUT4 #(
    .INIT(16'h0004)) 
    ctrl_start_i_1__0
       (.I0(busy_reg_n_0),
        .I1(state_0[1]),
        .I2(state_0[0]),
        .I3(ctrl_start),
        .O(busy_reg_0));
  FDRE done_reg
       (.C(CLK),
        .CE(1'b1),
        .D(\FSM_onehot_state_reg_n_0_[4] ),
        .Q(done_reg_n_0),
        .R(rst));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \kc_cnt[0]_i_1__0 
       (.I0(kc_cnt[0]),
        .I1(computation_done),
        .I2(\row_cnt_reg[7]_i_6_n_1 ),
        .O(\kc_cnt[0]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT4 #(
    .INIT(16'h2800)) 
    \kc_cnt[1]_i_1__0 
       (.I0(computation_done),
        .I1(kc_cnt[1]),
        .I2(kc_cnt[0]),
        .I3(\row_cnt_reg[7]_i_6_n_1 ),
        .O(\kc_cnt[1]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT5 #(
    .INIT(32'h08808080)) 
    \kc_cnt[2]_i_1__0 
       (.I0(computation_done),
        .I1(\row_cnt_reg[7]_i_6_n_1 ),
        .I2(kc_cnt[2]),
        .I3(kc_cnt[0]),
        .I4(kc_cnt[1]),
        .O(\kc_cnt[2]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h0888888880000000)) 
    \kc_cnt[3]_i_1__0 
       (.I0(\row_cnt_reg[7]_i_6_n_1 ),
        .I1(computation_done),
        .I2(kc_cnt[0]),
        .I3(kc_cnt[1]),
        .I4(kc_cnt[2]),
        .I5(kc_cnt[3]),
        .O(\kc_cnt[3]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT4 #(
    .INIT(16'h6000)) 
    \kc_cnt[4]_i_1__0 
       (.I0(kc_cnt[4]),
        .I1(\kc_cnt[4]_i_2__0_n_0 ),
        .I2(\row_cnt_reg[7]_i_6_n_1 ),
        .I3(computation_done),
        .O(\kc_cnt[4]_i_1__0_n_0 ));
  LUT4 #(
    .INIT(16'h8000)) 
    \kc_cnt[4]_i_2__0 
       (.I0(kc_cnt[3]),
        .I1(kc_cnt[2]),
        .I2(kc_cnt[1]),
        .I3(kc_cnt[0]),
        .O(\kc_cnt[4]_i_2__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT4 #(
    .INIT(16'h8008)) 
    \kc_cnt[5]_i_1__0 
       (.I0(computation_done),
        .I1(\row_cnt_reg[7]_i_6_n_1 ),
        .I2(kc_cnt[5]),
        .I3(\kc_cnt[7]_i_3__0_n_0 ),
        .O(\kc_cnt[5]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT5 #(
    .INIT(32'h80088080)) 
    \kc_cnt[6]_i_1__0 
       (.I0(computation_done),
        .I1(\row_cnt_reg[7]_i_6_n_1 ),
        .I2(kc_cnt[6]),
        .I3(\kc_cnt[7]_i_3__0_n_0 ),
        .I4(kc_cnt[5]),
        .O(\kc_cnt[6]_i_1__0_n_0 ));
  LUT3 #(
    .INIT(8'hEA)) 
    \kc_cnt[7]_i_1__0 
       (.I0(computation_done),
        .I1(\FSM_onehot_state_reg_n_0_[0] ),
        .I2(ctrl_start),
        .O(kc_cnt0));
  LUT6 #(
    .INIT(64'h8888288800000000)) 
    \kc_cnt[7]_i_2__0 
       (.I0(computation_done),
        .I1(kc_cnt[7]),
        .I2(kc_cnt[6]),
        .I3(kc_cnt[5]),
        .I4(\kc_cnt[7]_i_3__0_n_0 ),
        .I5(\row_cnt_reg[7]_i_6_n_1 ),
        .O(\kc_cnt[7]_i_2__0_n_0 ));
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    \kc_cnt[7]_i_3__0 
       (.I0(kc_cnt[4]),
        .I1(kc_cnt[0]),
        .I2(kc_cnt[1]),
        .I3(kc_cnt[2]),
        .I4(kc_cnt[3]),
        .O(\kc_cnt[7]_i_3__0_n_0 ));
  FDRE \kc_cnt_reg[0] 
       (.C(CLK),
        .CE(kc_cnt0),
        .D(\kc_cnt[0]_i_1__0_n_0 ),
        .Q(kc_cnt[0]),
        .R(rst));
  FDRE \kc_cnt_reg[1] 
       (.C(CLK),
        .CE(kc_cnt0),
        .D(\kc_cnt[1]_i_1__0_n_0 ),
        .Q(kc_cnt[1]),
        .R(rst));
  FDRE \kc_cnt_reg[2] 
       (.C(CLK),
        .CE(kc_cnt0),
        .D(\kc_cnt[2]_i_1__0_n_0 ),
        .Q(kc_cnt[2]),
        .R(rst));
  FDRE \kc_cnt_reg[3] 
       (.C(CLK),
        .CE(kc_cnt0),
        .D(\kc_cnt[3]_i_1__0_n_0 ),
        .Q(kc_cnt[3]),
        .R(rst));
  FDRE \kc_cnt_reg[4] 
       (.C(CLK),
        .CE(kc_cnt0),
        .D(\kc_cnt[4]_i_1__0_n_0 ),
        .Q(kc_cnt[4]),
        .R(rst));
  FDRE \kc_cnt_reg[5] 
       (.C(CLK),
        .CE(kc_cnt0),
        .D(\kc_cnt[5]_i_1__0_n_0 ),
        .Q(kc_cnt[5]),
        .R(rst));
  FDRE \kc_cnt_reg[6] 
       (.C(CLK),
        .CE(kc_cnt0),
        .D(\kc_cnt[6]_i_1__0_n_0 ),
        .Q(kc_cnt[6]),
        .R(rst));
  FDRE \kc_cnt_reg[7] 
       (.C(CLK),
        .CE(kc_cnt0),
        .D(\kc_cnt[7]_i_2__0_n_0 ),
        .Q(kc_cnt[7]),
        .R(rst));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \kr_cnt[0]_i_1__0 
       (.I0(kr_cnt[0]),
        .I1(computation_done),
        .I2(\row_cnt_reg[7]_i_5_n_1 ),
        .O(\kr_cnt[0]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT4 #(
    .INIT(16'h2800)) 
    \kr_cnt[1]_i_1__0 
       (.I0(computation_done),
        .I1(kr_cnt[1]),
        .I2(kr_cnt[0]),
        .I3(\row_cnt_reg[7]_i_5_n_1 ),
        .O(\kr_cnt[1]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT5 #(
    .INIT(32'h78000000)) 
    \kr_cnt[2]_i_1__0 
       (.I0(kr_cnt[0]),
        .I1(kr_cnt[1]),
        .I2(kr_cnt[2]),
        .I3(\row_cnt_reg[7]_i_5_n_1 ),
        .I4(computation_done),
        .O(\kr_cnt[2]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h7F80000000000000)) 
    \kr_cnt[3]_i_1__0 
       (.I0(kr_cnt[2]),
        .I1(kr_cnt[1]),
        .I2(kr_cnt[0]),
        .I3(kr_cnt[3]),
        .I4(\row_cnt_reg[7]_i_5_n_1 ),
        .I5(computation_done),
        .O(\kr_cnt[3]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h1444444444444444)) 
    \kr_cnt[4]_i_1__0 
       (.I0(\kr_cnt[4]_i_2__0_n_0 ),
        .I1(kr_cnt[4]),
        .I2(kr_cnt[3]),
        .I3(kr_cnt[0]),
        .I4(kr_cnt[1]),
        .I5(kr_cnt[2]),
        .O(\kr_cnt[4]_i_1__0_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \kr_cnt[4]_i_2__0 
       (.I0(\row_cnt_reg[7]_i_5_n_1 ),
        .I1(computation_done),
        .O(\kr_cnt[4]_i_2__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT4 #(
    .INIT(16'h0880)) 
    \kr_cnt[5]_i_1__0 
       (.I0(\row_cnt_reg[7]_i_5_n_1 ),
        .I1(computation_done),
        .I2(kr_cnt[5]),
        .I3(\kr_cnt[5]_i_2__0_n_0 ),
        .O(\kr_cnt[5]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'h80000000)) 
    \kr_cnt[5]_i_2__0 
       (.I0(kr_cnt[4]),
        .I1(kr_cnt[3]),
        .I2(kr_cnt[0]),
        .I3(kr_cnt[1]),
        .I4(kr_cnt[2]),
        .O(\kr_cnt[5]_i_2__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT4 #(
    .INIT(16'h2800)) 
    \kr_cnt[6]_i_1__0 
       (.I0(computation_done),
        .I1(kr_cnt[6]),
        .I2(\kr_cnt[7]_i_3__0_n_0 ),
        .I3(\row_cnt_reg[7]_i_5_n_1 ),
        .O(\kr_cnt[6]_i_1__0_n_0 ));
  LUT4 #(
    .INIT(16'h8F88)) 
    \kr_cnt[7]_i_1__0 
       (.I0(\FSM_onehot_state_reg_n_0_[0] ),
        .I1(ctrl_start),
        .I2(\row_cnt_reg[7]_i_6_n_1 ),
        .I3(computation_done),
        .O(kr_cnt0));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT5 #(
    .INIT(32'h28880000)) 
    \kr_cnt[7]_i_2__0 
       (.I0(computation_done),
        .I1(kr_cnt[7]),
        .I2(\kr_cnt[7]_i_3__0_n_0 ),
        .I3(kr_cnt[6]),
        .I4(\row_cnt_reg[7]_i_5_n_1 ),
        .O(\kr_cnt[7]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \kr_cnt[7]_i_3__0 
       (.I0(kr_cnt[5]),
        .I1(kr_cnt[2]),
        .I2(kr_cnt[1]),
        .I3(kr_cnt[0]),
        .I4(kr_cnt[3]),
        .I5(kr_cnt[4]),
        .O(\kr_cnt[7]_i_3__0_n_0 ));
  FDRE \kr_cnt_reg[0] 
       (.C(CLK),
        .CE(kr_cnt0),
        .D(\kr_cnt[0]_i_1__0_n_0 ),
        .Q(kr_cnt[0]),
        .R(rst));
  FDRE \kr_cnt_reg[1] 
       (.C(CLK),
        .CE(kr_cnt0),
        .D(\kr_cnt[1]_i_1__0_n_0 ),
        .Q(kr_cnt[1]),
        .R(rst));
  FDRE \kr_cnt_reg[2] 
       (.C(CLK),
        .CE(kr_cnt0),
        .D(\kr_cnt[2]_i_1__0_n_0 ),
        .Q(kr_cnt[2]),
        .R(rst));
  FDRE \kr_cnt_reg[3] 
       (.C(CLK),
        .CE(kr_cnt0),
        .D(\kr_cnt[3]_i_1__0_n_0 ),
        .Q(kr_cnt[3]),
        .R(rst));
  FDRE \kr_cnt_reg[4] 
       (.C(CLK),
        .CE(kr_cnt0),
        .D(\kr_cnt[4]_i_1__0_n_0 ),
        .Q(kr_cnt[4]),
        .R(rst));
  FDRE \kr_cnt_reg[5] 
       (.C(CLK),
        .CE(kr_cnt0),
        .D(\kr_cnt[5]_i_1__0_n_0 ),
        .Q(kr_cnt[5]),
        .R(rst));
  FDRE \kr_cnt_reg[6] 
       (.C(CLK),
        .CE(kr_cnt0),
        .D(\kr_cnt[6]_i_1__0_n_0 ),
        .Q(kr_cnt[6]),
        .R(rst));
  FDRE \kr_cnt_reg[7] 
       (.C(CLK),
        .CE(kr_cnt0),
        .D(\kr_cnt[7]_i_2__0_n_0 ),
        .Q(kr_cnt[7]),
        .R(rst));
  (* SOFT_HLUTNM = "soft_lutpair78" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \pipe_delay_cnt[0]_i_1__0 
       (.I0(\FSM_onehot_state_reg_n_0_[3] ),
        .I1(\pipe_delay_cnt_reg_n_0_[0] ),
        .O(pipe_delay_cnt[0]));
  (* SOFT_HLUTNM = "soft_lutpair78" *) 
  LUT3 #(
    .INIT(8'h60)) 
    \pipe_delay_cnt[1]_i_1__2 
       (.I0(\pipe_delay_cnt_reg_n_0_[0] ),
        .I1(\pipe_delay_cnt_reg_n_0_[1] ),
        .I2(\FSM_onehot_state_reg_n_0_[3] ),
        .O(\pipe_delay_cnt[1]_i_1__2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT4 #(
    .INIT(16'h7800)) 
    \pipe_delay_cnt[2]_i_1__2 
       (.I0(\pipe_delay_cnt_reg_n_0_[1] ),
        .I1(\pipe_delay_cnt_reg_n_0_[0] ),
        .I2(\pipe_delay_cnt_reg_n_0_[2] ),
        .I3(\FSM_onehot_state_reg_n_0_[3] ),
        .O(\pipe_delay_cnt[2]_i_1__2_n_0 ));
  LUT3 #(
    .INIT(8'hEA)) 
    \pipe_delay_cnt[3]_i_1__1 
       (.I0(\FSM_onehot_state_reg_n_0_[3] ),
        .I1(\FSM_onehot_state_reg_n_0_[0] ),
        .I2(ctrl_start),
        .O(\pipe_delay_cnt[3]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT5 #(
    .INIT(32'h2AAA8000)) 
    \pipe_delay_cnt[3]_i_2__1 
       (.I0(\FSM_onehot_state_reg_n_0_[3] ),
        .I1(\pipe_delay_cnt_reg_n_0_[2] ),
        .I2(\pipe_delay_cnt_reg_n_0_[0] ),
        .I3(\pipe_delay_cnt_reg_n_0_[1] ),
        .I4(\pipe_delay_cnt_reg_n_0_[3] ),
        .O(pipe_delay_cnt[3]));
  FDRE \pipe_delay_cnt_reg[0] 
       (.C(CLK),
        .CE(\pipe_delay_cnt[3]_i_1__1_n_0 ),
        .D(pipe_delay_cnt[0]),
        .Q(\pipe_delay_cnt_reg_n_0_[0] ),
        .R(rst));
  FDRE \pipe_delay_cnt_reg[1] 
       (.C(CLK),
        .CE(\pipe_delay_cnt[3]_i_1__1_n_0 ),
        .D(\pipe_delay_cnt[1]_i_1__2_n_0 ),
        .Q(\pipe_delay_cnt_reg_n_0_[1] ),
        .R(rst));
  FDRE \pipe_delay_cnt_reg[2] 
       (.C(CLK),
        .CE(\pipe_delay_cnt[3]_i_1__1_n_0 ),
        .D(\pipe_delay_cnt[2]_i_1__2_n_0 ),
        .Q(\pipe_delay_cnt_reg_n_0_[2] ),
        .R(rst));
  FDRE \pipe_delay_cnt_reg[3] 
       (.C(CLK),
        .CE(\pipe_delay_cnt[3]_i_1__1_n_0 ),
        .D(pipe_delay_cnt[3]),
        .Q(\pipe_delay_cnt_reg_n_0_[3] ),
        .R(rst));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \row_cnt[0]_i_1__1 
       (.I0(row_cnt[0]),
        .I1(computation_done),
        .I2(\row_cnt_reg[7]_i_9_n_0 ),
        .O(\row_cnt[0]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT4 #(
    .INIT(16'h6000)) 
    \row_cnt[1]_i_1__1 
       (.I0(row_cnt[1]),
        .I1(row_cnt[0]),
        .I2(\row_cnt_reg[7]_i_9_n_0 ),
        .I3(computation_done),
        .O(\row_cnt[1]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT5 #(
    .INIT(32'h08808080)) 
    \row_cnt[2]_i_1__1 
       (.I0(computation_done),
        .I1(\row_cnt_reg[7]_i_9_n_0 ),
        .I2(row_cnt[2]),
        .I3(row_cnt[0]),
        .I4(row_cnt[1]),
        .O(\row_cnt[2]_i_1__1_n_0 ));
  LUT6 #(
    .INIT(64'h0880808080808080)) 
    \row_cnt[3]_i_1__1 
       (.I0(computation_done),
        .I1(\row_cnt_reg[7]_i_9_n_0 ),
        .I2(row_cnt[3]),
        .I3(row_cnt[2]),
        .I4(row_cnt[1]),
        .I5(row_cnt[0]),
        .O(\row_cnt[3]_i_1__1_n_0 ));
  LUT6 #(
    .INIT(64'h8080088080808080)) 
    \row_cnt[4]_i_1__1 
       (.I0(computation_done),
        .I1(\row_cnt_reg[7]_i_9_n_0 ),
        .I2(row_cnt[4]),
        .I3(row_cnt[3]),
        .I4(\row_cnt[4]_i_2__0_n_0 ),
        .I5(row_cnt[2]),
        .O(\row_cnt[4]_i_1__1_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \row_cnt[4]_i_2__0 
       (.I0(row_cnt[1]),
        .I1(row_cnt[0]),
        .O(\row_cnt[4]_i_2__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT4 #(
    .INIT(16'h8008)) 
    \row_cnt[5]_i_1__1 
       (.I0(computation_done),
        .I1(\row_cnt_reg[7]_i_9_n_0 ),
        .I2(row_cnt[5]),
        .I3(\row_cnt[5]_i_2__1_n_0 ),
        .O(\row_cnt[5]_i_1__1_n_0 ));
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    \row_cnt[5]_i_2__1 
       (.I0(row_cnt[3]),
        .I1(row_cnt[0]),
        .I2(row_cnt[1]),
        .I3(row_cnt[2]),
        .I4(row_cnt[4]),
        .O(\row_cnt[5]_i_2__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT4 #(
    .INIT(16'h0880)) 
    \row_cnt[6]_i_1__1 
       (.I0(computation_done),
        .I1(\row_cnt_reg[7]_i_9_n_0 ),
        .I2(row_cnt[6]),
        .I3(\row_cnt[7]_i_8__0_n_0 ),
        .O(\row_cnt[6]_i_1__1_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \row_cnt[7]_i_10__0 
       (.I0(ch_in_cnt[2]),
        .I1(ch_in_cnt[3]),
        .O(\row_cnt[7]_i_10__0_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \row_cnt[7]_i_11__0 
       (.I0(ch_in_cnt[0]),
        .I1(ch_in_cnt[1]),
        .O(\row_cnt[7]_i_11__0_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \row_cnt[7]_i_12__0 
       (.I0(ch_in_cnt[7]),
        .I1(ch_in_cnt[6]),
        .O(\row_cnt[7]_i_12__0_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \row_cnt[7]_i_13__0 
       (.I0(ch_in_cnt[5]),
        .I1(ch_in_cnt[4]),
        .O(\row_cnt[7]_i_13__0_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \row_cnt[7]_i_14__0 
       (.I0(ch_in_cnt[2]),
        .I1(ch_in_cnt[3]),
        .O(\row_cnt[7]_i_14__0_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \row_cnt[7]_i_15__0 
       (.I0(ch_in_cnt[0]),
        .I1(ch_in_cnt[1]),
        .O(\row_cnt[7]_i_15__0_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \row_cnt[7]_i_16__0 
       (.I0(kr_cnt[2]),
        .I1(kr_cnt[3]),
        .O(\row_cnt[7]_i_16__0_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \row_cnt[7]_i_17__0 
       (.I0(kr_cnt[7]),
        .I1(kr_cnt[6]),
        .O(\row_cnt[7]_i_17__0_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \row_cnt[7]_i_18__0 
       (.I0(kr_cnt[5]),
        .I1(kr_cnt[4]),
        .O(\row_cnt[7]_i_18__0_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \row_cnt[7]_i_19__0 
       (.I0(kr_cnt[2]),
        .I1(kr_cnt[3]),
        .O(\row_cnt[7]_i_19__0_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAABA)) 
    \row_cnt[7]_i_1__1 
       (.I0(\row_cnt[7]_i_3_n_0 ),
        .I1(\row_cnt_reg[7]_i_4_n_0 ),
        .I2(computation_done),
        .I3(\row_cnt_reg[7]_i_5_n_1 ),
        .I4(\row_cnt_reg[7]_i_6_n_1 ),
        .I5(\row_cnt_reg[7]_i_7_n_0 ),
        .O(row_cnt0));
  LUT2 #(
    .INIT(4'h1)) 
    \row_cnt[7]_i_20__0 
       (.I0(kc_cnt[2]),
        .I1(kc_cnt[3]),
        .O(\row_cnt[7]_i_20__0_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \row_cnt[7]_i_21__0 
       (.I0(kc_cnt[7]),
        .I1(kc_cnt[6]),
        .O(\row_cnt[7]_i_21__0_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \row_cnt[7]_i_22__1 
       (.I0(kc_cnt[5]),
        .I1(kc_cnt[4]),
        .O(\row_cnt[7]_i_22__1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \row_cnt[7]_i_23__0 
       (.I0(kc_cnt[2]),
        .I1(kc_cnt[3]),
        .O(\row_cnt[7]_i_23__0_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \row_cnt[7]_i_24__0 
       (.I0(col_cnt[2]),
        .I1(col_cnt[3]),
        .O(\row_cnt[7]_i_24__0_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \row_cnt[7]_i_25__0 
       (.I0(col_cnt[1]),
        .I1(col_cnt[0]),
        .O(\row_cnt[7]_i_25__0_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \row_cnt[7]_i_26__0 
       (.I0(col_cnt[7]),
        .I1(col_cnt[6]),
        .O(\row_cnt[7]_i_26__0_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \row_cnt[7]_i_27__0 
       (.I0(col_cnt[5]),
        .I1(col_cnt[4]),
        .O(\row_cnt[7]_i_27__0_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \row_cnt[7]_i_28__0 
       (.I0(col_cnt[2]),
        .I1(col_cnt[3]),
        .O(\row_cnt[7]_i_28__0_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \row_cnt[7]_i_29__1 
       (.I0(col_cnt[0]),
        .I1(col_cnt[1]),
        .O(\row_cnt[7]_i_29__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT5 #(
    .INIT(32'h28880000)) 
    \row_cnt[7]_i_2__1 
       (.I0(computation_done),
        .I1(row_cnt[7]),
        .I2(row_cnt[6]),
        .I3(\row_cnt[7]_i_8__0_n_0 ),
        .I4(\row_cnt_reg[7]_i_9_n_0 ),
        .O(\row_cnt[7]_i_2__1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \row_cnt[7]_i_3 
       (.I0(ctrl_start),
        .I1(\FSM_onehot_state_reg_n_0_[0] ),
        .O(\row_cnt[7]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \row_cnt[7]_i_30 
       (.I0(row_cnt[2]),
        .I1(row_cnt[3]),
        .O(\row_cnt[7]_i_30_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \row_cnt[7]_i_31 
       (.I0(row_cnt[1]),
        .I1(row_cnt[0]),
        .O(\row_cnt[7]_i_31_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \row_cnt[7]_i_32 
       (.I0(row_cnt[7]),
        .I1(row_cnt[6]),
        .O(\row_cnt[7]_i_32_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \row_cnt[7]_i_33 
       (.I0(row_cnt[5]),
        .I1(row_cnt[4]),
        .O(\row_cnt[7]_i_33_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \row_cnt[7]_i_34 
       (.I0(row_cnt[2]),
        .I1(row_cnt[3]),
        .O(\row_cnt[7]_i_34_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \row_cnt[7]_i_35 
       (.I0(row_cnt[0]),
        .I1(row_cnt[1]),
        .O(\row_cnt[7]_i_35_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \row_cnt[7]_i_8__0 
       (.I0(row_cnt[5]),
        .I1(row_cnt[4]),
        .I2(row_cnt[2]),
        .I3(row_cnt[1]),
        .I4(row_cnt[0]),
        .I5(row_cnt[3]),
        .O(\row_cnt[7]_i_8__0_n_0 ));
  FDRE \row_cnt_reg[0] 
       (.C(CLK),
        .CE(row_cnt0),
        .D(\row_cnt[0]_i_1__1_n_0 ),
        .Q(row_cnt[0]),
        .R(rst));
  FDRE \row_cnt_reg[1] 
       (.C(CLK),
        .CE(row_cnt0),
        .D(\row_cnt[1]_i_1__1_n_0 ),
        .Q(row_cnt[1]),
        .R(rst));
  FDRE \row_cnt_reg[2] 
       (.C(CLK),
        .CE(row_cnt0),
        .D(\row_cnt[2]_i_1__1_n_0 ),
        .Q(row_cnt[2]),
        .R(rst));
  FDRE \row_cnt_reg[3] 
       (.C(CLK),
        .CE(row_cnt0),
        .D(\row_cnt[3]_i_1__1_n_0 ),
        .Q(row_cnt[3]),
        .R(rst));
  FDRE \row_cnt_reg[4] 
       (.C(CLK),
        .CE(row_cnt0),
        .D(\row_cnt[4]_i_1__1_n_0 ),
        .Q(row_cnt[4]),
        .R(rst));
  FDRE \row_cnt_reg[5] 
       (.C(CLK),
        .CE(row_cnt0),
        .D(\row_cnt[5]_i_1__1_n_0 ),
        .Q(row_cnt[5]),
        .R(rst));
  FDRE \row_cnt_reg[6] 
       (.C(CLK),
        .CE(row_cnt0),
        .D(\row_cnt[6]_i_1__1_n_0 ),
        .Q(row_cnt[6]),
        .R(rst));
  FDRE \row_cnt_reg[7] 
       (.C(CLK),
        .CE(row_cnt0),
        .D(\row_cnt[7]_i_2__1_n_0 ),
        .Q(row_cnt[7]),
        .R(rst));
  CARRY4 \row_cnt_reg[7]_i_4 
       (.CI(1'b0),
        .CO({\row_cnt_reg[7]_i_4_n_0 ,\NLW_row_cnt_reg[7]_i_4_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,\row_cnt[7]_i_10__0_n_0 ,\row_cnt[7]_i_11__0_n_0 }),
        .O(\NLW_row_cnt_reg[7]_i_4_O_UNCONNECTED [3:0]),
        .S({\row_cnt[7]_i_12__0_n_0 ,\row_cnt[7]_i_13__0_n_0 ,\row_cnt[7]_i_14__0_n_0 ,\row_cnt[7]_i_15__0_n_0 }));
  CARRY4 \row_cnt_reg[7]_i_5 
       (.CI(1'b0),
        .CO({\NLW_row_cnt_reg[7]_i_5_CO_UNCONNECTED [3],\row_cnt_reg[7]_i_5_n_1 ,\NLW_row_cnt_reg[7]_i_5_CO_UNCONNECTED [1:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,\row_cnt[7]_i_16__0_n_0 }),
        .O(\NLW_row_cnt_reg[7]_i_5_O_UNCONNECTED [3:0]),
        .S({1'b0,\row_cnt[7]_i_17__0_n_0 ,\row_cnt[7]_i_18__0_n_0 ,\row_cnt[7]_i_19__0_n_0 }));
  CARRY4 \row_cnt_reg[7]_i_6 
       (.CI(1'b0),
        .CO({\NLW_row_cnt_reg[7]_i_6_CO_UNCONNECTED [3],\row_cnt_reg[7]_i_6_n_1 ,\NLW_row_cnt_reg[7]_i_6_CO_UNCONNECTED [1:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,\row_cnt[7]_i_20__0_n_0 }),
        .O(\NLW_row_cnt_reg[7]_i_6_O_UNCONNECTED [3:0]),
        .S({1'b0,\row_cnt[7]_i_21__0_n_0 ,\row_cnt[7]_i_22__1_n_0 ,\row_cnt[7]_i_23__0_n_0 }));
  CARRY4 \row_cnt_reg[7]_i_7 
       (.CI(1'b0),
        .CO({\row_cnt_reg[7]_i_7_n_0 ,\NLW_row_cnt_reg[7]_i_7_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,\row_cnt[7]_i_24__0_n_0 ,\row_cnt[7]_i_25__0_n_0 }),
        .O(\NLW_row_cnt_reg[7]_i_7_O_UNCONNECTED [3:0]),
        .S({\row_cnt[7]_i_26__0_n_0 ,\row_cnt[7]_i_27__0_n_0 ,\row_cnt[7]_i_28__0_n_0 ,\row_cnt[7]_i_29__1_n_0 }));
  CARRY4 \row_cnt_reg[7]_i_9 
       (.CI(1'b0),
        .CO({\row_cnt_reg[7]_i_9_n_0 ,\NLW_row_cnt_reg[7]_i_9_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,\row_cnt[7]_i_30_n_0 ,\row_cnt[7]_i_31_n_0 }),
        .O(\NLW_row_cnt_reg[7]_i_9_O_UNCONNECTED [3:0]),
        .S({\row_cnt[7]_i_32_n_0 ,\row_cnt[7]_i_33_n_0 ,\row_cnt[7]_i_34_n_0 ,\row_cnt[7]_i_35_n_0 }));
  LUT6 #(
    .INIT(64'h7F700F0F7F70F0F0)) 
    \state[0]_i_1__1 
       (.I0(\state_reg[0] ),
        .I1(Q),
        .I2(state_0[0]),
        .I3(done_reg_n_0),
        .I4(state_0[1]),
        .I5(\state_reg[0]_0 ),
        .O(\out_ch_cnt_reg[3] ));
  LUT4 #(
    .INIT(16'hBFAA)) 
    wgt_loading_done_i_1__0
       (.I0(wgt_loading_done),
        .I1(\FSM_onehot_state_reg_n_0_[0] ),
        .I2(ctrl_start),
        .I3(wgt_loading_done_reg_n_0),
        .O(wgt_loading_done_i_1__0_n_0));
  FDRE wgt_loading_done_reg
       (.C(CLK),
        .CE(1'b1),
        .D(wgt_loading_done_i_1__0_n_0),
        .Q(wgt_loading_done_reg_n_0),
        .R(rst));
endmodule

(* ORIG_REF_NAME = "nn_layer_control_unit" *) 
module nn_layer_control_unit_1
   (win_load_active_reg,
    \state_reg[0] ,
    rst,
    CLK,
    \state_reg[0]_0 ,
    \state_reg[0]_1 ,
    \state_reg[0]_2 ,
    \state_reg[0]_3 ,
    window_valid,
    ctrl_start);
  output win_load_active_reg;
  output \state_reg[0] ;
  input rst;
  input CLK;
  input \state_reg[0]_0 ;
  input \state_reg[0]_1 ;
  input \state_reg[0]_2 ;
  input \state_reg[0]_3 ;
  input window_valid;
  input ctrl_start;

  wire CLK;
  wire \FSM_onehot_state[4]_i_1__0_n_0 ;
  wire \FSM_onehot_state[4]_i_2__0_n_0 ;
  wire \FSM_onehot_state_reg_n_0_[0] ;
  wire \FSM_onehot_state_reg_n_0_[3] ;
  wire \FSM_onehot_state_reg_n_0_[4] ;
  wire busy_i_1__1_n_0;
  wire busy_reg_n_0;
  wire [7:0]ch_in_cnt;
  wire ch_in_cnt0;
  wire \ch_in_cnt[0]_i_1_n_0 ;
  wire \ch_in_cnt[1]_i_1_n_0 ;
  wire \ch_in_cnt[2]_i_1_n_0 ;
  wire \ch_in_cnt[3]_i_1_n_0 ;
  wire \ch_in_cnt[4]_i_1_n_0 ;
  wire \ch_in_cnt[5]_i_1_n_0 ;
  wire \ch_in_cnt[5]_i_2_n_0 ;
  wire \ch_in_cnt[6]_i_1_n_0 ;
  wire \ch_in_cnt[7]_i_10_n_0 ;
  wire \ch_in_cnt[7]_i_11_n_0 ;
  wire \ch_in_cnt[7]_i_2_n_0 ;
  wire \ch_in_cnt[7]_i_3_n_0 ;
  wire \ch_in_cnt[7]_i_5_n_0 ;
  wire \ch_in_cnt[7]_i_6_n_0 ;
  wire \ch_in_cnt[7]_i_7_n_0 ;
  wire \ch_in_cnt[7]_i_8_n_0 ;
  wire \ch_in_cnt[7]_i_9_n_0 ;
  wire \ch_in_cnt_reg[7]_i_4_n_0 ;
  wire [7:0]col_cnt;
  wire col_cnt0;
  wire \col_cnt[0]_i_1__0_n_0 ;
  wire \col_cnt[1]_i_1__0_n_0 ;
  wire \col_cnt[2]_i_1__0_n_0 ;
  wire \col_cnt[3]_i_1__0_n_0 ;
  wire \col_cnt[4]_i_1__0_n_0 ;
  wire \col_cnt[5]_i_1__0_n_0 ;
  wire \col_cnt[5]_i_2__0_n_0 ;
  wire \col_cnt[5]_i_3_n_0 ;
  wire \col_cnt[6]_i_1__0_n_0 ;
  wire \col_cnt[7]_i_2__0_n_0 ;
  wire \col_cnt[7]_i_3__0_n_0 ;
  wire computation_done;
  wire computation_done_i_1__1_n_0;
  wire computation_done_i_2__0_n_0;
  wire computation_done_reg_n_0;
  wire ctrl_start;
  wire done_reg_n_0;
  wire [3:0]pipe_delay_cnt;
  wire \pipe_delay_cnt[3]_i_1__0_n_0 ;
  wire \pipe_delay_cnt_reg_n_0_[0] ;
  wire \pipe_delay_cnt_reg_n_0_[1] ;
  wire \pipe_delay_cnt_reg_n_0_[2] ;
  wire \pipe_delay_cnt_reg_n_0_[3] ;
  wire [7:0]pool_col_cnt;
  wire pool_col_cnt0;
  wire \pool_col_cnt[0]_i_1_n_0 ;
  wire \pool_col_cnt[1]_i_1_n_0 ;
  wire \pool_col_cnt[2]_i_1_n_0 ;
  wire \pool_col_cnt[3]_i_1_n_0 ;
  wire \pool_col_cnt[4]_i_1_n_0 ;
  wire \pool_col_cnt[4]_i_2_n_0 ;
  wire \pool_col_cnt[5]_i_1_n_0 ;
  wire \pool_col_cnt[5]_i_2_n_0 ;
  wire \pool_col_cnt[6]_i_1_n_0 ;
  wire \pool_col_cnt[7]_i_2_n_0 ;
  wire \pool_col_cnt[7]_i_3_n_0 ;
  wire [7:0]pool_row_cnt;
  wire pool_row_cnt0;
  wire \pool_row_cnt[0]_i_1_n_0 ;
  wire \pool_row_cnt[1]_i_1_n_0 ;
  wire \pool_row_cnt[2]_i_1_n_0 ;
  wire \pool_row_cnt[3]_i_1_n_0 ;
  wire \pool_row_cnt[4]_i_1_n_0 ;
  wire \pool_row_cnt[4]_i_2_n_0 ;
  wire \pool_row_cnt[5]_i_1_n_0 ;
  wire \pool_row_cnt[5]_i_2_n_0 ;
  wire \pool_row_cnt[6]_i_1_n_0 ;
  wire \pool_row_cnt[7]_i_2_n_0 ;
  wire \pool_row_cnt[7]_i_3_n_0 ;
  wire [7:0]row_cnt;
  wire row_cnt0;
  wire \row_cnt[0]_i_1__0_n_0 ;
  wire \row_cnt[1]_i_1__0_n_0 ;
  wire \row_cnt[2]_i_1__0_n_0 ;
  wire \row_cnt[3]_i_1__0_n_0 ;
  wire \row_cnt[4]_i_1__0_n_0 ;
  wire \row_cnt[5]_i_1__0_n_0 ;
  wire \row_cnt[5]_i_2__0_n_0 ;
  wire \row_cnt[5]_i_3_n_0 ;
  wire \row_cnt[6]_i_1__0_n_0 ;
  wire \row_cnt[7]_i_10_n_0 ;
  wire \row_cnt[7]_i_11_n_0 ;
  wire \row_cnt[7]_i_12_n_0 ;
  wire \row_cnt[7]_i_13_n_0 ;
  wire \row_cnt[7]_i_14_n_0 ;
  wire \row_cnt[7]_i_15_n_0 ;
  wire \row_cnt[7]_i_16_n_0 ;
  wire \row_cnt[7]_i_17_n_0 ;
  wire \row_cnt[7]_i_18_n_0 ;
  wire \row_cnt[7]_i_19_n_0 ;
  wire \row_cnt[7]_i_20_n_0 ;
  wire \row_cnt[7]_i_21_n_0 ;
  wire \row_cnt[7]_i_22__0_n_0 ;
  wire \row_cnt[7]_i_23_n_0 ;
  wire \row_cnt[7]_i_24_n_0 ;
  wire \row_cnt[7]_i_25_n_0 ;
  wire \row_cnt[7]_i_26_n_0 ;
  wire \row_cnt[7]_i_27_n_0 ;
  wire \row_cnt[7]_i_28_n_0 ;
  wire \row_cnt[7]_i_29__0_n_0 ;
  wire \row_cnt[7]_i_2__0_n_0 ;
  wire \row_cnt[7]_i_6__0_n_0 ;
  wire \row_cnt[7]_i_8_n_0 ;
  wire \row_cnt[7]_i_9_n_0 ;
  wire \row_cnt_reg[7]_i_3_n_0 ;
  wire \row_cnt_reg[7]_i_4_n_0 ;
  wire \row_cnt_reg[7]_i_5_n_0 ;
  wire \row_cnt_reg[7]_i_7_n_0 ;
  wire rst;
  wire \state_reg[0] ;
  wire \state_reg[0]_0 ;
  wire \state_reg[0]_1 ;
  wire \state_reg[0]_2 ;
  wire \state_reg[0]_3 ;
  wire wgt_loading_done;
  wire win_load_active_reg;
  wire window_valid;
  wire [2:0]\NLW_ch_in_cnt_reg[7]_i_4_CO_UNCONNECTED ;
  wire [3:0]\NLW_ch_in_cnt_reg[7]_i_4_O_UNCONNECTED ;
  wire [2:0]\NLW_row_cnt_reg[7]_i_3_CO_UNCONNECTED ;
  wire [3:0]\NLW_row_cnt_reg[7]_i_3_O_UNCONNECTED ;
  wire [2:0]\NLW_row_cnt_reg[7]_i_4_CO_UNCONNECTED ;
  wire [3:0]\NLW_row_cnt_reg[7]_i_4_O_UNCONNECTED ;
  wire [2:0]\NLW_row_cnt_reg[7]_i_5_CO_UNCONNECTED ;
  wire [3:0]\NLW_row_cnt_reg[7]_i_5_O_UNCONNECTED ;
  wire [2:0]\NLW_row_cnt_reg[7]_i_7_CO_UNCONNECTED ;
  wire [3:0]\NLW_row_cnt_reg[7]_i_7_O_UNCONNECTED ;

  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \FSM_onehot_state[4]_i_1__0 
       (.I0(\FSM_onehot_state[4]_i_2__0_n_0 ),
        .I1(\FSM_onehot_state_reg_n_0_[0] ),
        .I2(ctrl_start),
        .I3(computation_done),
        .I4(computation_done_reg_n_0),
        .O(\FSM_onehot_state[4]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'hFFFEEEEEEEEEEEEE)) 
    \FSM_onehot_state[4]_i_2__0 
       (.I0(wgt_loading_done),
        .I1(\FSM_onehot_state_reg_n_0_[4] ),
        .I2(\pipe_delay_cnt_reg_n_0_[2] ),
        .I3(\pipe_delay_cnt_reg_n_0_[1] ),
        .I4(\pipe_delay_cnt_reg_n_0_[3] ),
        .I5(\FSM_onehot_state_reg_n_0_[3] ),
        .O(\FSM_onehot_state[4]_i_2__0_n_0 ));
  (* FSM_ENCODED_STATES = "IDLE:00001,LOAD_WGT:00010,COMPUTE:00100,WRITE_OUT:01000,DONE_ST:10000," *) 
  FDSE #(
    .INIT(1'b1)) 
    \FSM_onehot_state_reg[0] 
       (.C(CLK),
        .CE(\FSM_onehot_state[4]_i_1__0_n_0 ),
        .D(\FSM_onehot_state_reg_n_0_[4] ),
        .Q(\FSM_onehot_state_reg_n_0_[0] ),
        .S(rst));
  (* FSM_ENCODED_STATES = "IDLE:00001,LOAD_WGT:00010,COMPUTE:00100,WRITE_OUT:01000,DONE_ST:10000," *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[1] 
       (.C(CLK),
        .CE(\FSM_onehot_state[4]_i_1__0_n_0 ),
        .D(\FSM_onehot_state_reg_n_0_[0] ),
        .Q(wgt_loading_done),
        .R(rst));
  (* FSM_ENCODED_STATES = "IDLE:00001,LOAD_WGT:00010,COMPUTE:00100,WRITE_OUT:01000,DONE_ST:10000," *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[2] 
       (.C(CLK),
        .CE(\FSM_onehot_state[4]_i_1__0_n_0 ),
        .D(wgt_loading_done),
        .Q(computation_done),
        .R(rst));
  (* FSM_ENCODED_STATES = "IDLE:00001,LOAD_WGT:00010,COMPUTE:00100,WRITE_OUT:01000,DONE_ST:10000," *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[3] 
       (.C(CLK),
        .CE(\FSM_onehot_state[4]_i_1__0_n_0 ),
        .D(computation_done),
        .Q(\FSM_onehot_state_reg_n_0_[3] ),
        .R(rst));
  (* FSM_ENCODED_STATES = "IDLE:00001,LOAD_WGT:00010,COMPUTE:00100,WRITE_OUT:01000,DONE_ST:10000," *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[4] 
       (.C(CLK),
        .CE(\FSM_onehot_state[4]_i_1__0_n_0 ),
        .D(\FSM_onehot_state_reg_n_0_[3] ),
        .Q(\FSM_onehot_state_reg_n_0_[4] ),
        .R(rst));
  LUT4 #(
    .INIT(16'h8B88)) 
    busy_i_1__1
       (.I0(ctrl_start),
        .I1(\FSM_onehot_state_reg_n_0_[0] ),
        .I2(\FSM_onehot_state_reg_n_0_[4] ),
        .I3(busy_reg_n_0),
        .O(busy_i_1__1_n_0));
  FDRE busy_reg
       (.C(CLK),
        .CE(1'b1),
        .D(busy_i_1__1_n_0),
        .Q(busy_reg_n_0),
        .R(rst));
  LUT2 #(
    .INIT(4'h2)) 
    \ch_in_cnt[0]_i_1 
       (.I0(computation_done),
        .I1(ch_in_cnt[0]),
        .O(\ch_in_cnt[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT3 #(
    .INIT(8'h48)) 
    \ch_in_cnt[1]_i_1 
       (.I0(ch_in_cnt[0]),
        .I1(computation_done),
        .I2(ch_in_cnt[1]),
        .O(\ch_in_cnt[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT4 #(
    .INIT(16'h7080)) 
    \ch_in_cnt[2]_i_1 
       (.I0(ch_in_cnt[1]),
        .I1(ch_in_cnt[0]),
        .I2(computation_done),
        .I3(ch_in_cnt[2]),
        .O(\ch_in_cnt[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT5 #(
    .INIT(32'h7F008000)) 
    \ch_in_cnt[3]_i_1 
       (.I0(ch_in_cnt[2]),
        .I1(ch_in_cnt[0]),
        .I2(ch_in_cnt[1]),
        .I3(computation_done),
        .I4(ch_in_cnt[3]),
        .O(\ch_in_cnt[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7FFF000080000000)) 
    \ch_in_cnt[4]_i_1 
       (.I0(ch_in_cnt[1]),
        .I1(ch_in_cnt[0]),
        .I2(ch_in_cnt[2]),
        .I3(ch_in_cnt[3]),
        .I4(computation_done),
        .I5(ch_in_cnt[4]),
        .O(\ch_in_cnt[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT3 #(
    .INIT(8'h48)) 
    \ch_in_cnt[5]_i_1 
       (.I0(\ch_in_cnt[5]_i_2_n_0 ),
        .I1(computation_done),
        .I2(ch_in_cnt[5]),
        .O(\ch_in_cnt[5]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h80000000)) 
    \ch_in_cnt[5]_i_2 
       (.I0(ch_in_cnt[4]),
        .I1(ch_in_cnt[3]),
        .I2(ch_in_cnt[2]),
        .I3(ch_in_cnt[0]),
        .I4(ch_in_cnt[1]),
        .O(\ch_in_cnt[5]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT3 #(
    .INIT(8'h84)) 
    \ch_in_cnt[6]_i_1 
       (.I0(\ch_in_cnt[7]_i_5_n_0 ),
        .I1(computation_done),
        .I2(ch_in_cnt[6]),
        .O(\ch_in_cnt[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF002000200020)) 
    \ch_in_cnt[7]_i_1 
       (.I0(\ch_in_cnt[7]_i_3_n_0 ),
        .I1(\row_cnt_reg[7]_i_3_n_0 ),
        .I2(\ch_in_cnt_reg[7]_i_4_n_0 ),
        .I3(\row_cnt_reg[7]_i_7_n_0 ),
        .I4(ctrl_start),
        .I5(\FSM_onehot_state_reg_n_0_[0] ),
        .O(ch_in_cnt0));
  LUT2 #(
    .INIT(4'h2)) 
    \ch_in_cnt[7]_i_10 
       (.I0(ch_in_cnt[2]),
        .I1(ch_in_cnt[3]),
        .O(\ch_in_cnt[7]_i_10_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \ch_in_cnt[7]_i_11 
       (.I0(ch_in_cnt[0]),
        .I1(ch_in_cnt[1]),
        .O(\ch_in_cnt[7]_i_11_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT4 #(
    .INIT(16'hB040)) 
    \ch_in_cnt[7]_i_2 
       (.I0(\ch_in_cnt[7]_i_5_n_0 ),
        .I1(ch_in_cnt[6]),
        .I2(computation_done),
        .I3(ch_in_cnt[7]),
        .O(\ch_in_cnt[7]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h04)) 
    \ch_in_cnt[7]_i_3 
       (.I0(\row_cnt_reg[7]_i_4_n_0 ),
        .I1(computation_done),
        .I2(\row_cnt_reg[7]_i_5_n_0 ),
        .O(\ch_in_cnt[7]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \ch_in_cnt[7]_i_5 
       (.I0(ch_in_cnt[1]),
        .I1(ch_in_cnt[0]),
        .I2(ch_in_cnt[2]),
        .I3(ch_in_cnt[3]),
        .I4(ch_in_cnt[4]),
        .I5(ch_in_cnt[5]),
        .O(\ch_in_cnt[7]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \ch_in_cnt[7]_i_6 
       (.I0(ch_in_cnt[3]),
        .I1(ch_in_cnt[2]),
        .O(\ch_in_cnt[7]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \ch_in_cnt[7]_i_7 
       (.I0(ch_in_cnt[1]),
        .I1(ch_in_cnt[0]),
        .O(\ch_in_cnt[7]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \ch_in_cnt[7]_i_8 
       (.I0(ch_in_cnt[7]),
        .I1(ch_in_cnt[6]),
        .O(\ch_in_cnt[7]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \ch_in_cnt[7]_i_9 
       (.I0(ch_in_cnt[5]),
        .I1(ch_in_cnt[4]),
        .O(\ch_in_cnt[7]_i_9_n_0 ));
  FDRE \ch_in_cnt_reg[0] 
       (.C(CLK),
        .CE(ch_in_cnt0),
        .D(\ch_in_cnt[0]_i_1_n_0 ),
        .Q(ch_in_cnt[0]),
        .R(rst));
  FDRE \ch_in_cnt_reg[1] 
       (.C(CLK),
        .CE(ch_in_cnt0),
        .D(\ch_in_cnt[1]_i_1_n_0 ),
        .Q(ch_in_cnt[1]),
        .R(rst));
  FDRE \ch_in_cnt_reg[2] 
       (.C(CLK),
        .CE(ch_in_cnt0),
        .D(\ch_in_cnt[2]_i_1_n_0 ),
        .Q(ch_in_cnt[2]),
        .R(rst));
  FDRE \ch_in_cnt_reg[3] 
       (.C(CLK),
        .CE(ch_in_cnt0),
        .D(\ch_in_cnt[3]_i_1_n_0 ),
        .Q(ch_in_cnt[3]),
        .R(rst));
  FDRE \ch_in_cnt_reg[4] 
       (.C(CLK),
        .CE(ch_in_cnt0),
        .D(\ch_in_cnt[4]_i_1_n_0 ),
        .Q(ch_in_cnt[4]),
        .R(rst));
  FDRE \ch_in_cnt_reg[5] 
       (.C(CLK),
        .CE(ch_in_cnt0),
        .D(\ch_in_cnt[5]_i_1_n_0 ),
        .Q(ch_in_cnt[5]),
        .R(rst));
  FDRE \ch_in_cnt_reg[6] 
       (.C(CLK),
        .CE(ch_in_cnt0),
        .D(\ch_in_cnt[6]_i_1_n_0 ),
        .Q(ch_in_cnt[6]),
        .R(rst));
  FDRE \ch_in_cnt_reg[7] 
       (.C(CLK),
        .CE(ch_in_cnt0),
        .D(\ch_in_cnt[7]_i_2_n_0 ),
        .Q(ch_in_cnt[7]),
        .R(rst));
  CARRY4 \ch_in_cnt_reg[7]_i_4 
       (.CI(1'b0),
        .CO({\ch_in_cnt_reg[7]_i_4_n_0 ,\NLW_ch_in_cnt_reg[7]_i_4_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,\ch_in_cnt[7]_i_6_n_0 ,\ch_in_cnt[7]_i_7_n_0 }),
        .O(\NLW_ch_in_cnt_reg[7]_i_4_O_UNCONNECTED [3:0]),
        .S({\ch_in_cnt[7]_i_8_n_0 ,\ch_in_cnt[7]_i_9_n_0 ,\ch_in_cnt[7]_i_10_n_0 ,\ch_in_cnt[7]_i_11_n_0 }));
  LUT3 #(
    .INIT(8'h08)) 
    \col_cnt[0]_i_1__0 
       (.I0(computation_done),
        .I1(\row_cnt_reg[7]_i_3_n_0 ),
        .I2(col_cnt[0]),
        .O(\col_cnt[0]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT4 #(
    .INIT(16'h0880)) 
    \col_cnt[1]_i_1__0 
       (.I0(\row_cnt_reg[7]_i_3_n_0 ),
        .I1(computation_done),
        .I2(col_cnt[0]),
        .I3(col_cnt[1]),
        .O(\col_cnt[1]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT5 #(
    .INIT(32'h08888000)) 
    \col_cnt[2]_i_1__0 
       (.I0(\row_cnt_reg[7]_i_3_n_0 ),
        .I1(computation_done),
        .I2(col_cnt[0]),
        .I3(col_cnt[1]),
        .I4(col_cnt[2]),
        .O(\col_cnt[2]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h7F00000080000000)) 
    \col_cnt[3]_i_1__0 
       (.I0(col_cnt[2]),
        .I1(col_cnt[0]),
        .I2(col_cnt[1]),
        .I3(computation_done),
        .I4(\row_cnt_reg[7]_i_3_n_0 ),
        .I5(col_cnt[3]),
        .O(\col_cnt[3]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h7FFF000080000000)) 
    \col_cnt[4]_i_1__0 
       (.I0(col_cnt[1]),
        .I1(col_cnt[0]),
        .I2(col_cnt[2]),
        .I3(col_cnt[3]),
        .I4(\col_cnt[5]_i_3_n_0 ),
        .I5(col_cnt[4]),
        .O(\col_cnt[4]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'hFF7F000000800000)) 
    \col_cnt[5]_i_1__0 
       (.I0(col_cnt[4]),
        .I1(col_cnt[3]),
        .I2(col_cnt[2]),
        .I3(\col_cnt[5]_i_2__0_n_0 ),
        .I4(\col_cnt[5]_i_3_n_0 ),
        .I5(col_cnt[5]),
        .O(\col_cnt[5]_i_1__0_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \col_cnt[5]_i_2__0 
       (.I0(col_cnt[1]),
        .I1(col_cnt[0]),
        .O(\col_cnt[5]_i_2__0_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \col_cnt[5]_i_3 
       (.I0(\row_cnt_reg[7]_i_3_n_0 ),
        .I1(computation_done),
        .O(\col_cnt[5]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT4 #(
    .INIT(16'h8040)) 
    \col_cnt[6]_i_1__0 
       (.I0(\col_cnt[7]_i_3__0_n_0 ),
        .I1(computation_done),
        .I2(\row_cnt_reg[7]_i_3_n_0 ),
        .I3(col_cnt[6]),
        .O(\col_cnt[6]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'hFF040404)) 
    \col_cnt[7]_i_1__0 
       (.I0(\row_cnt_reg[7]_i_5_n_0 ),
        .I1(computation_done),
        .I2(\row_cnt_reg[7]_i_4_n_0 ),
        .I3(ctrl_start),
        .I4(\FSM_onehot_state_reg_n_0_[0] ),
        .O(col_cnt0));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT5 #(
    .INIT(32'hB0004000)) 
    \col_cnt[7]_i_2__0 
       (.I0(\col_cnt[7]_i_3__0_n_0 ),
        .I1(col_cnt[6]),
        .I2(computation_done),
        .I3(\row_cnt_reg[7]_i_3_n_0 ),
        .I4(col_cnt[7]),
        .O(\col_cnt[7]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \col_cnt[7]_i_3__0 
       (.I0(col_cnt[1]),
        .I1(col_cnt[0]),
        .I2(col_cnt[2]),
        .I3(col_cnt[3]),
        .I4(col_cnt[4]),
        .I5(col_cnt[5]),
        .O(\col_cnt[7]_i_3__0_n_0 ));
  FDRE \col_cnt_reg[0] 
       (.C(CLK),
        .CE(col_cnt0),
        .D(\col_cnt[0]_i_1__0_n_0 ),
        .Q(col_cnt[0]),
        .R(rst));
  FDRE \col_cnt_reg[1] 
       (.C(CLK),
        .CE(col_cnt0),
        .D(\col_cnt[1]_i_1__0_n_0 ),
        .Q(col_cnt[1]),
        .R(rst));
  FDRE \col_cnt_reg[2] 
       (.C(CLK),
        .CE(col_cnt0),
        .D(\col_cnt[2]_i_1__0_n_0 ),
        .Q(col_cnt[2]),
        .R(rst));
  FDRE \col_cnt_reg[3] 
       (.C(CLK),
        .CE(col_cnt0),
        .D(\col_cnt[3]_i_1__0_n_0 ),
        .Q(col_cnt[3]),
        .R(rst));
  FDRE \col_cnt_reg[4] 
       (.C(CLK),
        .CE(col_cnt0),
        .D(\col_cnt[4]_i_1__0_n_0 ),
        .Q(col_cnt[4]),
        .R(rst));
  FDRE \col_cnt_reg[5] 
       (.C(CLK),
        .CE(col_cnt0),
        .D(\col_cnt[5]_i_1__0_n_0 ),
        .Q(col_cnt[5]),
        .R(rst));
  FDRE \col_cnt_reg[6] 
       (.C(CLK),
        .CE(col_cnt0),
        .D(\col_cnt[6]_i_1__0_n_0 ),
        .Q(col_cnt[6]),
        .R(rst));
  FDRE \col_cnt_reg[7] 
       (.C(CLK),
        .CE(col_cnt0),
        .D(\col_cnt[7]_i_2__0_n_0 ),
        .Q(col_cnt[7]),
        .R(rst));
  LUT5 #(
    .INIT(32'hABBBA888)) 
    computation_done_i_1__1
       (.I0(computation_done),
        .I1(computation_done_i_2__0_n_0),
        .I2(ctrl_start),
        .I3(\FSM_onehot_state_reg_n_0_[0] ),
        .I4(computation_done_reg_n_0),
        .O(computation_done_i_1__1_n_0));
  LUT6 #(
    .INIT(64'h0000000000010000)) 
    computation_done_i_2__0
       (.I0(\row_cnt_reg[7]_i_7_n_0 ),
        .I1(\ch_in_cnt_reg[7]_i_4_n_0 ),
        .I2(\row_cnt_reg[7]_i_3_n_0 ),
        .I3(\row_cnt_reg[7]_i_5_n_0 ),
        .I4(computation_done),
        .I5(\row_cnt_reg[7]_i_4_n_0 ),
        .O(computation_done_i_2__0_n_0));
  FDRE computation_done_reg
       (.C(CLK),
        .CE(1'b1),
        .D(computation_done_i_1__1_n_0),
        .Q(computation_done_reg_n_0),
        .R(rst));
  LUT4 #(
    .INIT(16'h0004)) 
    ctrl_start_i_1__2
       (.I0(\state_reg[0]_2 ),
        .I1(\state_reg[0]_3 ),
        .I2(busy_reg_n_0),
        .I3(ctrl_start),
        .O(\state_reg[0] ));
  FDRE done_reg
       (.C(CLK),
        .CE(1'b1),
        .D(\FSM_onehot_state_reg_n_0_[4] ),
        .Q(done_reg_n_0),
        .R(rst));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \pipe_delay_cnt[0]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[3] ),
        .I1(\pipe_delay_cnt_reg_n_0_[0] ),
        .O(pipe_delay_cnt[0]));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT3 #(
    .INIT(8'h48)) 
    \pipe_delay_cnt[1]_i_1__0 
       (.I0(\pipe_delay_cnt_reg_n_0_[0] ),
        .I1(\FSM_onehot_state_reg_n_0_[3] ),
        .I2(\pipe_delay_cnt_reg_n_0_[1] ),
        .O(pipe_delay_cnt[1]));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT4 #(
    .INIT(16'h7080)) 
    \pipe_delay_cnt[2]_i_1__0 
       (.I0(\pipe_delay_cnt_reg_n_0_[0] ),
        .I1(\pipe_delay_cnt_reg_n_0_[1] ),
        .I2(\FSM_onehot_state_reg_n_0_[3] ),
        .I3(\pipe_delay_cnt_reg_n_0_[2] ),
        .O(pipe_delay_cnt[2]));
  LUT3 #(
    .INIT(8'hF8)) 
    \pipe_delay_cnt[3]_i_1__0 
       (.I0(ctrl_start),
        .I1(\FSM_onehot_state_reg_n_0_[0] ),
        .I2(\FSM_onehot_state_reg_n_0_[3] ),
        .O(\pipe_delay_cnt[3]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT5 #(
    .INIT(32'h7F008000)) 
    \pipe_delay_cnt[3]_i_2__0 
       (.I0(\pipe_delay_cnt_reg_n_0_[1] ),
        .I1(\pipe_delay_cnt_reg_n_0_[0] ),
        .I2(\pipe_delay_cnt_reg_n_0_[2] ),
        .I3(\FSM_onehot_state_reg_n_0_[3] ),
        .I4(\pipe_delay_cnt_reg_n_0_[3] ),
        .O(pipe_delay_cnt[3]));
  FDRE \pipe_delay_cnt_reg[0] 
       (.C(CLK),
        .CE(\pipe_delay_cnt[3]_i_1__0_n_0 ),
        .D(pipe_delay_cnt[0]),
        .Q(\pipe_delay_cnt_reg_n_0_[0] ),
        .R(rst));
  FDRE \pipe_delay_cnt_reg[1] 
       (.C(CLK),
        .CE(\pipe_delay_cnt[3]_i_1__0_n_0 ),
        .D(pipe_delay_cnt[1]),
        .Q(\pipe_delay_cnt_reg_n_0_[1] ),
        .R(rst));
  FDRE \pipe_delay_cnt_reg[2] 
       (.C(CLK),
        .CE(\pipe_delay_cnt[3]_i_1__0_n_0 ),
        .D(pipe_delay_cnt[2]),
        .Q(\pipe_delay_cnt_reg_n_0_[2] ),
        .R(rst));
  FDRE \pipe_delay_cnt_reg[3] 
       (.C(CLK),
        .CE(\pipe_delay_cnt[3]_i_1__0_n_0 ),
        .D(pipe_delay_cnt[3]),
        .Q(\pipe_delay_cnt_reg_n_0_[3] ),
        .R(rst));
  LUT3 #(
    .INIT(8'h08)) 
    \pool_col_cnt[0]_i_1 
       (.I0(computation_done),
        .I1(\row_cnt_reg[7]_i_4_n_0 ),
        .I2(pool_col_cnt[0]),
        .O(\pool_col_cnt[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT4 #(
    .INIT(16'h0880)) 
    \pool_col_cnt[1]_i_1 
       (.I0(\row_cnt_reg[7]_i_4_n_0 ),
        .I1(computation_done),
        .I2(pool_col_cnt[0]),
        .I3(pool_col_cnt[1]),
        .O(\pool_col_cnt[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT5 #(
    .INIT(32'h70008000)) 
    \pool_col_cnt[2]_i_1 
       (.I0(pool_col_cnt[1]),
        .I1(pool_col_cnt[0]),
        .I2(computation_done),
        .I3(\row_cnt_reg[7]_i_4_n_0 ),
        .I4(pool_col_cnt[2]),
        .O(\pool_col_cnt[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7F00000080000000)) 
    \pool_col_cnt[3]_i_1 
       (.I0(pool_col_cnt[2]),
        .I1(pool_col_cnt[0]),
        .I2(pool_col_cnt[1]),
        .I3(computation_done),
        .I4(\row_cnt_reg[7]_i_4_n_0 ),
        .I5(pool_col_cnt[3]),
        .O(\pool_col_cnt[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7FFF000080000000)) 
    \pool_col_cnt[4]_i_1 
       (.I0(pool_col_cnt[1]),
        .I1(pool_col_cnt[0]),
        .I2(pool_col_cnt[2]),
        .I3(pool_col_cnt[3]),
        .I4(\pool_col_cnt[4]_i_2_n_0 ),
        .I5(pool_col_cnt[4]),
        .O(\pool_col_cnt[4]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \pool_col_cnt[4]_i_2 
       (.I0(\row_cnt_reg[7]_i_4_n_0 ),
        .I1(computation_done),
        .O(\pool_col_cnt[4]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h4080)) 
    \pool_col_cnt[5]_i_1 
       (.I0(\pool_col_cnt[5]_i_2_n_0 ),
        .I1(computation_done),
        .I2(\row_cnt_reg[7]_i_4_n_0 ),
        .I3(pool_col_cnt[5]),
        .O(\pool_col_cnt[5]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h80000000)) 
    \pool_col_cnt[5]_i_2 
       (.I0(pool_col_cnt[4]),
        .I1(pool_col_cnt[3]),
        .I2(pool_col_cnt[2]),
        .I3(pool_col_cnt[0]),
        .I4(pool_col_cnt[1]),
        .O(\pool_col_cnt[5]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT4 #(
    .INIT(16'h8040)) 
    \pool_col_cnt[6]_i_1 
       (.I0(\pool_col_cnt[7]_i_3_n_0 ),
        .I1(computation_done),
        .I2(\row_cnt_reg[7]_i_4_n_0 ),
        .I3(pool_col_cnt[6]),
        .O(\pool_col_cnt[6]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hF8)) 
    \pool_col_cnt[7]_i_1 
       (.I0(ctrl_start),
        .I1(\FSM_onehot_state_reg_n_0_[0] ),
        .I2(computation_done),
        .O(pool_col_cnt0));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT5 #(
    .INIT(32'hB0004000)) 
    \pool_col_cnt[7]_i_2 
       (.I0(\pool_col_cnt[7]_i_3_n_0 ),
        .I1(pool_col_cnt[6]),
        .I2(computation_done),
        .I3(\row_cnt_reg[7]_i_4_n_0 ),
        .I4(pool_col_cnt[7]),
        .O(\pool_col_cnt[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \pool_col_cnt[7]_i_3 
       (.I0(pool_col_cnt[1]),
        .I1(pool_col_cnt[0]),
        .I2(pool_col_cnt[2]),
        .I3(pool_col_cnt[3]),
        .I4(pool_col_cnt[4]),
        .I5(pool_col_cnt[5]),
        .O(\pool_col_cnt[7]_i_3_n_0 ));
  FDRE \pool_col_cnt_reg[0] 
       (.C(CLK),
        .CE(pool_col_cnt0),
        .D(\pool_col_cnt[0]_i_1_n_0 ),
        .Q(pool_col_cnt[0]),
        .R(rst));
  FDRE \pool_col_cnt_reg[1] 
       (.C(CLK),
        .CE(pool_col_cnt0),
        .D(\pool_col_cnt[1]_i_1_n_0 ),
        .Q(pool_col_cnt[1]),
        .R(rst));
  FDRE \pool_col_cnt_reg[2] 
       (.C(CLK),
        .CE(pool_col_cnt0),
        .D(\pool_col_cnt[2]_i_1_n_0 ),
        .Q(pool_col_cnt[2]),
        .R(rst));
  FDRE \pool_col_cnt_reg[3] 
       (.C(CLK),
        .CE(pool_col_cnt0),
        .D(\pool_col_cnt[3]_i_1_n_0 ),
        .Q(pool_col_cnt[3]),
        .R(rst));
  FDRE \pool_col_cnt_reg[4] 
       (.C(CLK),
        .CE(pool_col_cnt0),
        .D(\pool_col_cnt[4]_i_1_n_0 ),
        .Q(pool_col_cnt[4]),
        .R(rst));
  FDRE \pool_col_cnt_reg[5] 
       (.C(CLK),
        .CE(pool_col_cnt0),
        .D(\pool_col_cnt[5]_i_1_n_0 ),
        .Q(pool_col_cnt[5]),
        .R(rst));
  FDRE \pool_col_cnt_reg[6] 
       (.C(CLK),
        .CE(pool_col_cnt0),
        .D(\pool_col_cnt[6]_i_1_n_0 ),
        .Q(pool_col_cnt[6]),
        .R(rst));
  FDRE \pool_col_cnt_reg[7] 
       (.C(CLK),
        .CE(pool_col_cnt0),
        .D(\pool_col_cnt[7]_i_2_n_0 ),
        .Q(pool_col_cnt[7]),
        .R(rst));
  LUT3 #(
    .INIT(8'h08)) 
    \pool_row_cnt[0]_i_1 
       (.I0(computation_done),
        .I1(\row_cnt_reg[7]_i_5_n_0 ),
        .I2(pool_row_cnt[0]),
        .O(\pool_row_cnt[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT4 #(
    .INIT(16'h0880)) 
    \pool_row_cnt[1]_i_1 
       (.I0(\row_cnt_reg[7]_i_5_n_0 ),
        .I1(computation_done),
        .I2(pool_row_cnt[0]),
        .I3(pool_row_cnt[1]),
        .O(\pool_row_cnt[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT5 #(
    .INIT(32'h70008000)) 
    \pool_row_cnt[2]_i_1 
       (.I0(pool_row_cnt[1]),
        .I1(pool_row_cnt[0]),
        .I2(computation_done),
        .I3(\row_cnt_reg[7]_i_5_n_0 ),
        .I4(pool_row_cnt[2]),
        .O(\pool_row_cnt[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7F00000080000000)) 
    \pool_row_cnt[3]_i_1 
       (.I0(pool_row_cnt[2]),
        .I1(pool_row_cnt[0]),
        .I2(pool_row_cnt[1]),
        .I3(computation_done),
        .I4(\row_cnt_reg[7]_i_5_n_0 ),
        .I5(pool_row_cnt[3]),
        .O(\pool_row_cnt[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7FFF000080000000)) 
    \pool_row_cnt[4]_i_1 
       (.I0(pool_row_cnt[1]),
        .I1(pool_row_cnt[0]),
        .I2(pool_row_cnt[2]),
        .I3(pool_row_cnt[3]),
        .I4(\pool_row_cnt[4]_i_2_n_0 ),
        .I5(pool_row_cnt[4]),
        .O(\pool_row_cnt[4]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \pool_row_cnt[4]_i_2 
       (.I0(\row_cnt_reg[7]_i_5_n_0 ),
        .I1(computation_done),
        .O(\pool_row_cnt[4]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h4080)) 
    \pool_row_cnt[5]_i_1 
       (.I0(\pool_row_cnt[5]_i_2_n_0 ),
        .I1(computation_done),
        .I2(\row_cnt_reg[7]_i_5_n_0 ),
        .I3(pool_row_cnt[5]),
        .O(\pool_row_cnt[5]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h80000000)) 
    \pool_row_cnt[5]_i_2 
       (.I0(pool_row_cnt[4]),
        .I1(pool_row_cnt[3]),
        .I2(pool_row_cnt[2]),
        .I3(pool_row_cnt[0]),
        .I4(pool_row_cnt[1]),
        .O(\pool_row_cnt[5]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT4 #(
    .INIT(16'h8040)) 
    \pool_row_cnt[6]_i_1 
       (.I0(\pool_row_cnt[7]_i_3_n_0 ),
        .I1(computation_done),
        .I2(\row_cnt_reg[7]_i_5_n_0 ),
        .I3(pool_row_cnt[6]),
        .O(\pool_row_cnt[6]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hF444)) 
    \pool_row_cnt[7]_i_1 
       (.I0(\row_cnt_reg[7]_i_4_n_0 ),
        .I1(computation_done),
        .I2(ctrl_start),
        .I3(\FSM_onehot_state_reg_n_0_[0] ),
        .O(pool_row_cnt0));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT5 #(
    .INIT(32'hB0004000)) 
    \pool_row_cnt[7]_i_2 
       (.I0(\pool_row_cnt[7]_i_3_n_0 ),
        .I1(pool_row_cnt[6]),
        .I2(computation_done),
        .I3(\row_cnt_reg[7]_i_5_n_0 ),
        .I4(pool_row_cnt[7]),
        .O(\pool_row_cnt[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \pool_row_cnt[7]_i_3 
       (.I0(pool_row_cnt[1]),
        .I1(pool_row_cnt[0]),
        .I2(pool_row_cnt[2]),
        .I3(pool_row_cnt[3]),
        .I4(pool_row_cnt[4]),
        .I5(pool_row_cnt[5]),
        .O(\pool_row_cnt[7]_i_3_n_0 ));
  FDRE \pool_row_cnt_reg[0] 
       (.C(CLK),
        .CE(pool_row_cnt0),
        .D(\pool_row_cnt[0]_i_1_n_0 ),
        .Q(pool_row_cnt[0]),
        .R(rst));
  FDRE \pool_row_cnt_reg[1] 
       (.C(CLK),
        .CE(pool_row_cnt0),
        .D(\pool_row_cnt[1]_i_1_n_0 ),
        .Q(pool_row_cnt[1]),
        .R(rst));
  FDRE \pool_row_cnt_reg[2] 
       (.C(CLK),
        .CE(pool_row_cnt0),
        .D(\pool_row_cnt[2]_i_1_n_0 ),
        .Q(pool_row_cnt[2]),
        .R(rst));
  FDRE \pool_row_cnt_reg[3] 
       (.C(CLK),
        .CE(pool_row_cnt0),
        .D(\pool_row_cnt[3]_i_1_n_0 ),
        .Q(pool_row_cnt[3]),
        .R(rst));
  FDRE \pool_row_cnt_reg[4] 
       (.C(CLK),
        .CE(pool_row_cnt0),
        .D(\pool_row_cnt[4]_i_1_n_0 ),
        .Q(pool_row_cnt[4]),
        .R(rst));
  FDRE \pool_row_cnt_reg[5] 
       (.C(CLK),
        .CE(pool_row_cnt0),
        .D(\pool_row_cnt[5]_i_1_n_0 ),
        .Q(pool_row_cnt[5]),
        .R(rst));
  FDRE \pool_row_cnt_reg[6] 
       (.C(CLK),
        .CE(pool_row_cnt0),
        .D(\pool_row_cnt[6]_i_1_n_0 ),
        .Q(pool_row_cnt[6]),
        .R(rst));
  FDRE \pool_row_cnt_reg[7] 
       (.C(CLK),
        .CE(pool_row_cnt0),
        .D(\pool_row_cnt[7]_i_2_n_0 ),
        .Q(pool_row_cnt[7]),
        .R(rst));
  LUT3 #(
    .INIT(8'h08)) 
    \row_cnt[0]_i_1__0 
       (.I0(computation_done),
        .I1(\row_cnt_reg[7]_i_7_n_0 ),
        .I2(row_cnt[0]),
        .O(\row_cnt[0]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT4 #(
    .INIT(16'h0880)) 
    \row_cnt[1]_i_1__0 
       (.I0(\row_cnt_reg[7]_i_7_n_0 ),
        .I1(computation_done),
        .I2(row_cnt[0]),
        .I3(row_cnt[1]),
        .O(\row_cnt[1]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT5 #(
    .INIT(32'h08888000)) 
    \row_cnt[2]_i_1__0 
       (.I0(\row_cnt_reg[7]_i_7_n_0 ),
        .I1(computation_done),
        .I2(row_cnt[0]),
        .I3(row_cnt[1]),
        .I4(row_cnt[2]),
        .O(\row_cnt[2]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h7F00000080000000)) 
    \row_cnt[3]_i_1__0 
       (.I0(row_cnt[2]),
        .I1(row_cnt[0]),
        .I2(row_cnt[1]),
        .I3(computation_done),
        .I4(\row_cnt_reg[7]_i_7_n_0 ),
        .I5(row_cnt[3]),
        .O(\row_cnt[3]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h7FFF000080000000)) 
    \row_cnt[4]_i_1__0 
       (.I0(row_cnt[1]),
        .I1(row_cnt[0]),
        .I2(row_cnt[2]),
        .I3(row_cnt[3]),
        .I4(\row_cnt[5]_i_3_n_0 ),
        .I5(row_cnt[4]),
        .O(\row_cnt[4]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'hFF7F000000800000)) 
    \row_cnt[5]_i_1__0 
       (.I0(row_cnt[4]),
        .I1(row_cnt[3]),
        .I2(row_cnt[2]),
        .I3(\row_cnt[5]_i_2__0_n_0 ),
        .I4(\row_cnt[5]_i_3_n_0 ),
        .I5(row_cnt[5]),
        .O(\row_cnt[5]_i_1__0_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \row_cnt[5]_i_2__0 
       (.I0(row_cnt[1]),
        .I1(row_cnt[0]),
        .O(\row_cnt[5]_i_2__0_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \row_cnt[5]_i_3 
       (.I0(\row_cnt_reg[7]_i_7_n_0 ),
        .I1(computation_done),
        .O(\row_cnt[5]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT4 #(
    .INIT(16'h8040)) 
    \row_cnt[6]_i_1__0 
       (.I0(\row_cnt[7]_i_6__0_n_0 ),
        .I1(computation_done),
        .I2(\row_cnt_reg[7]_i_7_n_0 ),
        .I3(row_cnt[6]),
        .O(\row_cnt[6]_i_1__0_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \row_cnt[7]_i_10 
       (.I0(col_cnt[7]),
        .I1(col_cnt[6]),
        .O(\row_cnt[7]_i_10_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \row_cnt[7]_i_11 
       (.I0(col_cnt[5]),
        .I1(col_cnt[4]),
        .O(\row_cnt[7]_i_11_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \row_cnt[7]_i_12 
       (.I0(col_cnt[3]),
        .I1(col_cnt[2]),
        .O(\row_cnt[7]_i_12_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \row_cnt[7]_i_13 
       (.I0(col_cnt[0]),
        .I1(col_cnt[1]),
        .O(\row_cnt[7]_i_13_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \row_cnt[7]_i_14 
       (.I0(pool_col_cnt[1]),
        .I1(pool_col_cnt[0]),
        .O(\row_cnt[7]_i_14_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \row_cnt[7]_i_15 
       (.I0(pool_col_cnt[7]),
        .I1(pool_col_cnt[6]),
        .O(\row_cnt[7]_i_15_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \row_cnt[7]_i_16 
       (.I0(pool_col_cnt[5]),
        .I1(pool_col_cnt[4]),
        .O(\row_cnt[7]_i_16_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \row_cnt[7]_i_17 
       (.I0(pool_col_cnt[3]),
        .I1(pool_col_cnt[2]),
        .O(\row_cnt[7]_i_17_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \row_cnt[7]_i_18 
       (.I0(pool_col_cnt[0]),
        .I1(pool_col_cnt[1]),
        .O(\row_cnt[7]_i_18_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \row_cnt[7]_i_19 
       (.I0(pool_row_cnt[1]),
        .I1(pool_row_cnt[0]),
        .O(\row_cnt[7]_i_19_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF001000100010)) 
    \row_cnt[7]_i_1__0 
       (.I0(\row_cnt_reg[7]_i_3_n_0 ),
        .I1(\row_cnt_reg[7]_i_4_n_0 ),
        .I2(computation_done),
        .I3(\row_cnt_reg[7]_i_5_n_0 ),
        .I4(ctrl_start),
        .I5(\FSM_onehot_state_reg_n_0_[0] ),
        .O(row_cnt0));
  LUT2 #(
    .INIT(4'h1)) 
    \row_cnt[7]_i_20 
       (.I0(pool_row_cnt[7]),
        .I1(pool_row_cnt[6]),
        .O(\row_cnt[7]_i_20_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \row_cnt[7]_i_21 
       (.I0(pool_row_cnt[5]),
        .I1(pool_row_cnt[4]),
        .O(\row_cnt[7]_i_21_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \row_cnt[7]_i_22__0 
       (.I0(pool_row_cnt[3]),
        .I1(pool_row_cnt[2]),
        .O(\row_cnt[7]_i_22__0_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \row_cnt[7]_i_23 
       (.I0(pool_row_cnt[0]),
        .I1(pool_row_cnt[1]),
        .O(\row_cnt[7]_i_23_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \row_cnt[7]_i_24 
       (.I0(row_cnt[3]),
        .O(\row_cnt[7]_i_24_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \row_cnt[7]_i_25 
       (.I0(row_cnt[1]),
        .I1(row_cnt[0]),
        .O(\row_cnt[7]_i_25_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \row_cnt[7]_i_26 
       (.I0(row_cnt[7]),
        .I1(row_cnt[6]),
        .O(\row_cnt[7]_i_26_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \row_cnt[7]_i_27 
       (.I0(row_cnt[5]),
        .I1(row_cnt[4]),
        .O(\row_cnt[7]_i_27_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \row_cnt[7]_i_28 
       (.I0(row_cnt[3]),
        .I1(row_cnt[2]),
        .O(\row_cnt[7]_i_28_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \row_cnt[7]_i_29__0 
       (.I0(row_cnt[0]),
        .I1(row_cnt[1]),
        .O(\row_cnt[7]_i_29__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT5 #(
    .INIT(32'hB0004000)) 
    \row_cnt[7]_i_2__0 
       (.I0(\row_cnt[7]_i_6__0_n_0 ),
        .I1(row_cnt[6]),
        .I2(computation_done),
        .I3(\row_cnt_reg[7]_i_7_n_0 ),
        .I4(row_cnt[7]),
        .O(\row_cnt[7]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \row_cnt[7]_i_6__0 
       (.I0(row_cnt[1]),
        .I1(row_cnt[0]),
        .I2(row_cnt[2]),
        .I3(row_cnt[3]),
        .I4(row_cnt[4]),
        .I5(row_cnt[5]),
        .O(\row_cnt[7]_i_6__0_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \row_cnt[7]_i_8 
       (.I0(col_cnt[3]),
        .O(\row_cnt[7]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \row_cnt[7]_i_9 
       (.I0(col_cnt[1]),
        .I1(col_cnt[0]),
        .O(\row_cnt[7]_i_9_n_0 ));
  FDRE \row_cnt_reg[0] 
       (.C(CLK),
        .CE(row_cnt0),
        .D(\row_cnt[0]_i_1__0_n_0 ),
        .Q(row_cnt[0]),
        .R(rst));
  FDRE \row_cnt_reg[1] 
       (.C(CLK),
        .CE(row_cnt0),
        .D(\row_cnt[1]_i_1__0_n_0 ),
        .Q(row_cnt[1]),
        .R(rst));
  FDRE \row_cnt_reg[2] 
       (.C(CLK),
        .CE(row_cnt0),
        .D(\row_cnt[2]_i_1__0_n_0 ),
        .Q(row_cnt[2]),
        .R(rst));
  FDRE \row_cnt_reg[3] 
       (.C(CLK),
        .CE(row_cnt0),
        .D(\row_cnt[3]_i_1__0_n_0 ),
        .Q(row_cnt[3]),
        .R(rst));
  FDRE \row_cnt_reg[4] 
       (.C(CLK),
        .CE(row_cnt0),
        .D(\row_cnt[4]_i_1__0_n_0 ),
        .Q(row_cnt[4]),
        .R(rst));
  FDRE \row_cnt_reg[5] 
       (.C(CLK),
        .CE(row_cnt0),
        .D(\row_cnt[5]_i_1__0_n_0 ),
        .Q(row_cnt[5]),
        .R(rst));
  FDRE \row_cnt_reg[6] 
       (.C(CLK),
        .CE(row_cnt0),
        .D(\row_cnt[6]_i_1__0_n_0 ),
        .Q(row_cnt[6]),
        .R(rst));
  FDRE \row_cnt_reg[7] 
       (.C(CLK),
        .CE(row_cnt0),
        .D(\row_cnt[7]_i_2__0_n_0 ),
        .Q(row_cnt[7]),
        .R(rst));
  CARRY4 \row_cnt_reg[7]_i_3 
       (.CI(1'b0),
        .CO({\row_cnt_reg[7]_i_3_n_0 ,\NLW_row_cnt_reg[7]_i_3_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,\row_cnt[7]_i_8_n_0 ,\row_cnt[7]_i_9_n_0 }),
        .O(\NLW_row_cnt_reg[7]_i_3_O_UNCONNECTED [3:0]),
        .S({\row_cnt[7]_i_10_n_0 ,\row_cnt[7]_i_11_n_0 ,\row_cnt[7]_i_12_n_0 ,\row_cnt[7]_i_13_n_0 }));
  CARRY4 \row_cnt_reg[7]_i_4 
       (.CI(1'b0),
        .CO({\row_cnt_reg[7]_i_4_n_0 ,\NLW_row_cnt_reg[7]_i_4_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,\row_cnt[7]_i_14_n_0 }),
        .O(\NLW_row_cnt_reg[7]_i_4_O_UNCONNECTED [3:0]),
        .S({\row_cnt[7]_i_15_n_0 ,\row_cnt[7]_i_16_n_0 ,\row_cnt[7]_i_17_n_0 ,\row_cnt[7]_i_18_n_0 }));
  CARRY4 \row_cnt_reg[7]_i_5 
       (.CI(1'b0),
        .CO({\row_cnt_reg[7]_i_5_n_0 ,\NLW_row_cnt_reg[7]_i_5_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,\row_cnt[7]_i_19_n_0 }),
        .O(\NLW_row_cnt_reg[7]_i_5_O_UNCONNECTED [3:0]),
        .S({\row_cnt[7]_i_20_n_0 ,\row_cnt[7]_i_21_n_0 ,\row_cnt[7]_i_22__0_n_0 ,\row_cnt[7]_i_23_n_0 }));
  CARRY4 \row_cnt_reg[7]_i_7 
       (.CI(1'b0),
        .CO({\row_cnt_reg[7]_i_7_n_0 ,\NLW_row_cnt_reg[7]_i_7_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,\row_cnt[7]_i_24_n_0 ,\row_cnt[7]_i_25_n_0 }),
        .O(\NLW_row_cnt_reg[7]_i_7_O_UNCONNECTED [3:0]),
        .S({\row_cnt[7]_i_26_n_0 ,\row_cnt[7]_i_27_n_0 ,\row_cnt[7]_i_28_n_0 ,\row_cnt[7]_i_29__0_n_0 }));
  LUT6 #(
    .INIT(64'h5F50CFCF5F50C0C0)) 
    \state[0]_i_1__2 
       (.I0(\state_reg[0]_0 ),
        .I1(\state_reg[0]_1 ),
        .I2(\state_reg[0]_2 ),
        .I3(done_reg_n_0),
        .I4(\state_reg[0]_3 ),
        .I5(window_valid),
        .O(win_load_active_reg));
endmodule

(* ORIG_REF_NAME = "nn_layer_control_unit" *) 
module nn_layer_control_unit_2
   (done_reg_0,
    \state_reg[0] ,
    rst,
    CLK,
    ctrl_start_reg,
    \state_reg[0]_0 ,
    \state_reg[0]_1 ,
    \state_reg[0]_2 ,
    ctrl_start_reg_0,
    ctrl_start);
  output done_reg_0;
  output \state_reg[0] ;
  input rst;
  input CLK;
  input ctrl_start_reg;
  input \state_reg[0]_0 ;
  input \state_reg[0]_1 ;
  input \state_reg[0]_2 ;
  input ctrl_start_reg_0;
  input ctrl_start;

  wire CLK;
  wire \FSM_onehot_state[4]_i_1_n_0 ;
  wire \FSM_onehot_state[4]_i_2_n_0 ;
  wire \FSM_onehot_state_reg_n_0_[0] ;
  wire \FSM_onehot_state_reg_n_0_[3] ;
  wire \FSM_onehot_state_reg_n_0_[4] ;
  wire busy_i_1_n_0;
  wire busy_reg_n_0;
  wire [7:0]ch_out_cnt;
  wire ch_out_cnt0;
  wire \ch_out_cnt[0]_i_1__0_n_0 ;
  wire \ch_out_cnt[1]_i_1_n_0 ;
  wire \ch_out_cnt[2]_i_1_n_0 ;
  wire \ch_out_cnt[3]_i_1_n_0 ;
  wire \ch_out_cnt[4]_i_1_n_0 ;
  wire \ch_out_cnt[5]_i_1_n_0 ;
  wire \ch_out_cnt[5]_i_2_n_0 ;
  wire \ch_out_cnt[6]_i_1_n_0 ;
  wire \ch_out_cnt[7]_i_10__0_n_0 ;
  wire \ch_out_cnt[7]_i_11__0_n_0 ;
  wire \ch_out_cnt[7]_i_12_n_0 ;
  wire \ch_out_cnt[7]_i_2_n_0 ;
  wire \ch_out_cnt[7]_i_3_n_0 ;
  wire \ch_out_cnt[7]_i_4__0_n_0 ;
  wire \ch_out_cnt[7]_i_6_n_0 ;
  wire \ch_out_cnt[7]_i_7__0_n_0 ;
  wire \ch_out_cnt[7]_i_8__0_n_0 ;
  wire \ch_out_cnt[7]_i_9__0_n_0 ;
  wire \ch_out_cnt_reg[7]_i_5_n_0 ;
  wire [7:0]col_cnt;
  wire col_cnt0;
  wire \col_cnt[0]_i_1_n_0 ;
  wire \col_cnt[1]_i_1_n_0 ;
  wire \col_cnt[2]_i_1_n_0 ;
  wire \col_cnt[3]_i_1_n_0 ;
  wire \col_cnt[4]_i_1_n_0 ;
  wire \col_cnt[4]_i_2_n_0 ;
  wire \col_cnt[5]_i_1_n_0 ;
  wire \col_cnt[5]_i_2_n_0 ;
  wire \col_cnt[6]_i_1_n_0 ;
  wire \col_cnt[7]_i_2_n_0 ;
  wire \col_cnt[7]_i_3_n_0 ;
  wire computation_done;
  wire computation_done_i_1_n_0;
  wire computation_done_i_2_n_0;
  wire computation_done_reg_n_0;
  wire ctrl_start;
  wire ctrl_start_reg;
  wire ctrl_start_reg_0;
  wire done_reg_0;
  wire done_reg_n_0;
  wire [7:0]kc_cnt;
  wire kc_cnt0;
  wire \kc_cnt[0]_i_1_n_0 ;
  wire \kc_cnt[1]_i_1_n_0 ;
  wire \kc_cnt[2]_i_1_n_0 ;
  wire \kc_cnt[3]_i_1_n_0 ;
  wire \kc_cnt[4]_i_1_n_0 ;
  wire \kc_cnt[4]_i_2_n_0 ;
  wire \kc_cnt[5]_i_1_n_0 ;
  wire \kc_cnt[5]_i_2_n_0 ;
  wire \kc_cnt[6]_i_1_n_0 ;
  wire \kc_cnt[7]_i_2_n_0 ;
  wire \kc_cnt[7]_i_3_n_0 ;
  wire [7:0]kr_cnt;
  wire kr_cnt0;
  wire \kr_cnt[0]_i_1_n_0 ;
  wire \kr_cnt[1]_i_1_n_0 ;
  wire \kr_cnt[2]_i_1_n_0 ;
  wire \kr_cnt[3]_i_1_n_0 ;
  wire \kr_cnt[4]_i_1_n_0 ;
  wire \kr_cnt[4]_i_2_n_0 ;
  wire \kr_cnt[5]_i_1_n_0 ;
  wire \kr_cnt[5]_i_2_n_0 ;
  wire \kr_cnt[6]_i_1_n_0 ;
  wire \kr_cnt[7]_i_2_n_0 ;
  wire \kr_cnt[7]_i_3_n_0 ;
  wire [3:1]pipe_delay_cnt;
  wire \pipe_delay_cnt[0]_i_1__2_n_0 ;
  wire \pipe_delay_cnt[3]_i_1_n_0 ;
  wire \pipe_delay_cnt_reg_n_0_[0] ;
  wire \pipe_delay_cnt_reg_n_0_[1] ;
  wire \pipe_delay_cnt_reg_n_0_[2] ;
  wire \pipe_delay_cnt_reg_n_0_[3] ;
  wire [7:0]row_cnt;
  wire row_cnt0;
  wire \row_cnt[0]_i_1_n_0 ;
  wire \row_cnt[1]_i_1_n_0 ;
  wire \row_cnt[2]_i_1_n_0 ;
  wire \row_cnt[3]_i_1_n_0 ;
  wire \row_cnt[4]_i_1_n_0 ;
  wire \row_cnt[4]_i_2_n_0 ;
  wire \row_cnt[5]_i_1_n_0 ;
  wire \row_cnt[5]_i_2_n_0 ;
  wire \row_cnt[6]_i_1_n_0 ;
  wire \row_cnt[7]_i_10__2_n_0 ;
  wire \row_cnt[7]_i_11__2_n_0 ;
  wire \row_cnt[7]_i_12__2_n_0 ;
  wire \row_cnt[7]_i_13__2_n_0 ;
  wire \row_cnt[7]_i_14__2_n_0 ;
  wire \row_cnt[7]_i_15__2_n_0 ;
  wire \row_cnt[7]_i_16__2_n_0 ;
  wire \row_cnt[7]_i_17__2_n_0 ;
  wire \row_cnt[7]_i_18__2_n_0 ;
  wire \row_cnt[7]_i_19__2_n_0 ;
  wire \row_cnt[7]_i_20__2_n_0 ;
  wire \row_cnt[7]_i_21__2_n_0 ;
  wire \row_cnt[7]_i_22_n_0 ;
  wire \row_cnt[7]_i_23__1_n_0 ;
  wire \row_cnt[7]_i_24__2_n_0 ;
  wire \row_cnt[7]_i_25__2_n_0 ;
  wire \row_cnt[7]_i_26__1_n_0 ;
  wire \row_cnt[7]_i_27__2_n_0 ;
  wire \row_cnt[7]_i_28__1_n_0 ;
  wire \row_cnt[7]_i_29_n_0 ;
  wire \row_cnt[7]_i_2_n_0 ;
  wire \row_cnt[7]_i_6_n_0 ;
  wire \row_cnt[7]_i_8__2_n_0 ;
  wire \row_cnt[7]_i_9__1_n_0 ;
  wire \row_cnt_reg[7]_i_3_n_1 ;
  wire \row_cnt_reg[7]_i_4_n_1 ;
  wire \row_cnt_reg[7]_i_5_n_0 ;
  wire \row_cnt_reg[7]_i_7_n_0 ;
  wire rst;
  wire \state_reg[0] ;
  wire \state_reg[0]_0 ;
  wire \state_reg[0]_1 ;
  wire \state_reg[0]_2 ;
  wire wgt_loading_done;
  wire wgt_loading_done_i_1_n_0;
  wire wgt_loading_done_reg_n_0;
  wire [2:0]\NLW_ch_out_cnt_reg[7]_i_5_CO_UNCONNECTED ;
  wire [3:0]\NLW_ch_out_cnt_reg[7]_i_5_O_UNCONNECTED ;
  wire [3:0]\NLW_row_cnt_reg[7]_i_3_CO_UNCONNECTED ;
  wire [3:0]\NLW_row_cnt_reg[7]_i_3_O_UNCONNECTED ;
  wire [3:0]\NLW_row_cnt_reg[7]_i_4_CO_UNCONNECTED ;
  wire [3:0]\NLW_row_cnt_reg[7]_i_4_O_UNCONNECTED ;
  wire [2:0]\NLW_row_cnt_reg[7]_i_5_CO_UNCONNECTED ;
  wire [3:0]\NLW_row_cnt_reg[7]_i_5_O_UNCONNECTED ;
  wire [2:0]\NLW_row_cnt_reg[7]_i_7_CO_UNCONNECTED ;
  wire [3:0]\NLW_row_cnt_reg[7]_i_7_O_UNCONNECTED ;

  LUT6 #(
    .INIT(64'hFFFFFFFFFFEAEAEA)) 
    \FSM_onehot_state[4]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[4] ),
        .I1(wgt_loading_done_reg_n_0),
        .I2(wgt_loading_done),
        .I3(ctrl_start),
        .I4(\FSM_onehot_state_reg_n_0_[0] ),
        .I5(\FSM_onehot_state[4]_i_2_n_0 ),
        .O(\FSM_onehot_state[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFA800A800A800)) 
    \FSM_onehot_state[4]_i_2 
       (.I0(\pipe_delay_cnt_reg_n_0_[3] ),
        .I1(\pipe_delay_cnt_reg_n_0_[1] ),
        .I2(\pipe_delay_cnt_reg_n_0_[2] ),
        .I3(\FSM_onehot_state_reg_n_0_[3] ),
        .I4(computation_done_reg_n_0),
        .I5(computation_done),
        .O(\FSM_onehot_state[4]_i_2_n_0 ));
  (* FSM_ENCODED_STATES = "IDLE:00001,LOAD_WGT:00010,COMPUTE:00100,WRITE_OUT:01000,DONE_ST:10000," *) 
  FDSE #(
    .INIT(1'b1)) 
    \FSM_onehot_state_reg[0] 
       (.C(CLK),
        .CE(\FSM_onehot_state[4]_i_1_n_0 ),
        .D(\FSM_onehot_state_reg_n_0_[4] ),
        .Q(\FSM_onehot_state_reg_n_0_[0] ),
        .S(rst));
  (* FSM_ENCODED_STATES = "IDLE:00001,LOAD_WGT:00010,COMPUTE:00100,WRITE_OUT:01000,DONE_ST:10000," *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[1] 
       (.C(CLK),
        .CE(\FSM_onehot_state[4]_i_1_n_0 ),
        .D(\FSM_onehot_state_reg_n_0_[0] ),
        .Q(wgt_loading_done),
        .R(rst));
  (* FSM_ENCODED_STATES = "IDLE:00001,LOAD_WGT:00010,COMPUTE:00100,WRITE_OUT:01000,DONE_ST:10000," *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[2] 
       (.C(CLK),
        .CE(\FSM_onehot_state[4]_i_1_n_0 ),
        .D(wgt_loading_done),
        .Q(computation_done),
        .R(rst));
  (* FSM_ENCODED_STATES = "IDLE:00001,LOAD_WGT:00010,COMPUTE:00100,WRITE_OUT:01000,DONE_ST:10000," *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[3] 
       (.C(CLK),
        .CE(\FSM_onehot_state[4]_i_1_n_0 ),
        .D(computation_done),
        .Q(\FSM_onehot_state_reg_n_0_[3] ),
        .R(rst));
  (* FSM_ENCODED_STATES = "IDLE:00001,LOAD_WGT:00010,COMPUTE:00100,WRITE_OUT:01000,DONE_ST:10000," *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[4] 
       (.C(CLK),
        .CE(\FSM_onehot_state[4]_i_1_n_0 ),
        .D(\FSM_onehot_state_reg_n_0_[3] ),
        .Q(\FSM_onehot_state_reg_n_0_[4] ),
        .R(rst));
  LUT4 #(
    .INIT(16'h8B88)) 
    busy_i_1
       (.I0(ctrl_start),
        .I1(\FSM_onehot_state_reg_n_0_[0] ),
        .I2(\FSM_onehot_state_reg_n_0_[4] ),
        .I3(busy_reg_n_0),
        .O(busy_i_1_n_0));
  FDRE busy_reg
       (.C(CLK),
        .CE(1'b1),
        .D(busy_i_1_n_0),
        .Q(busy_reg_n_0),
        .R(rst));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \ch_out_cnt[0]_i_1__0 
       (.I0(computation_done),
        .I1(ch_out_cnt[0]),
        .O(\ch_out_cnt[0]_i_1__0_n_0 ));
  LUT3 #(
    .INIT(8'h28)) 
    \ch_out_cnt[1]_i_1 
       (.I0(computation_done),
        .I1(ch_out_cnt[1]),
        .I2(ch_out_cnt[0]),
        .O(\ch_out_cnt[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'h2888)) 
    \ch_out_cnt[2]_i_1 
       (.I0(computation_done),
        .I1(ch_out_cnt[2]),
        .I2(ch_out_cnt[1]),
        .I3(ch_out_cnt[0]),
        .O(\ch_out_cnt[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT5 #(
    .INIT(32'h28888888)) 
    \ch_out_cnt[3]_i_1 
       (.I0(computation_done),
        .I1(ch_out_cnt[3]),
        .I2(ch_out_cnt[2]),
        .I3(ch_out_cnt[0]),
        .I4(ch_out_cnt[1]),
        .O(\ch_out_cnt[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2888888888888888)) 
    \ch_out_cnt[4]_i_1 
       (.I0(computation_done),
        .I1(ch_out_cnt[4]),
        .I2(ch_out_cnt[3]),
        .I3(ch_out_cnt[1]),
        .I4(ch_out_cnt[0]),
        .I5(ch_out_cnt[2]),
        .O(\ch_out_cnt[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'h28)) 
    \ch_out_cnt[5]_i_1 
       (.I0(computation_done),
        .I1(ch_out_cnt[5]),
        .I2(\ch_out_cnt[5]_i_2_n_0 ),
        .O(\ch_out_cnt[5]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h80000000)) 
    \ch_out_cnt[5]_i_2 
       (.I0(ch_out_cnt[4]),
        .I1(ch_out_cnt[2]),
        .I2(ch_out_cnt[0]),
        .I3(ch_out_cnt[1]),
        .I4(ch_out_cnt[3]),
        .O(\ch_out_cnt[5]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'h28)) 
    \ch_out_cnt[6]_i_1 
       (.I0(computation_done),
        .I1(ch_out_cnt[6]),
        .I2(\ch_out_cnt[7]_i_6_n_0 ),
        .O(\ch_out_cnt[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAEAAAAAAAAAA)) 
    \ch_out_cnt[7]_i_1 
       (.I0(\ch_out_cnt[7]_i_3_n_0 ),
        .I1(\ch_out_cnt[7]_i_4__0_n_0 ),
        .I2(\row_cnt_reg[7]_i_7_n_0 ),
        .I3(\ch_out_cnt_reg[7]_i_5_n_0 ),
        .I4(\row_cnt_reg[7]_i_5_n_0 ),
        .I5(computation_done),
        .O(ch_out_cnt0));
  LUT2 #(
    .INIT(4'h1)) 
    \ch_out_cnt[7]_i_10__0 
       (.I0(ch_out_cnt[4]),
        .I1(ch_out_cnt[5]),
        .O(\ch_out_cnt[7]_i_10__0_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \ch_out_cnt[7]_i_11__0 
       (.I0(ch_out_cnt[2]),
        .I1(ch_out_cnt[3]),
        .O(\ch_out_cnt[7]_i_11__0_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \ch_out_cnt[7]_i_12 
       (.I0(ch_out_cnt[0]),
        .I1(ch_out_cnt[1]),
        .O(\ch_out_cnt[7]_i_12_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT4 #(
    .INIT(16'h2888)) 
    \ch_out_cnt[7]_i_2 
       (.I0(computation_done),
        .I1(ch_out_cnt[7]),
        .I2(ch_out_cnt[6]),
        .I3(\ch_out_cnt[7]_i_6_n_0 ),
        .O(\ch_out_cnt[7]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \ch_out_cnt[7]_i_3 
       (.I0(\FSM_onehot_state_reg_n_0_[0] ),
        .I1(ctrl_start),
        .O(\ch_out_cnt[7]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \ch_out_cnt[7]_i_4__0 
       (.I0(\row_cnt_reg[7]_i_4_n_1 ),
        .I1(\row_cnt_reg[7]_i_3_n_1 ),
        .O(\ch_out_cnt[7]_i_4__0_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \ch_out_cnt[7]_i_6 
       (.I0(ch_out_cnt[5]),
        .I1(ch_out_cnt[3]),
        .I2(ch_out_cnt[1]),
        .I3(ch_out_cnt[0]),
        .I4(ch_out_cnt[2]),
        .I5(ch_out_cnt[4]),
        .O(\ch_out_cnt[7]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \ch_out_cnt[7]_i_7__0 
       (.I0(ch_out_cnt[2]),
        .I1(ch_out_cnt[3]),
        .O(\ch_out_cnt[7]_i_7__0_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \ch_out_cnt[7]_i_8__0 
       (.I0(ch_out_cnt[0]),
        .I1(ch_out_cnt[1]),
        .O(\ch_out_cnt[7]_i_8__0_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \ch_out_cnt[7]_i_9__0 
       (.I0(ch_out_cnt[6]),
        .I1(ch_out_cnt[7]),
        .O(\ch_out_cnt[7]_i_9__0_n_0 ));
  FDRE \ch_out_cnt_reg[0] 
       (.C(CLK),
        .CE(ch_out_cnt0),
        .D(\ch_out_cnt[0]_i_1__0_n_0 ),
        .Q(ch_out_cnt[0]),
        .R(rst));
  FDRE \ch_out_cnt_reg[1] 
       (.C(CLK),
        .CE(ch_out_cnt0),
        .D(\ch_out_cnt[1]_i_1_n_0 ),
        .Q(ch_out_cnt[1]),
        .R(rst));
  FDRE \ch_out_cnt_reg[2] 
       (.C(CLK),
        .CE(ch_out_cnt0),
        .D(\ch_out_cnt[2]_i_1_n_0 ),
        .Q(ch_out_cnt[2]),
        .R(rst));
  FDRE \ch_out_cnt_reg[3] 
       (.C(CLK),
        .CE(ch_out_cnt0),
        .D(\ch_out_cnt[3]_i_1_n_0 ),
        .Q(ch_out_cnt[3]),
        .R(rst));
  FDRE \ch_out_cnt_reg[4] 
       (.C(CLK),
        .CE(ch_out_cnt0),
        .D(\ch_out_cnt[4]_i_1_n_0 ),
        .Q(ch_out_cnt[4]),
        .R(rst));
  FDRE \ch_out_cnt_reg[5] 
       (.C(CLK),
        .CE(ch_out_cnt0),
        .D(\ch_out_cnt[5]_i_1_n_0 ),
        .Q(ch_out_cnt[5]),
        .R(rst));
  FDRE \ch_out_cnt_reg[6] 
       (.C(CLK),
        .CE(ch_out_cnt0),
        .D(\ch_out_cnt[6]_i_1_n_0 ),
        .Q(ch_out_cnt[6]),
        .R(rst));
  FDRE \ch_out_cnt_reg[7] 
       (.C(CLK),
        .CE(ch_out_cnt0),
        .D(\ch_out_cnt[7]_i_2_n_0 ),
        .Q(ch_out_cnt[7]),
        .R(rst));
  CARRY4 \ch_out_cnt_reg[7]_i_5 
       (.CI(1'b0),
        .CO({\ch_out_cnt_reg[7]_i_5_n_0 ,\NLW_ch_out_cnt_reg[7]_i_5_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,\ch_out_cnt[7]_i_7__0_n_0 ,\ch_out_cnt[7]_i_8__0_n_0 }),
        .O(\NLW_ch_out_cnt_reg[7]_i_5_O_UNCONNECTED [3:0]),
        .S({\ch_out_cnt[7]_i_9__0_n_0 ,\ch_out_cnt[7]_i_10__0_n_0 ,\ch_out_cnt[7]_i_11__0_n_0 ,\ch_out_cnt[7]_i_12_n_0 }));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \col_cnt[0]_i_1 
       (.I0(computation_done),
        .I1(col_cnt[0]),
        .I2(\row_cnt_reg[7]_i_5_n_0 ),
        .O(\col_cnt[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h2800)) 
    \col_cnt[1]_i_1 
       (.I0(computation_done),
        .I1(col_cnt[0]),
        .I2(col_cnt[1]),
        .I3(\row_cnt_reg[7]_i_5_n_0 ),
        .O(\col_cnt[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'h2A800000)) 
    \col_cnt[2]_i_1 
       (.I0(computation_done),
        .I1(col_cnt[0]),
        .I2(col_cnt[1]),
        .I3(col_cnt[2]),
        .I4(\row_cnt_reg[7]_i_5_n_0 ),
        .O(\col_cnt[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2AAA800000000000)) 
    \col_cnt[3]_i_1 
       (.I0(computation_done),
        .I1(col_cnt[1]),
        .I2(col_cnt[0]),
        .I3(col_cnt[2]),
        .I4(col_cnt[3]),
        .I5(\row_cnt_reg[7]_i_5_n_0 ),
        .O(\col_cnt[3]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h2800)) 
    \col_cnt[4]_i_1 
       (.I0(computation_done),
        .I1(\col_cnt[4]_i_2_n_0 ),
        .I2(col_cnt[4]),
        .I3(\row_cnt_reg[7]_i_5_n_0 ),
        .O(\col_cnt[4]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h8000)) 
    \col_cnt[4]_i_2 
       (.I0(col_cnt[3]),
        .I1(col_cnt[1]),
        .I2(col_cnt[0]),
        .I3(col_cnt[2]),
        .O(\col_cnt[4]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'h2800)) 
    \col_cnt[5]_i_1 
       (.I0(computation_done),
        .I1(\col_cnt[5]_i_2_n_0 ),
        .I2(col_cnt[5]),
        .I3(\row_cnt_reg[7]_i_5_n_0 ),
        .O(\col_cnt[5]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h80000000)) 
    \col_cnt[5]_i_2 
       (.I0(col_cnt[4]),
        .I1(col_cnt[2]),
        .I2(col_cnt[0]),
        .I3(col_cnt[1]),
        .I4(col_cnt[3]),
        .O(\col_cnt[5]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h2800)) 
    \col_cnt[6]_i_1 
       (.I0(computation_done),
        .I1(\col_cnt[7]_i_3_n_0 ),
        .I2(col_cnt[6]),
        .I3(\row_cnt_reg[7]_i_5_n_0 ),
        .O(\col_cnt[6]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h888F8888)) 
    \col_cnt[7]_i_1 
       (.I0(ctrl_start),
        .I1(\FSM_onehot_state_reg_n_0_[0] ),
        .I2(\row_cnt_reg[7]_i_4_n_1 ),
        .I3(\row_cnt_reg[7]_i_3_n_1 ),
        .I4(computation_done),
        .O(col_cnt0));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'h2A800000)) 
    \col_cnt[7]_i_2 
       (.I0(computation_done),
        .I1(\col_cnt[7]_i_3_n_0 ),
        .I2(col_cnt[6]),
        .I3(col_cnt[7]),
        .I4(\row_cnt_reg[7]_i_5_n_0 ),
        .O(\col_cnt[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \col_cnt[7]_i_3 
       (.I0(col_cnt[5]),
        .I1(col_cnt[3]),
        .I2(col_cnt[1]),
        .I3(col_cnt[0]),
        .I4(col_cnt[2]),
        .I5(col_cnt[4]),
        .O(\col_cnt[7]_i_3_n_0 ));
  FDRE \col_cnt_reg[0] 
       (.C(CLK),
        .CE(col_cnt0),
        .D(\col_cnt[0]_i_1_n_0 ),
        .Q(col_cnt[0]),
        .R(rst));
  FDRE \col_cnt_reg[1] 
       (.C(CLK),
        .CE(col_cnt0),
        .D(\col_cnt[1]_i_1_n_0 ),
        .Q(col_cnt[1]),
        .R(rst));
  FDRE \col_cnt_reg[2] 
       (.C(CLK),
        .CE(col_cnt0),
        .D(\col_cnt[2]_i_1_n_0 ),
        .Q(col_cnt[2]),
        .R(rst));
  FDRE \col_cnt_reg[3] 
       (.C(CLK),
        .CE(col_cnt0),
        .D(\col_cnt[3]_i_1_n_0 ),
        .Q(col_cnt[3]),
        .R(rst));
  FDRE \col_cnt_reg[4] 
       (.C(CLK),
        .CE(col_cnt0),
        .D(\col_cnt[4]_i_1_n_0 ),
        .Q(col_cnt[4]),
        .R(rst));
  FDRE \col_cnt_reg[5] 
       (.C(CLK),
        .CE(col_cnt0),
        .D(\col_cnt[5]_i_1_n_0 ),
        .Q(col_cnt[5]),
        .R(rst));
  FDRE \col_cnt_reg[6] 
       (.C(CLK),
        .CE(col_cnt0),
        .D(\col_cnt[6]_i_1_n_0 ),
        .Q(col_cnt[6]),
        .R(rst));
  FDRE \col_cnt_reg[7] 
       (.C(CLK),
        .CE(col_cnt0),
        .D(\col_cnt[7]_i_2_n_0 ),
        .Q(col_cnt[7]),
        .R(rst));
  LUT5 #(
    .INIT(32'hAABFAA80)) 
    computation_done_i_1
       (.I0(computation_done),
        .I1(ctrl_start),
        .I2(\FSM_onehot_state_reg_n_0_[0] ),
        .I3(computation_done_i_2_n_0),
        .I4(computation_done_reg_n_0),
        .O(computation_done_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    computation_done_i_2
       (.I0(computation_done),
        .I1(\row_cnt_reg[7]_i_5_n_0 ),
        .I2(\ch_out_cnt_reg[7]_i_5_n_0 ),
        .I3(\row_cnt_reg[7]_i_7_n_0 ),
        .I4(\row_cnt_reg[7]_i_4_n_1 ),
        .I5(\row_cnt_reg[7]_i_3_n_1 ),
        .O(computation_done_i_2_n_0));
  FDRE computation_done_reg
       (.C(CLK),
        .CE(1'b1),
        .D(computation_done_i_1_n_0),
        .Q(computation_done_reg_n_0),
        .R(rst));
  LUT4 #(
    .INIT(16'h0100)) 
    ctrl_start_i_1
       (.I0(ctrl_start_reg_0),
        .I1(busy_reg_n_0),
        .I2(ctrl_start),
        .I3(ctrl_start_reg),
        .O(\state_reg[0] ));
  FDRE done_reg
       (.C(CLK),
        .CE(1'b1),
        .D(\FSM_onehot_state_reg_n_0_[4] ),
        .Q(done_reg_n_0),
        .R(rst));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \kc_cnt[0]_i_1 
       (.I0(computation_done),
        .I1(kc_cnt[0]),
        .I2(\row_cnt_reg[7]_i_4_n_1 ),
        .O(\kc_cnt[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h2800)) 
    \kc_cnt[1]_i_1 
       (.I0(computation_done),
        .I1(kc_cnt[0]),
        .I2(kc_cnt[1]),
        .I3(\row_cnt_reg[7]_i_4_n_1 ),
        .O(\kc_cnt[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h2A800000)) 
    \kc_cnt[2]_i_1 
       (.I0(computation_done),
        .I1(kc_cnt[0]),
        .I2(kc_cnt[1]),
        .I3(kc_cnt[2]),
        .I4(\row_cnt_reg[7]_i_4_n_1 ),
        .O(\kc_cnt[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2AAA800000000000)) 
    \kc_cnt[3]_i_1 
       (.I0(computation_done),
        .I1(kc_cnt[1]),
        .I2(kc_cnt[0]),
        .I3(kc_cnt[2]),
        .I4(kc_cnt[3]),
        .I5(\row_cnt_reg[7]_i_4_n_1 ),
        .O(\kc_cnt[3]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h2800)) 
    \kc_cnt[4]_i_1 
       (.I0(computation_done),
        .I1(\kc_cnt[4]_i_2_n_0 ),
        .I2(kc_cnt[4]),
        .I3(\row_cnt_reg[7]_i_4_n_1 ),
        .O(\kc_cnt[4]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h8000)) 
    \kc_cnt[4]_i_2 
       (.I0(kc_cnt[3]),
        .I1(kc_cnt[1]),
        .I2(kc_cnt[0]),
        .I3(kc_cnt[2]),
        .O(\kc_cnt[4]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'h2800)) 
    \kc_cnt[5]_i_1 
       (.I0(computation_done),
        .I1(\kc_cnt[5]_i_2_n_0 ),
        .I2(kc_cnt[5]),
        .I3(\row_cnt_reg[7]_i_4_n_1 ),
        .O(\kc_cnt[5]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h80000000)) 
    \kc_cnt[5]_i_2 
       (.I0(kc_cnt[4]),
        .I1(kc_cnt[2]),
        .I2(kc_cnt[0]),
        .I3(kc_cnt[1]),
        .I4(kc_cnt[3]),
        .O(\kc_cnt[5]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h2800)) 
    \kc_cnt[6]_i_1 
       (.I0(computation_done),
        .I1(\kc_cnt[7]_i_3_n_0 ),
        .I2(kc_cnt[6]),
        .I3(\row_cnt_reg[7]_i_4_n_1 ),
        .O(\kc_cnt[6]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hF8)) 
    \kc_cnt[7]_i_1 
       (.I0(ctrl_start),
        .I1(\FSM_onehot_state_reg_n_0_[0] ),
        .I2(computation_done),
        .O(kc_cnt0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h2A800000)) 
    \kc_cnt[7]_i_2 
       (.I0(computation_done),
        .I1(\kc_cnt[7]_i_3_n_0 ),
        .I2(kc_cnt[6]),
        .I3(kc_cnt[7]),
        .I4(\row_cnt_reg[7]_i_4_n_1 ),
        .O(\kc_cnt[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \kc_cnt[7]_i_3 
       (.I0(kc_cnt[5]),
        .I1(kc_cnt[3]),
        .I2(kc_cnt[1]),
        .I3(kc_cnt[0]),
        .I4(kc_cnt[2]),
        .I5(kc_cnt[4]),
        .O(\kc_cnt[7]_i_3_n_0 ));
  FDRE \kc_cnt_reg[0] 
       (.C(CLK),
        .CE(kc_cnt0),
        .D(\kc_cnt[0]_i_1_n_0 ),
        .Q(kc_cnt[0]),
        .R(rst));
  FDRE \kc_cnt_reg[1] 
       (.C(CLK),
        .CE(kc_cnt0),
        .D(\kc_cnt[1]_i_1_n_0 ),
        .Q(kc_cnt[1]),
        .R(rst));
  FDRE \kc_cnt_reg[2] 
       (.C(CLK),
        .CE(kc_cnt0),
        .D(\kc_cnt[2]_i_1_n_0 ),
        .Q(kc_cnt[2]),
        .R(rst));
  FDRE \kc_cnt_reg[3] 
       (.C(CLK),
        .CE(kc_cnt0),
        .D(\kc_cnt[3]_i_1_n_0 ),
        .Q(kc_cnt[3]),
        .R(rst));
  FDRE \kc_cnt_reg[4] 
       (.C(CLK),
        .CE(kc_cnt0),
        .D(\kc_cnt[4]_i_1_n_0 ),
        .Q(kc_cnt[4]),
        .R(rst));
  FDRE \kc_cnt_reg[5] 
       (.C(CLK),
        .CE(kc_cnt0),
        .D(\kc_cnt[5]_i_1_n_0 ),
        .Q(kc_cnt[5]),
        .R(rst));
  FDRE \kc_cnt_reg[6] 
       (.C(CLK),
        .CE(kc_cnt0),
        .D(\kc_cnt[6]_i_1_n_0 ),
        .Q(kc_cnt[6]),
        .R(rst));
  FDRE \kc_cnt_reg[7] 
       (.C(CLK),
        .CE(kc_cnt0),
        .D(\kc_cnt[7]_i_2_n_0 ),
        .Q(kc_cnt[7]),
        .R(rst));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \kr_cnt[0]_i_1 
       (.I0(computation_done),
        .I1(kr_cnt[0]),
        .I2(\row_cnt_reg[7]_i_3_n_1 ),
        .O(\kr_cnt[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h2800)) 
    \kr_cnt[1]_i_1 
       (.I0(computation_done),
        .I1(kr_cnt[0]),
        .I2(kr_cnt[1]),
        .I3(\row_cnt_reg[7]_i_3_n_1 ),
        .O(\kr_cnt[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h2A800000)) 
    \kr_cnt[2]_i_1 
       (.I0(computation_done),
        .I1(kr_cnt[0]),
        .I2(kr_cnt[1]),
        .I3(kr_cnt[2]),
        .I4(\row_cnt_reg[7]_i_3_n_1 ),
        .O(\kr_cnt[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2AAA800000000000)) 
    \kr_cnt[3]_i_1 
       (.I0(computation_done),
        .I1(kr_cnt[1]),
        .I2(kr_cnt[0]),
        .I3(kr_cnt[2]),
        .I4(kr_cnt[3]),
        .I5(\row_cnt_reg[7]_i_3_n_1 ),
        .O(\kr_cnt[3]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h2800)) 
    \kr_cnt[4]_i_1 
       (.I0(computation_done),
        .I1(\kr_cnt[4]_i_2_n_0 ),
        .I2(kr_cnt[4]),
        .I3(\row_cnt_reg[7]_i_3_n_1 ),
        .O(\kr_cnt[4]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h8000)) 
    \kr_cnt[4]_i_2 
       (.I0(kr_cnt[3]),
        .I1(kr_cnt[1]),
        .I2(kr_cnt[0]),
        .I3(kr_cnt[2]),
        .O(\kr_cnt[4]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'h2800)) 
    \kr_cnt[5]_i_1 
       (.I0(computation_done),
        .I1(\kr_cnt[5]_i_2_n_0 ),
        .I2(kr_cnt[5]),
        .I3(\row_cnt_reg[7]_i_3_n_1 ),
        .O(\kr_cnt[5]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h80000000)) 
    \kr_cnt[5]_i_2 
       (.I0(kr_cnt[4]),
        .I1(kr_cnt[2]),
        .I2(kr_cnt[0]),
        .I3(kr_cnt[1]),
        .I4(kr_cnt[3]),
        .O(\kr_cnt[5]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h2800)) 
    \kr_cnt[6]_i_1 
       (.I0(computation_done),
        .I1(\kr_cnt[7]_i_3_n_0 ),
        .I2(kr_cnt[6]),
        .I3(\row_cnt_reg[7]_i_3_n_1 ),
        .O(\kr_cnt[6]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h8F88)) 
    \kr_cnt[7]_i_1 
       (.I0(ctrl_start),
        .I1(\FSM_onehot_state_reg_n_0_[0] ),
        .I2(\row_cnt_reg[7]_i_4_n_1 ),
        .I3(computation_done),
        .O(kr_cnt0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h2A800000)) 
    \kr_cnt[7]_i_2 
       (.I0(computation_done),
        .I1(\kr_cnt[7]_i_3_n_0 ),
        .I2(kr_cnt[6]),
        .I3(kr_cnt[7]),
        .I4(\row_cnt_reg[7]_i_3_n_1 ),
        .O(\kr_cnt[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \kr_cnt[7]_i_3 
       (.I0(kr_cnt[5]),
        .I1(kr_cnt[3]),
        .I2(kr_cnt[1]),
        .I3(kr_cnt[0]),
        .I4(kr_cnt[2]),
        .I5(kr_cnt[4]),
        .O(\kr_cnt[7]_i_3_n_0 ));
  FDRE \kr_cnt_reg[0] 
       (.C(CLK),
        .CE(kr_cnt0),
        .D(\kr_cnt[0]_i_1_n_0 ),
        .Q(kr_cnt[0]),
        .R(rst));
  FDRE \kr_cnt_reg[1] 
       (.C(CLK),
        .CE(kr_cnt0),
        .D(\kr_cnt[1]_i_1_n_0 ),
        .Q(kr_cnt[1]),
        .R(rst));
  FDRE \kr_cnt_reg[2] 
       (.C(CLK),
        .CE(kr_cnt0),
        .D(\kr_cnt[2]_i_1_n_0 ),
        .Q(kr_cnt[2]),
        .R(rst));
  FDRE \kr_cnt_reg[3] 
       (.C(CLK),
        .CE(kr_cnt0),
        .D(\kr_cnt[3]_i_1_n_0 ),
        .Q(kr_cnt[3]),
        .R(rst));
  FDRE \kr_cnt_reg[4] 
       (.C(CLK),
        .CE(kr_cnt0),
        .D(\kr_cnt[4]_i_1_n_0 ),
        .Q(kr_cnt[4]),
        .R(rst));
  FDRE \kr_cnt_reg[5] 
       (.C(CLK),
        .CE(kr_cnt0),
        .D(\kr_cnt[5]_i_1_n_0 ),
        .Q(kr_cnt[5]),
        .R(rst));
  FDRE \kr_cnt_reg[6] 
       (.C(CLK),
        .CE(kr_cnt0),
        .D(\kr_cnt[6]_i_1_n_0 ),
        .Q(kr_cnt[6]),
        .R(rst));
  FDRE \kr_cnt_reg[7] 
       (.C(CLK),
        .CE(kr_cnt0),
        .D(\kr_cnt[7]_i_2_n_0 ),
        .Q(kr_cnt[7]),
        .R(rst));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \pipe_delay_cnt[0]_i_1__2 
       (.I0(\FSM_onehot_state_reg_n_0_[3] ),
        .I1(\pipe_delay_cnt_reg_n_0_[0] ),
        .O(\pipe_delay_cnt[0]_i_1__2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'h28)) 
    \pipe_delay_cnt[1]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[3] ),
        .I1(\pipe_delay_cnt_reg_n_0_[1] ),
        .I2(\pipe_delay_cnt_reg_n_0_[0] ),
        .O(pipe_delay_cnt[1]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'h2888)) 
    \pipe_delay_cnt[2]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[3] ),
        .I1(\pipe_delay_cnt_reg_n_0_[2] ),
        .I2(\pipe_delay_cnt_reg_n_0_[1] ),
        .I3(\pipe_delay_cnt_reg_n_0_[0] ),
        .O(pipe_delay_cnt[2]));
  LUT3 #(
    .INIT(8'hEA)) 
    \pipe_delay_cnt[3]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[3] ),
        .I1(ctrl_start),
        .I2(\FSM_onehot_state_reg_n_0_[0] ),
        .O(\pipe_delay_cnt[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT5 #(
    .INIT(32'h28888888)) 
    \pipe_delay_cnt[3]_i_2 
       (.I0(\FSM_onehot_state_reg_n_0_[3] ),
        .I1(\pipe_delay_cnt_reg_n_0_[3] ),
        .I2(\pipe_delay_cnt_reg_n_0_[2] ),
        .I3(\pipe_delay_cnt_reg_n_0_[0] ),
        .I4(\pipe_delay_cnt_reg_n_0_[1] ),
        .O(pipe_delay_cnt[3]));
  FDRE \pipe_delay_cnt_reg[0] 
       (.C(CLK),
        .CE(\pipe_delay_cnt[3]_i_1_n_0 ),
        .D(\pipe_delay_cnt[0]_i_1__2_n_0 ),
        .Q(\pipe_delay_cnt_reg_n_0_[0] ),
        .R(rst));
  FDRE \pipe_delay_cnt_reg[1] 
       (.C(CLK),
        .CE(\pipe_delay_cnt[3]_i_1_n_0 ),
        .D(pipe_delay_cnt[1]),
        .Q(\pipe_delay_cnt_reg_n_0_[1] ),
        .R(rst));
  FDRE \pipe_delay_cnt_reg[2] 
       (.C(CLK),
        .CE(\pipe_delay_cnt[3]_i_1_n_0 ),
        .D(pipe_delay_cnt[2]),
        .Q(\pipe_delay_cnt_reg_n_0_[2] ),
        .R(rst));
  FDRE \pipe_delay_cnt_reg[3] 
       (.C(CLK),
        .CE(\pipe_delay_cnt[3]_i_1_n_0 ),
        .D(pipe_delay_cnt[3]),
        .Q(\pipe_delay_cnt_reg_n_0_[3] ),
        .R(rst));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \row_cnt[0]_i_1 
       (.I0(computation_done),
        .I1(row_cnt[0]),
        .I2(\row_cnt_reg[7]_i_7_n_0 ),
        .O(\row_cnt[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h2800)) 
    \row_cnt[1]_i_1 
       (.I0(computation_done),
        .I1(row_cnt[0]),
        .I2(row_cnt[1]),
        .I3(\row_cnt_reg[7]_i_7_n_0 ),
        .O(\row_cnt[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h2A800000)) 
    \row_cnt[2]_i_1 
       (.I0(computation_done),
        .I1(row_cnt[0]),
        .I2(row_cnt[1]),
        .I3(row_cnt[2]),
        .I4(\row_cnt_reg[7]_i_7_n_0 ),
        .O(\row_cnt[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2AAA800000000000)) 
    \row_cnt[3]_i_1 
       (.I0(computation_done),
        .I1(row_cnt[1]),
        .I2(row_cnt[0]),
        .I3(row_cnt[2]),
        .I4(row_cnt[3]),
        .I5(\row_cnt_reg[7]_i_7_n_0 ),
        .O(\row_cnt[3]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h2800)) 
    \row_cnt[4]_i_1 
       (.I0(computation_done),
        .I1(\row_cnt[4]_i_2_n_0 ),
        .I2(row_cnt[4]),
        .I3(\row_cnt_reg[7]_i_7_n_0 ),
        .O(\row_cnt[4]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h8000)) 
    \row_cnt[4]_i_2 
       (.I0(row_cnt[3]),
        .I1(row_cnt[1]),
        .I2(row_cnt[0]),
        .I3(row_cnt[2]),
        .O(\row_cnt[4]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'h2800)) 
    \row_cnt[5]_i_1 
       (.I0(computation_done),
        .I1(\row_cnt[5]_i_2_n_0 ),
        .I2(row_cnt[5]),
        .I3(\row_cnt_reg[7]_i_7_n_0 ),
        .O(\row_cnt[5]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h80000000)) 
    \row_cnt[5]_i_2 
       (.I0(row_cnt[4]),
        .I1(row_cnt[2]),
        .I2(row_cnt[0]),
        .I3(row_cnt[1]),
        .I4(row_cnt[3]),
        .O(\row_cnt[5]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h2800)) 
    \row_cnt[6]_i_1 
       (.I0(computation_done),
        .I1(\row_cnt[7]_i_6_n_0 ),
        .I2(row_cnt[6]),
        .I3(\row_cnt_reg[7]_i_7_n_0 ),
        .O(\row_cnt[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8888888F88888888)) 
    \row_cnt[7]_i_1 
       (.I0(ctrl_start),
        .I1(\FSM_onehot_state_reg_n_0_[0] ),
        .I2(\row_cnt_reg[7]_i_3_n_1 ),
        .I3(\row_cnt_reg[7]_i_4_n_1 ),
        .I4(\row_cnt_reg[7]_i_5_n_0 ),
        .I5(computation_done),
        .O(row_cnt0));
  LUT2 #(
    .INIT(4'h1)) 
    \row_cnt[7]_i_10__2 
       (.I0(kr_cnt[4]),
        .I1(kr_cnt[5]),
        .O(\row_cnt[7]_i_10__2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \row_cnt[7]_i_11__2 
       (.I0(kr_cnt[2]),
        .I1(kr_cnt[3]),
        .O(\row_cnt[7]_i_11__2_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \row_cnt[7]_i_12__2 
       (.I0(kc_cnt[2]),
        .I1(kc_cnt[3]),
        .O(\row_cnt[7]_i_12__2_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \row_cnt[7]_i_13__2 
       (.I0(kc_cnt[6]),
        .I1(kc_cnt[7]),
        .O(\row_cnt[7]_i_13__2_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \row_cnt[7]_i_14__2 
       (.I0(kc_cnt[4]),
        .I1(kc_cnt[5]),
        .O(\row_cnt[7]_i_14__2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \row_cnt[7]_i_15__2 
       (.I0(kc_cnt[2]),
        .I1(kc_cnt[3]),
        .O(\row_cnt[7]_i_15__2_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \row_cnt[7]_i_16__2 
       (.I0(col_cnt[4]),
        .I1(col_cnt[5]),
        .O(\row_cnt[7]_i_16__2_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \row_cnt[7]_i_17__2 
       (.I0(col_cnt[2]),
        .I1(col_cnt[3]),
        .O(\row_cnt[7]_i_17__2_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \row_cnt[7]_i_18__2 
       (.I0(col_cnt[0]),
        .I1(col_cnt[1]),
        .O(\row_cnt[7]_i_18__2_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \row_cnt[7]_i_19__2 
       (.I0(col_cnt[6]),
        .I1(col_cnt[7]),
        .O(\row_cnt[7]_i_19__2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h2A800000)) 
    \row_cnt[7]_i_2 
       (.I0(computation_done),
        .I1(\row_cnt[7]_i_6_n_0 ),
        .I2(row_cnt[6]),
        .I3(row_cnt[7]),
        .I4(\row_cnt_reg[7]_i_7_n_0 ),
        .O(\row_cnt[7]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \row_cnt[7]_i_20__2 
       (.I0(col_cnt[4]),
        .I1(col_cnt[5]),
        .O(\row_cnt[7]_i_20__2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \row_cnt[7]_i_21__2 
       (.I0(col_cnt[2]),
        .I1(col_cnt[3]),
        .O(\row_cnt[7]_i_21__2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \row_cnt[7]_i_22 
       (.I0(col_cnt[0]),
        .I1(col_cnt[1]),
        .O(\row_cnt[7]_i_22_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \row_cnt[7]_i_23__1 
       (.I0(row_cnt[4]),
        .I1(row_cnt[5]),
        .O(\row_cnt[7]_i_23__1_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \row_cnt[7]_i_24__2 
       (.I0(row_cnt[2]),
        .I1(row_cnt[3]),
        .O(\row_cnt[7]_i_24__2_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \row_cnt[7]_i_25__2 
       (.I0(row_cnt[0]),
        .I1(row_cnt[1]),
        .O(\row_cnt[7]_i_25__2_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \row_cnt[7]_i_26__1 
       (.I0(row_cnt[6]),
        .I1(row_cnt[7]),
        .O(\row_cnt[7]_i_26__1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \row_cnt[7]_i_27__2 
       (.I0(row_cnt[4]),
        .I1(row_cnt[5]),
        .O(\row_cnt[7]_i_27__2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \row_cnt[7]_i_28__1 
       (.I0(row_cnt[2]),
        .I1(row_cnt[3]),
        .O(\row_cnt[7]_i_28__1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \row_cnt[7]_i_29 
       (.I0(row_cnt[0]),
        .I1(row_cnt[1]),
        .O(\row_cnt[7]_i_29_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \row_cnt[7]_i_6 
       (.I0(row_cnt[5]),
        .I1(row_cnt[3]),
        .I2(row_cnt[1]),
        .I3(row_cnt[0]),
        .I4(row_cnt[2]),
        .I5(row_cnt[4]),
        .O(\row_cnt[7]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \row_cnt[7]_i_8__2 
       (.I0(kr_cnt[2]),
        .I1(kr_cnt[3]),
        .O(\row_cnt[7]_i_8__2_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \row_cnt[7]_i_9__1 
       (.I0(kr_cnt[6]),
        .I1(kr_cnt[7]),
        .O(\row_cnt[7]_i_9__1_n_0 ));
  FDRE \row_cnt_reg[0] 
       (.C(CLK),
        .CE(row_cnt0),
        .D(\row_cnt[0]_i_1_n_0 ),
        .Q(row_cnt[0]),
        .R(rst));
  FDRE \row_cnt_reg[1] 
       (.C(CLK),
        .CE(row_cnt0),
        .D(\row_cnt[1]_i_1_n_0 ),
        .Q(row_cnt[1]),
        .R(rst));
  FDRE \row_cnt_reg[2] 
       (.C(CLK),
        .CE(row_cnt0),
        .D(\row_cnt[2]_i_1_n_0 ),
        .Q(row_cnt[2]),
        .R(rst));
  FDRE \row_cnt_reg[3] 
       (.C(CLK),
        .CE(row_cnt0),
        .D(\row_cnt[3]_i_1_n_0 ),
        .Q(row_cnt[3]),
        .R(rst));
  FDRE \row_cnt_reg[4] 
       (.C(CLK),
        .CE(row_cnt0),
        .D(\row_cnt[4]_i_1_n_0 ),
        .Q(row_cnt[4]),
        .R(rst));
  FDRE \row_cnt_reg[5] 
       (.C(CLK),
        .CE(row_cnt0),
        .D(\row_cnt[5]_i_1_n_0 ),
        .Q(row_cnt[5]),
        .R(rst));
  FDRE \row_cnt_reg[6] 
       (.C(CLK),
        .CE(row_cnt0),
        .D(\row_cnt[6]_i_1_n_0 ),
        .Q(row_cnt[6]),
        .R(rst));
  FDRE \row_cnt_reg[7] 
       (.C(CLK),
        .CE(row_cnt0),
        .D(\row_cnt[7]_i_2_n_0 ),
        .Q(row_cnt[7]),
        .R(rst));
  CARRY4 \row_cnt_reg[7]_i_3 
       (.CI(1'b0),
        .CO({\NLW_row_cnt_reg[7]_i_3_CO_UNCONNECTED [3],\row_cnt_reg[7]_i_3_n_1 ,\NLW_row_cnt_reg[7]_i_3_CO_UNCONNECTED [1:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,\row_cnt[7]_i_8__2_n_0 }),
        .O(\NLW_row_cnt_reg[7]_i_3_O_UNCONNECTED [3:0]),
        .S({1'b0,\row_cnt[7]_i_9__1_n_0 ,\row_cnt[7]_i_10__2_n_0 ,\row_cnt[7]_i_11__2_n_0 }));
  CARRY4 \row_cnt_reg[7]_i_4 
       (.CI(1'b0),
        .CO({\NLW_row_cnt_reg[7]_i_4_CO_UNCONNECTED [3],\row_cnt_reg[7]_i_4_n_1 ,\NLW_row_cnt_reg[7]_i_4_CO_UNCONNECTED [1:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,\row_cnt[7]_i_12__2_n_0 }),
        .O(\NLW_row_cnt_reg[7]_i_4_O_UNCONNECTED [3:0]),
        .S({1'b0,\row_cnt[7]_i_13__2_n_0 ,\row_cnt[7]_i_14__2_n_0 ,\row_cnt[7]_i_15__2_n_0 }));
  CARRY4 \row_cnt_reg[7]_i_5 
       (.CI(1'b0),
        .CO({\row_cnt_reg[7]_i_5_n_0 ,\NLW_row_cnt_reg[7]_i_5_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,\row_cnt[7]_i_16__2_n_0 ,\row_cnt[7]_i_17__2_n_0 ,\row_cnt[7]_i_18__2_n_0 }),
        .O(\NLW_row_cnt_reg[7]_i_5_O_UNCONNECTED [3:0]),
        .S({\row_cnt[7]_i_19__2_n_0 ,\row_cnt[7]_i_20__2_n_0 ,\row_cnt[7]_i_21__2_n_0 ,\row_cnt[7]_i_22_n_0 }));
  CARRY4 \row_cnt_reg[7]_i_7 
       (.CI(1'b0),
        .CO({\row_cnt_reg[7]_i_7_n_0 ,\NLW_row_cnt_reg[7]_i_7_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,\row_cnt[7]_i_23__1_n_0 ,\row_cnt[7]_i_24__2_n_0 ,\row_cnt[7]_i_25__2_n_0 }),
        .O(\NLW_row_cnt_reg[7]_i_7_O_UNCONNECTED [3:0]),
        .S({\row_cnt[7]_i_26__1_n_0 ,\row_cnt[7]_i_27__2_n_0 ,\row_cnt[7]_i_28__1_n_0 ,\row_cnt[7]_i_29_n_0 }));
  LUT6 #(
    .INIT(64'hFFF3CCC088888888)) 
    \state[0]_i_1 
       (.I0(done_reg_n_0),
        .I1(ctrl_start_reg),
        .I2(\state_reg[0]_0 ),
        .I3(\state_reg[0]_1 ),
        .I4(\state_reg[0]_2 ),
        .I5(ctrl_start_reg_0),
        .O(done_reg_0));
  LUT4 #(
    .INIT(16'hBFAA)) 
    wgt_loading_done_i_1
       (.I0(wgt_loading_done),
        .I1(ctrl_start),
        .I2(\FSM_onehot_state_reg_n_0_[0] ),
        .I3(wgt_loading_done_reg_n_0),
        .O(wgt_loading_done_i_1_n_0));
  FDRE wgt_loading_done_reg
       (.C(CLK),
        .CE(1'b1),
        .D(wgt_loading_done_i_1_n_0),
        .Q(wgt_loading_done_reg_n_0),
        .R(rst));
endmodule

module streaming_nn_layer_stage
   (state,
    leds_OBUF,
    rst,
    CLK);
  output [1:0]state;
  output [0:0]leds_OBUF;
  input rst;
  input CLK;

  wire CLK;
  wire control_unit_n_0;
  wire control_unit_n_1;
  wire ctrl_start;
  wire [0:0]leds_OBUF;
  wire \out_ch_cnt[0]_i_1_n_0 ;
  wire \out_ch_cnt[1]_i_1_n_0 ;
  wire \out_ch_cnt[2]_i_1_n_0 ;
  wire \out_ch_cnt[2]_i_2_n_0 ;
  wire \out_ch_cnt_reg_n_0_[0] ;
  wire \out_ch_cnt_reg_n_0_[1] ;
  wire \out_ch_cnt_reg_n_0_[2] ;
  wire [4:0]out_col_cnt;
  wire \out_col_cnt[0]_i_1_n_0 ;
  wire \out_col_cnt[1]_i_1_n_0 ;
  wire \out_col_cnt[2]_i_1_n_0 ;
  wire \out_col_cnt[3]_i_1_n_0 ;
  wire \out_col_cnt[4]_i_1_n_0 ;
  wire \out_col_cnt[4]_i_2_n_0 ;
  wire rst;
  wire [1:0]state;
  wire \state[1]_i_1_n_0 ;
  wire \state[1]_i_2_n_0 ;
  wire win_load_active_i_1_n_0;
  wire win_load_active_reg_n_0;

  nn_layer_control_unit_2 control_unit
       (.CLK(CLK),
        .ctrl_start(ctrl_start),
        .ctrl_start_reg(state[1]),
        .ctrl_start_reg_0(state[0]),
        .done_reg_0(control_unit_n_0),
        .rst(rst),
        .\state_reg[0] (control_unit_n_1),
        .\state_reg[0]_0 (\state[1]_i_2_n_0 ),
        .\state_reg[0]_1 (\out_ch_cnt[2]_i_2_n_0 ),
        .\state_reg[0]_2 (win_load_active_reg_n_0));
  FDRE ctrl_start_reg
       (.C(CLK),
        .CE(1'b1),
        .D(control_unit_n_1),
        .Q(ctrl_start),
        .R(rst));
  LUT2 #(
    .INIT(4'hE)) 
    \leds_OBUF[3]_inst_i_1 
       (.I0(state[1]),
        .I1(state[0]),
        .O(leds_OBUF));
  LUT6 #(
    .INIT(64'hF0FFFF0007000000)) 
    \out_ch_cnt[0]_i_1 
       (.I0(\out_ch_cnt_reg_n_0_[1] ),
        .I1(\out_ch_cnt_reg_n_0_[2] ),
        .I2(\out_ch_cnt[2]_i_2_n_0 ),
        .I3(state[0]),
        .I4(state[1]),
        .I5(\out_ch_cnt_reg_n_0_[0] ),
        .O(\out_ch_cnt[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF1FFFF0002000000)) 
    \out_ch_cnt[1]_i_1 
       (.I0(\out_ch_cnt_reg_n_0_[0] ),
        .I1(\out_ch_cnt_reg_n_0_[2] ),
        .I2(\out_ch_cnt[2]_i_2_n_0 ),
        .I3(state[0]),
        .I4(state[1]),
        .I5(\out_ch_cnt_reg_n_0_[1] ),
        .O(\out_ch_cnt[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF1FFFF0008000000)) 
    \out_ch_cnt[2]_i_1 
       (.I0(\out_ch_cnt_reg_n_0_[0] ),
        .I1(\out_ch_cnt_reg_n_0_[1] ),
        .I2(\out_ch_cnt[2]_i_2_n_0 ),
        .I3(state[0]),
        .I4(state[1]),
        .I5(\out_ch_cnt_reg_n_0_[2] ),
        .O(\out_ch_cnt[2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h1555FFFF)) 
    \out_ch_cnt[2]_i_2 
       (.I0(out_col_cnt[3]),
        .I1(out_col_cnt[2]),
        .I2(out_col_cnt[1]),
        .I3(out_col_cnt[0]),
        .I4(out_col_cnt[4]),
        .O(\out_ch_cnt[2]_i_2_n_0 ));
  FDRE \out_ch_cnt_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .D(\out_ch_cnt[0]_i_1_n_0 ),
        .Q(\out_ch_cnt_reg_n_0_[0] ),
        .R(rst));
  FDRE \out_ch_cnt_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .D(\out_ch_cnt[1]_i_1_n_0 ),
        .Q(\out_ch_cnt_reg_n_0_[1] ),
        .R(rst));
  FDRE \out_ch_cnt_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .D(\out_ch_cnt[2]_i_1_n_0 ),
        .Q(\out_ch_cnt_reg_n_0_[2] ),
        .R(rst));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT4 #(
    .INIT(16'h0222)) 
    \out_col_cnt[0]_i_1 
       (.I0(state[1]),
        .I1(out_col_cnt[0]),
        .I2(out_col_cnt[3]),
        .I3(out_col_cnt[4]),
        .O(\out_col_cnt[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT5 #(
    .INIT(32'h00282828)) 
    \out_col_cnt[1]_i_1 
       (.I0(state[1]),
        .I1(out_col_cnt[0]),
        .I2(out_col_cnt[1]),
        .I3(out_col_cnt[3]),
        .I4(out_col_cnt[4]),
        .O(\out_col_cnt[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00002A802A802A80)) 
    \out_col_cnt[2]_i_1 
       (.I0(state[1]),
        .I1(out_col_cnt[0]),
        .I2(out_col_cnt[1]),
        .I3(out_col_cnt[2]),
        .I4(out_col_cnt[3]),
        .I5(out_col_cnt[4]),
        .O(\out_col_cnt[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h000000002AAA8000)) 
    \out_col_cnt[3]_i_1 
       (.I0(state[1]),
        .I1(out_col_cnt[1]),
        .I2(out_col_cnt[0]),
        .I3(out_col_cnt[2]),
        .I4(out_col_cnt[3]),
        .I5(out_col_cnt[4]),
        .O(\out_col_cnt[3]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \out_col_cnt[4]_i_1 
       (.I0(state[1]),
        .I1(state[0]),
        .O(\out_col_cnt[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00002AAA80000000)) 
    \out_col_cnt[4]_i_2 
       (.I0(state[1]),
        .I1(out_col_cnt[2]),
        .I2(out_col_cnt[0]),
        .I3(out_col_cnt[1]),
        .I4(out_col_cnt[3]),
        .I5(out_col_cnt[4]),
        .O(\out_col_cnt[4]_i_2_n_0 ));
  FDRE \out_col_cnt_reg[0] 
       (.C(CLK),
        .CE(\out_col_cnt[4]_i_1_n_0 ),
        .D(\out_col_cnt[0]_i_1_n_0 ),
        .Q(out_col_cnt[0]),
        .R(rst));
  FDRE \out_col_cnt_reg[1] 
       (.C(CLK),
        .CE(\out_col_cnt[4]_i_1_n_0 ),
        .D(\out_col_cnt[1]_i_1_n_0 ),
        .Q(out_col_cnt[1]),
        .R(rst));
  FDRE \out_col_cnt_reg[2] 
       (.C(CLK),
        .CE(\out_col_cnt[4]_i_1_n_0 ),
        .D(\out_col_cnt[2]_i_1_n_0 ),
        .Q(out_col_cnt[2]),
        .R(rst));
  FDRE \out_col_cnt_reg[3] 
       (.C(CLK),
        .CE(\out_col_cnt[4]_i_1_n_0 ),
        .D(\out_col_cnt[3]_i_1_n_0 ),
        .Q(out_col_cnt[3]),
        .R(rst));
  FDRE \out_col_cnt_reg[4] 
       (.C(CLK),
        .CE(\out_col_cnt[4]_i_1_n_0 ),
        .D(\out_col_cnt[4]_i_2_n_0 ),
        .Q(out_col_cnt[4]),
        .R(rst));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT5 #(
    .INIT(32'hFC55FF00)) 
    \state[1]_i_1 
       (.I0(win_load_active_reg_n_0),
        .I1(\out_ch_cnt[2]_i_2_n_0 ),
        .I2(\state[1]_i_2_n_0 ),
        .I3(state[1]),
        .I4(state[0]),
        .O(\state[1]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h1F)) 
    \state[1]_i_2 
       (.I0(\out_ch_cnt_reg_n_0_[0] ),
        .I1(\out_ch_cnt_reg_n_0_[1] ),
        .I2(\out_ch_cnt_reg_n_0_[2] ),
        .O(\state[1]_i_2_n_0 ));
  FDRE \state_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .D(control_unit_n_0),
        .Q(state[0]),
        .R(rst));
  FDRE \state_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .D(\state[1]_i_1_n_0 ),
        .Q(state[1]),
        .R(rst));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'hF4)) 
    win_load_active_i_1
       (.I0(state[1]),
        .I1(state[0]),
        .I2(win_load_active_reg_n_0),
        .O(win_load_active_i_1_n_0));
  FDRE win_load_active_reg
       (.C(CLK),
        .CE(1'b1),
        .D(win_load_active_i_1_n_0),
        .Q(win_load_active_reg_n_0),
        .R(rst));
endmodule

(* ORIG_REF_NAME = "streaming_nn_layer_stage" *) 
module streaming_nn_layer_stage__parameterized0
   (state,
    leds_OBUF,
    rst,
    CLK,
    state_0);
  output [1:0]state;
  output [0:0]leds_OBUF;
  input rst;
  input CLK;
  input [1:0]state_0;

  wire CLK;
  wire control_unit_n_0;
  wire control_unit_n_1;
  wire ctrl_start;
  wire [0:0]leds_OBUF;
  wire \out_ch_cnt[0]_i_1__0_n_0 ;
  wire \out_ch_cnt[1]_i_1__1_n_0 ;
  wire \out_ch_cnt[2]_i_1__1_n_0 ;
  wire \out_ch_cnt[2]_i_2__0_n_0 ;
  wire \out_ch_cnt_reg_n_0_[0] ;
  wire \out_ch_cnt_reg_n_0_[1] ;
  wire \out_ch_cnt_reg_n_0_[2] ;
  wire [3:0]out_col_cnt;
  wire \out_col_cnt[0]_i_1__1_n_0 ;
  wire \out_col_cnt[1]_i_1__1_n_0 ;
  wire \out_col_cnt[2]_i_1__1_n_0 ;
  wire \out_col_cnt[3]_i_1__0_n_0 ;
  wire \out_col_cnt[3]_i_2_n_0 ;
  wire rst;
  wire [1:0]state;
  wire \state[1]_i_1__2_n_0 ;
  wire \state[1]_i_2__1_n_0 ;
  wire \state[1]_i_3__0_n_0 ;
  wire [1:0]state_0;
  wire win_load_active_i_1__2_n_0;
  wire win_load_active_reg_n_0;
  wire window_valid;

  streaming_row_buffer__parameterized0 \GEN_ROW_BUFFER.row_buffer 
       (.CLK(CLK),
        .rst(rst),
        .state_0(state_0),
        .window_valid(window_valid));
  nn_layer_control_unit_1 control_unit
       (.CLK(CLK),
        .ctrl_start(ctrl_start),
        .rst(rst),
        .\state_reg[0] (control_unit_n_1),
        .\state_reg[0]_0 (\state[1]_i_2__1_n_0 ),
        .\state_reg[0]_1 (win_load_active_reg_n_0),
        .\state_reg[0]_2 (state[0]),
        .\state_reg[0]_3 (state[1]),
        .win_load_active_reg(control_unit_n_0),
        .window_valid(window_valid));
  FDRE ctrl_start_reg
       (.C(CLK),
        .CE(1'b1),
        .D(control_unit_n_1),
        .Q(ctrl_start),
        .R(rst));
  LUT2 #(
    .INIT(4'hE)) 
    \leds_OBUF[4]_inst_i_1 
       (.I0(state[1]),
        .I1(state[0]),
        .O(leds_OBUF));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT5 #(
    .INIT(32'h00FF7000)) 
    \out_ch_cnt[0]_i_1__0 
       (.I0(\out_ch_cnt_reg_n_0_[2] ),
        .I1(\out_ch_cnt_reg_n_0_[1] ),
        .I2(state[1]),
        .I3(\out_ch_cnt[2]_i_2__0_n_0 ),
        .I4(\out_ch_cnt_reg_n_0_[0] ),
        .O(\out_ch_cnt[0]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT5 #(
    .INIT(32'h10FF4000)) 
    \out_ch_cnt[1]_i_1__1 
       (.I0(\out_ch_cnt_reg_n_0_[2] ),
        .I1(\out_ch_cnt_reg_n_0_[0] ),
        .I2(state[1]),
        .I3(\out_ch_cnt[2]_i_2__0_n_0 ),
        .I4(\out_ch_cnt_reg_n_0_[1] ),
        .O(\out_ch_cnt[1]_i_1__1_n_0 ));
  LUT5 #(
    .INIT(32'h10FF8000)) 
    \out_ch_cnt[2]_i_1__1 
       (.I0(\out_ch_cnt_reg_n_0_[0] ),
        .I1(\out_ch_cnt_reg_n_0_[1] ),
        .I2(state[1]),
        .I3(\out_ch_cnt[2]_i_2__0_n_0 ),
        .I4(\out_ch_cnt_reg_n_0_[2] ),
        .O(\out_ch_cnt[2]_i_1__1_n_0 ));
  LUT6 #(
    .INIT(64'hAA8000000000FFFF)) 
    \out_ch_cnt[2]_i_2__0 
       (.I0(out_col_cnt[3]),
        .I1(out_col_cnt[0]),
        .I2(out_col_cnt[1]),
        .I3(out_col_cnt[2]),
        .I4(state[0]),
        .I5(state[1]),
        .O(\out_ch_cnt[2]_i_2__0_n_0 ));
  FDRE \out_ch_cnt_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .D(\out_ch_cnt[0]_i_1__0_n_0 ),
        .Q(\out_ch_cnt_reg_n_0_[0] ),
        .R(rst));
  FDRE \out_ch_cnt_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .D(\out_ch_cnt[1]_i_1__1_n_0 ),
        .Q(\out_ch_cnt_reg_n_0_[1] ),
        .R(rst));
  FDRE \out_ch_cnt_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .D(\out_ch_cnt[2]_i_1__1_n_0 ),
        .Q(\out_ch_cnt_reg_n_0_[2] ),
        .R(rst));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT4 #(
    .INIT(16'h1500)) 
    \out_col_cnt[0]_i_1__1 
       (.I0(out_col_cnt[0]),
        .I1(out_col_cnt[3]),
        .I2(out_col_cnt[2]),
        .I3(state[1]),
        .O(\out_col_cnt[0]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT5 #(
    .INIT(32'h06660000)) 
    \out_col_cnt[1]_i_1__1 
       (.I0(out_col_cnt[1]),
        .I1(out_col_cnt[0]),
        .I2(out_col_cnt[3]),
        .I3(out_col_cnt[2]),
        .I4(state[1]),
        .O(\out_col_cnt[1]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT5 #(
    .INIT(32'h14440000)) 
    \out_col_cnt[2]_i_1__1 
       (.I0(out_col_cnt[3]),
        .I1(out_col_cnt[2]),
        .I2(out_col_cnt[0]),
        .I3(out_col_cnt[1]),
        .I4(state[1]),
        .O(\out_col_cnt[2]_i_1__1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \out_col_cnt[3]_i_1__0 
       (.I0(state[0]),
        .I1(state[1]),
        .O(\out_col_cnt[3]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT5 #(
    .INIT(32'h15800000)) 
    \out_col_cnt[3]_i_2 
       (.I0(out_col_cnt[2]),
        .I1(out_col_cnt[1]),
        .I2(out_col_cnt[0]),
        .I3(out_col_cnt[3]),
        .I4(state[1]),
        .O(\out_col_cnt[3]_i_2_n_0 ));
  FDRE \out_col_cnt_reg[0] 
       (.C(CLK),
        .CE(\out_col_cnt[3]_i_1__0_n_0 ),
        .D(\out_col_cnt[0]_i_1__1_n_0 ),
        .Q(out_col_cnt[0]),
        .R(rst));
  FDRE \out_col_cnt_reg[1] 
       (.C(CLK),
        .CE(\out_col_cnt[3]_i_1__0_n_0 ),
        .D(\out_col_cnt[1]_i_1__1_n_0 ),
        .Q(out_col_cnt[1]),
        .R(rst));
  FDRE \out_col_cnt_reg[2] 
       (.C(CLK),
        .CE(\out_col_cnt[3]_i_1__0_n_0 ),
        .D(\out_col_cnt[2]_i_1__1_n_0 ),
        .Q(out_col_cnt[2]),
        .R(rst));
  FDRE \out_col_cnt_reg[3] 
       (.C(CLK),
        .CE(\out_col_cnt[3]_i_1__0_n_0 ),
        .D(\out_col_cnt[3]_i_2_n_0 ),
        .Q(out_col_cnt[3]),
        .R(rst));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT4 #(
    .INIT(16'h5F30)) 
    \state[1]_i_1__2 
       (.I0(\state[1]_i_2__1_n_0 ),
        .I1(win_load_active_reg_n_0),
        .I2(state[0]),
        .I3(state[1]),
        .O(\state[1]_i_1__2_n_0 ));
  LUT5 #(
    .INIT(32'hCC800000)) 
    \state[1]_i_2__1 
       (.I0(out_col_cnt[0]),
        .I1(\state[1]_i_3__0_n_0 ),
        .I2(out_col_cnt[1]),
        .I3(out_col_cnt[2]),
        .I4(out_col_cnt[3]),
        .O(\state[1]_i_2__1_n_0 ));
  LUT3 #(
    .INIT(8'hE0)) 
    \state[1]_i_3__0 
       (.I0(\out_ch_cnt_reg_n_0_[0] ),
        .I1(\out_ch_cnt_reg_n_0_[1] ),
        .I2(\out_ch_cnt_reg_n_0_[2] ),
        .O(\state[1]_i_3__0_n_0 ));
  FDRE \state_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .D(control_unit_n_0),
        .Q(state[0]),
        .R(rst));
  FDRE \state_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .D(\state[1]_i_1__2_n_0 ),
        .Q(state[1]),
        .R(rst));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT3 #(
    .INIT(8'hF4)) 
    win_load_active_i_1__2
       (.I0(state[1]),
        .I1(state[0]),
        .I2(win_load_active_reg_n_0),
        .O(win_load_active_i_1__2_n_0));
  FDRE win_load_active_reg
       (.C(CLK),
        .CE(1'b1),
        .D(win_load_active_i_1__2_n_0),
        .Q(win_load_active_reg_n_0),
        .R(rst));
endmodule

(* ORIG_REF_NAME = "streaming_nn_layer_stage" *) 
module streaming_nn_layer_stage__parameterized1
   (leds_OBUF,
    rst,
    CLK,
    state);
  output [0:0]leds_OBUF;
  input rst;
  input CLK;
  input [1:0]state;

  wire [3:0]A;
  wire CEA2;
  wire CLK;
  wire \GEN_ROW_BUFFER.row_buffer_n_0 ;
  wire \GEN_ROW_BUFFER.row_buffer_n_1 ;
  wire control_unit_n_0;
  wire control_unit_n_1;
  wire ctrl_start;
  wire [0:0]leds_OBUF;
  wire \out_ch_cnt[0]_i_1__1_n_0 ;
  wire \out_ch_cnt[1]_i_1__0_n_0 ;
  wire \out_ch_cnt[2]_i_1__0_n_0 ;
  wire \out_ch_cnt[3]_i_1_n_0 ;
  wire \out_ch_cnt[3]_i_2_n_0 ;
  wire \out_ch_cnt_reg_n_0_[0] ;
  wire \out_ch_cnt_reg_n_0_[1] ;
  wire \out_ch_cnt_reg_n_0_[2] ;
  wire \out_ch_cnt_reg_n_0_[3] ;
  wire [2:0]out_col_cnt;
  wire \out_col_cnt[0]_i_1__0_n_0 ;
  wire \out_col_cnt[1]_i_1__0_n_0 ;
  wire \out_col_cnt[2]_i_1__0_n_0 ;
  wire rst;
  wire [1:0]state;
  wire \state[1]_i_2__0_n_0 ;
  wire [1:0]state_0;
  wire [2:1]win_ch;
  wire \win_ch[0]_i_1_n_0 ;
  wire \win_ch[1]_i_1_n_0 ;
  wire \win_ch[2]_i_1_n_0 ;
  wire \win_ch_reg_n_0_[0] ;
  wire [3:0]win_kc;
  wire \win_kr[0]_i_1_n_0 ;
  wire \win_kr[1]_i_1_n_0 ;
  wire \win_kr[2]_i_1_n_0 ;
  wire \win_kr[2]_i_2_n_0 ;
  wire \win_kr[2]_i_3_n_0 ;
  wire \win_kr_reg_n_0_[0] ;
  wire \win_kr_reg_n_0_[1] ;
  wire \win_kr_reg_n_0_[2] ;
  wire win_load_active_i_1__1_n_0;
  wire win_load_active_i_2_n_0;
  wire win_load_active_reg_n_0;

  streaming_row_buffer__parameterized1 \GEN_ROW_BUFFER.row_buffer 
       (.CLK(CLK),
        .Q(\out_ch_cnt_reg_n_0_[3] ),
        .\out_ch_cnt_reg[3] (\GEN_ROW_BUFFER.row_buffer_n_0 ),
        .rst(rst),
        .state(state),
        .state_0(state_0),
        .\state_reg[1] (\state[1]_i_2__0_n_0 ),
        .\state_reg[1]_0 (win_load_active_reg_n_0),
        .win_load_active_reg(\GEN_ROW_BUFFER.row_buffer_n_1 ));
  nn_layer_control_unit_0 control_unit
       (.CLK(CLK),
        .Q(\out_ch_cnt_reg_n_0_[3] ),
        .busy_reg_0(control_unit_n_1),
        .ctrl_start(ctrl_start),
        .\out_ch_cnt_reg[3] (control_unit_n_0),
        .rst(rst),
        .state_0(state_0),
        .\state_reg[0] (\state[1]_i_2__0_n_0 ),
        .\state_reg[0]_0 (\GEN_ROW_BUFFER.row_buffer_n_1 ));
  FDRE ctrl_start_reg
       (.C(CLK),
        .CE(1'b1),
        .D(control_unit_n_1),
        .Q(ctrl_start),
        .R(rst));
  LUT2 #(
    .INIT(4'hE)) 
    \leds_OBUF[5]_inst_i_1 
       (.I0(state_0[0]),
        .I1(state_0[1]),
        .O(leds_OBUF));
  (* SOFT_HLUTNM = "soft_lutpair87" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out_ch_cnt[0]_i_1__1 
       (.I0(state_0[1]),
        .I1(\out_ch_cnt_reg_n_0_[0] ),
        .O(\out_ch_cnt[0]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair87" *) 
  LUT3 #(
    .INIT(8'h60)) 
    \out_ch_cnt[1]_i_1__0 
       (.I0(\out_ch_cnt_reg_n_0_[1] ),
        .I1(\out_ch_cnt_reg_n_0_[0] ),
        .I2(state_0[1]),
        .O(\out_ch_cnt[1]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair85" *) 
  LUT4 #(
    .INIT(16'h7800)) 
    \out_ch_cnt[2]_i_1__0 
       (.I0(\out_ch_cnt_reg_n_0_[1] ),
        .I1(\out_ch_cnt_reg_n_0_[0] ),
        .I2(\out_ch_cnt_reg_n_0_[2] ),
        .I3(state_0[1]),
        .O(\out_ch_cnt[2]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'h800000FF)) 
    \out_ch_cnt[3]_i_1 
       (.I0(out_col_cnt[2]),
        .I1(out_col_cnt[1]),
        .I2(out_col_cnt[0]),
        .I3(state_0[1]),
        .I4(state_0[0]),
        .O(\out_ch_cnt[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair85" *) 
  LUT5 #(
    .INIT(32'h7F800000)) 
    \out_ch_cnt[3]_i_2 
       (.I0(\out_ch_cnt_reg_n_0_[2] ),
        .I1(\out_ch_cnt_reg_n_0_[1] ),
        .I2(\out_ch_cnt_reg_n_0_[0] ),
        .I3(\out_ch_cnt_reg_n_0_[3] ),
        .I4(state_0[1]),
        .O(\out_ch_cnt[3]_i_2_n_0 ));
  FDRE \out_ch_cnt_reg[0] 
       (.C(CLK),
        .CE(\out_ch_cnt[3]_i_1_n_0 ),
        .D(\out_ch_cnt[0]_i_1__1_n_0 ),
        .Q(\out_ch_cnt_reg_n_0_[0] ),
        .R(rst));
  FDRE \out_ch_cnt_reg[1] 
       (.C(CLK),
        .CE(\out_ch_cnt[3]_i_1_n_0 ),
        .D(\out_ch_cnt[1]_i_1__0_n_0 ),
        .Q(\out_ch_cnt_reg_n_0_[1] ),
        .R(rst));
  FDRE \out_ch_cnt_reg[2] 
       (.C(CLK),
        .CE(\out_ch_cnt[3]_i_1_n_0 ),
        .D(\out_ch_cnt[2]_i_1__0_n_0 ),
        .Q(\out_ch_cnt_reg_n_0_[2] ),
        .R(rst));
  FDRE \out_ch_cnt_reg[3] 
       (.C(CLK),
        .CE(\out_ch_cnt[3]_i_1_n_0 ),
        .D(\out_ch_cnt[3]_i_2_n_0 ),
        .Q(\out_ch_cnt_reg_n_0_[3] ),
        .R(rst));
  LUT3 #(
    .INIT(8'h68)) 
    \out_col_cnt[0]_i_1__0 
       (.I0(state_0[0]),
        .I1(state_0[1]),
        .I2(out_col_cnt[0]),
        .O(\out_col_cnt[0]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair82" *) 
  LUT4 #(
    .INIT(16'h7C80)) 
    \out_col_cnt[1]_i_1__0 
       (.I0(out_col_cnt[0]),
        .I1(state_0[0]),
        .I2(state_0[1]),
        .I3(out_col_cnt[1]),
        .O(\out_col_cnt[1]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair82" *) 
  LUT5 #(
    .INIT(32'h7FF08000)) 
    \out_col_cnt[2]_i_1__0 
       (.I0(out_col_cnt[1]),
        .I1(out_col_cnt[0]),
        .I2(state_0[0]),
        .I3(state_0[1]),
        .I4(out_col_cnt[2]),
        .O(\out_col_cnt[2]_i_1__0_n_0 ));
  FDRE \out_col_cnt_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .D(\out_col_cnt[0]_i_1__0_n_0 ),
        .Q(out_col_cnt[0]),
        .R(rst));
  FDRE \out_col_cnt_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .D(\out_col_cnt[1]_i_1__0_n_0 ),
        .Q(out_col_cnt[1]),
        .R(rst));
  FDRE \out_col_cnt_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .D(\out_col_cnt[2]_i_1__0_n_0 ),
        .Q(out_col_cnt[2]),
        .R(rst));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \state[1]_i_2__0 
       (.I0(\out_ch_cnt_reg_n_0_[0] ),
        .I1(out_col_cnt[2]),
        .I2(out_col_cnt[1]),
        .I3(out_col_cnt[0]),
        .I4(\out_ch_cnt_reg_n_0_[1] ),
        .I5(\out_ch_cnt_reg_n_0_[2] ),
        .O(\state[1]_i_2__0_n_0 ));
  FDRE \state_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .D(control_unit_n_0),
        .Q(state_0[0]),
        .R(rst));
  FDRE \state_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .D(\GEN_ROW_BUFFER.row_buffer_n_0 ),
        .Q(state_0[1]),
        .R(rst));
  LUT5 #(
    .INIT(32'hFF000070)) 
    \win_ch[0]_i_1 
       (.I0(win_ch[2]),
        .I1(win_ch[1]),
        .I2(state_0[0]),
        .I3(state_0[1]),
        .I4(\win_ch_reg_n_0_[0] ),
        .O(\win_ch[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair80" *) 
  LUT5 #(
    .INIT(32'hFF100040)) 
    \win_ch[1]_i_1 
       (.I0(win_ch[2]),
        .I1(\win_ch_reg_n_0_[0] ),
        .I2(state_0[0]),
        .I3(state_0[1]),
        .I4(win_ch[1]),
        .O(\win_ch[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair80" *) 
  LUT5 #(
    .INIT(32'hFF100080)) 
    \win_ch[2]_i_1 
       (.I0(\win_ch_reg_n_0_[0] ),
        .I1(win_ch[1]),
        .I2(state_0[0]),
        .I3(state_0[1]),
        .I4(win_ch[2]),
        .O(\win_ch[2]_i_1_n_0 ));
  FDRE \win_ch_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .D(\win_ch[0]_i_1_n_0 ),
        .Q(\win_ch_reg_n_0_[0] ),
        .R(rst));
  FDRE \win_ch_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .D(\win_ch[1]_i_1_n_0 ),
        .Q(win_ch[1]),
        .R(rst));
  FDRE \win_ch_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .D(\win_ch[2]_i_1_n_0 ),
        .Q(win_ch[2]),
        .R(rst));
  (* SOFT_HLUTNM = "soft_lutpair84" *) 
  LUT4 #(
    .INIT(16'h1500)) 
    \win_kc[0]_i_1 
       (.I0(win_kc[0]),
        .I1(win_kc[3]),
        .I2(win_kc[2]),
        .I3(state_0[0]),
        .O(A[0]));
  (* SOFT_HLUTNM = "soft_lutpair84" *) 
  LUT5 #(
    .INIT(32'h06660000)) 
    \win_kc[1]_i_1 
       (.I0(win_kc[0]),
        .I1(win_kc[1]),
        .I2(win_kc[3]),
        .I3(win_kc[2]),
        .I4(state_0[0]),
        .O(A[1]));
  (* SOFT_HLUTNM = "soft_lutpair83" *) 
  LUT5 #(
    .INIT(32'h15400000)) 
    \win_kc[2]_i_1 
       (.I0(win_kc[3]),
        .I1(win_kc[0]),
        .I2(win_kc[1]),
        .I3(win_kc[2]),
        .I4(state_0[0]),
        .O(A[2]));
  LUT5 #(
    .INIT(32'h0000FD55)) 
    \win_kc[3]_i_1 
       (.I0(state_0[0]),
        .I1(win_ch[1]),
        .I2(\win_ch_reg_n_0_[0] ),
        .I3(win_ch[2]),
        .I4(state_0[1]),
        .O(CEA2));
  (* SOFT_HLUTNM = "soft_lutpair83" *) 
  LUT5 #(
    .INIT(32'h13800000)) 
    \win_kc[3]_i_2 
       (.I0(win_kc[1]),
        .I1(win_kc[2]),
        .I2(win_kc[0]),
        .I3(win_kc[3]),
        .I4(state_0[0]),
        .O(A[3]));
  FDRE \win_kc_reg[0] 
       (.C(CLK),
        .CE(CEA2),
        .D(A[0]),
        .Q(win_kc[0]),
        .R(rst));
  FDRE \win_kc_reg[1] 
       (.C(CLK),
        .CE(CEA2),
        .D(A[1]),
        .Q(win_kc[1]),
        .R(rst));
  FDRE \win_kc_reg[2] 
       (.C(CLK),
        .CE(CEA2),
        .D(A[2]),
        .Q(win_kc[2]),
        .R(rst));
  FDRE \win_kc_reg[3] 
       (.C(CLK),
        .CE(CEA2),
        .D(A[3]),
        .Q(win_kc[3]),
        .R(rst));
  LUT4 #(
    .INIT(16'h0F40)) 
    \win_kr[0]_i_1 
       (.I0(\win_kr_reg_n_0_[2] ),
        .I1(state_0[0]),
        .I2(\win_kr[2]_i_2_n_0 ),
        .I3(\win_kr_reg_n_0_[0] ),
        .O(\win_kr[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair79" *) 
  LUT5 #(
    .INIT(32'h10FF4000)) 
    \win_kr[1]_i_1 
       (.I0(\win_kr_reg_n_0_[2] ),
        .I1(\win_kr_reg_n_0_[0] ),
        .I2(state_0[0]),
        .I3(\win_kr[2]_i_2_n_0 ),
        .I4(\win_kr_reg_n_0_[1] ),
        .O(\win_kr[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair79" *) 
  LUT5 #(
    .INIT(32'h00FF8000)) 
    \win_kr[2]_i_1 
       (.I0(\win_kr_reg_n_0_[1] ),
        .I1(\win_kr_reg_n_0_[0] ),
        .I2(state_0[0]),
        .I3(\win_kr[2]_i_2_n_0 ),
        .I4(\win_kr_reg_n_0_[2] ),
        .O(\win_kr[2]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h00D5)) 
    \win_kr[2]_i_2 
       (.I0(state_0[0]),
        .I1(\win_kr[2]_i_3_n_0 ),
        .I2(win_kc[3]),
        .I3(state_0[1]),
        .O(\win_kr[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hF0F0F00080808000)) 
    \win_kr[2]_i_3 
       (.I0(win_kc[0]),
        .I1(win_kc[1]),
        .I2(win_ch[2]),
        .I3(\win_ch_reg_n_0_[0] ),
        .I4(win_ch[1]),
        .I5(win_kc[2]),
        .O(\win_kr[2]_i_3_n_0 ));
  FDRE \win_kr_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .D(\win_kr[0]_i_1_n_0 ),
        .Q(\win_kr_reg_n_0_[0] ),
        .R(rst));
  FDRE \win_kr_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .D(\win_kr[1]_i_1_n_0 ),
        .Q(\win_kr_reg_n_0_[1] ),
        .R(rst));
  FDRE \win_kr_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .D(\win_kr[2]_i_1_n_0 ),
        .Q(\win_kr_reg_n_0_[2] ),
        .R(rst));
  LUT6 #(
    .INIT(64'hFFFFDFFF0000DF00)) 
    win_load_active_i_1__1
       (.I0(win_kc[3]),
        .I1(win_load_active_i_2_n_0),
        .I2(\win_kr_reg_n_0_[2] ),
        .I3(state_0[0]),
        .I4(state_0[1]),
        .I5(win_load_active_reg_n_0),
        .O(win_load_active_i_1__1_n_0));
  LUT6 #(
    .INIT(64'h0F0F0FFF7F7F7FFF)) 
    win_load_active_i_2
       (.I0(win_kc[0]),
        .I1(win_kc[1]),
        .I2(win_ch[2]),
        .I3(win_ch[1]),
        .I4(\win_ch_reg_n_0_[0] ),
        .I5(win_kc[2]),
        .O(win_load_active_i_2_n_0));
  FDRE win_load_active_reg
       (.C(CLK),
        .CE(1'b1),
        .D(win_load_active_i_1__1_n_0),
        .Q(win_load_active_reg_n_0),
        .R(rst));
endmodule

(* ORIG_REF_NAME = "streaming_nn_layer_stage" *) 
module streaming_nn_layer_stage__parameterized2
   (\FSM_onehot_oc_state_reg[2] ,
    \FSM_onehot_oc_state_reg[0] ,
    \FSM_onehot_oc_state_reg[2]_0 ,
    leds_OBUF,
    \FSM_onehot_oc_state_reg[1] ,
    oc_mem_addr,
    \FSM_onehot_oc_state_reg[2]_1 ,
    \FSM_onehot_oc_state_reg[1]_0 ,
    rst,
    CLK);
  output \FSM_onehot_oc_state_reg[2] ;
  output \FSM_onehot_oc_state_reg[0] ;
  output \FSM_onehot_oc_state_reg[2]_0 ;
  output [0:0]leds_OBUF;
  input \FSM_onehot_oc_state_reg[1] ;
  input [0:0]oc_mem_addr;
  input \FSM_onehot_oc_state_reg[2]_1 ;
  input \FSM_onehot_oc_state_reg[1]_0 ;
  input rst;
  input CLK;

  wire CLK;
  wire \FSM_onehot_oc_state_reg[0] ;
  wire \FSM_onehot_oc_state_reg[1] ;
  wire \FSM_onehot_oc_state_reg[1]_0 ;
  wire \FSM_onehot_oc_state_reg[2] ;
  wire \FSM_onehot_oc_state_reg[2]_0 ;
  wire \FSM_onehot_oc_state_reg[2]_1 ;
  wire control_unit_n_0;
  wire control_unit_n_1;
  wire ctrl_start;
  wire [0:0]leds_OBUF;
  wire [0:0]oc_mem_addr;
  wire rst;
  wire [1:0]state;
  wire \state[1]_i_1__0_n_0 ;
  wire win_load_active;
  wire win_load_active_i_1__0_n_0;

  LUT6 #(
    .INIT(64'h4777777744444444)) 
    \FSM_onehot_oc_state[0]_i_1 
       (.I0(\FSM_onehot_oc_state_reg[1] ),
        .I1(oc_mem_addr),
        .I2(state[1]),
        .I3(state[0]),
        .I4(\FSM_onehot_oc_state_reg[2]_1 ),
        .I5(\FSM_onehot_oc_state_reg[1]_0 ),
        .O(\FSM_onehot_oc_state_reg[2] ));
  LUT6 #(
    .INIT(64'hEAEFEFEFE0E0E0E0)) 
    \FSM_onehot_oc_state[1]_i_1 
       (.I0(\FSM_onehot_oc_state_reg[1]_0 ),
        .I1(\FSM_onehot_oc_state_reg[1] ),
        .I2(oc_mem_addr),
        .I3(state[1]),
        .I4(state[0]),
        .I5(\FSM_onehot_oc_state_reg[2]_1 ),
        .O(\FSM_onehot_oc_state_reg[0] ));
  (* SOFT_HLUTNM = "soft_lutpair106" *) 
  LUT4 #(
    .INIT(16'hEA00)) 
    \FSM_onehot_oc_state[2]_i_1 
       (.I0(oc_mem_addr),
        .I1(state[1]),
        .I2(state[0]),
        .I3(\FSM_onehot_oc_state_reg[2]_1 ),
        .O(\FSM_onehot_oc_state_reg[2]_0 ));
  nn_layer_control_unit control_unit
       (.CLK(CLK),
        .ctrl_start(ctrl_start),
        .done_reg_0(control_unit_n_0),
        .rst(rst),
        .state(state),
        .\state_reg[0] (control_unit_n_1),
        .win_load_active(win_load_active));
  FDRE ctrl_start_reg
       (.C(CLK),
        .CE(1'b1),
        .D(control_unit_n_1),
        .Q(ctrl_start),
        .R(rst));
  LUT2 #(
    .INIT(4'hE)) 
    \leds_OBUF[6]_inst_i_1 
       (.I0(state[1]),
        .I1(state[0]),
        .O(leds_OBUF));
  (* SOFT_HLUTNM = "soft_lutpair106" *) 
  LUT3 #(
    .INIT(8'hF4)) 
    \state[1]_i_1__0 
       (.I0(win_load_active),
        .I1(state[0]),
        .I2(state[1]),
        .O(\state[1]_i_1__0_n_0 ));
  FDRE \state_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .D(control_unit_n_0),
        .Q(state[0]),
        .R(rst));
  FDRE \state_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .D(\state[1]_i_1__0_n_0 ),
        .Q(state[1]),
        .R(rst));
  LUT3 #(
    .INIT(8'hF4)) 
    win_load_active_i_1__0
       (.I0(state[1]),
        .I1(state[0]),
        .I2(win_load_active),
        .O(win_load_active_i_1__0_n_0));
  FDRE win_load_active_reg
       (.C(CLK),
        .CE(1'b1),
        .D(win_load_active_i_1__0_n_0),
        .Q(win_load_active),
        .R(rst));
endmodule

module streaming_nn_pipeline
   (leds_OBUF,
    \FSM_onehot_oc_state_reg[2] ,
    \FSM_onehot_oc_state_reg[0] ,
    \FSM_onehot_oc_state_reg[2]_0 ,
    rst,
    \FSM_onehot_oc_state_reg[1] ,
    oc_mem_addr,
    \FSM_onehot_oc_state_reg[2]_1 ,
    \FSM_onehot_oc_state_reg[1]_0 ,
    CLK);
  output [3:0]leds_OBUF;
  output \FSM_onehot_oc_state_reg[2] ;
  output \FSM_onehot_oc_state_reg[0] ;
  output \FSM_onehot_oc_state_reg[2]_0 ;
  input rst;
  input \FSM_onehot_oc_state_reg[1] ;
  input [0:0]oc_mem_addr;
  input \FSM_onehot_oc_state_reg[2]_1 ;
  input \FSM_onehot_oc_state_reg[1]_0 ;
  input CLK;

  wire CLK;
  wire \FSM_onehot_oc_state_reg[0] ;
  wire \FSM_onehot_oc_state_reg[1] ;
  wire \FSM_onehot_oc_state_reg[1]_0 ;
  wire \FSM_onehot_oc_state_reg[2] ;
  wire \FSM_onehot_oc_state_reg[2]_0 ;
  wire \FSM_onehot_oc_state_reg[2]_1 ;
  wire [3:0]leds_OBUF;
  wire [0:0]oc_mem_addr;
  wire rst;
  wire [1:0]state;
  wire [1:0]state_0;

  streaming_nn_layer_stage layer_0
       (.CLK(CLK),
        .leds_OBUF(leds_OBUF[0]),
        .rst(rst),
        .state(state));
  streaming_nn_layer_stage__parameterized0 layer_1
       (.CLK(CLK),
        .leds_OBUF(leds_OBUF[1]),
        .rst(rst),
        .state(state_0),
        .state_0(state));
  streaming_nn_layer_stage__parameterized1 layer_2
       (.CLK(CLK),
        .leds_OBUF(leds_OBUF[2]),
        .rst(rst),
        .state(state_0));
  streaming_nn_layer_stage__parameterized2 layer_3
       (.CLK(CLK),
        .\FSM_onehot_oc_state_reg[0] (\FSM_onehot_oc_state_reg[0] ),
        .\FSM_onehot_oc_state_reg[1] (\FSM_onehot_oc_state_reg[1] ),
        .\FSM_onehot_oc_state_reg[1]_0 (\FSM_onehot_oc_state_reg[1]_0 ),
        .\FSM_onehot_oc_state_reg[2] (\FSM_onehot_oc_state_reg[2] ),
        .\FSM_onehot_oc_state_reg[2]_0 (\FSM_onehot_oc_state_reg[2]_0 ),
        .\FSM_onehot_oc_state_reg[2]_1 (\FSM_onehot_oc_state_reg[2]_1 ),
        .leds_OBUF(leds_OBUF[3]),
        .oc_mem_addr(oc_mem_addr),
        .rst(rst));
endmodule

module streaming_nn_system
   (leds_OBUF,
    rst,
    CLK,
    sw_sync_1,
    sw_prev);
  output [5:0]leds_OBUF;
  input rst;
  input CLK;
  input [0:0]sw_sync_1;
  input [0:0]sw_prev;

  wire CLK;
  wire \FSM_onehot_oc_state[1]_i_2_n_0 ;
  wire \FSM_onehot_oc_state[1]_i_3_n_0 ;
  wire \FSM_onehot_oc_state_reg_n_0_[0] ;
  wire \FSM_onehot_oc_state_reg_n_0_[1] ;
  wire \FSM_sequential_wl_state[0]_i_1_n_0 ;
  wire \FSM_sequential_wl_state[1]_i_1_n_0 ;
  wire \FSM_sequential_wl_state[2]_i_1_n_0 ;
  wire \FSM_sequential_wl_state[2]_i_2_n_0 ;
  wire [15:1]in5;
  wire inference_done_i_1_n_0;
  wire inference_done_i_2_n_0;
  wire inference_done_i_3_n_0;
  wire inference_done_i_4_n_0;
  wire inference_done_i_5_n_0;
  wire [5:0]leds_OBUF;
  wire [0:0]oc_mem_addr;
  wire [15:0]oc_pixel_cnt;
  wire \oc_pixel_cnt[0]_i_1_n_0 ;
  wire \oc_pixel_cnt_reg[12]_i_1_n_0 ;
  wire \oc_pixel_cnt_reg[4]_i_1_n_0 ;
  wire \oc_pixel_cnt_reg[8]_i_1_n_0 ;
  wire pipeline_n_4;
  wire pipeline_n_5;
  wire pipeline_n_6;
  wire rst;
  wire [0:0]sw_prev;
  wire [0:0]sw_sync_1;
  wire weights_loaded_i_1_n_0;
  wire [1:0]wl_layer_idx;
  wire \wl_layer_idx[0]_i_1_n_0 ;
  wire \wl_layer_idx[1]_i_1_n_0 ;
  wire \wl_layer_idx[1]_i_2_n_0 ;
  wire [2:0]wl_state;
  wire [2:0]\NLW_oc_pixel_cnt_reg[12]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_oc_pixel_cnt_reg[15]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_oc_pixel_cnt_reg[15]_i_1_O_UNCONNECTED ;
  wire [2:0]\NLW_oc_pixel_cnt_reg[4]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_oc_pixel_cnt_reg[8]_i_1_CO_UNCONNECTED ;

  LUT6 #(
    .INIT(64'h000000007FFFFFFF)) 
    \FSM_onehot_oc_state[1]_i_2 
       (.I0(inference_done_i_5_n_0),
        .I1(oc_pixel_cnt[3]),
        .I2(oc_pixel_cnt[0]),
        .I3(oc_pixel_cnt[5]),
        .I4(oc_pixel_cnt[2]),
        .I5(\FSM_onehot_oc_state[1]_i_3_n_0 ),
        .O(\FSM_onehot_oc_state[1]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \FSM_onehot_oc_state[1]_i_3 
       (.I0(oc_pixel_cnt[13]),
        .I1(oc_pixel_cnt[9]),
        .I2(oc_pixel_cnt[11]),
        .I3(oc_pixel_cnt[14]),
        .I4(inference_done_i_3_n_0),
        .O(\FSM_onehot_oc_state[1]_i_3_n_0 ));
  (* FSM_ENCODED_STATES = "OC_WRITE:100,OC_IDLE:001,OC_COLLECT:010" *) 
  FDSE #(
    .INIT(1'b1)) 
    \FSM_onehot_oc_state_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .D(pipeline_n_4),
        .Q(\FSM_onehot_oc_state_reg_n_0_[0] ),
        .S(rst));
  (* FSM_ENCODED_STATES = "OC_WRITE:100,OC_IDLE:001,OC_COLLECT:010" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_oc_state_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .D(pipeline_n_5),
        .Q(\FSM_onehot_oc_state_reg_n_0_[1] ),
        .R(rst));
  (* FSM_ENCODED_STATES = "OC_WRITE:100,OC_IDLE:001,OC_COLLECT:010" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_oc_state_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .D(pipeline_n_6),
        .Q(oc_mem_addr),
        .R(rst));
  LUT6 #(
    .INIT(64'h007AFFFF00FF0000)) 
    \FSM_sequential_wl_state[0]_i_1 
       (.I0(wl_state[1]),
        .I1(wl_layer_idx[1]),
        .I2(wl_layer_idx[0]),
        .I3(wl_state[2]),
        .I4(\FSM_sequential_wl_state[2]_i_2_n_0 ),
        .I5(wl_state[0]),
        .O(\FSM_sequential_wl_state[0]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h9A)) 
    \FSM_sequential_wl_state[1]_i_1 
       (.I0(wl_state[1]),
        .I1(wl_state[2]),
        .I2(wl_state[0]),
        .O(\FSM_sequential_wl_state[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000FFFF80000000)) 
    \FSM_sequential_wl_state[2]_i_1 
       (.I0(wl_layer_idx[1]),
        .I1(wl_layer_idx[0]),
        .I2(wl_state[1]),
        .I3(wl_state[0]),
        .I4(\FSM_sequential_wl_state[2]_i_2_n_0 ),
        .I5(wl_state[2]),
        .O(\FSM_sequential_wl_state[2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00FF5510)) 
    \FSM_sequential_wl_state[2]_i_2 
       (.I0(wl_state[1]),
        .I1(sw_prev),
        .I2(sw_sync_1),
        .I3(wl_state[2]),
        .I4(wl_state[0]),
        .O(\FSM_sequential_wl_state[2]_i_2_n_0 ));
  (* FSM_ENCODED_STATES = "WL_IDLE:000,WL_WRITE_LAYER:010,WL_NEXT_LAYER:011,WL_DONE:100,WL_READ_MEM:001" *) 
  FDRE \FSM_sequential_wl_state_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .D(\FSM_sequential_wl_state[0]_i_1_n_0 ),
        .Q(wl_state[0]),
        .R(rst));
  (* FSM_ENCODED_STATES = "WL_IDLE:000,WL_WRITE_LAYER:010,WL_NEXT_LAYER:011,WL_DONE:100,WL_READ_MEM:001" *) 
  FDRE \FSM_sequential_wl_state_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .D(\FSM_sequential_wl_state[1]_i_1_n_0 ),
        .Q(wl_state[1]),
        .R(rst));
  (* FSM_ENCODED_STATES = "WL_IDLE:000,WL_WRITE_LAYER:010,WL_NEXT_LAYER:011,WL_DONE:100,WL_READ_MEM:001" *) 
  FDRE \FSM_sequential_wl_state_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .D(\FSM_sequential_wl_state[2]_i_1_n_0 ),
        .Q(wl_state[2]),
        .R(rst));
  LUT5 #(
    .INIT(32'hA8AAA8A8)) 
    inference_done_i_1
       (.I0(oc_mem_addr),
        .I1(inference_done_i_2_n_0),
        .I2(inference_done_i_3_n_0),
        .I3(inference_done_i_4_n_0),
        .I4(inference_done_i_5_n_0),
        .O(inference_done_i_1_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    inference_done_i_2
       (.I0(oc_pixel_cnt[14]),
        .I1(oc_pixel_cnt[11]),
        .I2(oc_pixel_cnt[9]),
        .I3(oc_pixel_cnt[13]),
        .O(inference_done_i_2_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    inference_done_i_3
       (.I0(oc_pixel_cnt[12]),
        .I1(oc_pixel_cnt[15]),
        .I2(oc_pixel_cnt[8]),
        .I3(oc_pixel_cnt[10]),
        .O(inference_done_i_3_n_0));
  LUT4 #(
    .INIT(16'h7FFF)) 
    inference_done_i_4
       (.I0(oc_pixel_cnt[3]),
        .I1(oc_pixel_cnt[0]),
        .I2(oc_pixel_cnt[5]),
        .I3(oc_pixel_cnt[2]),
        .O(inference_done_i_4_n_0));
  LUT4 #(
    .INIT(16'h8000)) 
    inference_done_i_5
       (.I0(oc_pixel_cnt[7]),
        .I1(oc_pixel_cnt[4]),
        .I2(oc_pixel_cnt[1]),
        .I3(oc_pixel_cnt[6]),
        .O(inference_done_i_5_n_0));
  FDRE inference_done_reg
       (.C(CLK),
        .CE(1'b1),
        .D(inference_done_i_1_n_0),
        .Q(leds_OBUF[1]),
        .R(rst));
  LUT1 #(
    .INIT(2'h1)) 
    \oc_pixel_cnt[0]_i_1 
       (.I0(oc_pixel_cnt[0]),
        .O(\oc_pixel_cnt[0]_i_1_n_0 ));
  FDRE \oc_pixel_cnt_reg[0] 
       (.C(CLK),
        .CE(oc_mem_addr),
        .D(\oc_pixel_cnt[0]_i_1_n_0 ),
        .Q(oc_pixel_cnt[0]),
        .R(rst));
  FDRE \oc_pixel_cnt_reg[10] 
       (.C(CLK),
        .CE(oc_mem_addr),
        .D(in5[10]),
        .Q(oc_pixel_cnt[10]),
        .R(rst));
  FDRE \oc_pixel_cnt_reg[11] 
       (.C(CLK),
        .CE(oc_mem_addr),
        .D(in5[11]),
        .Q(oc_pixel_cnt[11]),
        .R(rst));
  FDRE \oc_pixel_cnt_reg[12] 
       (.C(CLK),
        .CE(oc_mem_addr),
        .D(in5[12]),
        .Q(oc_pixel_cnt[12]),
        .R(rst));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \oc_pixel_cnt_reg[12]_i_1 
       (.CI(\oc_pixel_cnt_reg[8]_i_1_n_0 ),
        .CO({\oc_pixel_cnt_reg[12]_i_1_n_0 ,\NLW_oc_pixel_cnt_reg[12]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(in5[12:9]),
        .S(oc_pixel_cnt[12:9]));
  FDRE \oc_pixel_cnt_reg[13] 
       (.C(CLK),
        .CE(oc_mem_addr),
        .D(in5[13]),
        .Q(oc_pixel_cnt[13]),
        .R(rst));
  FDRE \oc_pixel_cnt_reg[14] 
       (.C(CLK),
        .CE(oc_mem_addr),
        .D(in5[14]),
        .Q(oc_pixel_cnt[14]),
        .R(rst));
  FDRE \oc_pixel_cnt_reg[15] 
       (.C(CLK),
        .CE(oc_mem_addr),
        .D(in5[15]),
        .Q(oc_pixel_cnt[15]),
        .R(rst));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \oc_pixel_cnt_reg[15]_i_1 
       (.CI(\oc_pixel_cnt_reg[12]_i_1_n_0 ),
        .CO(\NLW_oc_pixel_cnt_reg[15]_i_1_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_oc_pixel_cnt_reg[15]_i_1_O_UNCONNECTED [3],in5[15:13]}),
        .S({1'b0,oc_pixel_cnt[15:13]}));
  FDRE \oc_pixel_cnt_reg[1] 
       (.C(CLK),
        .CE(oc_mem_addr),
        .D(in5[1]),
        .Q(oc_pixel_cnt[1]),
        .R(rst));
  FDRE \oc_pixel_cnt_reg[2] 
       (.C(CLK),
        .CE(oc_mem_addr),
        .D(in5[2]),
        .Q(oc_pixel_cnt[2]),
        .R(rst));
  FDRE \oc_pixel_cnt_reg[3] 
       (.C(CLK),
        .CE(oc_mem_addr),
        .D(in5[3]),
        .Q(oc_pixel_cnt[3]),
        .R(rst));
  FDRE \oc_pixel_cnt_reg[4] 
       (.C(CLK),
        .CE(oc_mem_addr),
        .D(in5[4]),
        .Q(oc_pixel_cnt[4]),
        .R(rst));
  (* ADDER_THRESHOLD = "35" *) 
  (* \PinAttr:S[0]:HOLD_DETOUR  = "178" *) 
  CARRY4 \oc_pixel_cnt_reg[4]_i_1 
       (.CI(1'b0),
        .CO({\oc_pixel_cnt_reg[4]_i_1_n_0 ,\NLW_oc_pixel_cnt_reg[4]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(oc_pixel_cnt[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(in5[4:1]),
        .S(oc_pixel_cnt[4:1]));
  FDRE \oc_pixel_cnt_reg[5] 
       (.C(CLK),
        .CE(oc_mem_addr),
        .D(in5[5]),
        .Q(oc_pixel_cnt[5]),
        .R(rst));
  FDRE \oc_pixel_cnt_reg[6] 
       (.C(CLK),
        .CE(oc_mem_addr),
        .D(in5[6]),
        .Q(oc_pixel_cnt[6]),
        .R(rst));
  FDRE \oc_pixel_cnt_reg[7] 
       (.C(CLK),
        .CE(oc_mem_addr),
        .D(in5[7]),
        .Q(oc_pixel_cnt[7]),
        .R(rst));
  FDRE \oc_pixel_cnt_reg[8] 
       (.C(CLK),
        .CE(oc_mem_addr),
        .D(in5[8]),
        .Q(oc_pixel_cnt[8]),
        .R(rst));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \oc_pixel_cnt_reg[8]_i_1 
       (.CI(\oc_pixel_cnt_reg[4]_i_1_n_0 ),
        .CO({\oc_pixel_cnt_reg[8]_i_1_n_0 ,\NLW_oc_pixel_cnt_reg[8]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(in5[8:5]),
        .S(oc_pixel_cnt[8:5]));
  FDRE \oc_pixel_cnt_reg[9] 
       (.C(CLK),
        .CE(oc_mem_addr),
        .D(in5[9]),
        .Q(oc_pixel_cnt[9]),
        .R(rst));
  streaming_nn_pipeline pipeline
       (.CLK(CLK),
        .\FSM_onehot_oc_state_reg[0] (pipeline_n_5),
        .\FSM_onehot_oc_state_reg[1] (\FSM_onehot_oc_state[1]_i_2_n_0 ),
        .\FSM_onehot_oc_state_reg[1]_0 (\FSM_onehot_oc_state_reg_n_0_[0] ),
        .\FSM_onehot_oc_state_reg[2] (pipeline_n_4),
        .\FSM_onehot_oc_state_reg[2]_0 (pipeline_n_6),
        .\FSM_onehot_oc_state_reg[2]_1 (\FSM_onehot_oc_state_reg_n_0_[1] ),
        .leds_OBUF(leds_OBUF[5:2]),
        .oc_mem_addr(oc_mem_addr),
        .rst(rst));
  LUT6 #(
    .INIT(64'hFFFFFFFD000F0000)) 
    weights_loaded_i_1
       (.I0(sw_sync_1),
        .I1(sw_prev),
        .I2(wl_state[1]),
        .I3(wl_state[0]),
        .I4(wl_state[2]),
        .I5(leds_OBUF[0]),
        .O(weights_loaded_i_1_n_0));
  FDRE weights_loaded_reg
       (.C(CLK),
        .CE(1'b1),
        .D(weights_loaded_i_1_n_0),
        .Q(leds_OBUF[0]),
        .R(rst));
  LUT6 #(
    .INIT(64'h504F5050505A5050)) 
    \wl_layer_idx[0]_i_1 
       (.I0(\wl_layer_idx[1]_i_2_n_0 ),
        .I1(wl_layer_idx[1]),
        .I2(wl_layer_idx[0]),
        .I3(wl_state[2]),
        .I4(wl_state[1]),
        .I5(wl_state[0]),
        .O(\wl_layer_idx[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h447C4444446C4444)) 
    \wl_layer_idx[1]_i_1 
       (.I0(\wl_layer_idx[1]_i_2_n_0 ),
        .I1(wl_layer_idx[1]),
        .I2(wl_layer_idx[0]),
        .I3(wl_state[2]),
        .I4(wl_state[1]),
        .I5(wl_state[0]),
        .O(\wl_layer_idx[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00000010)) 
    \wl_layer_idx[1]_i_2 
       (.I0(wl_state[1]),
        .I1(wl_state[0]),
        .I2(sw_sync_1),
        .I3(sw_prev),
        .I4(wl_state[2]),
        .O(\wl_layer_idx[1]_i_2_n_0 ));
  FDRE \wl_layer_idx_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .D(\wl_layer_idx[0]_i_1_n_0 ),
        .Q(wl_layer_idx[0]),
        .R(rst));
  FDRE \wl_layer_idx_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .D(\wl_layer_idx[1]_i_1_n_0 ),
        .Q(wl_layer_idx[1]),
        .R(rst));
endmodule

(* ORIG_REF_NAME = "streaming_row_buffer" *) 
module streaming_row_buffer__parameterized0
   (window_valid,
    rst,
    state_0,
    CLK);
  output window_valid;
  input rst;
  input [1:0]state_0;
  input CLK;

  wire CLK;
  wire [2:0]ch_cnt;
  wire \ch_cnt[0]_i_1_n_0 ;
  wire \ch_cnt[1]_i_1_n_0 ;
  wire \ch_cnt[2]_i_1_n_0 ;
  wire [0:0]col_cnt;
  wire \col_cnt[0]_i_1__1_n_0 ;
  wire \col_cnt[2]_i_1__4_n_0 ;
  wire \col_cnt[4]_i_1__3_n_0 ;
  wire [4:0]col_cnt_reg;
  wire [4:1]p_0_in;
  wire rst;
  wire [1:0]state_0;
  wire \valid_rows[0]_i_1_n_0 ;
  wire \valid_rows[1]_i_1_n_0 ;
  wire \valid_rows[1]_i_2_n_0 ;
  wire \valid_rows_reg_n_0_[0] ;
  wire window_valid;

  LUT6 #(
    .INIT(64'h0000000077770888)) 
    \ch_cnt[0]_i_1 
       (.I0(state_0[0]),
        .I1(state_0[1]),
        .I2(ch_cnt[2]),
        .I3(ch_cnt[1]),
        .I4(ch_cnt[0]),
        .I5(rst),
        .O(\ch_cnt[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000077087F00)) 
    \ch_cnt[1]_i_1 
       (.I0(state_0[0]),
        .I1(state_0[1]),
        .I2(ch_cnt[2]),
        .I3(ch_cnt[1]),
        .I4(ch_cnt[0]),
        .I5(rst),
        .O(\ch_cnt[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00000000787070F0)) 
    \ch_cnt[2]_i_1 
       (.I0(state_0[0]),
        .I1(state_0[1]),
        .I2(ch_cnt[2]),
        .I3(ch_cnt[1]),
        .I4(ch_cnt[0]),
        .I5(rst),
        .O(\ch_cnt[2]_i_1_n_0 ));
  FDRE \ch_cnt_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .D(\ch_cnt[0]_i_1_n_0 ),
        .Q(ch_cnt[0]),
        .R(1'b0));
  FDRE \ch_cnt_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .D(\ch_cnt[1]_i_1_n_0 ),
        .Q(ch_cnt[1]),
        .R(1'b0));
  FDRE \ch_cnt_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .D(\ch_cnt[2]_i_1_n_0 ),
        .Q(ch_cnt[2]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \col_cnt[0]_i_1__1 
       (.I0(col_cnt_reg[0]),
        .O(\col_cnt[0]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \col_cnt[1]_i_1__1 
       (.I0(col_cnt_reg[1]),
        .I1(col_cnt_reg[0]),
        .O(p_0_in[1]));
  LUT3 #(
    .INIT(8'h6A)) 
    \col_cnt[2]_i_1__4 
       (.I0(col_cnt_reg[2]),
        .I1(col_cnt_reg[0]),
        .I2(col_cnt_reg[1]),
        .O(\col_cnt[2]_i_1__4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \col_cnt[3]_i_1__1 
       (.I0(col_cnt_reg[3]),
        .I1(col_cnt_reg[1]),
        .I2(col_cnt_reg[0]),
        .I3(col_cnt_reg[2]),
        .O(p_0_in[3]));
  LUT5 #(
    .INIT(32'hEAEAEAAA)) 
    \col_cnt[4]_i_1__3 
       (.I0(rst),
        .I1(col_cnt_reg[4]),
        .I2(col_cnt),
        .I3(col_cnt_reg[3]),
        .I4(\valid_rows[1]_i_2_n_0 ),
        .O(\col_cnt[4]_i_1__3_n_0 ));
  LUT5 #(
    .INIT(32'h80808000)) 
    \col_cnt[4]_i_2__0 
       (.I0(state_0[0]),
        .I1(state_0[1]),
        .I2(ch_cnt[2]),
        .I3(ch_cnt[1]),
        .I4(ch_cnt[0]),
        .O(col_cnt));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \col_cnt[4]_i_3 
       (.I0(col_cnt_reg[3]),
        .I1(col_cnt_reg[1]),
        .I2(col_cnt_reg[0]),
        .I3(col_cnt_reg[2]),
        .I4(col_cnt_reg[4]),
        .O(p_0_in[4]));
  FDRE \col_cnt_reg[0] 
       (.C(CLK),
        .CE(col_cnt),
        .D(\col_cnt[0]_i_1__1_n_0 ),
        .Q(col_cnt_reg[0]),
        .R(\col_cnt[4]_i_1__3_n_0 ));
  FDRE \col_cnt_reg[1] 
       (.C(CLK),
        .CE(col_cnt),
        .D(p_0_in[1]),
        .Q(col_cnt_reg[1]),
        .R(\col_cnt[4]_i_1__3_n_0 ));
  FDRE \col_cnt_reg[2] 
       (.C(CLK),
        .CE(col_cnt),
        .D(\col_cnt[2]_i_1__4_n_0 ),
        .Q(col_cnt_reg[2]),
        .R(\col_cnt[4]_i_1__3_n_0 ));
  FDRE \col_cnt_reg[3] 
       (.C(CLK),
        .CE(col_cnt),
        .D(p_0_in[3]),
        .Q(col_cnt_reg[3]),
        .R(\col_cnt[4]_i_1__3_n_0 ));
  FDRE \col_cnt_reg[4] 
       (.C(CLK),
        .CE(col_cnt),
        .D(p_0_in[4]),
        .Q(col_cnt_reg[4]),
        .R(\col_cnt[4]_i_1__3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF1FFF0000E000)) 
    \valid_rows[0]_i_1 
       (.I0(\valid_rows[1]_i_2_n_0 ),
        .I1(col_cnt_reg[3]),
        .I2(col_cnt),
        .I3(col_cnt_reg[4]),
        .I4(window_valid),
        .I5(\valid_rows_reg_n_0_[0] ),
        .O(\valid_rows[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hECCCECCCECCCCCCC)) 
    \valid_rows[1]_i_1 
       (.I0(\valid_rows_reg_n_0_[0] ),
        .I1(window_valid),
        .I2(col_cnt_reg[4]),
        .I3(col_cnt),
        .I4(col_cnt_reg[3]),
        .I5(\valid_rows[1]_i_2_n_0 ),
        .O(\valid_rows[1]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \valid_rows[1]_i_2 
       (.I0(col_cnt_reg[2]),
        .I1(col_cnt_reg[0]),
        .I2(col_cnt_reg[1]),
        .O(\valid_rows[1]_i_2_n_0 ));
  FDRE \valid_rows_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .D(\valid_rows[0]_i_1_n_0 ),
        .Q(\valid_rows_reg_n_0_[0] ),
        .R(rst));
  FDRE \valid_rows_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .D(\valid_rows[1]_i_1_n_0 ),
        .Q(window_valid),
        .R(rst));
endmodule

(* ORIG_REF_NAME = "streaming_row_buffer" *) 
module streaming_row_buffer__parameterized1
   (\out_ch_cnt_reg[3] ,
    win_load_active_reg,
    \state_reg[1] ,
    Q,
    state_0,
    \state_reg[1]_0 ,
    state,
    rst,
    CLK);
  output \out_ch_cnt_reg[3] ;
  output win_load_active_reg;
  input \state_reg[1] ;
  input [0:0]Q;
  input [1:0]state_0;
  input \state_reg[1]_0 ;
  input [1:0]state;
  input rst;
  input CLK;

  wire CLK;
  wire [0:0]Q;
  wire [2:0]ch_cnt;
  wire \ch_cnt[0]_i_1__0_n_0 ;
  wire \ch_cnt[1]_i_1__0_n_0 ;
  wire \ch_cnt[2]_i_1__0_n_0 ;
  wire [0:0]col_cnt;
  wire \col_cnt[0]_i_1__4_n_0 ;
  wire \col_cnt[3]_i_1__4_n_0 ;
  wire \col_cnt_reg_n_0_[0] ;
  wire \col_cnt_reg_n_0_[1] ;
  wire \col_cnt_reg_n_0_[2] ;
  wire \col_cnt_reg_n_0_[3] ;
  wire \out_ch_cnt_reg[3] ;
  wire [3:1]p_0_in;
  wire rst;
  wire [1:0]state;
  wire [1:0]state_0;
  wire \state_reg[1] ;
  wire \state_reg[1]_0 ;
  wire \valid_rows[0]_i_1__0_n_0 ;
  wire \valid_rows[1]_i_1__0_n_0 ;
  wire \valid_rows[2]_i_1_n_0 ;
  wire \valid_rows[2]_i_2_n_0 ;
  wire \valid_rows_reg_n_0_[0] ;
  wire \valid_rows_reg_n_0_[1] ;
  wire \valid_rows_reg_n_0_[2] ;
  wire win_load_active_reg;

  LUT6 #(
    .INIT(64'h0000000013CCCCCC)) 
    \ch_cnt[0]_i_1__0 
       (.I0(ch_cnt[1]),
        .I1(ch_cnt[0]),
        .I2(ch_cnt[2]),
        .I3(state[1]),
        .I4(state[0]),
        .I5(rst),
        .O(\ch_cnt[0]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h0000000006AAAAAA)) 
    \ch_cnt[1]_i_1__0 
       (.I0(ch_cnt[1]),
        .I1(ch_cnt[0]),
        .I2(ch_cnt[2]),
        .I3(state[1]),
        .I4(state[0]),
        .I5(rst),
        .O(\ch_cnt[1]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h0000000018F0F0F0)) 
    \ch_cnt[2]_i_1__0 
       (.I0(ch_cnt[1]),
        .I1(ch_cnt[0]),
        .I2(ch_cnt[2]),
        .I3(state[1]),
        .I4(state[0]),
        .I5(rst),
        .O(\ch_cnt[2]_i_1__0_n_0 ));
  FDRE \ch_cnt_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .D(\ch_cnt[0]_i_1__0_n_0 ),
        .Q(ch_cnt[0]),
        .R(1'b0));
  FDRE \ch_cnt_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .D(\ch_cnt[1]_i_1__0_n_0 ),
        .Q(ch_cnt[1]),
        .R(1'b0));
  FDRE \ch_cnt_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .D(\ch_cnt[2]_i_1__0_n_0 ),
        .Q(ch_cnt[2]),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \col_cnt[0]_i_1__4 
       (.I0(\col_cnt_reg_n_0_[0] ),
        .O(\col_cnt[0]_i_1__4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \col_cnt[1]_i_1__4 
       (.I0(\col_cnt_reg_n_0_[1] ),
        .I1(\col_cnt_reg_n_0_[0] ),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \col_cnt[2]_i_1__3 
       (.I0(\col_cnt_reg_n_0_[2] ),
        .I1(\col_cnt_reg_n_0_[0] ),
        .I2(\col_cnt_reg_n_0_[1] ),
        .O(p_0_in[2]));
  LUT6 #(
    .INIT(64'hFFEAAAAAAAAAAAAA)) 
    \col_cnt[3]_i_1__4 
       (.I0(rst),
        .I1(\col_cnt_reg_n_0_[1] ),
        .I2(\col_cnt_reg_n_0_[0] ),
        .I3(\col_cnt_reg_n_0_[2] ),
        .I4(\col_cnt_reg_n_0_[3] ),
        .I5(col_cnt),
        .O(\col_cnt[3]_i_1__4_n_0 ));
  LUT5 #(
    .INIT(32'hE0000000)) 
    \col_cnt[3]_i_2 
       (.I0(ch_cnt[1]),
        .I1(ch_cnt[0]),
        .I2(ch_cnt[2]),
        .I3(state[1]),
        .I4(state[0]),
        .O(col_cnt));
  LUT4 #(
    .INIT(16'h6AAA)) 
    \col_cnt[3]_i_3 
       (.I0(\col_cnt_reg_n_0_[3] ),
        .I1(\col_cnt_reg_n_0_[2] ),
        .I2(\col_cnt_reg_n_0_[1] ),
        .I3(\col_cnt_reg_n_0_[0] ),
        .O(p_0_in[3]));
  FDRE \col_cnt_reg[0] 
       (.C(CLK),
        .CE(col_cnt),
        .D(\col_cnt[0]_i_1__4_n_0 ),
        .Q(\col_cnt_reg_n_0_[0] ),
        .R(\col_cnt[3]_i_1__4_n_0 ));
  FDRE \col_cnt_reg[1] 
       (.C(CLK),
        .CE(col_cnt),
        .D(p_0_in[1]),
        .Q(\col_cnt_reg_n_0_[1] ),
        .R(\col_cnt[3]_i_1__4_n_0 ));
  FDRE \col_cnt_reg[2] 
       (.C(CLK),
        .CE(col_cnt),
        .D(p_0_in[2]),
        .Q(\col_cnt_reg_n_0_[2] ),
        .R(\col_cnt[3]_i_1__4_n_0 ));
  FDRE \col_cnt_reg[3] 
       (.C(CLK),
        .CE(col_cnt),
        .D(p_0_in[3]),
        .Q(\col_cnt_reg_n_0_[3] ),
        .R(\col_cnt[3]_i_1__4_n_0 ));
  LUT5 #(
    .INIT(32'h7FF07F00)) 
    \state[1]_i_1__1 
       (.I0(\state_reg[1] ),
        .I1(Q),
        .I2(state_0[0]),
        .I3(state_0[1]),
        .I4(win_load_active_reg),
        .O(\out_ch_cnt_reg[3] ));
  LUT5 #(
    .INIT(32'h74747444)) 
    \state[1]_i_3 
       (.I0(\state_reg[1]_0 ),
        .I1(state_0[0]),
        .I2(\valid_rows_reg_n_0_[2] ),
        .I3(\valid_rows_reg_n_0_[1] ),
        .I4(\valid_rows_reg_n_0_[0] ),
        .O(win_load_active_reg));
  LUT4 #(
    .INIT(16'hCE66)) 
    \valid_rows[0]_i_1__0 
       (.I0(\valid_rows[2]_i_2_n_0 ),
        .I1(\valid_rows_reg_n_0_[0] ),
        .I2(\valid_rows_reg_n_0_[1] ),
        .I3(\valid_rows_reg_n_0_[2] ),
        .O(\valid_rows[0]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT4 #(
    .INIT(16'hF078)) 
    \valid_rows[1]_i_1__0 
       (.I0(\valid_rows[2]_i_2_n_0 ),
        .I1(\valid_rows_reg_n_0_[0] ),
        .I2(\valid_rows_reg_n_0_[1] ),
        .I3(\valid_rows_reg_n_0_[2] ),
        .O(\valid_rows[1]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT4 #(
    .INIT(16'hFF80)) 
    \valid_rows[2]_i_1 
       (.I0(\valid_rows[2]_i_2_n_0 ),
        .I1(\valid_rows_reg_n_0_[0] ),
        .I2(\valid_rows_reg_n_0_[1] ),
        .I3(\valid_rows_reg_n_0_[2] ),
        .O(\valid_rows[2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h88808080)) 
    \valid_rows[2]_i_2 
       (.I0(col_cnt),
        .I1(\col_cnt_reg_n_0_[3] ),
        .I2(\col_cnt_reg_n_0_[2] ),
        .I3(\col_cnt_reg_n_0_[0] ),
        .I4(\col_cnt_reg_n_0_[1] ),
        .O(\valid_rows[2]_i_2_n_0 ));
  FDRE \valid_rows_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .D(\valid_rows[0]_i_1__0_n_0 ),
        .Q(\valid_rows_reg_n_0_[0] ),
        .R(rst));
  FDRE \valid_rows_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .D(\valid_rows[1]_i_1__0_n_0 ),
        .Q(\valid_rows_reg_n_0_[1] ),
        .R(rst));
  FDRE \valid_rows_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .D(\valid_rows[2]_i_1_n_0 ),
        .Q(\valid_rows_reg_n_0_[2] ),
        .R(rst));
endmodule

(* ECO_CHECKSUM = "b408c8ea" *) (* MEM_ADDR_W = "20" *) (* NUM_LAYERS = "4" *) 
(* NotValidForBitStream *)
module zedboard_top
   (clk,
    rst_n,
    switches,
    leds);
  input clk;
  input rst_n;
  input [1:0]switches;
  output [7:0]leds;

  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire \heartbeat_cnt[0]_i_2_n_0 ;
  wire \heartbeat_cnt_reg[0]_i_1_n_0 ;
  wire \heartbeat_cnt_reg[0]_i_1_n_4 ;
  wire \heartbeat_cnt_reg[0]_i_1_n_5 ;
  wire \heartbeat_cnt_reg[0]_i_1_n_6 ;
  wire \heartbeat_cnt_reg[0]_i_1_n_7 ;
  wire \heartbeat_cnt_reg[12]_i_1_n_0 ;
  wire \heartbeat_cnt_reg[12]_i_1_n_4 ;
  wire \heartbeat_cnt_reg[12]_i_1_n_5 ;
  wire \heartbeat_cnt_reg[12]_i_1_n_6 ;
  wire \heartbeat_cnt_reg[12]_i_1_n_7 ;
  wire \heartbeat_cnt_reg[16]_i_1_n_0 ;
  wire \heartbeat_cnt_reg[16]_i_1_n_4 ;
  wire \heartbeat_cnt_reg[16]_i_1_n_5 ;
  wire \heartbeat_cnt_reg[16]_i_1_n_6 ;
  wire \heartbeat_cnt_reg[16]_i_1_n_7 ;
  wire \heartbeat_cnt_reg[20]_i_1_n_0 ;
  wire \heartbeat_cnt_reg[20]_i_1_n_4 ;
  wire \heartbeat_cnt_reg[20]_i_1_n_5 ;
  wire \heartbeat_cnt_reg[20]_i_1_n_6 ;
  wire \heartbeat_cnt_reg[20]_i_1_n_7 ;
  wire \heartbeat_cnt_reg[24]_i_1_n_6 ;
  wire \heartbeat_cnt_reg[24]_i_1_n_7 ;
  wire \heartbeat_cnt_reg[4]_i_1_n_0 ;
  wire \heartbeat_cnt_reg[4]_i_1_n_4 ;
  wire \heartbeat_cnt_reg[4]_i_1_n_5 ;
  wire \heartbeat_cnt_reg[4]_i_1_n_6 ;
  wire \heartbeat_cnt_reg[4]_i_1_n_7 ;
  wire \heartbeat_cnt_reg[8]_i_1_n_0 ;
  wire \heartbeat_cnt_reg[8]_i_1_n_4 ;
  wire \heartbeat_cnt_reg[8]_i_1_n_5 ;
  wire \heartbeat_cnt_reg[8]_i_1_n_6 ;
  wire \heartbeat_cnt_reg[8]_i_1_n_7 ;
  wire \heartbeat_cnt_reg_n_0_[0] ;
  wire \heartbeat_cnt_reg_n_0_[10] ;
  wire \heartbeat_cnt_reg_n_0_[11] ;
  wire \heartbeat_cnt_reg_n_0_[12] ;
  wire \heartbeat_cnt_reg_n_0_[13] ;
  wire \heartbeat_cnt_reg_n_0_[14] ;
  wire \heartbeat_cnt_reg_n_0_[15] ;
  wire \heartbeat_cnt_reg_n_0_[16] ;
  wire \heartbeat_cnt_reg_n_0_[17] ;
  wire \heartbeat_cnt_reg_n_0_[18] ;
  wire \heartbeat_cnt_reg_n_0_[19] ;
  wire \heartbeat_cnt_reg_n_0_[1] ;
  wire \heartbeat_cnt_reg_n_0_[20] ;
  wire \heartbeat_cnt_reg_n_0_[21] ;
  wire \heartbeat_cnt_reg_n_0_[22] ;
  wire \heartbeat_cnt_reg_n_0_[23] ;
  wire \heartbeat_cnt_reg_n_0_[24] ;
  wire \heartbeat_cnt_reg_n_0_[2] ;
  wire \heartbeat_cnt_reg_n_0_[3] ;
  wire \heartbeat_cnt_reg_n_0_[4] ;
  wire \heartbeat_cnt_reg_n_0_[5] ;
  wire \heartbeat_cnt_reg_n_0_[6] ;
  wire \heartbeat_cnt_reg_n_0_[7] ;
  wire \heartbeat_cnt_reg_n_0_[8] ;
  wire \heartbeat_cnt_reg_n_0_[9] ;
  wire [7:0]leds;
  wire [7:1]leds_OBUF;
  wire p_0_in;
  wire p_1_in;
  wire rst;
  wire rst_n;
  wire rst_n_IBUF;
  wire rst_sync_0;
  wire rst_sync_0_i_1_n_0;
  wire [1:1]sw_sync_0;
  wire [1:0]switches;
  wire [1:1]switches_IBUF;
  wire [2:0]\NLW_heartbeat_cnt_reg[0]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_heartbeat_cnt_reg[12]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_heartbeat_cnt_reg[16]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_heartbeat_cnt_reg[20]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_heartbeat_cnt_reg[24]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_heartbeat_cnt_reg[24]_i_1_O_UNCONNECTED ;
  wire [2:0]\NLW_heartbeat_cnt_reg[4]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_heartbeat_cnt_reg[8]_i_1_CO_UNCONNECTED ;
PULLUP pullup_rst_n
       (.O(rst_n));

initial begin
 $sdf_annotate("zedboard_top_tsmn.sdf",,,,"tool_control");
end
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  LUT1 #(
    .INIT(2'h1)) 
    \heartbeat_cnt[0]_i_2 
       (.I0(\heartbeat_cnt_reg_n_0_[0] ),
        .O(\heartbeat_cnt[0]_i_2_n_0 ));
  FDRE \heartbeat_cnt_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\heartbeat_cnt_reg[0]_i_1_n_7 ),
        .Q(\heartbeat_cnt_reg_n_0_[0] ),
        .R(rst));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \heartbeat_cnt_reg[0]_i_1 
       (.CI(1'b0),
        .CO({\heartbeat_cnt_reg[0]_i_1_n_0 ,\NLW_heartbeat_cnt_reg[0]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\heartbeat_cnt_reg[0]_i_1_n_4 ,\heartbeat_cnt_reg[0]_i_1_n_5 ,\heartbeat_cnt_reg[0]_i_1_n_6 ,\heartbeat_cnt_reg[0]_i_1_n_7 }),
        .S({\heartbeat_cnt_reg_n_0_[3] ,\heartbeat_cnt_reg_n_0_[2] ,\heartbeat_cnt_reg_n_0_[1] ,\heartbeat_cnt[0]_i_2_n_0 }));
  FDRE \heartbeat_cnt_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\heartbeat_cnt_reg[8]_i_1_n_5 ),
        .Q(\heartbeat_cnt_reg_n_0_[10] ),
        .R(rst));
  FDRE \heartbeat_cnt_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\heartbeat_cnt_reg[8]_i_1_n_4 ),
        .Q(\heartbeat_cnt_reg_n_0_[11] ),
        .R(rst));
  FDRE \heartbeat_cnt_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\heartbeat_cnt_reg[12]_i_1_n_7 ),
        .Q(\heartbeat_cnt_reg_n_0_[12] ),
        .R(rst));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \heartbeat_cnt_reg[12]_i_1 
       (.CI(\heartbeat_cnt_reg[8]_i_1_n_0 ),
        .CO({\heartbeat_cnt_reg[12]_i_1_n_0 ,\NLW_heartbeat_cnt_reg[12]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\heartbeat_cnt_reg[12]_i_1_n_4 ,\heartbeat_cnt_reg[12]_i_1_n_5 ,\heartbeat_cnt_reg[12]_i_1_n_6 ,\heartbeat_cnt_reg[12]_i_1_n_7 }),
        .S({\heartbeat_cnt_reg_n_0_[15] ,\heartbeat_cnt_reg_n_0_[14] ,\heartbeat_cnt_reg_n_0_[13] ,\heartbeat_cnt_reg_n_0_[12] }));
  FDRE \heartbeat_cnt_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\heartbeat_cnt_reg[12]_i_1_n_6 ),
        .Q(\heartbeat_cnt_reg_n_0_[13] ),
        .R(rst));
  FDRE \heartbeat_cnt_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\heartbeat_cnt_reg[12]_i_1_n_5 ),
        .Q(\heartbeat_cnt_reg_n_0_[14] ),
        .R(rst));
  FDRE \heartbeat_cnt_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\heartbeat_cnt_reg[12]_i_1_n_4 ),
        .Q(\heartbeat_cnt_reg_n_0_[15] ),
        .R(rst));
  FDRE \heartbeat_cnt_reg[16] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\heartbeat_cnt_reg[16]_i_1_n_7 ),
        .Q(\heartbeat_cnt_reg_n_0_[16] ),
        .R(rst));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \heartbeat_cnt_reg[16]_i_1 
       (.CI(\heartbeat_cnt_reg[12]_i_1_n_0 ),
        .CO({\heartbeat_cnt_reg[16]_i_1_n_0 ,\NLW_heartbeat_cnt_reg[16]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\heartbeat_cnt_reg[16]_i_1_n_4 ,\heartbeat_cnt_reg[16]_i_1_n_5 ,\heartbeat_cnt_reg[16]_i_1_n_6 ,\heartbeat_cnt_reg[16]_i_1_n_7 }),
        .S({\heartbeat_cnt_reg_n_0_[19] ,\heartbeat_cnt_reg_n_0_[18] ,\heartbeat_cnt_reg_n_0_[17] ,\heartbeat_cnt_reg_n_0_[16] }));
  FDRE \heartbeat_cnt_reg[17] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\heartbeat_cnt_reg[16]_i_1_n_6 ),
        .Q(\heartbeat_cnt_reg_n_0_[17] ),
        .R(rst));
  FDRE \heartbeat_cnt_reg[18] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\heartbeat_cnt_reg[16]_i_1_n_5 ),
        .Q(\heartbeat_cnt_reg_n_0_[18] ),
        .R(rst));
  FDRE \heartbeat_cnt_reg[19] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\heartbeat_cnt_reg[16]_i_1_n_4 ),
        .Q(\heartbeat_cnt_reg_n_0_[19] ),
        .R(rst));
  FDRE \heartbeat_cnt_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\heartbeat_cnt_reg[0]_i_1_n_6 ),
        .Q(\heartbeat_cnt_reg_n_0_[1] ),
        .R(rst));
  FDRE \heartbeat_cnt_reg[20] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\heartbeat_cnt_reg[20]_i_1_n_7 ),
        .Q(\heartbeat_cnt_reg_n_0_[20] ),
        .R(rst));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \heartbeat_cnt_reg[20]_i_1 
       (.CI(\heartbeat_cnt_reg[16]_i_1_n_0 ),
        .CO({\heartbeat_cnt_reg[20]_i_1_n_0 ,\NLW_heartbeat_cnt_reg[20]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\heartbeat_cnt_reg[20]_i_1_n_4 ,\heartbeat_cnt_reg[20]_i_1_n_5 ,\heartbeat_cnt_reg[20]_i_1_n_6 ,\heartbeat_cnt_reg[20]_i_1_n_7 }),
        .S({\heartbeat_cnt_reg_n_0_[23] ,\heartbeat_cnt_reg_n_0_[22] ,\heartbeat_cnt_reg_n_0_[21] ,\heartbeat_cnt_reg_n_0_[20] }));
  FDRE \heartbeat_cnt_reg[21] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\heartbeat_cnt_reg[20]_i_1_n_6 ),
        .Q(\heartbeat_cnt_reg_n_0_[21] ),
        .R(rst));
  FDRE \heartbeat_cnt_reg[22] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\heartbeat_cnt_reg[20]_i_1_n_5 ),
        .Q(\heartbeat_cnt_reg_n_0_[22] ),
        .R(rst));
  FDRE \heartbeat_cnt_reg[23] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\heartbeat_cnt_reg[20]_i_1_n_4 ),
        .Q(\heartbeat_cnt_reg_n_0_[23] ),
        .R(rst));
  FDRE \heartbeat_cnt_reg[24] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\heartbeat_cnt_reg[24]_i_1_n_7 ),
        .Q(\heartbeat_cnt_reg_n_0_[24] ),
        .R(rst));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \heartbeat_cnt_reg[24]_i_1 
       (.CI(\heartbeat_cnt_reg[20]_i_1_n_0 ),
        .CO(\NLW_heartbeat_cnt_reg[24]_i_1_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_heartbeat_cnt_reg[24]_i_1_O_UNCONNECTED [3:2],\heartbeat_cnt_reg[24]_i_1_n_6 ,\heartbeat_cnt_reg[24]_i_1_n_7 }),
        .S({1'b0,1'b0,leds_OBUF[7],\heartbeat_cnt_reg_n_0_[24] }));
  FDRE \heartbeat_cnt_reg[25] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\heartbeat_cnt_reg[24]_i_1_n_6 ),
        .Q(leds_OBUF[7]),
        .R(rst));
  FDRE \heartbeat_cnt_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\heartbeat_cnt_reg[0]_i_1_n_5 ),
        .Q(\heartbeat_cnt_reg_n_0_[2] ),
        .R(rst));
  FDRE \heartbeat_cnt_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\heartbeat_cnt_reg[0]_i_1_n_4 ),
        .Q(\heartbeat_cnt_reg_n_0_[3] ),
        .R(rst));
  FDRE \heartbeat_cnt_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\heartbeat_cnt_reg[4]_i_1_n_7 ),
        .Q(\heartbeat_cnt_reg_n_0_[4] ),
        .R(rst));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \heartbeat_cnt_reg[4]_i_1 
       (.CI(\heartbeat_cnt_reg[0]_i_1_n_0 ),
        .CO({\heartbeat_cnt_reg[4]_i_1_n_0 ,\NLW_heartbeat_cnt_reg[4]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\heartbeat_cnt_reg[4]_i_1_n_4 ,\heartbeat_cnt_reg[4]_i_1_n_5 ,\heartbeat_cnt_reg[4]_i_1_n_6 ,\heartbeat_cnt_reg[4]_i_1_n_7 }),
        .S({\heartbeat_cnt_reg_n_0_[7] ,\heartbeat_cnt_reg_n_0_[6] ,\heartbeat_cnt_reg_n_0_[5] ,\heartbeat_cnt_reg_n_0_[4] }));
  FDRE \heartbeat_cnt_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\heartbeat_cnt_reg[4]_i_1_n_6 ),
        .Q(\heartbeat_cnt_reg_n_0_[5] ),
        .R(rst));
  FDRE \heartbeat_cnt_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\heartbeat_cnt_reg[4]_i_1_n_5 ),
        .Q(\heartbeat_cnt_reg_n_0_[6] ),
        .R(rst));
  FDRE \heartbeat_cnt_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\heartbeat_cnt_reg[4]_i_1_n_4 ),
        .Q(\heartbeat_cnt_reg_n_0_[7] ),
        .R(rst));
  FDRE \heartbeat_cnt_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\heartbeat_cnt_reg[8]_i_1_n_7 ),
        .Q(\heartbeat_cnt_reg_n_0_[8] ),
        .R(rst));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \heartbeat_cnt_reg[8]_i_1 
       (.CI(\heartbeat_cnt_reg[4]_i_1_n_0 ),
        .CO({\heartbeat_cnt_reg[8]_i_1_n_0 ,\NLW_heartbeat_cnt_reg[8]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\heartbeat_cnt_reg[8]_i_1_n_4 ,\heartbeat_cnt_reg[8]_i_1_n_5 ,\heartbeat_cnt_reg[8]_i_1_n_6 ,\heartbeat_cnt_reg[8]_i_1_n_7 }),
        .S({\heartbeat_cnt_reg_n_0_[11] ,\heartbeat_cnt_reg_n_0_[10] ,\heartbeat_cnt_reg_n_0_[9] ,\heartbeat_cnt_reg_n_0_[8] }));
  FDRE \heartbeat_cnt_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\heartbeat_cnt_reg[8]_i_1_n_6 ),
        .Q(\heartbeat_cnt_reg_n_0_[9] ),
        .R(rst));
  OBUF \leds_OBUF[0]_inst 
       (.I(1'b0),
        .O(leds[0]));
  OBUF \leds_OBUF[1]_inst 
       (.I(leds_OBUF[1]),
        .O(leds[1]));
  OBUF \leds_OBUF[2]_inst 
       (.I(leds_OBUF[2]),
        .O(leds[2]));
  OBUF \leds_OBUF[3]_inst 
       (.I(leds_OBUF[3]),
        .O(leds[3]));
  OBUF \leds_OBUF[4]_inst 
       (.I(leds_OBUF[4]),
        .O(leds[4]));
  OBUF \leds_OBUF[5]_inst 
       (.I(leds_OBUF[5]),
        .O(leds[5]));
  OBUF \leds_OBUF[6]_inst 
       (.I(leds_OBUF[6]),
        .O(leds[6]));
  OBUF \leds_OBUF[7]_inst 
       (.I(leds_OBUF[7]),
        .O(leds[7]));
  IBUF rst_n_IBUF_inst
       (.I(rst_n),
        .O(rst_n_IBUF));
  LUT1 #(
    .INIT(2'h1)) 
    rst_sync_0_i_1
       (.I0(rst_n_IBUF),
        .O(rst_sync_0_i_1_n_0));
  FDPE rst_sync_0_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(1'b0),
        .PRE(rst_sync_0_i_1_n_0),
        .Q(rst_sync_0));
  FDPE rst_sync_1_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(rst_sync_0),
        .PRE(rst_sync_0_i_1_n_0),
        .Q(rst));
  FDRE \sw_prev_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(p_1_in),
        .Q(p_0_in),
        .R(1'b0));
  FDRE \sw_sync_0_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(switches_IBUF),
        .Q(sw_sync_0),
        .R(1'b0));
  FDRE \sw_sync_1_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(sw_sync_0),
        .Q(p_1_in),
        .R(1'b0));
  IBUF \switches_IBUF[1]_inst 
       (.I(switches[1]),
        .O(switches_IBUF));
  streaming_nn_system u_dut
       (.CLK(clk_IBUF_BUFG),
        .leds_OBUF(leds_OBUF[6:1]),
        .rst(rst),
        .sw_prev(p_0_in),
        .sw_sync_1(p_1_in));
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
