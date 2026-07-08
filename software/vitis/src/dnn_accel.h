/* =============================================================================
 * dnn_accel.h
 *
 * Bare-metal driver for the YOLO-Nano DNN accelerator attached to the Zynq PS
 * via M_AXI_GP0 (control) and S_AXI_HP0 (DMA into DDR).
 *
 *   Register window  (M_AXI_GP0)     : DNN_ACCEL_BASE_ADDR (0x43C00000)
 *   DMA scratch pool (S_AXI_HP0)     : DNN_DMA_POOL_BASE   (0x10000000)
 *
 * The accelerator is master on the data bus and will fetch input/weights and
 * write output to whatever physical addresses are programmed into the
 * INPUT_BASE / OUTPUT_BASE / WEIGHT_BASE registers. Those are 20-bit
 * accelerator-local addresses; the AXI master wrapper ORs in DNN_DMA_POOL_BASE
 * (0x1000_0000) to land them in DDR, so the layout is:
 *
 *   DNN_DMA_POOL_BASE + 0x00000   →  INPUT  (16x16 i16 = 512 B)
 *   DNN_DMA_POOL_BASE + 0x10000   →  OUTPUT (20 i32     =  80 B)
 *   DNN_DMA_POOL_BASE + 0x80000   →  WEIGHTS L0  (36 i16 = 72 B)
 *   DNN_DMA_POOL_BASE + 0x80C00   →  WEIGHTS L3  (720 i16 = 1440 B)
 * ============================================================================= */
#ifndef DNN_ACCEL_H_
#define DNN_ACCEL_H_

#include "xil_types.h"

/* --- Memory map ---------------------------------------------------------- */
#define DNN_ACCEL_BASE_ADDR     0x43C00000u
#define DNN_DMA_POOL_BASE       0x10000000u
#define DNN_DMA_POOL_SIZE       (16u * 1024u * 1024u)   /* 16 MB */

/* Offsets from DNN_DMA_POOL_BASE (byte offsets).
 *
 * Weights are laid out contiguously because the weight-loader FSM in the
 * accelerator reads them as one continuous stream (only Layer 0's base is
 * writable via CTRL; layers 1..3 continue from where Layer 0 ended). So the
 * order in DRAM must be Layer 0 (36 words) immediately followed by Layer 3
 * (720 words). Skip layers (POOL) don't consume any words. */
#define DNN_OFFS_INPUT          0x00000000u
#define DNN_OFFS_OUTPUT         0x00010000u
#define DNN_OFFS_WGT_L0         0x00080000u                    /* 36  * 4 = 144 B */
#define DNN_OFFS_WGT_L3         (DNN_OFFS_WGT_L0 + 36u * 4u)   /* = 0x00080090u  */

/* Accelerator-local 20-bit word indices (what we write into INPUT_BASE etc.) */
#define DNN_ACC_IDX_INPUT       (DNN_OFFS_INPUT  >> 2)
#define DNN_ACC_IDX_OUTPUT      (DNN_OFFS_OUTPUT >> 2)
#define DNN_ACC_IDX_WGT_L0      (DNN_OFFS_WGT_L0 >> 2)
#define DNN_ACC_IDX_WGT_L3      (DNN_OFFS_WGT_L3 >> 2)

/* Physical pointers usable from the A9 (cached unless Xil_DCacheDisable).
 *
 * IMPORTANT: The accelerator's axi_master_mem interface addresses DRAM in
 * 32-bit word strides (accel_addr << 2). For each pixel/weight/output element
 * the accelerator reads or writes ONE 32-bit word. The DATA_W-wide payload
 * lives in the low bits of that word. So every array below must be laid out
 * as one element per 32-bit word — using s16* would pack two elements per
 * word and cause the accelerator to skip half of them and read stale DRAM. */
