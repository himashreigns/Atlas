# =============================================================================
# program_and_run.tcl  (XSDB script)
#
# Connect over JTAG, init the PS, program the bitstream, download the .elf
# to the A9, and run.  The serial console output appears on /dev/ttyACM0
# (115200 8N1).
#
# Run:
#     xsdb software/vitis/scripts/program_and_run.tcl
# =============================================================================

set repo_root [file normalize [file dirname [info script]]/../../..]
set ws        [file join $repo_root software vitis workspace]
set app       "dnn_yolo_app"
set plat      "dnn_platform"
set bit       [file join $repo_root build dnn_zynq_yolo dnn_zynq_yolo.runs impl_1 system_wrapper.bit]
set ps_init   [file join $ws $plat hw ps7_init.tcl]
set elf_rel   [file join $ws $app Release ${app}.elf]
set elf_dbg   [file join $ws $app Debug   ${app}.elf]

set elf $elf_rel
if {![file exists $elf]} { set elf $elf_dbg }
if {![file exists $elf]} {
    puts stderr "ERROR: app ELF not found ($elf_rel or $elf_dbg). Run create_app.tcl first."
    exit 1
}
if {![file exists $bit]} {
    puts stderr "ERROR: bitstream not found ($bit). Run build_zynq_system.tcl first."
    exit 1
}
if {![file exists $ps_init]} {
    puts stderr "ERROR: ps7_init.tcl missing under platform. Re-run create_platform.tcl."
    exit 1
}

puts "[xsdb] connecting to hw_server..."
connect

# Target Cortex-A9 #0
targets -set -filter {name =~ "ARM*#0"}

puts "[xsdb] resetting PS and initialising..."
rst -system
source $ps_init
ps7_init
ps7_post_config

puts "[xsdb] programming bitstream: $bit"
fpga $bit

puts "[xsdb] downloading ELF: $elf"
dow $elf

puts "[xsdb] starting CPU."
con

# Stay attached so the user can hit ctrl-c, then `stop`, `bt`, etc.
# (Comment the next line out if you prefer XSDB to exit immediately.)
after 500
puts "[xsdb] CPU is running. Attach `picocom -b 115200 /dev/ttyACM0` to view UART."
puts "[xsdb] Use 'stop' here for a JTAG halt, 'bt' for backtrace, 'rrd' to dump regs."
