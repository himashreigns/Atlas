# =============================================================================
# build_zynq_system.tcl
#
# Vivado 2022.x Tcl script that creates the full PS+PL bring-up project for
# the YOLO-Nano accelerator on ZedBoard (XC7Z020-1CLG484).
#
# What it builds:
#   - Zynq7 PS configured for ZedBoard with:
#       * DDR3 controller (default Avnet preset)
#       * USB OTG 0 enabled on MIO 28..39 (Host mode → routes to ZedBoard
#         USB OTG port via on-board ULPI PHY)
#       * M_AXI_GP0 (control plane to accelerator AXI-Lite)
#       * S_AXI_HP0 (data plane from accelerator AXI master to DDR)
#       * FCLK_CLK0 @ 100 MHz, IRQ_F2P[0]
#   - axi_lite_ctrl_slave + axi_master_mem + stream_processing_top
#     all instantiated as one custom hierarchy ("dnn_accel_ps_top")
#   - AXI Interconnect from M_AXI_GP0 → accel control
#   - AXI Interconnect from accel master → S_AXI_HP0
#   - Processor System Reset block
#   - Address: accel control window @ 0x43C00000, 64 KB
#
# Usage:  vivado -mode batch -source scripts/build_zynq_system.tcl
# =============================================================================

set proj_name   "dnn_zynq_hdmi"
set proj_dir    "build/[file rootname $proj_name]"
set bd_name     "system"
set part        "xc7z020clg484-1"
# Digilent's official ZedBoard board file (installed at
# ~/.Xilinx/Vivado/2025.2/xhub/board_store/board_files/zedboard/1.3/).
# This preset carries the canonical DDR3/MIO/PLL/clock config that matches
# the actual board hardware and ships with Avnet's known-good FSBL recipe.
set board_part  "digilentinc.com:zedboard:part0:1.1"

# --------- Project housekeeping ------------------------------------------------
# Point Vivado at the locally-cloned Digilent board files
# (https://github.com/Digilent/vivado-boards). The "new/board_files"
# directory contains <board_name>/<version>/board.xml entries.
set repo_root [file normalize [file dirname [info script]]/..]
set digilent_boards [file join $repo_root tools vivado-boards new board_files]
if {![file isdirectory $digilent_boards]} {
    puts stderr "ERROR: Digilent board repo not found at $digilent_boards"
    puts stderr "       Clone with:  git clone --depth 1 https://github.com/Digilent/vivado-boards.git tools/vivado-boards"
    exit 1
}
set_param board.repoPaths $digilent_boards
puts "INFO: board.repoPaths -> $digilent_boards"

file mkdir $proj_dir
create_project -force $proj_name $proj_dir -part $part

# Diagnostic: list available board_parts after setting repoPaths
puts "DIAG: get_board_parts (filtered *zed*): [get_board_parts -filter {NAME =~ \"*zed*\"}]"
puts "DIAG: get_boards: [get_boards -filter {NAME =~ \"*zed*\"}]"
if {[catch {set_property board_part $board_part [current_project]} err]} {
    puts "ERROR: board_part '$board_part' not installed. Have the Digilent board files been copied?"
    puts "       Expected at ~/.Xilinx/Vivado/2025.2/xhub/board_store/board_files/zedboard/1.3/"
    puts "       Detail: $err"
    exit 1
}
puts "INFO: board_part set to $board_part"

# --------- Source HDL ----------------------------------------------------------
set rtl_files [list \
    rtl_stubs/stream_processing_top.v \
    rtl_stubs/streaming_nn_system.v \
    rtl_stubs/reconfigurable_nn_accelerator.v \
    rtl/ps_integration/axi_lite_ctrl_slave.v \
    rtl/ps_integration/axi_master_mem.v \
    rtl/ps_integration/dnn_accel_ps_top.v \
    rtl/ps_integration/hdmi_out.v \
]
foreach f $rtl_files {
    if {[file exists $f]} {
        add_files -norecurse $f
    } else {
        puts "INFO: $f not present yet — will need to be added when RTL is built"
    }
}