#define DNN_PTR_INPUT           ((volatile s32 *)(DNN_DMA_POOL_BASE + DNN_OFFS_INPUT))
#define DNN_PTR_OUTPUT          ((volatile s32 *)(DNN_DMA_POOL_BASE + DNN_OFFS_OUTPUT))
#define DNN_PTR_WGT_L0          ((volatile s32 *)(DNN_DMA_POOL_BASE + DNN_OFFS_WGT_L0))
#define DNN_PTR_WGT_L3          ((volatile s32 *)(DNN_DMA_POOL_BASE + DNN_OFFS_WGT_L3))

/* --- Register offsets ---------------------------------------------------- */
#define DNN_REG_CTRL            0x0000u   /* W : [0]=start, [1]=load_wgt, [3:2]=mode */
#define DNN_REG_STATUS          0x0004u   /* R : [0]=done, [1]=busy, [2]=wgt_loaded */
#define DNN_REG_CONFIG          0x0008u   /* R : [7:0]=NUM_LAYERS */
#define DNN_REG_INPUT_BASE      0x0010u   /* W : 20-bit accel address */
#define DNN_REG_OUTPUT_BASE     0x0014u   /* W : 20-bit accel address */
#define DNN_REG_WEIGHT_BASE     0x0018u   /* W : 20-bit accel address (L0 base) */

/* YOLO accommodation: tensor-size configuration window (added 2026-06-27) */
#define DNN_REG_INPUT_SIZE      0x0020u   /* W : pixels per frame      */
#define DNN_REG_OUTPUT_SIZE     0x0024u   /* W : output elements       */
#define DNN_REG_WGT_PL(idx)     (0x0030u + ((idx) * 0x04u)) /* W : weights[L] */

/* Reconfigurable-mode per-layer config window starts at 0x0100 */
#define DNN_REG_LAYER_CFG(idx)  (0x0100u + ((idx) * 0x10u))

#define DNN_CTRL_START          (1u << 0)
#define DNN_CTRL_LOAD_WGT       (1u << 1)
#define DNN_STATUS_DONE         (1u << 0)
#define DNN_STATUS_BUSY         (1u << 1)
#define DNN_STATUS_WGT_LOADED   (1u << 2)

/* --- Image / tensor shapes ------------------------------------------------
 * The accelerator now exposes INPUT_SIZE / OUTPUT_SIZE / weights_per_layer[]
 * as host-writable registers (DNN_REG_INPUT_SIZE etc.), so the same bitstream
 * can serve different workloads. We push YOLO-Nano sizes from the host before
 * loading weights.
 *
 * Caveat: the bitstream's LAYER TOPOLOGY (CONV(5x5) - POOL - CONV(5x5) - POOL)
 * is still hardcoded — YOLO-Nano's true layer ordering is CONV(3x3)-POOL-POOL-FC.
 * Inference will COMPLETE with YOLO-shaped inputs, but the convolved values
 * are mathematically meaningless until the layer modules themselves are
 * redesigned to support per-layer type / kernel-size configuration.
 */
#define YOLO_IN_H               16
#define YOLO_IN_W               16
#define YOLO_IN_C               1
#define YOLO_IN_LEN             (YOLO_IN_H * YOLO_IN_W * YOLO_IN_C)  /* 256 */
#define YOLO_OUT_LEN            20   /* 4 grid cells * 5 params */
#define YOLO_GRID_CELLS         4
#define YOLO_PARAMS_PER_CELL    5

#define YOLO_WGT_L0_LEN         36   /* 3x3x1x4 */
#define YOLO_WGT_L3_LEN         720  /* 36x20    */

/* IRQ ID for accelerator done_interrupt (Zynq IRQ_F2P[0] = SPI #61) */
#define DNN_ACCEL_IRQ_ID        61u

/* --- API ----------------------------------------------------------------- */
int  dnn_accel_init(void);
void dnn_accel_configure_yolo_sizes(void);   /* writes the YOLO-Nano size regs */
void dnn_accel_load_weights(const s16 *wgt_l0, const s16 *wgt_l3);
int  dnn_accel_run_inference(const s16 *input, s32 *output);
void dnn_accel_dump_regs(void);

#endif /* DNN_ACCEL_H_ */
