# Incremental rebuild: open existing Vivado project, reset synth/impl runs,
# re-run with the updated streaming_nn_layer_stage.v.
# Usage: vivado -mode batch -source scripts/rebuild_zynq_system.tcl

set proj_dir  "build/dnn_zynq_yolo"
set proj_name "dnn_zynq_yolo"
set bd_name   "system"

open_project ${proj_dir}/${proj_name}.xpr

# Disable incremental synthesis — a deleted DCP causes launch_runs to error
# out, and we want a full re-synth anyway when RTL changes.
set_property incremental_checkpoint {} [get_runs synth_1]

# Reset top-level AND every OOC sub-run so cached synth of the accel block
# (which contains streaming_nn_layer_stage) is rebuilt from current RTL.
reset_run impl_1
reset_run synth_1
foreach r [get_runs *_synth_1] {
    if {$r ne "synth_1"} {
        puts "Resetting OOC run: $r"
        reset_run $r
    }
}

launch_runs synth_1 -jobs 4
wait_on_run synth_1

launch_runs impl_1 -to_step write_bitstream -jobs 4
wait_on_run impl_1

write_hw_platform -fixed -force -file ${proj_dir}/${proj_name}.xsa

puts "=================================================================="
puts " Rebuild done."
puts "   Bitstream: ${proj_dir}/${proj_name}.runs/impl_1/${bd_name}_wrapper.bit"
puts "   Hardware : ${proj_dir}/${proj_name}.xsa"
puts "=================================================================="
