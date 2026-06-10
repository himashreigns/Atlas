# =============================================================================
# DNN Accelerator: Constrained Optimization + Comprehensive TB Flow
# =============================================================================
# Run from the directory that contains this Makefile.
# Paths are all RELATIVE so the project works regardless of where it is placed
# on disk — including paths with spaces.
#
# Targets:
#   optimize    run the optimizer, emit sim/dnn_config.vh
#   golden      run TF inference, write golden CSV + memh
#   compile     iverilog-compile the comprehensive TB
#   sim         run the comprehensive simulation
#   hw-dump     run DUT with real MAC computation, dump sim/hw_output.txt
#   compare     Python: compare sim/hw_output.txt vs TF golden
#   vs-golden   run overall SV golden-comparison TB
#   timing      Zedboard timing verification
#   all         everything above in order
#   pareto      print Pareto-optimal design points
#   unit        30 Python unit tests for the optimizer
#   vivado      production synth/impl/STA flow (requires Vivado)
#   clean       remove all generated artefacts
#
# Tunable variables (override on the command line):
#   DNN=lenet5|tiny_vgg   AREA=180   POWER=2000   OBJ=latency
# =============================================================================

DNN      ?= lenet5
AREA     ?= 180
POWER    ?= 2000
OBJ      ?= latency

PY       ?= python3
IVERILOG ?= iverilog
VVP      ?= vvp
VIVADO   ?= vivado

# ---------------------------------------------------------------------------
# All paths are relative to the directory containing this Makefile.
# Never use $(abspath ...) — absolute paths break when the directory name
# contains spaces.
# ---------------------------------------------------------------------------
SIM_DIR  := sim
STUB_DIR := rtl_stubs
GOLD_DIR := golden

HEADER   := $(SIM_DIR)/dnn_config.vh
JSON     := dnn_config.json
TB_V     := $(SIM_DIR)/tb_dnn_comprehensive.v
TBZ_V    := $(SIM_DIR)/tb_zedboard_timing.v
TBG_V    := $(SIM_DIR)/tb_dnn_vs_golden.v
TBD_V    := $(SIM_DIR)/tb_hw_output_dump.v
STUB_SV  := $(STUB_DIR)/streaming_nn_system_stub.sv
TOP_SV   := $(STUB_DIR)/zedboard_top.sv

VVP_OUT  := $(SIM_DIR)/tb.vvp
VVPZ_OUT := $(SIM_DIR)/tb_zed.vvp
VVPG_OUT := $(SIM_DIR)/tb_vs_golden.vvp
VVPD_OUT := $(SIM_DIR)/tb_hw_dump.vvp

GOLD_OUT := $(GOLD_DIR)/golden_output_tf.memh
GOLD_CSV := $(GOLD_DIR)/golden_output_tf.csv

.PHONY: all optimize golden compile sim hw-dump compare vs-golden \
        timing timing-compile unit pareto vivado clean help \
        bench-kws bench-vww bench-yolo bench-ecg bench-gesture bench-all

# ---------------------------------------------------------------------------
all: optimize golden compile sim hw-dump compare vs-golden timing

help:
	@echo "Targets: optimize golden compile sim hw-dump compare vs-golden timing all"
	@echo "         pareto unit vivado clean"
	@echo "Benchmarks (iverilog): bench-kws bench-vww bench-yolo bench-ecg bench-gesture bench-all"
	@echo "Benchmarks (Vivado) :  make vivado-bench BENCH=kws"
	@echo "Vars   : DNN=$(DNN) AREA=$(AREA) POWER=$(POWER) OBJ=$(OBJ)"

# ---------------------------------------------------------------------------
optimize: $(HEADER)

$(HEADER): dnn_optimizer.py
	@echo "=== Running constrained optimizer ==="
	$(PY) dnn_optimizer.py \
	    --dnn $(DNN) \
	    --area-budget $(AREA) \
	    --power-budget $(POWER) \
	    --objective $(OBJ) \
	    --out-header $(HEADER) \
	    --out-json $(JSON) \
	    -v

# ---------------------------------------------------------------------------
golden: $(GOLD_OUT)

$(GOLD_OUT): $(GOLD_DIR)/tf_golden.py
	@echo "=== Generating TF golden reference ==="
	cd $(GOLD_DIR) && $(PY) tf_golden.py . 2>&1 | \
	    grep -v 'tensorflow\|cuda\|oneDNN\|cpu_feature\|absl::\|InitializeLog'

# ---------------------------------------------------------------------------
pareto:
	$(PY) dnn_optimizer.py --dnn $(DNN) \
	    --area-budget $(AREA) --power-budget $(POWER) --pareto

unit:
	$(PY) -m pytest -q test_dnn_optimizer.py 2>/dev/null || $(PY) test_dnn_optimizer.py

# ---------------------------------------------------------------------------
compile: $(VVP_OUT)

$(VVP_OUT): $(TB_V) $(STUB_SV) $(HEADER) $(GOLD_OUT)
	@echo "=== Compiling comprehensive TB ==="
	cd $(SIM_DIR) && $(IVERILOG) -g2012 -DGOLDEN_REPLAY -o tb.vvp \
	    tb_dnn_comprehensive.v ../$(STUB_SV) -I .

