# =============================================================================
# dnn_zedboard_flow.tcl
#
# Full Vivado flow for the DNN accelerator (LeNet-5) on the ZedBoard.
# Covers every stage from simulation through bitstream generation:
#
#   Phase 0 : Pre-flight checks
#   Phase 1 : Project creation
#   Phase 2 : Source & constraint file addition
#   Phase 3 : Behavioural simulation (XSim)
#              - tb_dnn_comprehensive  (11 functional + golden checks)
#              - tb_zedboard_timing    (8 timing-margin checks)
#   Phase 4 : Synthesis
#   Phase 5 : Implementation (opt / place / phys_opt / route)
#   Phase 6 : Static timing analysis + reports
#   Phase 7 : Timing-sim artefacts (SDF + netlist) for post-impl XSim
#   Phase 8 : Bitstream generation
#
# HOW TO RUN
# ----------
#   # Batch mode (no GUI):
#   cd dnn_opt
#   vivado -mode batch -source scripts/dnn_zedboard_flow.tcl
#
#   # GUI mode (opens Vivado, runs in background):
#   vivado -mode gui -source scripts/dnn_zedboard_flow.tcl
#
# PREREQUISITES
# -------------
#   1. Run the Python optimizer first to produce sim/dnn_config.vh:
#        python3 dnn_optimizer.py --dnn lenet5 \
#            --area-budget 180 --power-budget 2000 \
#            --objective latency --out-header sim/dnn_config.vh -v
#
#   2. (Optional) Re-generate golden reference vectors:
#        cd golden && python3 tf_golden.py . && cd ..
#
#   3. Run this script from the dnn_opt/ directory (where Makefile lives).
#
# OUTPUTS
# -------
#   build/dnn_zedboard/dnn_zedboard.xpr       <- Vivado project (open in GUI)
#   build/dnn_zedboard/reports/               <- all text reports
#   build/dnn_zedboard/post_synth.dcp         <- synthesis checkpoint
#   build/dnn_zedboard/post_impl.dcp          <- implementation checkpoint
#   build/zedboard_top.bit                    <- bitstream for board
#   build/zedboard_top_tsmn.sdf               <- SDF for post-impl XSim
#   build/zedboard_top_tsmn.v                 <- timing netlist for XSim
# =============================================================================

# ─────────────────────────────────────────────────────────────────────────────
# USER-CONFIGURABLE SECTION  (edit here if your paths differ)
# ─────────────────────────────────────────────────────────────────────────────

set PROJECT_NAME  "dnn_zedboard"
set PROJECT_DIR   "build/dnn_zedboard"
set FPGA_PART     "xc7z020clg484-1"          ;# ZedBoard XC7Z020, speed grade -1
set TOP_MODULE    "zedboard_top"
set REPORT_DIR    "$PROJECT_DIR/reports"

# RTL source files (all .v / .sv under rtl_stubs/ + the board top wrapper).
# Replace streaming_nn_system_stub.sv with your production RTL when ready.
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

# Board-level top wrapper (synthesis target)
set TOP_SV        "Backup/zedboard_top.sv"

# Simulation testbench files
set TB_COMP_SV    "sim/tb_dnn_comprehensive.sv"
set TB_TIMING_SV  "sim/tb_zedboard_timing.sv"

# Include directories (for `include "dnn_config.vh")
set INCLUDE_DIRS  { sim }

# XDC pin/timing constraints
set XDC_FILE      "xdc/zedboard.xdc"

# Golden memh files used by the vs-golden testbench
set GOLDEN_DIR    "golden"

# XSim simulation run limits
set SIM_TIMEOUT_US 5000          ;# microseconds — enough for all 18 TC checks

# ─────────────────────────────────────────────────────────────────────────────
# HELPER PROCEDURES
# ─────────────────────────────────────────────────────────────────────────────

proc banner {msg} {
    set line [string repeat "=" 72]
    puts ""
    puts $line
    puts "  $msg"
    puts $line
}

# Run a Tcl command; print a readable error and exit on failure.
proc safe_run {cmd description} {
    puts "  -> $description ..."
    if {[catch {uplevel 1 $cmd} err]} {
        puts ""
        puts "  ERROR during: $description"
        puts "  Details     : $err"
        puts ""
        puts "  TIP: Open the project in the GUI for interactive debug:"
        puts "       vivado build/dnn_zedboard/dnn_zedboard.xpr"
        puts ""
        exit 1
    }
}