# Pick up any other RTL stubs the accelerator depends on. Exclude *_stub.sv
# files to avoid duplicate `module streaming_nn_system` declarations (the
# real implementation lives in streaming_nn_system.v).
if {[file isdirectory rtl_stubs]} {
    set extra_files [glob -nocomplain rtl_stubs/*.v rtl_stubs/*.sv]
    set extra_files [lsearch -all -inline -not $extra_files {*_stub.sv}]
    add_files -norecurse $extra_files
}

# Constraints
add_files -fileset constrs_1 -norecurse xdc/zedboard_ps.xdc
add_files -fileset constrs_1 -norecurse xdc/zedboard_hdmi.xdc

# --------- Block design --------------------------------------------------------
create_bd_design $bd_name
current_bd_design $bd_name

# Zynq PS
create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 ps7
apply_bd_automation -rule xilinx.com:bd_rule:processing_system7 \
    -config { make_external "FIXED_IO, DDR" \
              apply_board_preset "1" \
              Master "Disable" \
              Slave "Disable" } [get_bd_cells ps7]

# Now ONLY add the things our design needs on top of the canonical preset
# (which already configures DDR3, USB OTG, SDIO0, UART1, MIO, clocks, etc.
# correctly for ZedBoard). Don't override DDR/MIO — that was what was breaking
# the FSBL.
set_property -dict [list \
    CONFIG.PCW_USE_M_AXI_GP0           {1} \
    CONFIG.PCW_USE_S_AXI_HP0           {1} \
    CONFIG.PCW_S_AXI_HP0_DATA_WIDTH    {32} \
    CONFIG.PCW_USE_FABRIC_INTERRUPT    {1} \
    CONFIG.PCW_IRQ_F2P_INTR            {1} \
    CONFIG.PCW_FPGA0_PERIPHERAL_FREQMHZ {100} \
    CONFIG.PCW_EN_CLK0_PORT            {1} \
    CONFIG.PCW_USE_S_AXI_HP1           {1} \
    CONFIG.PCW_S_AXI_HP1_DATA_WIDTH    {32} \
    CONFIG.PCW_FPGA1_PERIPHERAL_FREQMHZ {25} \
    CONFIG.PCW_EN_CLK1_PORT            {1} \
] [get_bd_cells ps7]

# Accelerator hierarchy
create_bd_cell -type module -reference dnn_accel_ps_top accel

# HDMI scanout core
create_bd_cell -type module -reference hdmi_out hdmi

# AXI Interconnect: PS GP0 → accel ctrl (AXI-Lite, 32-bit)
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_ic_ctrl
set_property -dict [list CONFIG.NUM_MI {2} CONFIG.NUM_SI {1}] [get_bd_cells axi_ic_ctrl]

# AXI Interconnect: accel master → PS HP0 (AXI3 32-bit)
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_ic_mem
set_property -dict [list CONFIG.NUM_MI {1} CONFIG.NUM_SI {1}] [get_bd_cells axi_ic_mem]

# AXI Protocol Convert: AXI4 ↔ AXI-Lite on control side (safer than naked tie)
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_protocol_converter:2.1 axi_pc_ctrl
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_protocol_converter:2.1 axi_pc_hdmi

# AXI Interconnect: hdmi read master → PS HP1
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_ic_vid
set_property -dict [list CONFIG.NUM_MI {1} CONFIG.NUM_SI {1}] [get_bd_cells axi_ic_vid]

# Processor system reset
create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_sys

# --------- Wiring --------------------------------------------------------------
# Clocks
connect_bd_net [get_bd_pins ps7/FCLK_CLK0] [get_bd_pins ps7/M_AXI_GP0_ACLK]
connect_bd_net [get_bd_pins ps7/FCLK_CLK0] [get_bd_pins ps7/S_AXI_HP0_ACLK]
connect_bd_net [get_bd_pins ps7/FCLK_CLK0] [get_bd_pins rst_sys/slowest_sync_clk]
connect_bd_net [get_bd_pins ps7/FCLK_CLK0] [get_bd_pins axi_ic_ctrl/ACLK]
connect_bd_net [get_bd_pins ps7/FCLK_CLK0] [get_bd_pins axi_ic_ctrl/S00_ACLK]
connect_bd_net [get_bd_pins ps7/FCLK_CLK0] [get_bd_pins axi_ic_ctrl/M00_ACLK]
connect_bd_net [get_bd_pins ps7/FCLK_CLK0] [get_bd_pins axi_ic_mem/ACLK]
connect_bd_net [get_bd_pins ps7/FCLK_CLK0] [get_bd_pins axi_ic_mem/S00_ACLK]
connect_bd_net [get_bd_pins ps7/FCLK_CLK0] [get_bd_pins axi_ic_mem/M00_ACLK]
connect_bd_net [get_bd_pins ps7/FCLK_CLK0] [get_bd_pins axi_ic_ctrl/M01_ACLK]
connect_bd_net [get_bd_pins ps7/FCLK_CLK0] [get_bd_pins ps7/S_AXI_HP1_ACLK]
connect_bd_net [get_bd_pins ps7/FCLK_CLK0] [get_bd_pins axi_ic_vid/ACLK]
connect_bd_net [get_bd_pins ps7/FCLK_CLK0] [get_bd_pins axi_ic_vid/S00_ACLK]
connect_bd_net [get_bd_pins ps7/FCLK_CLK0] [get_bd_pins axi_ic_vid/M00_ACLK]
connect_bd_net [get_bd_pins ps7/FCLK_CLK0] [get_bd_pins axi_pc_ctrl/aclk]
connect_bd_net [get_bd_pins ps7/FCLK_CLK0] [get_bd_pins axi_pc_hdmi/aclk]
connect_bd_net [get_bd_pins ps7/FCLK_CLK0] [get_bd_pins accel/aclk]
connect_bd_net [get_bd_pins ps7/FCLK_CLK0] [get_bd_pins hdmi/aclk]
connect_bd_net [get_bd_pins ps7/FCLK_CLK1] [get_bd_pins hdmi/pixel_clk]

# Resets
connect_bd_net [get_bd_pins ps7/FCLK_RESET0_N] [get_bd_pins rst_sys/ext_reset_in]
connect_bd_net [get_bd_pins rst_sys/peripheral_aresetn] [get_bd_pins axi_ic_ctrl/ARESETN]
connect_bd_net [get_bd_pins rst_sys/peripheral_aresetn] [get_bd_pins axi_ic_ctrl/S00_ARESETN]
connect_bd_net [get_bd_pins rst_sys/peripheral_aresetn] [get_bd_pins axi_ic_ctrl/M00_ARESETN]
connect_bd_net [get_bd_pins rst_sys/peripheral_aresetn] [get_bd_pins axi_ic_mem/ARESETN]
connect_bd_net [get_bd_pins rst_sys/peripheral_aresetn] [get_bd_pins axi_ic_mem/S00_ARESETN]
connect_bd_net [get_bd_pins rst_sys/peripheral_aresetn] [get_bd_pins axi_ic_mem/M00_ARESETN]
connect_bd_net [get_bd_pins rst_sys/peripheral_aresetn] [get_bd_pins axi_ic_ctrl/M01_ARESETN]
connect_bd_net [get_bd_pins rst_sys/peripheral_aresetn] [get_bd_pins axi_ic_vid/ARESETN]
connect_bd_net [get_bd_pins rst_sys/peripheral_aresetn] [get_bd_pins axi_ic_vid/S00_ARESETN]
connect_bd_net [get_bd_pins rst_sys/peripheral_aresetn] [get_bd_pins axi_ic_vid/M00_ARESETN]
connect_bd_net [get_bd_pins rst_sys/peripheral_aresetn] [get_bd_pins axi_pc_ctrl/aresetn]
connect_bd_net [get_bd_pins rst_sys/peripheral_aresetn] [get_bd_pins axi_pc_hdmi/aresetn]
connect_bd_net [get_bd_pins rst_sys/peripheral_aresetn] [get_bd_pins accel/aresetn]
connect_bd_net [get_bd_pins rst_sys/peripheral_aresetn] [get_bd_pins hdmi/aresetn]

# AXI Lite path: PS M_AXI_GP0 → IC → Protocol Convert → accel
connect_bd_intf_net [get_bd_intf_pins ps7/M_AXI_GP0]       [get_bd_intf_pins axi_ic_ctrl/S00_AXI]
connect_bd_intf_net [get_bd_intf_pins axi_ic_ctrl/M00_AXI] [get_bd_intf_pins axi_pc_ctrl/S_AXI]
# We expose accel's s_axi_lite_* as a Lite interface; the protocol converter
# bridges from AXI4 (PS) to AXI4-Lite (accel).
connect_bd_intf_net [get_bd_intf_pins axi_pc_ctrl/M_AXI]   [get_bd_intf_pins accel/s_axi_lite]

# AXI HP path: accel master → IC → PS S_AXI_HP0
connect_bd_intf_net [get_bd_intf_pins accel/m_axi_hp]       [get_bd_intf_pins axi_ic_mem/S00_AXI]
connect_bd_intf_net [get_bd_intf_pins axi_ic_mem/M00_AXI]   [get_bd_intf_pins ps7/S_AXI_HP0]

# HDMI ctrl: 2nd master of ctrl IC → protocol conv → hdmi AXI-Lite
connect_bd_intf_net [get_bd_intf_pins axi_ic_ctrl/M01_AXI] [get_bd_intf_pins axi_pc_hdmi/S_AXI]
connect_bd_intf_net [get_bd_intf_pins axi_pc_hdmi/M_AXI]   [get_bd_intf_pins hdmi/s_axi_lite]

# HDMI framebuffer reads: hdmi read master → IC → PS S_AXI_HP1
connect_bd_intf_net [get_bd_intf_pins hdmi/m_axi_hp]       [get_bd_intf_pins axi_ic_vid/S00_AXI]
connect_bd_intf_net [get_bd_intf_pins axi_ic_vid/M00_AXI]  [get_bd_intf_pins ps7/S_AXI_HP1]

# Interrupt
connect_bd_net [get_bd_pins accel/irq_done] [get_bd_pins ps7/IRQ_F2P]

# Status LEDs out to top
create_bd_port -dir O -from 3 -to 0 leds
connect_bd_net [get_bd_pins accel/status_leds] [get_bd_ports leds]

# HDMI / VGA pins out to top
create_bd_port -dir O hdmi_clk
create_bd_port -dir O -from 15 -to 0 hdmi_d
create_bd_port -dir O hdmi_de
create_bd_port -dir O hdmi_hsync
create_bd_port -dir O hdmi_vsync
create_bd_port -dir IO hdmi_scl
create_bd_port -dir IO hdmi_sda
create_bd_port -dir O -from 3 -to 0 vga_r
create_bd_port -dir O -from 3 -to 0 vga_g
create_bd_port -dir O -from 3 -to 0 vga_b
create_bd_port -dir O vga_hsync
create_bd_port -dir O vga_vsync
foreach p {hdmi_clk hdmi_d hdmi_de hdmi_hsync hdmi_vsync hdmi_scl hdmi_sda \
           vga_r vga_g vga_b vga_hsync vga_vsync} {
    connect_bd_net [get_bd_pins hdmi/$p] [get_bd_ports $p]
}

# --------- Addressing ---------------------------------------------------------
assign_bd_address -target_address_space /ps7/Data \
    [get_bd_addr_segs {accel/s_axi_lite/reg0}] -force
set_property offset 0x43C00000 [get_bd_addr_segs ps7/Data/SEG_accel_reg0]
set_property range  64K        [get_bd_addr_segs ps7/Data/SEG_accel_reg0]

assign_bd_address -target_address_space /accel/m_axi_hp \
    [get_bd_addr_segs {ps7/S_AXI_HP0/HP0_DDR_LOWOCM}] -force

assign_bd_address -target_address_space /ps7/Data \
    [get_bd_addr_segs {hdmi/s_axi_lite/reg0}] -force
set_property offset 0x43C10000 [get_bd_addr_segs ps7/Data/SEG_hdmi_reg0]
set_property range  64K        [get_bd_addr_segs ps7/Data/SEG_hdmi_reg0]

assign_bd_address -target_address_space /hdmi/m_axi_hp \
    [get_bd_addr_segs {ps7/S_AXI_HP1/HP1_DDR_LOWOCM}] -force
# The HP slave segment is fixed at 0x0000_0000 / 512 MB by the PS; the master
# segment must mirror that. Software puts buffers at 0x1000_0000 inside that
# window (see DNN_DMA_POOL_BASE in dnn_accel.h).

# --------- Validate & wrap ---------------------------------------------------
regenerate_bd_layout
validate_bd_design
save_bd_design

make_wrapper -files [get_files ${proj_dir}/${proj_name}.srcs/sources_1/bd/${bd_name}/${bd_name}.bd] -top
add_files -norecurse  ${proj_dir}/${proj_name}.gen/sources_1/bd/${bd_name}/hdl/${bd_name}_wrapper.v
set_property top ${bd_name}_wrapper [current_fileset]
update_compile_order -fileset sources_1

# --------- Synth, impl, bitstream, hardware export ----------------------------
launch_runs synth_1 -jobs 4
wait_on_run synth_1

launch_runs impl_1 -to_step write_bitstream -jobs 4
wait_on_run impl_1

# Export hardware (.xsa) for PetaLinux/Vitis
write_hw_platform -fixed -force -file ${proj_dir}/${proj_name}.xsa

puts "=================================================================="
puts " Build done."
puts "   Project : ${proj_dir}/${proj_name}.xpr"
puts "   Bitstream: ${proj_dir}/${proj_name}.runs/impl_1/${bd_name}_wrapper.bit"
puts "   Hardware : ${proj_dir}/${proj_name}.xsa"
puts "=================================================================="
