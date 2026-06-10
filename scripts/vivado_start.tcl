# =============================================================================
# vivado_start.tcl
#
# Beginner-friendly Vivado script for the DNN accelerator on the ZedBoard.
#
# What this script does (in order):
#   1.  Creates a Vivado project you can also open in the GUI
#   2.  Adds your RTL source files
#   3.  Adds the XDC pin/timing constraints
#   4.  Runs Synthesis  (RTL -> gates)
#   5.  Runs Implementation  (gates -> placed & routed on the FPGA fabric)
#   6.  Checks timing  (tells you if 100 MHz is achievable)
#   7.  Writes reports  (utilization, power, timing)
#   8.  Generates the bitstream  (.bit file you program onto the board)
#
# HOW TO RUN (batch mode — no GUI window):
#   cd dnn_opt
#   vivado -mode batch -source scripts/vivado_start.tcl
#
# HOW TO RUN (GUI mode — opens Vivado window, runs in background):
#   vivado -mode gui -source scripts/vivado_start.tcl
#
# HOW TO OPEN THE PROJECT LATER IN THE GUI:
#   vivado build/dnn_zedboard/dnn_zedboard.xpr
#
# AFTER THIS SCRIPT FINISHES, check:
#   build/dnn_zedboard/reports/timing_summary.rpt  <- did timing pass?
#   build/dnn_zedboard/reports/utilization.rpt     <- how full is the FPGA?
#   build/dnn_zedboard/dnn_zedboard.runs/impl_1/zedboard_top.bit  <- bitstream
# =============================================================================

# Turn off line-by-line echoing so only our puts messages appear
set ::tcl_interactive 0

# ---------------------------------------------------------------------------
# Configuration — edit these if your file names or paths differ
# ---------------------------------------------------------------------------

# Vivado project name and location
set PROJECT_NAME  "dnn_zedboard"
set PROJECT_DIR   "build/dnn_zedboard"

# Target FPGA part (ZedBoard = XC7Z020-CLG484, speed grade -1)
set FPGA_PART     "xc7z020clg484-1"

# Top-level module name (must match the module name in your RTL)
set TOP_MODULE    "zedboard_top"

# RTL source files — all your .v / .sv files
# These are the real accelerator RTL files from your design.
# zedboard_top.sv is the board wrapper that ties everything to the ZedBoard pins.
set RTL_FILES {
    rtl_stubs/dynamic_interconnect.v
    rtl_stubs/mac_array.v
    rtl_stubs/mac_array_stage_with_bram.v
    rtl_stubs/mac_stage.v
    rtl_stubs/nn_layer_control_unit.v
    rtl_stubs/reconfigurable_nn_accelerator.v
    rtl_stubs/runtime_resource_manager.v
    rtl_stubs/streaming_nn_layer_stage.v
    rtl_stubs/streaming_nn_pipeline.v
    rtl_stubs/streaming_nn_system.v
    rtl_stubs/streaming_row_buffer.v
    rtl_stubs/stream_processing_top.v
}

# Header/include directories (for `include "dnn_config.vh")
set INCLUDE_DIRS {
    sim
}

# Constraints file
set XDC_FILE "xdc/zedboard.xdc"

# Where reports will be written
set REPORT_DIR "build/dnn_zedboard/reports"

# ---------------------------------------------------------------------------
# Helper: print a clearly visible section banner
# ---------------------------------------------------------------------------
proc banner {msg} {
    puts ""
    puts "============================================================"
    puts "  $msg"
    puts "============================================================"
}

# ---------------------------------------------------------------------------
# Helper: check a condition and exit with a clear message if it fails
# ---------------------------------------------------------------------------
proc require {condition message} {
    if {![uplevel 1 [list expr $condition]]} {
        puts ""
        puts "ERROR: $message"
        puts "       Fix the issue above and re-run this script."
        puts ""
        exit 1
    }
}

# ---------------------------------------------------------------------------
# Helper: run a command and catch errors so we get a readable message
# ---------------------------------------------------------------------------
proc safe_run {cmd description} {
    puts "  -> $description..."
    if {[catch {uplevel 1 $cmd} err]} {
        puts ""
        puts "ERROR during: $description"
        puts "Details: $err"
        puts ""
        puts "TIP: Open the project in the GUI to see the full error:"
        puts "     vivado build/dnn_zedboard/dnn_zedboard.xpr"
        exit 1
    }
}

# ===========================================================================
# PRE-FLIGHT CHECKS
# ===========================================================================
banner "Step 0: Pre-flight checks"

# Check all RTL files exist before we start
foreach f $RTL_FILES {
    if {![file exists $f]} {
        puts "ERROR: RTL file not found: $f"
        puts ""
        puts "Make sure you are running this script from the dnn_opt directory:"
        puts "   cd dnn_opt"
        puts "   vivado -mode batch -source scripts/vivado_start.tcl"
        exit 1
    }
    puts "  OK  $f"
}

# Check constraints file
if {![file exists $XDC_FILE]} {
    puts "ERROR: Constraints file not found: $XDC_FILE"
    exit 1
}
puts "  OK  $XDC_FILE"

