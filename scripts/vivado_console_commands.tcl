# =============================================================================
# vivado_console_commands.tcl
#
# Quick-reference commands for the Vivado Tcl console.
# These are meant to be pasted ONE AT A TIME into the Vivado GUI console
# (the panel at the bottom of the Vivado window), not run as a script.
#
# To open the Vivado Tcl console:  Window -> Tcl Console
# =============================================================================


# ---------------------------------------------------------------------------
# OPENING AN EXISTING PROJECT
# ---------------------------------------------------------------------------

# Open the project that vivado_start.tcl created:
open_project build/dnn_zedboard/dnn_zedboard.xpr


# ---------------------------------------------------------------------------
# RE-RUNNING INDIVIDUAL STEPS (after opening the project)
# ---------------------------------------------------------------------------

# Re-run synthesis only:
launch_runs synth_1 -jobs 4
wait_on_run synth_1

# Re-run implementation only (after synthesis is done):
launch_runs impl_1 -jobs 4
wait_on_run impl_1

# Re-run just the bitstream step (after implementation is done):
launch_runs impl_1 -to_step write_bitstream -jobs 4
wait_on_run impl_1


# ---------------------------------------------------------------------------
# READING TIMING RESULTS IN THE CONSOLE
# ---------------------------------------------------------------------------

# Open the implemented design so you can query timing:
open_run impl_1

# Get the Worst Negative Slack (WNS) — positive means timing passed:
get_property SLACK [get_timing_paths -setup -max_paths 1]

# Get the Worst Hold Slack (WHS):
get_property SLACK [get_timing_paths -hold -max_paths 1]

# Print the 5 worst setup paths to the console:
report_timing -setup -nworst 5

# Show which paths involve a specific cell (replace with your cell name):
report_timing -setup -through [get_cells "*mac_array*"] -nworst 5


# ---------------------------------------------------------------------------
# READING RESOURCE USAGE IN THE CONSOLE
# ---------------------------------------------------------------------------

# Print a utilization summary:
report_utilization

# Count how many LUTs are used:
set lut_count [llength [get_cells -hierarchical -filter {REF_NAME =~ LUT*}]]
puts "LUTs used: $lut_count"

# Count how many FFs are used:
set ff_count [llength [get_cells -hierarchical -filter {REF_NAME =~ FD*}]]
puts "FFs used: $ff_count"


# ---------------------------------------------------------------------------
# PROGRAMMING THE BOARD FROM THE GUI CONSOLE
# ---------------------------------------------------------------------------

# Connect to the board:
open_hw_manager
connect_hw_server
open_hw_target

# See what's on the JTAG chain:
get_hw_devices

# Program the device (adjust device name if needed):
set_property PROGRAM.FILE {build/zedboard_top.bit} [get_hw_devices xc7z020_1]
program_hw_devices [get_hw_devices xc7z020_1]

# Done — close the hardware manager:
close_hw_manager


# ---------------------------------------------------------------------------
# USEFUL ONE-LINERS
# ---------------------------------------------------------------------------

# Check if the current design has timing violations:
set wns [get_property SLACK [get_timing_paths -setup -max_paths 1]]
puts [expr {$wns >= 0 ? "Timing PASSED (WNS = $wns ns)" : "Timing FAILED (WNS = $wns ns)"}]

# Save the current state as a checkpoint:
write_checkpoint -force build/my_checkpoint.dcp

# Reload a checkpoint you saved earlier:
open_checkpoint build/my_checkpoint.dcp

# List all the clocks in the design:
report_clocks

# Find all paths longer than 8 ns:
report_timing -setup -delay_type max -max_paths 20 \
    -filter {SLACK < 2.0}

# See how much slack you have on a specific clock:
report_timing -setup -nworst 1 -sort_by slack
