# =============================================================================
# resume_build.tcl
#
# Re-launch synth + impl + bitgen + XSA export on an already-created Vivado
# project. Use after build_zynq_system.tcl has produced the project and the
# block design but before synth/impl completed (e.g. background was killed).
# =============================================================================

set proj_dir   "build/dnn_zynq_yolo"
set proj_name  "dnn_zynq_yolo"
set xpr        "${proj_dir}/${proj_name}.xpr"
set bd_name    "system"

if {![file exists $xpr]} {
    puts stderr "ERROR: project not found at $xpr"
    puts stderr "       Run build_zynq_system.tcl first."
    exit 1
}

open_project $xpr

# Reset any in-flight runs so we start cleanly
foreach run [list synth_1 impl_1] {
    if {[get_property STATUS [get_runs $run]] ne "Not started"} {
        puts "INFO: resetting $run"
        catch { reset_run $run }
    }
}

launch_runs synth_1 -jobs 1
wait_on_run synth_1

if {[get_property PROGRESS [get_runs synth_1]] ne "100%"} {
    puts stderr "ERROR: synth_1 did not complete; see runs/synth_1/runme.log"
    exit 1
}

launch_runs impl_1 -to_step write_bitstream -jobs 1
wait_on_run impl_1

if {[get_property PROGRESS [get_runs impl_1]] ne "100%"} {
    puts stderr "ERROR: impl_1 did not complete; see runs/impl_1/runme.log"
    exit 1
}

# Export hardware (.xsa) for Vitis
write_hw_platform -fixed -force -file ${proj_dir}/${proj_name}.xsa

puts ""
puts "================================================================="
puts " Build done."
puts "   Bitstream: ${proj_dir}/${proj_name}.runs/impl_1/${bd_name}_wrapper.bit"
puts "   Hardware : ${proj_dir}/${proj_name}.xsa"
puts "================================================================="
