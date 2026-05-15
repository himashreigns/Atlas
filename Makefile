# Makefile for Stream Processing Accelerator
# Provides convenient commands for Vivado workflow

VIVADO = vivado
VIVADO_BATCH = $(VIVADO) -mode batch -source
PROJECT_DIR = vivado_project
PROJECT_NAME = stream_processing_final

.PHONY: help create build simulate test clean program gui reports

# Default target
help:
	@echo "================================================"
	@echo "Stream Processing Accelerator - Build System"
	@echo "================================================"
	@echo ""
	@echo "Available targets:"
	@echo "  make test       - Run all RTL unit tests (Vivado XSim)"
	@echo "  make test-clean - Clean sim_out/ then run all unit tests"
	@echo "  make create     - Create Vivado project"
	@echo "  make build      - Run full synthesis and implementation"
	@echo "  make simulate   - Run behavioral simulation"
	@echo "  make gui        - Open project in Vivado GUI"
	@echo "  make reports    - Generate detailed reports"
	@echo "  make program    - Program FPGA (requires hardware)"
	@echo "  make clean      - Clean build artifacts"
	@echo "  make help       - Show this help message"
	@echo ""
	@echo "Quick start:"
	@echo "  1. make create"
	@echo "  2. make build"
	@echo "  3. make program"
	@echo ""

# Run all unit tests with Vivado XSim
test:
	@bash scripts/run_tests.sh

# Run tests after deleting previous sim output
test-clean:
	@bash scripts/run_tests.sh --clean

# Create Vivado project
create:
	@echo "Creating Vivado project..."
	$(VIVADO_BATCH) scripts/create_project.tcl
	@echo "Project created successfully!"
	@echo "Location: $(PROJECT_DIR)/$(PROJECT_NAME).xpr"

# Run full build (synthesis + implementation + bitstream)
build:
	@echo "Running full build..."
	@if [ ! -f "$(PROJECT_DIR)/$(PROJECT_NAME).xpr" ]; then \
		echo "ERROR: Project not found. Run 'make create' first."; \
		exit 1; \
	fi
	$(VIVADO_BATCH) scripts/build.tcl
	@echo "Build complete!"
	@echo "Bitstream: bitstream/stream_processing_final.bit"

# Run simulation
simulate:
	@echo "Running simulation..."
	@if [ ! -f "$(PROJECT_DIR)/$(PROJECT_NAME).xpr" ]; then \
		echo "ERROR: Project not found. Run 'make create' first."; \
		exit 1; \
	fi
	$(VIVADO_BATCH) scripts/simulate.tcl
	@echo "Simulation complete!"

# Open GUI
gui:
	@if [ ! -f "$(PROJECT_DIR)/$(PROJECT_NAME).xpr" ]; then \
		echo "ERROR: Project not found. Run 'make create' first."; \
		exit 1; \
	fi
	$(VIVADO) $(PROJECT_DIR)/$(PROJECT_NAME).xpr &

# Generate detailed reports
reports:
	@echo "Generating reports..."
	@if [ ! -d "$(PROJECT_DIR)" ]; then \
		echo "ERROR: Project not found. Run 'make create' and 'make build' first."; \
		exit 1; \
	fi
	@mkdir -p docs
	@echo "Reports saved to docs/"

# Program FPGA
program:
	@echo "Programming FPGA..."
	@if [ ! -f "bitstream/stream_processing_final.bit" ]; then \
		echo "ERROR: Bitstream not found. Run 'make build' first."; \
		exit 1; \
	fi
	$(VIVADO_BATCH) scripts/program_fpga.tcl
	@echo "FPGA programmed successfully!"

# Clean build artifacts
clean:
	@echo "Cleaning build artifacts..."
	rm -rf $(PROJECT_DIR)
	rm -rf .Xil
	rm -rf docs/*.txt
	rm -rf docs/*.log
	rm -rf bitstream/*.bit
	rm -f vivado*.jou
	rm -f vivado*.log
	@echo "Clean complete!"

# Synthesis only
synth:
	@echo "Running synthesis..."
	@if [ ! -f "$(PROJECT_DIR)/$(PROJECT_NAME).xpr" ]; then \
		echo "ERROR: Project not found. Run 'make create' first."; \
		exit 1; \
	fi
	$(VIVADO) -mode batch -source scripts/synth_only.tcl
	@echo "Synthesis complete!"

# Implementation only (after synthesis)
impl:
	@echo "Running implementation..."
	@if [ ! -f "$(PROJECT_DIR)/$(PROJECT_NAME).xpr" ]; then \
		echo "ERROR: Project not found. Run synthesis first."; \
		exit 1; \
	fi
	$(VIVADO) -mode batch -source scripts/impl_only.tcl
	@echo "Implementation complete!"

# Quick check (syntax check without full synthesis)
check:
	@echo "Running syntax check..."
	@if [ ! -f "$(PROJECT_DIR)/$(PROJECT_NAME).xpr" ]; then \
		echo "ERROR: Project not found. Run 'make create' first."; \
		exit 1; \
	fi
	$(VIVADO) -mode batch -source scripts/check_syntax.tcl
	@echo "Syntax check complete!"

# Package everything for distribution
package:
	@echo "Packaging project..."
	@mkdir -p release
	tar -czf release/stream_processing_final.tar.gz \
		rtl/ tb/ scripts/ constraints/ README.md Makefile \
		--exclude='*.log' --exclude='*.jou'
	@echo "Package created: release/stream_processing_final.tar.gz"

# Show project info
info:
	@echo "================================================"
	@echo "Project Information"
	@echo "================================================"
	@if [ -f "$(PROJECT_DIR)/$(PROJECT_NAME).xpr" ]; then \
		echo "Status: Project exists"; \
		echo "Location: $(PROJECT_DIR)/$(PROJECT_NAME).xpr"; \
		if [ -f "bitstream/stream_processing_final.bit" ]; then \
			echo "Bitstream: Available"; \
			ls -lh bitstream/stream_processing_final.bit; \
		else \
			echo "Bitstream: Not generated"; \
		fi; \
	else \
		echo "Status: Project not created"; \
		echo "Run 'make create' to create project"; \
	fi
	@echo ""
	@echo "Source files:"
	@ls -1 rtl/*.v | wc -l | xargs echo "  RTL files:"
	@ls -1 tb/*.v tb/*.sv 2>/dev/null | wc -l | xargs echo "  Testbenches:"
	@echo ""
