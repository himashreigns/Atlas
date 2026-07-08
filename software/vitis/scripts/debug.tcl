# =============================================================================
# debug.tcl  (XSDB)
#
# Like program_and_run.tcl, but stops at main() and sets useful breakpoints
# for stepping through accelerator bring-up.
#
# Run:
#     xsdb -interactive software/vitis/scripts/debug.tcl
#
# Useful XSDB commands once stopped:
#   bplist            — list breakpoints
#   stop              — halt the target
#   con               — continue
#   stp               — step in
#   nxt               — step over
#   bt                — backtrace
#   locals            — show locals
#   rrd               — dump CPU registers
#   mrd 0x43C00000 8  — read 8 words from accel base
#   mwr 0x43C00000 1  — write 1 to CTRL (start)
# =============================================================================

set repo_root [file normalize [file dirname [info script]]/../../..]
set ws        [file join $repo_root software vitis workspace]
set app       "dnn_yolo_app"
set plat      "dnn_platform"
set bit       [file join $repo_root build dnn_zynq_yolo dnn_zynq_yolo.runs impl_1 system_wrapper.bit]
set ps_init   [file join $ws $plat hw ps7_init.tcl]
set elf_dbg   [file join $ws $app Debug ${app}.elf]
set elf_rel   [file join $ws $app Release ${app}.elf]

set elf $elf_dbg
if {![file exists $elf]} { set elf $elf_rel }
if {![file exists $elf]} { puts stderr "ERROR: no ELF found"; exit 1 }

connect
targets -set -filter {name =~ "ARM*#0"}
rst -system
source $ps_init
ps7_init
ps7_post_config

fpga $bit
dow $elf

# Set instructive breakpoints
bpadd -addr main
bpadd -addr dnn_accel_init
bpadd -addr dnn_accel_run_inference
bpadd -addr yolo_post_decode

puts "[xsdb] breakpoints armed:"
bplist
puts ""
puts "[xsdb] use 'con' to run; CPU will halt at main() first."
puts "[xsdb] After main() hits: 'mrd 0x43C00000 4' to read CTRL/STATUS/CONFIG."

con