# Check dnn_config.vh exists (generated by the optimizer)
if {![file exists "sim/dnn_config.vh"]} {
    puts ""
    puts "ERROR: sim/dnn_config.vh not found."
    puts "       Run the optimizer first:"
    puts "         python3 dnn_optimizer.py --dnn lenet5 --area-budget 180 \\"
    puts "             --power-budget 2000 --objective latency \\"
    puts "             --out-header sim/dnn_config.vh -v"
    exit 1
}
puts "  OK  sim/dnn_config.vh"

puts ""
puts "  All pre-flight checks passed."

# ===========================================================================
# STEP 1: CREATE THE VIVADO PROJECT
# ===========================================================================
banner "Step 1: Creating Vivado project"

# Create the output directories
file mkdir $PROJECT_DIR
file mkdir $REPORT_DIR

# Create a project-mode project (produces a .xpr file you can open in the GUI)
# -force overwrites if the project already exists
puts "  -> Creating project: $PROJECT_DIR/$PROJECT_NAME.xpr"
create_project -force $PROJECT_NAME $PROJECT_DIR -part $FPGA_PART

# Tell Vivado we're writing Verilog/SystemVerilog (not VHDL)
set_property target_language Verilog [current_project]

# Enable SystemVerilog 2012 parsing
set_property default_lib work [current_project]

puts "  -> Project created: $PROJECT_DIR/$PROJECT_NAME.xpr"
puts ""
puts "  TIP: You can open this project in the Vivado GUI at any time:"
puts "       vivado $PROJECT_DIR/$PROJECT_NAME.xpr"

# ===========================================================================
# STEP 2: ADD SOURCE FILES
# ===========================================================================
banner "Step 2: Adding source files"

foreach f $RTL_FILES {
    puts "  Adding: $f"
    add_files -norecurse $f
}

# Add the top-level SV wrapper (zedboard_top.sv).
# .sv files are automatically treated as SystemVerilog by Vivado.
puts "  Adding: rtl_stubs/zedboard_top.sv"
add_files -norecurse rtl_stubs/zedboard_top.sv

# Add include/header directories
foreach d $INCLUDE_DIRS {
    puts "  Adding include dir: $d"
}
set_property include_dirs $INCLUDE_DIRS [current_fileset]

# Add the constraints (XDC)
puts "  Adding constraints: $XDC_FILE"
add_files -fileset constrs_1 -norecurse $XDC_FILE

# Set the top module
set_property top $TOP_MODULE [current_fileset]

puts ""
puts "  [llength $RTL_FILES] source file(s) added."
puts "  Top module: $TOP_MODULE"

# ===========================================================================
# STEP 3: SYNTHESIS
# ===========================================================================
# Synthesis converts your RTL (SystemVerilog) into a netlist of logic gates.
# This is the first stage where Vivado checks that your code is synthesisable.
# Common errors here: undefined signals, unsupported constructs, missing files.
# ===========================================================================
banner {Step 3: Synthesis  (RTL -> gates)  ~2-5 minutes}

puts "  This converts your SystemVerilog into a gate-level netlist."
puts "  Watch for any CRITICAL WARNING messages — they usually indicate"
puts "  real problems in your RTL."
puts ""

safe_run {
    synth_design \
        -top      $TOP_MODULE  \
        -part     $FPGA_PART   \
        -flatten_hierarchy rebuilt
} "Running synthesis"

# Save a checkpoint so you can reload this stage without re-running synthesis
write_checkpoint -force "$PROJECT_DIR/post_synth.dcp"
puts "  Checkpoint saved: $PROJECT_DIR/post_synth.dcp"

# Quick utilization report after synthesis (before placement)
report_utilization -file "$REPORT_DIR/utilization_synth.rpt"
puts "  Report written:   $REPORT_DIR/utilization_synth.rpt"

puts ""
puts "  Synthesis complete."

# ===========================================================================
# STEP 4: IMPLEMENTATION  (place & route)
# ===========================================================================
# Implementation takes the gate netlist and physically places each logic cell
# onto the FPGA fabric, then routes the wires between them.
# This is the slowest step — typically 5-15 minutes for a design this size.
# ===========================================================================
banner {Step 4: Implementation  (place & route)  ~5-15 minutes}

puts "  opt_design   : removing redundant logic..."
safe_run { opt_design } "opt_design"

puts "  place_design : placing cells onto the FPGA fabric..."
safe_run { place_design } "place_design"

puts "  phys_opt     : physical optimisation after placement..."
safe_run { phys_opt_design } "phys_opt_design"

puts "  route_design : routing wires between cells..."
safe_run { route_design } "route_design"

# Save post-implementation checkpoint
write_checkpoint -force "$PROJECT_DIR/post_impl.dcp"
puts "  Checkpoint saved: $PROJECT_DIR/post_impl.dcp"

puts ""
puts "  Implementation complete."