# Print a compact PASS / FAIL line; increment global fail counter on failure.
proc check {label cond} {
    global g_fail_count
    if {$cond} {
        puts [format "  %-54s PASS" $label]
    } else {
        puts [format "  %-54s FAIL  <<<<" $label]
        incr g_fail_count
    }
}

set g_fail_count 0

# ─────────────────────────────────────────────────────────────────────────────
# PHASE 0 : PRE-FLIGHT CHECKS
# ─────────────────────────────────────────────────────────────────────────────
banner "Phase 0 : Pre-flight checks"

# Verify working directory is dnn_opt/
if {![file exists "Makefile"] || ![file exists "dnn_optimizer.py"]} {
    puts ""
    puts "  ERROR: This script must be run from the dnn_opt/ directory."
    puts "         cd dnn_opt"
    puts "         vivado -mode batch -source scripts/dnn_zedboard_flow.tcl"
    exit 1
}
puts "  OK  Working directory: [pwd]"

# Check every RTL file
foreach f [concat $RTL_FILES $TOP_SV] {
    if {![file exists $f]} {
        puts "  ERROR: Source file not found: $f"
        exit 1
    }
    puts "  OK  $f"
}

# Check testbench files
foreach f [list $TB_COMP_SV $TB_TIMING_SV] {
    if {![file exists $f]} {
        puts "  ERROR: Testbench not found: $f"
        exit 1
    }
    puts "  OK  $f"
}

# Check XDC
if {![file exists $XDC_FILE]} {
    puts "  ERROR: Constraints not found: $XDC_FILE"
    exit 1
}
puts "  OK  $XDC_FILE"

# Check optimizer output header (critical for TB parametrisation)
if {![file exists "sim/dnn_config.vh"]} {
    puts ""
    puts "  ERROR: sim/dnn_config.vh not found."
    puts "         Generate it first:"
    puts "           python3 dnn_optimizer.py --dnn lenet5 \\"
    puts "               --area-budget 180 --power-budget 2000 \\"
    puts "               --objective latency --out-header sim/dnn_config.vh -v"
    exit 1
}
puts "  OK  sim/dnn_config.vh"

# Warn (but do not abort) if golden vectors are absent
foreach gf [list golden/golden_input.memh \
                 golden/golden_weights_l0.memh \
                 golden/golden_weights_l2.memh \
                 golden/golden_output_tf.memh] {
    if {![file exists $gf]} {
        puts "  WARN: $gf missing — TC11 golden compare may be skipped."
        puts "        Regenerate with:  cd golden && python3 tf_golden.py ."
    } else {
        puts "  OK  $gf"
    }
}

puts ""
puts "  All required files present.  Proceeding."

# ─────────────────────────────────────────────────────────────────────────────
# PHASE 1 : CREATE VIVADO PROJECT
# ─────────────────────────────────────────────────────────────────────────────
banner "Phase 1 : Creating Vivado project"

file mkdir $PROJECT_DIR
file mkdir $REPORT_DIR

puts "  Creating project: $PROJECT_DIR/$PROJECT_NAME.xpr"
create_project -force $PROJECT_NAME $PROJECT_DIR -part $FPGA_PART

set_property target_language    Verilog [current_project]
set_property default_lib        work    [current_project]
set_property simulator_language Mixed   [current_project]

# Make the project use XSim as its default simulator
set_property target_simulator   XSim    [current_project]

puts "  Project created.  Open any time with:"
puts "    vivado $PROJECT_DIR/$PROJECT_NAME.xpr"

# ─────────────────────────────────────────────────────────────────────────────
# PHASE 2 : ADD SOURCES & CONSTRAINTS
# ─────────────────────────────────────────────────────────────────────────────
banner "Phase 2 : Adding sources and constraints"

# --- 2a. Synthesis / implementation sources ----------------------------------
puts "  Adding RTL sources to sources_1 fileset..."
foreach f $RTL_FILES {
    puts "    $f"
    add_files -norecurse -fileset [get_filesets sources_1] $f
}
add_files -norecurse -fileset [get_filesets sources_1] $TOP_SV
puts "    $TOP_SV  (synthesis top wrapper)"

