# Simulation Script for mac_stage unit test
set project_dir "./vivado_project"
set project_name "stream_processing_final"
set tb_file "tb/tb_mac_stage.v"

if {![file exists "$project_dir/${project_name}.xpr"]} {
    puts "ERROR: Project not found. Run create_project.tcl first."
    return
}

puts "Opening project..."
open_project "$project_dir/${project_name}.xpr"

puts "Adding mac_stage testbench to simulation fileset..."
if {[file exists $tb_file]} {
    add_files -fileset sim_1 $tb_file
    set_property file_type SystemVerilog [get_files $tb_file]
    update_compile_order -fileset sim_1
    set_property top tb_mac_stage [get_filesets sim_1]
} else {
    puts "ERROR: Testbench file not found: $tb_file"
    return
}

puts "Running mac_stage behavioral simulation..."
set_property -name {xsim.simulate.runtime} -value {1us} -objects [get_filesets sim_1]
set_property -name {xsim.simulate.log_all_signals} -value {true} -objects [get_filesets sim_1]
launch_simulation -mode behavioral
run 1us

puts "Simulation complete."
close_project
