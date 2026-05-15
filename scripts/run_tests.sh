#!/usr/bin/env bash
# run_tests.sh — compile and simulate all unit tests with Vivado XSim
#
# Usage:
#   ./scripts/run_tests.sh          # run all tests
#   ./scripts/run_tests.sh --clean  # delete sim_out/ first, then run
#
# Each test gets its own subdirectory under sim_out/ so libraries never
# conflict (important because tb_dynamic_interconnect defines its own
# mac_unit which clashes with reconfigurable_nn_accelerator.v).
#
# Logs per test:
#   sim_out/<tb_name>/compile.log   xvlog output
#   sim_out/<tb_name>/elab.log      xelab output
#   sim_out/<tb_name>/sim.log       xsim $display output (PASS/FAIL here)

set -uo pipefail

PROJ_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
RTL="$PROJ_ROOT/rtl"
TB="$PROJ_ROOT/tb"
OUTDIR="$PROJ_ROOT/sim_out"

if [[ "${1:-}" == "--clean" ]]; then
    echo "Removing $OUTDIR ..."
    rm -rf "$OUTDIR"
fi

mkdir -p "$OUTDIR"

PASS=0; FAIL=0; SKIP=0
declare -a RESULTS=()

# ---------------------------------------------------------------------------
# run_test <tb_module> <tb_filename> <rtl_file1> [<rtl_file2> ...]
#
# Compiles all files into an isolated xsim.dir in sim_out/<tb_module>/,
# elaborates the top-level tb_module, runs simulation, checks for PASS/FAIL.
# ---------------------------------------------------------------------------
run_test() {
    local TB_MOD="$1"; shift
    local TB_SRC="$1"; shift     # filename only, resolved from $TB/
    local WDIR="$OUTDIR/$TB_MOD"
    mkdir -p "$WDIR"

    # Build RTL file list with absolute paths
    local RTL_SRCS=()
    for f in "$@"; do
        RTL_SRCS+=("$RTL/$f")
    done

    printf "  %-46s " "$TB_MOD"

    # ---- compile ----
    (
        cd "$WDIR"
        xvlog "${RTL_SRCS[@]}" "$TB/$TB_SRC" > compile.log 2>&1 || exit 1

        # ---- elaborate ----
        xelab "$TB_MOD" -s "${TB_MOD}_sim" > elab.log 2>&1 || exit 2

        # ---- simulate ----
        xsim "${TB_MOD}_sim" --runall > sim.log 2>&1 || true
    )

    # ---- determine status from log files ----
    # Covers several $display conventions used across testbenches:
    #   "PASS: <name>..."        — standard one-liner verdict
    #   "ALL N TESTS PASSED"     — dynamic_interconnect / resource_manager style
    #   "passed, 0 failed"       — nn_layer_control_unit Results: line
    # Failure patterns mirror the same conventions.
    local STATUS
    if   ! [ -f "$WDIR/elab.log" ]; then
        STATUS="COMPILE_ERR"
    elif ! [ -f "$WDIR/sim.log"  ]; then
        STATUS="ELAB_ERR"
    elif grep -qE "(^PASS:|ALL [0-9]+ TESTS PASSED|passed, 0 failed)" "$WDIR/sim.log"; then
        STATUS="PASS"
    elif grep -qE "(^FAIL:|TESTS FAILED|[0-9]+ error)" "$WDIR/sim.log"; then
        STATUS="FAIL"
    else
        STATUS="UNKNOWN"
    fi

    echo "$STATUS"

    case "$STATUS" in
        PASS)    PASS=$((PASS+1));  RESULTS+=("  PASS     $TB_MOD") ;;
        FAIL)    FAIL=$((FAIL+1));  RESULTS+=("  FAIL     $TB_MOD") ;;
        *)       SKIP=$((SKIP+1));  RESULTS+=("  $STATUS  $TB_MOD") ;;
    esac
}

echo "========================================================"
echo "  Atlas RTL Unit Test Suite  —  Vivado XSim"
echo "  Project : $PROJ_ROOT"
echo "  Logs    : $OUTDIR/<test_name>/{compile,elab,sim}.log"
echo "========================================================"
echo ""
echo "Running tests..."
echo ""

# ---- leaf / standalone modules ----------------------------------------
run_test tb_mac_stage \
    tb_mac_stage.v \
    mac_stage.v

run_test tb_mac_array \
    tb_mac_array.v \
    mac_array.v

# ---- BRAM stage (wraps mac_array) -------------------------------------
run_test tb_mac_array_stage_with_bram \
    tb_mac_array_stage_with_bram.v \
    mac_array_stage_with_bram.v mac_array.v

# ---- streaming row buffer ---------------------------------------------
run_test tb_streaming_row_buffer \
    tb_streaming_row_buffer.v \
    streaming_row_buffer.v

# ---- control unit -----------------------------------------------------
run_test tb_nn_layer_control_unit \
    tb_nn_layer_control_unit.v \
    nn_layer_control_unit.v

# ---- single layer stage (depends on row buffer + mac + ctrl unit) -----
run_test tb_streaming_nn_layer_stage \
    tb_streaming_nn_layer_stage.v \
    streaming_nn_layer_stage.v \
    streaming_row_buffer.v \
    mac_array.v \
    nn_layer_control_unit.v

# ---- 4-layer LeNet-5 pipeline (all of the above + pipeline wrapper) ---
run_test tb_streaming_nn_pipeline \
    tb_streaming_nn_pipeline.v \
    streaming_nn_pipeline.v \
    streaming_nn_layer_stage.v \
    streaming_row_buffer.v \
    mac_array.v \
    nn_layer_control_unit.v

# ---- dynamic interconnect (isolated: defines its own mac_unit stub) ---
run_test tb_dynamic_interconnect \
    tb_dynamic_interconnect.v \
    dynamic_interconnect.v

# ---- runtime resource manager -----------------------------------------
run_test tb_runtime_resource_manager \
    tb_runtime_resource_manager.v \
    runtime_resource_manager.v

# ---- summary -----------------------------------------------------------
TOTAL=$((PASS + FAIL + SKIP))
echo ""
echo "========================================================"
echo "  Results"
echo "========================================================"
for r in "${RESULTS[@]}"; do echo "$r"; done
echo ""
printf "  PASS: %d   FAIL: %d   OTHER: %d   TOTAL: %d\n" \
    "$PASS" "$FAIL" "$SKIP" "$TOTAL"
echo ""
if [ "$FAIL" -eq 0 ] && [ "$SKIP" -eq 0 ]; then
    echo "  ALL TESTS PASSED"
else
    [ "$FAIL" -gt 0 ] && \
        echo "  Some tests FAILED — check sim_out/<name>/sim.log"
    [ "$SKIP" -gt 0 ] && \
        echo "  Some tests had compile/elab errors — check sim_out/<name>/compile.log or elab.log"
fi
echo "========================================================"

# Exit non-zero if any test failed or errored
[ "$FAIL" -eq 0 ] && [ "$SKIP" -eq 0 ]