# SystemVerilog-2012 file type for all .sv sources
foreach sv_file [get_files -of_objects [get_filesets sources_1] *.sv] {
    set_property file_type {SystemVerilog} $sv_file
}

# These two files use SystemVerilog syntax (task automatic, for(integer...))
# but have .v extensions — override so Vivado parses them as SV.
set_property file_type SystemVerilog [get_files reconfigurable_nn_accelerator.v]
set_property file_type SystemVerilog [get_files stream_processing_top.v]

# Include path so `include "dnn_config.vh" resolves correctly
set_property include_dirs $INCLUDE_DIRS [get_filesets sources_1]

# Set the synthesis top module
set_property top $TOP_MODULE [get_filesets sources_1]
update_compile_order -fileset sources_1

puts "  [llength $RTL_FILES] design file(s) added; top = $TOP_MODULE"

# --- 2b. Simulation sources --------------------------------------------------
puts "  Adding simulation testbenches to sim_1 fileset..."

# Comprehensive functional + golden TB
add_files -norecurse -fileset [get_filesets sim_1] $TB_COMP_SV
# ZedBoard behavioral timing TB
add_files -norecurse -fileset [get_filesets sim_1] $TB_TIMING_SV

# The TBs also need the RTL under test
foreach f $RTL_FILES {
    add_files -norecurse -fileset [get_filesets sim_1] $f
}

# Include dirs for simulation: sim/ (dnn_config.vh) and golden/ (memh files)
set_property include_dirs [concat $INCLUDE_DIRS $GOLDEN_DIR] \
    [get_filesets sim_1]

# Simulator compile definitions for GOLDEN_REPLAY mode (stub drives golden outputs)
# Remove this if running with production RTL
set_property verilog_define "GOLDEN_REPLAY" [get_filesets sim_1]

set_property top               tb_dnn_comprehensive [get_filesets sim_1]
set_property top_lib           work                 [get_filesets sim_1]

puts "  Simulation fileset configured (top TB: tb_dnn_comprehensive)"

# --- 2c. Constraints --------------------------------------------------------
puts "  Adding XDC constraints..."
add_files -fileset [get_filesets constrs_1] -norecurse $XDC_FILE
puts "    $XDC_FILE"

puts ""
puts "  Sources and constraints added successfully."

# ─────────────────────────────────────────────────────────────────────────────
# PHASE 3 : BEHAVIOURAL SIMULATION (XSim)
# ─────────────────────────────────────────────────────────────────────────────
banner "Phase 3 : Behavioural simulation"

# Helper: run one simulation pass and report pass/fail
# Search a list of candidate paths and return the first that exists, or "".
proc find_first_file {candidates} {
    foreach f $candidates {
        if {[file exists $f]} { return $f }
    }
    return ""
}

# Write text to a file and return the path.
proc write_log {path text} {
    set fh [open $path w]
    puts $fh $text
    close $fh
    return $path
}

