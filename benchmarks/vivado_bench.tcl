# =============================================================================
# vivado_bench.tcl  —  One-shot benchmark simulation launcher
#
# Usage
# -----
# Batch mode (from terminal):
#   vivado -mode batch -source benchmarks/vivado_bench.tcl -tclargs kws
#   vivado -mode batch -source benchmarks/vivado_bench.tcl -tclargs vww
#   vivado -mode batch -source benchmarks/vivado_bench.tcl -tclargs yolo_nano
#   vivado -mode batch -source benchmarks/vivado_bench.tcl -tclargs ecg
#   vivado -mode batch -source benchmarks/vivado_bench.tcl -tclargs gesture
#
# GUI mode (from Vivado Tcl console):
#   source benchmarks/vivado_bench.tcl
#   run_bench kws
# =============================================================================

# Resolve project root relative to this script's location
set SCRIPT_DIR [file normalize [file dirname [info script]]]
set ROOT       [file normalize "$SCRIPT_DIR/.."]

proc run_bench {bench_name} {
    global SCRIPT_DIR ROOT

    # ── Validate bench name ───────────────────────────────────────────────────
    set valid_benches {kws vww yolo_nano ecg gesture}
    if {$bench_name ni $valid_benches} {
        puts "ERROR: unknown benchmark '$bench_name'"
        puts "       choose one of: $valid_benches"
        return 1
    }

    set BENCH_DIR  "$SCRIPT_DIR/$bench_name"
    set RTL_DIR    "$ROOT/rtl_stubs"
    set SIM_DIR    "$ROOT/sim"
    set PROJ_DIR   "$BENCH_DIR/vivado_proj"

    # ── Map bench name → file stems ───────────────────────────────────────────
    switch $bench_name {
        kws       { set tb_file "tb_kws.v";        set cfg "dnn_config_kws.vh";        set top "tb_kws"      }
        vww       { set tb_file "tb_vww.v";        set cfg "dnn_config_vww.vh";        set top "tb_vww"      }
        yolo_nano { set tb_file "tb_yolo_nano.v";  set cfg "dnn_config_yolo_nano.vh";  set top "tb_yolo_nano"}
        ecg       { set tb_file "tb_ecg.v";        set cfg "dnn_config_ecg.vh";        set top "tb_ecg"      }
        gesture   { set tb_file "tb_gesture.v";    set cfg "dnn_config_gesture.vh";    set top "tb_gesture"  }
    }

    puts ""
    puts "╔══════════════════════════════════════════════════════╗"
    puts "║  DNN Accelerator — IoT Benchmark: $bench_name"
    puts "╚══════════════════════════════════════════════════════╝"
    puts "  Bench dir : $BENCH_DIR"
    puts "  RTL dir   : $RTL_DIR"
    puts "  Top module: $top"
    puts ""

    # ── Step 1: generate golden files if missing ──────────────────────────────
    set golden_py  "$BENCH_DIR/tf_golden_${bench_name}.py"
    set golden_memh [glob -nocomplain "$BENCH_DIR/golden_${bench_name}_output.memh"]
    if {[llength $golden_memh] == 0} {
        puts "--- Generating golden reference ($bench_name) ---"
        set rc [catch {exec python3 $golden_py $BENCH_DIR} msg]
        if {$rc} { puts "WARNING: golden generation failed:\n$msg" }
        else      { puts $msg }
    } else {
        puts "--- Golden files already present, skipping regeneration ---"
    }

    # ── Step 2: collect all RTL source files ──────────────────────────────────
    set rtl_files [list \
        "$RTL_DIR/mac_stage.v" \
        "$RTL_DIR/mac_array.v" \
        "$RTL_DIR/streaming_row_buffer.v" \
        "$RTL_DIR/mac_array_stage_with_bram.v" \
        "$RTL_DIR/nn_layer_control_unit.v" \
        "$RTL_DIR/streaming_nn_layer_stage.v" \
        "$RTL_DIR/streaming_nn_pipeline.v" \
        "$RTL_DIR/runtime_resource_manager.v" \
        "$RTL_DIR/streaming_nn_system.v" \
        "$BENCH_DIR/$tb_file" \
    ]

    # ── Step 3: create Vivado project ────────────────────────────────────────
    file mkdir $PROJ_DIR
    create_project ${bench_name}_bench $PROJ_DIR \
        -part xc7z020clg484-1 -force

    # Add all RTL + testbench as simulation sources
    add_files -fileset sim_1 $rtl_files

    # ── Step 4: set include directories ──────────────────────────────────────
    # tb_<bench>.v does:  `include "dnn_config_<bench>.vh"
    # RTL does:           `include "dnn_config.vh"  (from sim/)
    set_property include_dirs [list $BENCH_DIR $SIM_DIR] \
        [get_filesets sim_1]

    # ── Step 5: set simulation working directory ──────────────────────────────
    # This is where $readmemh resolves relative paths from.
    set_property -name {xsim.simulate.runtime}           -value {-all}           -objects [get_filesets sim_1]
    set_property -name {xsim.compile.xvlog.more_options} -value {}               -objects [get_filesets sim_1]
    set_property -name {xsim.elaborate.snapshot}         -value ${top}           -objects [get_filesets sim_1]

    # Working directory: benchmark folder so $readmemh finds .memh files
    set_property directory $BENCH_DIR [get_filesets sim_1]

    # ── Step 6: set top module ────────────────────────────────────────────────
    set_property top $top [get_filesets sim_1]
    update_compile_order -fileset sim_1

    # ── Step 7: launch simulation ─────────────────────────────────────────────
    puts "--- Launching simulation: $top ---"
    launch_simulation

    puts ""
    puts "Simulation complete. Check the Tcl console output above for PASS/FAIL."
    puts ""
}

# ── Entry point when called in batch mode with -tclargs ───────────────────────
if {[llength $argv] > 0} {
    run_bench [lindex $argv 0]
}
