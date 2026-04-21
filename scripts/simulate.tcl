# Simulation Script for Stream Processing Accelerator
# Runs behavioral simulation in Vivado

set project_dir "./vivado_project"
set project_name "stream_processing_final"

# Check if project exists
if {![file exists "$project_dir/${project_name}.xpr"]} {
    puts "ERROR: Project not found. Run create_project.tcl first."
    return
}

# Open project
puts "Opening project..."
open_project "$project_dir/${project_name}.xpr"

puts "\n=========================================="
puts "Running Behavioral Simulation"
puts "=========================================="

# Set simulation properties
set_property -name {xsim.simulate.runtime} -value {10us} -objects [get_filesets sim_1]
set_property -name {xsim.simulate.log_all_signals} -value {true} -objects [get_filesets sim_1]

# Launch simulation
launch_simulation -mode behavioral

# Run simulation
puts "\nStarting simulation..."
run 10us

puts "\nSimulation complete!"
puts "View waveforms in Vivado GUI"
puts "Or check simulation log in:"
puts "  vivado_project/stream_processing_final.sim/sim_1/behav/xsim/"

# Optionally export waveforms
# write_vcd -file ../docs/simulation.vcd

close_project