# Run one simulation testbench.
#
# Strategy (tried in order):
#   1. Use a pre-compiled Icarus .vvp file if one exists in sim/.
#   2. Compile with iverilog on the fly using the RTL stubs + the given TB .sv.
#   3. Fall back to Vivado launch_simulation (project mode XSim).
#
# The function returns 1 on PASS, 0 on FAIL or UNKNOWN.
proc run_xsim_tb {tb_top description timeout_us} {
    global REPORT_DIR PROJECT_DIR PROJECT_NAME RTL_FILES INCLUDE_DIRS GOLDEN_DIR

    puts ""
    puts "  -- $description --"

    set log_dst "$REPORT_DIR/sim_${tb_top}.log"
    set output  ""
    set ran     0

    # ------------------------------------------------------------------
    # Path 1: pre-compiled Icarus .vvp (already in sim/ from Makefile run)
    # ------------------------------------------------------------------
    # Map TB module names to the .vvp files the Makefile produces
    set vvp_candidates {}
    if {$tb_top eq "tb_dnn_comprehensive"} {
        lappend vvp_candidates "sim/tb.vvp"
    } elseif {$tb_top eq "tb_zedboard_timing"} {
        lappend vvp_candidates "sim/tb_zed.vvp"
    }
    # Also try a generic name
    lappend vvp_candidates "sim/${tb_top}.vvp"

    set vvp [find_first_file $vvp_candidates]

    if {$vvp ne ""} {
        puts "  Found pre-compiled .vvp: $vvp"
        puts "  Running with vvp ..."
        if {[catch { set output [exec vvp $vvp 2>@1] } err]} {
            # vvp exits non-zero on $finish — that is normal.
            # Keep whatever stdout we got.
            set output $err
        }
        set ran 1
    }

    # ------------------------------------------------------------------
    # Path 2: compile with iverilog on the fly
    # ------------------------------------------------------------------
    if {!$ran} {
        # Locate the TB source file
        set tb_sv_map [dict create \
            tb_dnn_comprehensive "sim/tb_dnn_comprehensive.sv" \
            tb_zedboard_timing   "sim/tb_zedboard_timing.sv"  \
            tb_dnn_vs_golden     "sim/tb_dnn_vs_golden.sv"    \
        ]
        if {[dict exists $tb_sv_map $tb_top]} {
            set tb_sv [dict get $tb_sv_map $tb_top]
        } else {
            set tb_sv "sim/${tb_top}.sv"
        }

        if {[file exists $tb_sv] && [catch {exec which iverilog} ]} {
            puts "  iverilog not found; skipping compile-on-the-fly path."
        } elseif {[file exists $tb_sv]} {
            puts "  Compiling $tb_sv with iverilog ..."
            set vvp_out "sim/${tb_top}_flow.vvp"
            set inc_flags {}
            foreach d [concat $INCLUDE_DIRS $GOLDEN_DIR] {
                lappend inc_flags "-I" $d
            }
            set rtl_sv {}
            foreach f $RTL_FILES { lappend rtl_sv $f }

            set cmd [list iverilog -g2012 -DGOLDEN_REPLAY \
                         -o $vvp_out $tb_sv {*}$rtl_sv {*}$inc_flags]
            if {[catch { exec {*}$cmd 2>@1 } cerr]} {
                puts "  iverilog compile error: $cerr"
                # Don't abort; fall through to XSim path
            } elseif {[file exists $vvp_out]} {
                puts "  Running $vvp_out with vvp ..."
                if {[catch { set output [exec vvp $vvp_out 2>@1] } err]} {
                    set output $err
                }
                set ran 1
            }
        }
    }

    # ------------------------------------------------------------------
    # Path 3: Vivado project-mode XSim
    # ------------------------------------------------------------------
    if {!$ran} {
        puts "  Trying Vivado launch_simulation (XSim) ..."
        set_property top     $tb_top [get_filesets sim_1]
        set_property top_lib work    [get_filesets sim_1]

        if {[catch {
            launch_simulation -mode behavioral -simset [get_filesets sim_1]
        } err]} {
            puts "  ERROR (elaborate): $err"
            write_log $log_dst "ERROR: elaborate failed\n$err"
            return 0
        }
        if {[catch { run ${timeout_us}us } err]} {
            puts "  WARN (run): $err"
        }
        catch { close_sim }

        # Collect XSim log — try several known locations
        set xsim_log [find_first_file [list \
            "$PROJECT_DIR/$PROJECT_NAME.sim/sim_1/behav/xsim/simulate.log" \
            "$PROJECT_DIR/$PROJECT_NAME.sim/sim_1/behav/xsim/xsim.log"    \
            "$PROJECT_DIR/xsim_${tb_top}.log"                              \
        ]]
        if {$xsim_log ne ""} {
            set fh [open $xsim_log r]
            set output [read $fh]
            close $fh
            set ran 1
        } else {
            puts "  WARN: XSim log not found. Cannot determine pass/fail."
            write_log $log_dst "WARN: XSim log not found."
            return 0
        }
    }

    # ------------------------------------------------------------------
    # Parse output and report
    # ------------------------------------------------------------------
    write_log $log_dst $output
    puts "  Log: $log_dst"

    set passed [regexp -nocase {ALL TESTS PASSED|TIMING VERIFICATION PASSED} $output]
    set failed [regexp -nocase {TESTS FAILED} $output]
    # Count explicit FAIL lines (avoid matching "false_path", "default", etc.)
    set nfail  [llength [lsearch -all -regexp [split $output "\n"] {\bFAIL\b}]]

    if {$passed && !$failed && $nfail == 0} {
        puts "  RESULT: PASS"
        return 1
    } else {
        puts "  RESULT: FAIL"
        if {$nfail > 0} { puts "  ($nfail FAIL line(s) in output)" }
        return 0
    }
}

