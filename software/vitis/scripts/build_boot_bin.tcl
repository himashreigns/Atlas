# =============================================================================
# build_boot_bin.tcl  (XSCT)
#
# Stitches the FSBL, bitstream and application ELF into a single BOOT.BIN
# that ZedBoard's BootROM will load from the SD card.
#
# Output:
#     software/vitis/workspace/BOOT.BIN
#
# Run (after create_platform.tcl + create_app.tcl + Vivado synth):
#     xsct software/vitis/scripts/build_boot_bin.tcl
# =============================================================================

set repo_root [file normalize [file dirname [info script]]/../../..]
set ws        [file join $repo_root software vitis workspace]
set app       "dnn_yolo_app"
set plat      "dnn_platform"

# --- locate inputs ------------------------------------------------------------
set fsbl_candidates [list \
    [file join $ws $plat export $plat sw $plat boot fsbl.elf] \
    [file join $ws $plat sw $plat boot fsbl.elf] \
    [file join $ws ${plat}_fsbl Debug ${plat}_fsbl.elf] \
]
set fsbl_elf ""
foreach c $fsbl_candidates {
    if {[file exists $c]} { set fsbl_elf $c; break }
}
if {$fsbl_elf eq ""} {
    puts stderr "ERROR: fsbl.elf not found. Searched:"
    foreach c $fsbl_candidates { puts stderr "  $c" }
    puts stderr "Tip: open the platform in Vitis IDE once and click 'Generate' so the"
    puts stderr "      FSBL ELF is built under the platform's boot/ folder."
    exit 1
}

set bit [file join $repo_root build dnn_zynq_yolo dnn_zynq_yolo.runs impl_1 system_wrapper.bit]
if {![file exists $bit]} {
    puts stderr "ERROR: bitstream not found at $bit"
    puts stderr "       Build it: vivado -mode batch -source scripts/build_zynq_system.tcl"
    exit 1
}

set app_elf [file join $ws $app Release ${app}.elf]
if {![file exists $app_elf]} { set app_elf [file join $ws $app Debug ${app}.elf] }
if {![file exists $app_elf]} {
    puts stderr "ERROR: app ELF not found. Run create_app.tcl."
    exit 1
}

# --- materialise the .bif -----------------------------------------------------
set bif_tmpl [file join [file dirname [info script]] boot.bif.tmpl]
set bif_out  [file join $ws boot.bif]
set boot_bin [file join $ws BOOT.BIN]

set f  [open $bif_tmpl r]
set txt [read $f]
close $f

set txt [string map [list \
    "@FSBL_ELF@"  $fsbl_elf \
    "@BITSTREAM@" $bit      \
    "@APP_ELF@"   $app_elf  \
] $txt]

set f [open $bif_out w]
puts -nonewline $f $txt
close $f

puts "[xsct] generated $bif_out:"
puts $txt

# --- invoke bootgen -----------------------------------------------------------
# bootgen is on PATH inside an XSCT shell. -arch zynq for Zynq-7000.
if {[file exists $boot_bin]} { file delete $boot_bin }
puts "[xsct] running bootgen..."
exec bootgen -arch zynq -image $bif_out -o $boot_bin -w on

if {![file exists $boot_bin]} {
    puts stderr "ERROR: bootgen did not produce BOOT.BIN"
    exit 1
}

set bytes [file size $boot_bin]
puts ""
puts "================================================================="
puts "  BOOT.BIN built: $boot_bin"
puts "  Size          : $bytes bytes ([expr {$bytes / 1024}] KB)"
puts ""
puts "  Next step:"
puts "    ./software/vitis/scripts/sd_copy.sh /run/media/<user>/<label>"
puts "  Then set ZedBoard JP7..11 = (GND, GND, 3V3, 3V3, GND) for SD boot."
puts "================================================================="
