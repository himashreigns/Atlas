# =============================================================================
# vivado_program.tcl
#
# Programs the ZedBoard with the generated bitstream.
#
# BEFORE RUNNING:
#   1. Connect the ZedBoard's JTAG USB cable to your PC
#      (the micro-USB port labeled "PROG/UART" — NOT the USB-OTG port)
#   2. Power on the ZedBoard (flip the power switch)
#   3. Make sure you have already run vivado_start.tcl to generate the .bit
#
# HOW TO RUN:
#   vivado -mode batch -source scripts/vivado_program.tcl
# =============================================================================

set BIT_FILE "build/zedboard_top.bit"

# ---------------------------------------------------------------------------
proc banner {msg} {
    puts ""
    puts "============================================================"
    puts "  $msg"
    puts "============================================================"
}

# ---------------------------------------------------------------------------
banner "ZedBoard Programming"

# Check the bitstream exists
if {![file exists $BIT_FILE]} {
    puts "ERROR: Bitstream not found: $BIT_FILE"
    puts ""
    puts "Run the build first:"
    puts "  vivado -mode batch -source scripts/vivado_start.tcl"
    exit 1
}
puts "  Bitstream: $BIT_FILE"

# ---------------------------------------------------------------------------
banner "Step 1: Connecting to hardware"

puts "  Opening hardware manager..."
open_hw_manager

puts "  Connecting to local hardware server..."
if {[catch {connect_hw_server -allow_non_jtag} err]} {
    puts ""
    puts "ERROR: Could not connect to hardware server."
    puts "       Is the ZedBoard plugged in and powered on?"
    puts "       Details: $err"
    exit 1
}

puts "  Opening hardware target (looking for JTAG chain)..."
if {[catch {open_hw_target} err]} {
    puts ""
    puts "ERROR: No hardware target found."
    puts "       Check:"
    puts "         1. The JTAG USB cable is connected (labeled PROG/UART)"
    puts "         2. The ZedBoard power switch is ON"
    puts "         3. The correct USB driver is installed"
    puts "            (Vivado installs this automatically on first run)"
    puts "       Details: $err"
    exit 1
}

# Show what's on the JTAG chain
set devices [get_hw_devices]
puts ""
puts "  Devices found on JTAG chain:"
foreach d $devices {
    puts "    $d"
}

# ---------------------------------------------------------------------------
banner "Step 2: Selecting the Zynq device"

# The ZedBoard has a Zynq XC7Z020 — select it
set zynq_device ""
foreach d $devices {
    if {[string match "*xc7z020*" [string tolower $d]]} {
        set zynq_device $d
        break
    }
}

if {$zynq_device eq ""} {
    # If pattern match fails, just take the first device
    set zynq_device [lindex $devices 0]
    puts "  Warning: Could not find XC7Z020 by name, using: $zynq_device"
} else {
    puts "  Selected: $zynq_device"
}

current_hw_device $zynq_device
refresh_hw_device $zynq_device

# ---------------------------------------------------------------------------
banner "Step 3: Programming"

puts "  Loading bitstream: $BIT_FILE"
set_property PROGRAM.FILE $BIT_FILE [current_hw_device]

puts "  Programming the device... (this takes about 10 seconds)"
if {[catch {program_hw_devices [current_hw_device]} err]} {
    puts ""
    puts "ERROR: Programming failed."
    puts "       Try power-cycling the ZedBoard and running this script again."
    puts "       Details: $err"
    exit 1
}

# ---------------------------------------------------------------------------
banner "Done"

puts "  ZedBoard programmed successfully!"
puts ""
puts "  What you should see on the board:"
puts "    LD7 blinking  : heartbeat (~1.5 Hz) — clock is running"
puts "    LD0 lit       : system_ready — design is waiting for input"
puts ""
puts "  Controls:"
puts "    SW1 toggle    : load weights"
puts "    SW0 toggle    : start inference"
puts "    BTNC          : reset"
puts ""

close_hw_manager