# ── 3a. Comprehensive functional + golden TB ─────────────────────────────────
puts ""
puts "  3a. Comprehensive testbench: tb_dnn_comprehensive"
puts "       Exercises 11 test cases (TC1-TC11) including:"
puts "       reset/ready, weight load, latency, throughput, quiescence,"
puts "       per-layer activity, reset-rerun, RRM phase, golden compare."
puts ""
puts "  NOTE: This phase requires XSim (bundled with Vivado)."
puts "        Alternatively, run outside Vivado with Icarus:"
puts "          iverilog -g2012 -DGOLDEN_REPLAY \\"
puts "              -o sim/tb.vvp sim/tb_dnn_comprehensive.sv \\"
puts "              rtl_stubs/*.v rtl_stubs/*.sv -I sim/ -I golden/"
puts "          vvp sim/tb.vvp"
puts ""

set sim_comp_ok [run_xsim_tb tb_dnn_comprehensive \
    "Comprehensive functional + golden testbench" $SIM_TIMEOUT_US]

# ── 3b. ZedBoard behavioral timing TB ───────────────────────────────────────
puts ""
puts "  3b. Zedboard timing testbench: tb_zedboard_timing"
puts "       Verifies 100 MHz timing model (TT1-TT8):"
puts "       static slack, functional correctness with injected delay,"
puts "       golden compare under delay, setup/hold scoreboard."
puts ""

set sim_timing_ok [run_xsim_tb tb_zedboard_timing \
    "ZedBoard behavioral timing testbench" $SIM_TIMEOUT_US]

# ── 3c. Simulation summary ───────────────────────────────────────────────────
puts ""
puts "  ── Simulation summary ──────────────────────────────────────────"
check "  tb_dnn_comprehensive (TC1-TC11)" $sim_comp_ok
check "  tb_zedboard_timing   (TT1-TT8)" $sim_timing_ok
puts "  ────────────────────────────────────────────────────────────────"
puts ""
if {!$sim_comp_ok || !$sim_timing_ok} {
    puts "  WARNING: One or more simulation phases failed."
    puts "           Continuing to synthesis — review the log files:"
    puts "             $REPORT_DIR/xsim_tb_dnn_comprehensive.log"
    puts "             $REPORT_DIR/xsim_tb_zedboard_timing.log"
    puts ""
    puts "  Icarus quick-rerun (no Vivado required):"
    puts "    iverilog -g2012 -DGOLDEN_REPLAY \\"
    puts "        -o sim/tb.vvp sim/tb_dnn_comprehensive.sv \\"
    puts "        rtl_stubs/*.v rtl_stubs/*.sv -I sim/ -I golden/ && vvp sim/tb.vvp"
    puts ""
}

# (Vivado automatically restores the active fileset after simulation)

# ─────────────────────────────────────────────────────────────────────────────
# PHASE 4 : SYNTHESIS
# ─────────────────────────────────────────────────────────────────────────────
banner "Phase 4 : Synthesis  (RTL -> gate netlist)  ~2-5 min"

puts "  Converting SystemVerilog RTL to a gate-level netlist."
puts "  Review any CRITICAL WARNING in the console — they usually"
puts "  indicate real RTL issues (undriven ports, latches, etc.)."
puts ""

safe_run {
    synth_design \
        -top              $TOP_MODULE \
        -part             $FPGA_PART  \
        -flatten_hierarchy rebuilt
} "synth_design"

write_checkpoint    -force "$PROJECT_DIR/post_synth.dcp"
report_utilization  -file  "$REPORT_DIR/utilization_synth.rpt"
report_timing_summary -file "$REPORT_DIR/timing_synth.rpt"

puts "  Checkpoint : $PROJECT_DIR/post_synth.dcp"
puts "  Report     : $REPORT_DIR/utilization_synth.rpt"
puts ""
puts "  Synthesis complete."