# ===========================================================================
# STEP 5: TIMING ANALYSIS
# ===========================================================================
# The most important step — did your design meet the 100 MHz clock constraint?
#
# WNS (Worst Negative Slack):
#   Positive = timing MET.  The slowest path still has margin to spare.
#   Negative = timing FAILED.  At least one path is too slow for 100 MHz.
#
# WHS (Worst Hold Slack):
#   Should always be positive after implementation.
# ===========================================================================
banner "Step 5: Timing analysis"

# Full timing summary
report_timing_summary \
    -warn_on_violation \
    -file "$REPORT_DIR/timing_summary.rpt"

# Top 10 worst setup paths (most useful for debugging failures)
report_timing \
    -setup \
    -nworst 10 \
    -path_type full_clock_expanded \
    -file "$REPORT_DIR/timing_setup_worst10.rpt"

# Top 10 worst hold paths
report_timing \
    -hold  \
    -nworst 10 \
    -file "$REPORT_DIR/timing_hold_worst10.rpt"

# Read the WNS and WHS values and print a clear pass/fail message
set wns [get_property SLACK [get_timing_paths -setup -max_paths 1]]
set whs [get_property SLACK [get_timing_paths -hold  -max_paths 1]]

puts ""
puts "  +-----------------------------------------+"
puts "  |  TIMING RESULT                          |"
puts "  +-----------------------------------------+"
puts [format "  |  WNS (setup) : %8.3f ns  %-11s|" $wns \
    [expr {$wns >= 0 ? "PASS ✓" : "FAIL ✗"}]]
puts [format "  |  WHS (hold)  : %8.3f ns  %-11s|" $whs \
    [expr {$whs >= 0 ? "PASS ✓" : "FAIL ✗"}]]
puts "  +-----------------------------------------+"

if {$wns < 0} {
    puts ""
    puts "  TIMING NOT MET.  Suggestions:"
    puts "   1. Relax the clock: change -period 10.000 to -period 12.000"
    puts "      in xdc/zedboard.xdc  (83 MHz instead of 100 MHz)"
    puts "   2. Open the timing report to find the failing path:"
    puts "      $REPORT_DIR/timing_setup_worst10.rpt"
    puts "   3. Open the project in the GUI for interactive analysis:"
    puts "      vivado $PROJECT_DIR/$PROJECT_NAME.xpr"
    puts "      Then: Reports -> Timing -> Report Timing Summary"
}

# ===========================================================================
# STEP 6: RESOURCE REPORTS
# ===========================================================================
banner "Step 6: Resource and power reports"

report_utilization    -file "$REPORT_DIR/utilization_impl.rpt"
report_clock_utilization -file "$REPORT_DIR/clock_utilization.rpt"
report_power          -file "$REPORT_DIR/power.rpt"
report_drc            -file "$REPORT_DIR/drc.rpt"

puts "  Reports written to: $REPORT_DIR/"
puts ""

# Print a quick utilization summary to the console
puts "  Quick summary (see utilization_impl.rpt for full detail):"
puts "  -> Check: $REPORT_DIR/utilization_impl.rpt"
puts "  -> Check: $REPORT_DIR/power.rpt"

# ===========================================================================
# STEP 7: GENERATE BITSTREAM
# ===========================================================================
# The bitstream is the binary file that programs the FPGA.
# Without a timing failure you can still generate the bitstream — but a
# design with negative slack may behave incorrectly on the board.
# ===========================================================================
banner {Step 7: Generating bitstream  ~1-3 minutes}

if {$wns < 0} {
    puts "  WARNING: Generating bitstream despite timing violation."
    puts "           The design may not work correctly on the board."
    puts "           Fix timing before programming for reliable operation."
    puts ""
}

set bit_file "$PROJECT_DIR/$PROJECT_NAME.runs/impl_1/${TOP_MODULE}.bit"

safe_run {
    write_bitstream -force $bit_file
} "Writing bitstream"

puts ""
puts "  Bitstream written: $bit_file"

# Also copy to a convenient top-level location
file copy -force $bit_file "build/zedboard_top.bit"
puts "  Also copied to:    build/zedboard_top.bit"

# ===========================================================================
# DONE
# ===========================================================================
banner "Build complete"

puts "  Project:      $PROJECT_DIR/$PROJECT_NAME.xpr"
puts "  Bitstream:    build/zedboard_top.bit"
puts "  Reports:      $REPORT_DIR/"
puts ""
puts "  Key reports to check:"
puts "    timing_summary.rpt       <- did 100 MHz timing pass?"
puts "    utilization_impl.rpt     <- how much of the FPGA is used?"
puts "    power.rpt                <- estimated power consumption"
puts ""
puts "  To open the project in the Vivado GUI:"
puts "    vivado $PROJECT_DIR/$PROJECT_NAME.xpr"
puts ""
puts "  To program the board, run:"
puts "    vivado -mode batch -source scripts/vivado_program.tcl"
puts ""

# Print final timing verdict one more time so it's easy to see
if {$wns >= 0 && $whs >= 0} {
    puts "  TIMING: PASSED  (WNS=$wns ns, WHS=$whs ns)"
} else {
    puts "  TIMING: FAILED  (WNS=$wns ns, WHS=$whs ns)"
    puts "  See $REPORT_DIR/timing_setup_worst10.rpt for the failing paths."
}
puts ""