sim: compile
	@echo "=== Running comprehensive simulation ==="
	cd $(SIM_DIR) && $(VVP) tb.vvp

# ---------------------------------------------------------------------------
hw-dump: $(VVPD_OUT)
	@echo "=== Running HW output dump (real MAC computation) ==="
	cd $(SIM_DIR) && $(VVP) tb_hw_dump.vvp

$(VVPD_OUT): $(TBD_V) $(STUB_SV) $(HEADER) $(GOLD_OUT)
	@echo "=== Compiling HW output dump TB ==="
	cd $(SIM_DIR) && $(IVERILOG) -g2012 -DCOMPUTE_MODE -o tb_hw_dump.vvp \
	    tb_hw_output_dump.v ../$(STUB_SV) -I .

compare: hw-dump $(GOLD_CSV)
	@echo "=== Comparing TF golden vs hardware output ==="
	cd $(SIM_DIR) && $(PY) ../compare_tf_vs_hw.py \
	    --tf-csv ../$(GOLD_CSV) \
	    --hw-txt hw_output.txt \
	    --tolerance 2.0

# ---------------------------------------------------------------------------
vs-golden: $(VVPG_OUT)
	@echo "=== Running SV golden-comparison TB ==="
	cd $(SIM_DIR) && $(VVP) tb_vs_golden.vvp

$(VVPG_OUT): $(TBG_V) $(STUB_SV) $(HEADER) $(GOLD_OUT)
	@echo "=== Compiling golden-comparison TB ==="
	cd $(SIM_DIR) && $(IVERILOG) -g2012 -DGOLDEN_REPLAY -o tb_vs_golden.vvp \
	    tb_dnn_vs_golden.v ../$(STUB_SV) -I .

# ---------------------------------------------------------------------------
timing-compile: $(VVPZ_OUT)

$(VVPZ_OUT): $(TBZ_V) $(STUB_SV) $(HEADER) $(GOLD_OUT)
	@echo "=== Compiling Zedboard timing TB ==="
	cd $(SIM_DIR) && $(IVERILOG) -g2012 -DGOLDEN_REPLAY -o tb_zed.vvp \
	    tb_zedboard_timing.v ../$(STUB_SV) -I .

timing: timing-compile
	@echo "=== Running Zedboard timing simulation ==="
	cd $(SIM_DIR) && $(VVP) tb_zed.vvp

# ---------------------------------------------------------------------------
vivado:
	@echo "=== Running Vivado build (synth + impl + bitstream) ==="
	vivado -mode batch -source scripts/vivado_start.tcl

program:
	@echo "=== Programming ZedBoard ==="
	vivado -mode batch -source scripts/vivado_program.tcl

# ---------------------------------------------------------------------------
# ---------------------------------------------------------------------------
# IoT Benchmark targets  (iverilog — no Vivado needed)
# ---------------------------------------------------------------------------
BENCH_RTL := $(wildcard $(STUB_DIR)/*.v)

define BENCH_template
bench-$(1):
	@echo "=== Benchmark: $(1) ==="
	cd benchmarks/$(1) && $(PY) tf_golden_$(1).py .
	cd benchmarks/$(1) && $(IVERILOG) -g2012 -o tb_$(1).vvp tb_$(2).v \
	    ../bench_stub.v -I . -I ../../sim
	cd benchmarks/$(1) && $(VVP) tb_$(1).vvp
endef

$(eval $(call BENCH_template,kws,kws))
$(eval $(call BENCH_template,vww,vww))
$(eval $(call BENCH_template,yolo_nano,yolo_nano))
$(eval $(call BENCH_template,ecg,ecg))
$(eval $(call BENCH_template,gesture,gesture))

bench-yolo: bench-yolo_nano

bench-all: bench-kws bench-vww bench-yolo_nano bench-ecg bench-gesture
	@echo "=== All 5 IoT benchmarks complete ==="

# Run all benchmarks then generate performance report + CSV
bench-report: bench-all
	@echo "=== Generating performance report ==="
	$(PY) benchmarks/perf_report.py

# Systolic-array benchmark (uses systolic_array_simulator/sim_framework)
bench-sa:
	@echo "=== Systolic Array Benchmark ==="
	$(PY) benchmarks/sa_benchmark.py

# Fair architectural comparison (equal MACs, DRAM modelled, corrected OS formula)
bench-fair:
	@echo "=== Fair Comparison: Streaming Pipeline vs SA-1×8 ==="
	$(PY) benchmarks/fair_comparison_benchmark.py

# Vivado batch mode for any benchmark:
#   make vivado-bench BENCH=kws
vivado-bench:
	$(VIVADO) -mode batch \
	    -source benchmarks/vivado_bench.tcl \
	    -tclargs $(BENCH)

# ---------------------------------------------------------------------------
clean:
	rm -f $(HEADER) $(JSON)
	rm -f $(SIM_DIR)/*.vvp $(SIM_DIR)/*.vcd $(SIM_DIR)/hw_output.txt
	rm -f $(GOLD_DIR)/golden_*.memh $(GOLD_DIR)/golden_*.csv \
	      $(GOLD_DIR)/golden_meta.json
	rm -rf __pycache__ .pytest_cache build
