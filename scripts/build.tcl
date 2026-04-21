# Synthesis and Implementation Flow Script
# Automates the build process for Stream Processing Accelerator

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

# ============================================================================
# Synthesis
# ============================================================================

puts "\n=========================================="
puts "Running Synthesis"
puts "=========================================="

# Reset synthesis run
reset_run synth_1

# Launch synthesis
launch_runs synth_1 -jobs 8
wait_on_run synth_1

# Check synthesis status
set synth_status [get_property STATUS [get_runs synth_1]]
set synth_progress [get_property PROGRESS [get_runs synth_1]]

puts "\nSynthesis Status: $synth_status"
puts "Progress: $synth_progress"

if {$synth_status != "synth_design Complete!"} {
    puts "ERROR: Synthesis failed!"
    return
}

# Open synthesized design
open_run synth_1 -name synth_1

# Generate synthesis reports
puts "\nGenerating synthesis reports..."

report_utilization -file ../docs/synth_utilization.txt
report_timing_summary -file ../docs/synth_timing.txt -max_paths 10
report_power -file ../docs/synth_power.txt

puts "Synthesis reports saved to docs/"

# Check timing
set wns [get_property SLACK [get_timing_paths -max_paths 1 -nworst 1 -setup]]
set tns [get_property SLACK [get_timing_paths -nworst 1 -hold]]

puts "\nSynthesis Timing:"
puts "  Worst Negative Slack (Setup): $wns ns"
puts "  Total Negative Slack (Hold): $tns ns"

if {$wns < 0} {
    puts "WARNING: Timing not met in synthesis!"
}

# ============================================================================
# Implementation
# ============================================================================

puts "\n=========================================="
puts "Running Implementation"
puts "=========================================="

# Reset implementation run
reset_run impl_1

# Launch implementation
launch_runs impl_1 -jobs 8
wait_on_run impl_1

# Check implementation status
set impl_status [get_property STATUS [get_runs impl_1]]
set impl_progress [get_property PROGRESS [get_runs impl_1]]

puts "\nImplementation Status: $impl_status"
puts "Progress: $impl_progress"

if {$impl_status != "route_design Complete!"} {
    puts "ERROR: Implementation failed!"
    return
}

# Open implemented design
open_run impl_1 -name impl_1

# Generate implementation reports
puts "\nGenerating implementation reports..."

report_utilization -file ../docs/impl_utilization.txt
report_timing_summary -file ../docs/impl_timing.txt -max_paths 10
report_power -file ../docs/impl_power.txt
report_drc -file ../docs/impl_drc.txt
report_methodology -file ../docs/impl_methodology.txt
report_route_status -file ../docs/impl_route_status.txt

puts "Implementation reports saved to docs/"

# Check timing
set wns [get_property SLACK [get_timing_paths -max_paths 1 -nworst 1 -setup]]
set tns [get_property SLACK [get_timing_paths -nworst 1 -hold]]

puts "\nImplementation Timing:"
puts "  Worst Negative Slack (Setup): $wns ns"
puts "  Total Negative Slack (Hold): $tns ns"

if {$wns < 0} {
    puts "ERROR: Timing not met after implementation!"
    puts "Consider:"
    puts "  - Reducing clock frequency"
    puts "  - Adding pipeline stages"
    puts "  - Adjusting synthesis/implementation strategies"
    return
}

# ============================================================================
# Bitstream Generation
# ============================================================================

puts "\n=========================================="
puts "Generating Bitstream"
puts "=========================================="

# Launch bitstream generation
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1

set bit_status [get_property STATUS [get_runs impl_1]]

puts "\nBitstream Status: $bit_status"

if {$bit_status == "write_bitstream Complete!"} {
    puts "\n=========================================="
    puts "BUILD SUCCESSFUL!"
    puts "=========================================="
    
    # Copy bitstream to output
    set bit_file [get_property DIRECTORY [get_runs impl_1]]
    append bit_file "/stream_processing_top.bit"
    
    if {[file exists $bit_file]} {
        file copy -force $bit_file "../bitstream/stream_processing_final.bit"
        puts "\nBitstream saved to: bitstream/stream_processing_final.bit"
        puts "Size: [file size $bit_file] bytes"
    }
    
    # Print resource utilization summary
    puts "\n=========================================="
    puts "Resource Utilization Summary"
    puts "=========================================="
    
    set util_report [report_utilization -return_string]
    set lines [split $util_report "\n"]
    foreach line $lines {
        if {[regexp {^\| (Slice LUTs|Slice Registers|Block RAM Tile|DSPs)} $line]} {
            puts $line
        }
    }
    
    puts "\n=========================================="
    puts "Build Complete!"
    puts "=========================================="
    puts "Next steps:"
    puts "  1. Review reports in docs/"
    puts "  2. Program FPGA with bitstream/stream_processing_final.bit"
    puts "  3. Run software driver to test accelerator"
    puts "=========================================="
    
} else {
    puts "ERROR: Bitstream generation failed!"
    return
}

# Close project
close_project