# ─────────────────────────────────────────────────────────────────────────────
# PHASE 5 : IMPLEMENTATION  (place & route)
# ─────────────────────────────────────────────────────────────────────────────
banner "Phase 5 : Implementation  (place & route)  ~5-15 min"

puts "  opt_design   — sweep redundant/equivalent logic ..."
safe_run { opt_design } "opt_design"

puts "  place_design — assign cells to fabric sites ..."
safe_run { place_design } "place_design"

puts "  phys_opt     — post-placement physical optimisation ..."
safe_run { phys_opt_design } "phys_opt_design"

puts "  route_design — connect placed cells with routing resources ..."
safe_run { route_design } "route_design"

write_checkpoint -force "$PROJECT_DIR/post_impl.dcp"
puts "  Checkpoint : $PROJECT_DIR/post_impl.dcp"
puts ""
puts "  Implementation complete."

# ─────────────────────────────────────────────────────────────────────────────
# PHASE 6 : STATIC TIMING ANALYSIS + REPORTS
# ─────────────────────────────────────────────────────────────────────────────
banner "Phase 6 : Static timing analysis"

# Full timing summary (issues warnings for violations)
report_timing_summary \
    -warn_on_violation \
    -file "$REPORT_DIR/timing_summary.rpt"

# Top-10 worst setup paths — most useful for debugging
report_timing \
    -setup \
    -nworst 10 \
    -path_type full_clock_expanded \
    -file "$REPORT_DIR/timing_setup_worst10.rpt"

# Top-10 worst hold paths
report_timing \
    -hold \
    -nworst 10 \
    -file "$REPORT_DIR/timing_hold_worst10.rpt"

# Resource / power / clock / DRC reports
report_utilization       -file "$REPORT_DIR/utilization_impl.rpt"
report_clock_utilization -file "$REPORT_DIR/clock_utilization.rpt"
report_power             -file "$REPORT_DIR/power.rpt"
report_drc               -file "$REPORT_DIR/drc.rpt"

puts "  Reports written to $REPORT_DIR/"

# ── Extract WNS / WHS and print a result box ─────────────────────────────────
set wns [get_property SLACK [get_timing_paths -setup -max_paths 1]]
set whs [get_property SLACK [get_timing_paths -hold  -max_paths 1]]

set wns_str [format "%.3f" $wns]
set whs_str [format "%.3f" $whs]
set wns_ok  [expr {$wns >= 0}]
set whs_ok  [expr {$whs >= 0}]

puts ""
puts "  ┌───────────────────────────────────────────────────┐"
puts "  │  TIMING RESULT  (100 MHz / 10 ns target)         │"
puts "  ├───────────────────────────────────────────────────┤"
puts [format "  │  WNS (setup slack) : %+8s ns   %-10s    │" \
         $wns_str [expr {$wns_ok ? "PASS ✓" : "FAIL ✗"}]]
puts [format "  │  WHS (hold  slack) : %+8s ns   %-10s    │" \
         $whs_str [expr {$whs_ok ? "PASS ✓" : "FAIL ✗"}]]
puts "  └───────────────────────────────────────────────────┘"

if {!$wns_ok} {
    puts ""
    puts "  TIMING NOT MET — suggestions:"
    puts "    1. Relax the clock period in xdc/zedboard.xdc:"
    puts "         create_clock -period 12.000  (83 MHz)  or"
    puts "         create_clock -period 15.000  (66 MHz)"
    puts "    2. Inspect the failing paths:"
    puts "         $REPORT_DIR/timing_setup_worst10.rpt"
    puts "    3. Open the project in the GUI for interactive analysis:"
    puts "         vivado $PROJECT_DIR/$PROJECT_NAME.xpr"
    puts "         Window -> Timing -> Report Timing Summary"
}

# ─────────────────────────────────────────────────────────────────────────────
# PHASE 7 : TIMING-SIM ARTEFACTS  (SDF + netlist for post-impl XSim)
# ─────────────────────────────────────────────────────────────────────────────
banner "Phase 7 : Generating post-impl timing-simulation artefacts"

puts "  These files allow XSim to run the testbenches with back-annotated"
puts "  gate delays rather than the behavioural timing model."
puts ""

