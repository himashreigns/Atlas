# =============================================================================
# create_platform.tcl
#
# XSCT (Xilinx Software Command-line Tool) script to create a Vitis Classic
# platform project from the .xsa exported by build_zynq_system.tcl, and a
# standalone BSP domain for the Cortex-A9 #0.
#
# Run:
#     xsct software/vitis/scripts/create_platform.tcl
#
# Result:
#     software/vitis/workspace/dnn_platform/  (platform)
#     software/vitis/workspace/dnn_platform/export/dnn_platform/sw/...
# =============================================================================

# --- Paths --------------------------------------------------------------------
set repo_root  [file normalize [file dirname [info script]]/../../..]
set xsa_path   [file join $repo_root build dnn_zynq_yolo dnn_zynq_yolo.xsa]
set ws_dir     [file join $repo_root software vitis workspace]
set plat_name  "dnn_platform"
set proc_name  "ps7_cortexa9_0"
set os_name    "standalone"

if {![file exists $xsa_path]} {
    puts stderr "ERROR: XSA not found at $xsa_path"
    puts stderr "       Build it first:  vivado -mode batch -source scripts/build_zynq_system.tcl"
    exit 1
}

file mkdir $ws_dir
setws $ws_dir

# Wipe any previous platform with the same name so re-runs are deterministic
if {[file isdirectory [file join $ws_dir $plat_name]]} {
    puts "INFO: removing prior platform [file join $ws_dir $plat_name]"
    file delete -force [file join $ws_dir $plat_name]
}

# --- Platform & BSP -----------------------------------------------------------
platform create -name $plat_name -hw $xsa_path -proc $proc_name -os $os_name \
                -arch {32-bit} -fsbl-target $proc_name -out $ws_dir

platform active $plat_name

# Standalone domain config: enable the libraries we need
# - xilffs : SD card / FAT (optional, useful for dropping weight files)
# - xilusbps was renamed; the USB driver is "usbps" in the BSP. We pull it in
#   by enabling the USB0 instance, which is auto-detected from the hardware.
domain config -runtime cpp

# stdin/stdout default to the Zynq PS UART (ps7_uart_1) automatically;
# attempting to override via 'bsp config stdin ps7_uart_1' in 2025.2 fails
# because the UART is a sub-peripheral of the ps7 cell, not a top-level cell.

# Enable BSP libraries
bsp setlib -name xilffs
bsp config use_lfn 1
bsp regenerate

platform generate

puts ""
puts "================================================================="
puts "  Platform built : [file join $ws_dir $plat_name]"
puts "  Next step      : xsct scripts/create_app.tcl"
puts "================================================================="
