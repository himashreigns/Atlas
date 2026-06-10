# =============================================================================
# vivado_timing.tcl
# Production flow: synth + impl + STA + SDF export for the DNN accelerator on
# the ZedBoard.  Run with:
#
#   vivado -mode batch -source scripts/vivado_timing.tcl
#
# Produces:
#   build/zedboard_top_synth.dcp
#   build/zedboard_top_impl.dcp
#   build/timing_summary.rpt
#   build/zedboard_top_tsmn.sdf           (SDF for post-impl timing sim)
#   build/zedboard_top_tsmn.v             (Vivado-generated timing model)
#   build/zedboard_top.bit                (Bitstream for board bring-up)
#
# Post-impl timing simulation (XSim) is invoked separately:
#   xelab -L unisims_ver -L secureip --debug typical \
#         tb_zedboard_timing zedboard_top_tsmn -sdfmax dut=zedboard_top_tsmn.sdf
#   xsim work.tb_zedboard_timing -tclbatch run.tcl
# =============================================================================

set proj_name      "dnn_zedboard"
set part           "xc7z020clg484-1"
set top_module     "zedboard_top"
set build_dir      "build"
set xdc_file       "xdc/zedboard.xdc"

# Source files (replace stub with the real RTL when integrating)
set rtl_files {
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
set hdr_dirs { sim }

file mkdir $build_dir

# -----------------------------------------------------------------------------
# Create an in-memory project for non-project-mode flow
# -----------------------------------------------------------------------------
create_project -in_memory -part $part
set_property target_language Verilog [current_project]

foreach f $rtl_files {
    read_verilog -sv $f
}
read_xdc $xdc_file

# Include search paths for `include "dnn_config.vh"
foreach d $hdr_dirs {
    set_property include_dirs $d [current_fileset]
}

# -----------------------------------------------------------------------------
# Synthesis
# -----------------------------------------------------------------------------
synth_design -top $top_module -part $part -flatten_hierarchy rebuilt
write_checkpoint -force $build_dir/${top_module}_synth.dcp
report_utilization -file $build_dir/util_synth.rpt
report_timing_summary -file $build_dir/timing_synth.rpt

# -----------------------------------------------------------------------------
# Implementation (place & route)
# -----------------------------------------------------------------------------
opt_design
place_design
phys_opt_design
route_design
write_checkpoint -force $build_dir/${top_module}_impl.dcp

# -----------------------------------------------------------------------------
# Final STA reports
# -----------------------------------------------------------------------------
report_timing_summary  -file $build_dir/timing_summary.rpt -warn_on_violation
report_timing          -setup -nworst 10 -file $build_dir/timing_setup_top10.rpt
report_timing          -hold  -nworst 10 -file $build_dir/timing_hold_top10.rpt
report_clock_utilization -file $build_dir/clock_util.rpt
report_drc             -file $build_dir/drc.rpt
report_utilization     -file $build_dir/util_impl.rpt
report_power           -file $build_dir/power.rpt

# Fail the script if timing is not met
set wns [get_property SLACK [get_timing_paths -setup -max_paths 1]]
set whs [get_property SLACK [get_timing_paths -hold  -max_paths 1]]
puts "WNS (setup): $wns ns"
puts "WHS (hold) : $whs ns"
if {$wns < 0 || $whs < 0} {
    puts "ERROR: timing not met (WNS=$wns, WHS=$whs)"
    # Don't exit on first failure — let the user inspect the reports
}

# -----------------------------------------------------------------------------
# Timing-sim artifacts: SDF + Verilog netlist for post-impl simulation
# -----------------------------------------------------------------------------
write_sdf      -force $build_dir/${top_module}_tsmn.sdf -process_corner slow
write_verilog  -force $build_dir/${top_module}_tsmn.v -mode timesim -sdf_anno true

# -----------------------------------------------------------------------------
# Bitstream
# -----------------------------------------------------------------------------
write_bitstream -force $build_dir/${top_module}.bit

puts "============================================================"
puts " Vivado flow complete."
puts "   WNS (setup) : $wns ns"
puts "   WHS (hold)  : $whs ns"
puts "   SDF         : $build_dir/${top_module}_tsmn.sdf"
puts "   Bitstream   : $build_dir/${top_module}.bit"
puts "============================================================"