# SDF (Standard Delay Format) — slow process corner for worst-case analysis
write_sdf \
    -force \
    -process_corner slow \
    "build/${TOP_MODULE}_tsmn.sdf"

# Verilog timing netlist annotated with SDF references
write_verilog \
    -force \
    -mode timesim \
    -sdf_anno true \
    "build/${TOP_MODULE}_tsmn.v"

puts "  SDF netlist : build/${TOP_MODULE}_tsmn.sdf"
puts "  Verilog net : build/${TOP_MODULE}_tsmn.v"
puts ""
puts "  To run post-impl timing simulation in XSim (outside this script):"
puts "    xelab -L unisims_ver -L secureip --debug typical \\"
puts "          tb_zedboard_timing ${TOP_MODULE}_tsmn \\"
puts "          -sdfmax /dut=build/${TOP_MODULE}_tsmn.sdf"
puts "    xsim work.tb_zedboard_timing -R"

# ─────────────────────────────────────────────────────────────────────────────
# PHASE 8 : BITSTREAM GENERATION
# ─────────────────────────────────────────────────────────────────────────────
banner "Phase 8 : Generating bitstream  ~1-3 min"

if {!$wns_ok} {
    puts "  WARNING: Bitstream will be generated despite timing violation."
    puts "           The design may malfunction on the board."
    puts "           Resolve timing failures before production use."
    puts ""
}

# Primary bitstream location (inside the runs/ directory)
set BIT_RUNS "$PROJECT_DIR/$PROJECT_NAME.runs/impl_1/${TOP_MODULE}.bit"

safe_run {
    write_bitstream -force $BIT_RUNS
} "write_bitstream"

# Copy to a short, predictable path for the programming script
file copy -force $BIT_RUNS "build/zedboard_top.bit"

puts "  Bitstream  : $BIT_RUNS"
puts "  Also at    : build/zedboard_top.bit"

# ─────────────────────────────────────────────────────────────────────────────
# FINAL SUMMARY
# ─────────────────────────────────────────────────────────────────────────────
banner "Build complete — summary"

puts "  Project     : $PROJECT_DIR/$PROJECT_NAME.xpr"
puts "  Bitstream   : build/zedboard_top.bit"
puts "  Reports     : $REPORT_DIR/"
puts ""
puts "  Key reports:"
puts "    timing_summary.rpt         WNS/WHS — did 100 MHz pass?"
puts "    utilization_impl.rpt       LUTs, BRAMs, DSPs used"
puts "    power.rpt                  estimated power consumption"
puts "    xsim_tb_dnn_comprehensive.log   simulation results"
puts "    xsim_tb_zedboard_timing.log     timing-TB results"
puts ""

# Simulation results
puts "  Simulation:"
check "    tb_dnn_comprehensive passed" $sim_comp_ok
check "    tb_zedboard_timing passed"   $sim_timing_ok
puts ""

# Timing results
puts "  Implementation timing @ 100 MHz:"
check "    WNS (setup) >= 0 ns  ($wns_str ns)" $wns_ok
check "    WHS (hold)  >= 0 ns  ($whs_str ns)" $whs_ok
puts ""

# Overall verdict
if {$g_fail_count == 0} {
    puts "  ╔══════════════════════════════════════╗"
    puts "  ║  ALL CHECKS PASSED — board-ready!   ║"
    puts "  ╚══════════════════════════════════════╝"
} else {
    puts "  ╔═══════════════════════════════════════════════════════╗"
    puts "  ║  $g_fail_count CHECK(S) FAILED — review logs before programming  ║"
    puts "  ╚═══════════════════════════════════════════════════════╝"
}

puts ""
puts "  Next steps:"
puts "    1. Open the project in the Vivado GUI:"
puts "         vivado $PROJECT_DIR/$PROJECT_NAME.xpr"
puts ""
puts "    2. Program the ZedBoard (JTAG cable connected, board powered):"
puts "         vivado -mode batch -source scripts/vivado_program.tcl"
puts ""
puts "    3. On the board after programming:"
puts "         LD7 blinking   heartbeat — clock running at 100 MHz"
puts "         LD0 lit        system_ready — waiting for commands"
puts "         SW1 toggle     load weights"
puts "         SW0 toggle     start inference"
puts "         BTNC           reset"
puts ""
