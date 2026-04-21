# Vivado Project Creation Script
# Stream Processing Neural Network Accelerator

set project_name "stream_processing_final"
set project_dir "./vivado_project"
set top_module "stream_processing_top"

# Set target device (adjust for your board)
# Default: Xilinx Zynq-7000 ZC702
set target_device "xc7z020clg484-1"
# Alternative devices:
# set target_device "xczu9eg-ffvb1156-2-e"  # Zynq UltraScale+ ZCU102
# set target_device "xc7k325tffg676-2"      # Kintex-7 KC705
# set target_device "xcvu9p-flga2104-2L-e"  # Virtex UltraScale+ VCU118

puts "=========================================="
puts "Creating Vivado Project"
puts "=========================================="
puts "Project: $project_name"
puts "Target:  $target_device"
puts "=========================================="

# Create project
create_project $project_name $project_dir -part $target_device -force

# Set project properties
set_property target_language Verilog [current_project]
set_property simulator_language Mixed [current_project]

puts "\nAdding RTL source files..."

# Add RTL files in dependency order
set rtl_files [list \
    "../rtl/mac_stage.v" \
    "../rtl/mac_array.v" \
    "../rtl/mac_array_stage_with_bram.v" \
    "../rtl/nn_layer_control_unit.v" \
    "../rtl/streaming_row_buffer.v" \
    "../rtl/streaming_nn_layer_stage.v" \
    "../rtl/streaming_nn_pipeline.v" \
    "../rtl/streaming_nn_system.v" \
    "../rtl/runtime_resource_manager.v" \
    "../rtl/dynamic_interconnect.v" \
    "../rtl/reconfigurable_nn_accelerator.v" \
    "../rtl/stream_processing_top.v" \
]

foreach file $rtl_files {
    if {[file exists $file]} {
        add_files -fileset sources_1 $file
        puts "  Added: $file"
    } else {
        puts "  WARNING: File not found: $file"
    }
}

# Add testbench files
puts "\nAdding testbench files..."
set tb_files [list \
    "../tb/tb_streaming_nn_system.v" \
]

foreach file $tb_files {
    if {[file exists $file]} {
        add_files -fileset sim_1 $file
        puts "  Added: $file"
    } else {
        puts "  WARNING: File not found: $file"
    }
}

# Add constraints
puts "\nAdding constraint files..."
if {[file exists "../constraints/timing_constraints.xdc"]} {
    add_files -fileset constrs_1 "../constraints/timing_constraints.xdc"
    puts "  Added: timing_constraints.xdc"
}

if {[file exists "../constraints/pin_constraints.xdc"]} {
    add_files -fileset constrs_1 "../constraints/pin_constraints.xdc"
    puts "  Added: pin_constraints.xdc"
}

# Set top module
set_property top $top_module [current_fileset]
set_property top tb_streaming_nn_system [get_filesets sim_1]

# Update compile order
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1

puts "\n=========================================="
puts "Project Configuration"
puts "=========================================="

# Set synthesis options
set_property strategy "Flow_PerfOptimized_high" [get_runs synth_1]
set_property STEPS.SYNTH_DESIGN.ARGS.DIRECTIVE "PerformanceOptimized" [get_runs synth_1]
set_property STEPS.SYNTH_DESIGN.ARGS.RETIMING true [get_runs synth_1]

# Set implementation options
set_property strategy "Performance_ExplorePostRoutePhysOpt" [get_runs impl_1]
set_property STEPS.OPT_DESIGN.ARGS.DIRECTIVE "ExploreWithRemap" [get_runs impl_1]
set_property STEPS.PLACE_DESIGN.ARGS.DIRECTIVE "ExtraPostPlacementOpt" [get_runs impl_1]
set_property STEPS.ROUTE_DESIGN.ARGS.DIRECTIVE "AlternateCLBRouting" [get_runs impl_1]

puts "Synthesis strategy: Flow_PerfOptimized_high"
puts "Implementation strategy: Performance_ExplorePostRoutePhysOpt"

# Create block design (optional)
puts "\n=========================================="
puts "Optional: Create Block Design"
puts "=========================================="
puts "Skipping block design creation."
puts "For PS+PL design, run: source scripts/create_bd.tcl"

puts "\n=========================================="
puts "Project Created Successfully!"
puts "=========================================="
puts "Location: [get_property DIRECTORY [current_project]]"
puts ""
puts "Next steps:"
puts "  1. Review design hierarchy"
puts "  2. Run synthesis:      launch_runs synth_1 -jobs 8"
puts "  3. Run implementation: launch_runs impl_1 -jobs 8"
puts "  4. Generate bitstream: launch_runs impl_1 -to_step write_bitstream -jobs 8"
puts ""
puts "GUI mode:"
puts "  Open Vivado GUI and load project: $project_dir/${project_name}.xpr"
puts "=========================================="

# Save project
save_project_as $project_name $project_dir -force

# Generate useful reports
puts "\nGenerating initial reports..."
if {[catch {
    synth_design -rtl -name rtl_1
    write_schematic -format pdf -force "../docs/rtl_schematic.pdf"
    puts "RTL schematic saved to docs/rtl_schematic.pdf"
} err]} {
    puts "Note: RTL schematic generation skipped (GUI required)"
}

puts "\nProject setup complete!"
