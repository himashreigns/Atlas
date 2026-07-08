# =============================================================================
# Makefile — direct cross-build of dnn_yolo_app for Zynq-7000 Cortex-A9
# Bypasses the broken XSCT 'app create' path in Vitis 2025.2 by compiling
# straight against the pre-built BSP library (libxil.a) under dnn_platform.
#
# Output: workspace/dnn_yolo_app/dnn_yolo_app.elf
# =============================================================================

VITIS_BIN  ?= /home/chathupa/Desktop/AMD/2025.2/Vitis/gnu/aarch32/lin/gcc-arm-none-eabi/bin
CROSS      ?= $(VITIS_BIN)/arm-none-eabi-
CC          = $(CROSS)gcc
LD          = $(CROSS)gcc
OBJCOPY     = $(CROSS)objcopy
SIZE        = $(CROSS)size

PLATFORM   = workspace/dnn_platform
EXPORT     = $(PLATFORM)/export/dnn_platform/sw/dnn_platform
BSP_INC    = $(EXPORT)/standalone_domain/bspinclude/include
BSP_LIB    = $(EXPORT)/standalone_domain/bsplib/lib

SRC_DIR    = src
BUILD_DIR  = workspace/dnn_yolo_app
APP        = $(BUILD_DIR)/dnn_yolo_app.elf

SOURCES    = $(wildcard $(SRC_DIR)/*.c)
OBJECTS    = $(patsubst $(SRC_DIR)/%.c,$(BUILD_DIR)/%.o,$(SOURCES))

CPUFLAGS   = -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard
CFLAGS     = $(CPUFLAGS) -Os -ffunction-sections -fdata-sections \
             -Wall -Wextra -Wno-unused-parameter -Wno-unused-function \
             -DDNN_YOLO_NANO=1 \
             -I$(BSP_INC) -I$(SRC_DIR)

LSCRIPT    = $(SRC_DIR)/lscript.ld
LDFLAGS    = $(CPUFLAGS) \
             -Wl,-T,$(LSCRIPT) \
             -Wl,--gc-sections \
             -Wl,-Map,$(BUILD_DIR)/dnn_yolo_app.map \
             -Wl,--build-id=none \
             -nostartfiles \
             -L$(BSP_LIB)

# crt0 + vectors + boot + MMU table come from BSP .o files (libxil.a archives
# them but crt0 in particular is provided as a free-standing object).
BSP_STARTUP = $(BSP_LIB)/xil-crt0.o \
              $(BSP_LIB)/asm_vectors.o \
              $(BSP_LIB)/boot.o \
              $(BSP_LIB)/translation_table.o \
              $(BSP_LIB)/vectors.o

LIBS        = -Wl,--start-group -lxil -lxilffs -lgcc -lc -lm -Wl,--end-group

# -----------------------------------------------------------------------------
.PHONY: all clean dirs print

all: dirs $(APP)
	@$(SIZE) $(APP)

dirs:
	@mkdir -p $(BUILD_DIR)

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

$(APP): $(OBJECTS) $(LSCRIPT)
	$(LD) $(LDFLAGS) $(BSP_STARTUP) $(OBJECTS) $(LIBS) -o $@

clean:
	rm -rf $(BUILD_DIR)

print:
	@echo "SOURCES = $(SOURCES)"
	@echo "OBJECTS = $(OBJECTS)"
	@echo "BSP_INC = $(BSP_INC)"
	@echo "BSP_LIB = $(BSP_LIB)"
