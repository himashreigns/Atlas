/* =============================================================================
 * dnn_accel.c — bare-metal driver
 * ============================================================================= */
#include "dnn_accel.h"

#include "xil_io.h"
#include "xil_cache.h"
#include "xil_printf.h"
#include "xparameters.h"
#include "xscugic.h"
#include "sleep.h"

/* --- Register accessors -------------------------------------------------- */
static inline void  reg_wr(u32 off, u32 v) { Xil_Out32(DNN_ACCEL_BASE_ADDR + off, v); }
static inline u32   reg_rd(u32 off)        { return Xil_In32(DNN_ACCEL_BASE_ADDR + off); }

/* --- IRQ plumbing -------------------------------------------------------- */
static volatile int s_done_flag = 0;
static XScuGic *s_gic = NULL;

static void dnn_irq_handler(void *cb) {
    (void)cb;
    s_done_flag = 1;
}

static int dnn_irq_connect(XScuGic *gic) {
    int s;
    s_gic = gic;
    s = XScuGic_Connect(gic, DNN_ACCEL_IRQ_ID,
                        (Xil_ExceptionHandler)dnn_irq_handler, NULL);
    if (s != XST_SUCCESS) {
        xil_printf("[dnn_accel] XScuGic_Connect FAIL (%d)\r\n", s);
        return s;
    }
    /* Rising edge, priority 0xA0 */
    XScuGic_SetPriorityTriggerType(gic, DNN_ACCEL_IRQ_ID, 0xA0, 0x3);
    XScuGic_Enable(gic, DNN_ACCEL_IRQ_ID);
    return XST_SUCCESS;
}

/* --- Public API ---------------------------------------------------------- */
int dnn_accel_init(void) {
    /* Smoke-test: read CONFIG register, expect NUM_LAYERS=4 for YOLO-Nano. */
    u32 cfg = reg_rd(DNN_REG_CONFIG);
    u32 num_layers = cfg & 0xFF;
    xil_printf("[dnn_accel] CONFIG=0x%08x  NUM_LAYERS=%u\r\n", cfg, num_layers);
    if (num_layers == 0u || num_layers == 0xFFu) {
        xil_printf("[dnn_accel] ERROR: accelerator unresponsive at 0x%08x\r\n",
                   DNN_ACCEL_BASE_ADDR);
        return -1;
    }

    /* Program the static base addresses (in accelerator-local word units). */
    reg_wr(DNN_REG_INPUT_BASE,  DNN_ACC_IDX_INPUT);
    reg_wr(DNN_REG_OUTPUT_BASE, DNN_ACC_IDX_OUTPUT);
    reg_wr(DNN_REG_WEIGHT_BASE, DNN_ACC_IDX_WGT_L0);
    return 0;
}

void dnn_accel_configure_yolo_sizes(void) {
    /* Tell the accelerator's streaming pipeline to expect YOLO-Nano tensor
     * sizes (16x16 input, 20 outputs, per-layer weight counts 36/0/0/720).
     * Without these writes the core falls back to its built-in LeNet defaults
     * (784 / 256 / 150-0-2400-0). */
    reg_wr(DNN_REG_INPUT_SIZE,  YOLO_IN_LEN);   /* 256 */
    reg_wr(DNN_REG_OUTPUT_SIZE, YOLO_OUT_LEN);  /* 20  */
    reg_wr(DNN_REG_WGT_PL(0), YOLO_WGT_L0_LEN); /* 36  CONV(3x3,1->4) */
    reg_wr(DNN_REG_WGT_PL(1), 0);               /*     POOL — no weights */
    reg_wr(DNN_REG_WGT_PL(2), 0);               /*     POOL — no weights */
    reg_wr(DNN_REG_WGT_PL(3), YOLO_WGT_L3_LEN); /* 720 FC(36->20)    */
    xil_printf("[dnn_accel] YOLO sizes: IN=%d OUT=%d WGT=[%d,0,0,%d]\r\n",
               YOLO_IN_LEN, YOLO_OUT_LEN, YOLO_WGT_L0_LEN, YOLO_WGT_L3_LEN);
}

void dnn_accel_load_weights(const s16 *wgt_l0, const s16 *wgt_l3) {
    /* One weight per 32-bit DDR word (accelerator strides by 4 bytes). Store
     * as sign-extended s32 so the layer sees the same value the C source
     * declared. */
    int i;
    for (i = 0; i < YOLO_WGT_L0_LEN; ++i) DNN_PTR_WGT_L0[i] = (s32)wgt_l0[i];
    for (i = 0; i < YOLO_WGT_L3_LEN; ++i) DNN_PTR_WGT_L3[i] = (s32)wgt_l3[i];

    /* Flush so the accelerator (non-coherent HP) sees the latest data. */
    Xil_DCacheFlushRange((INTPTR)DNN_PTR_WGT_L0, YOLO_WGT_L0_LEN * sizeof(s32));
    Xil_DCacheFlushRange((INTPTR)DNN_PTR_WGT_L3, YOLO_WGT_L3_LEN * sizeof(s32));

    /* Pulse load_weights, then poll wgt_loaded. */
    reg_wr(DNN_REG_CTRL, DNN_CTRL_LOAD_WGT);
    for (int t = 0; t < 1000; ++t) {
        if (reg_rd(DNN_REG_STATUS) & DNN_STATUS_WGT_LOADED) {
            xil_printf("[dnn_accel] weights loaded (t=%d)\r\n", t);
            return;
        }
        usleep(10);
    }
    xil_printf("[dnn_accel] WARN: weights_loaded never asserted (status=0x%08x)\r\n",
               reg_rd(DNN_REG_STATUS));
}

int dnn_accel_run_inference(const s16 *input, s32 *output) {
    /* 1. Stage the input into DDR and flush. One pixel per 32-bit word;
     *    sign-extend the s16 activation into the low 16 bits of the word. */
    for (int i = 0; i < YOLO_IN_LEN; ++i) DNN_PTR_INPUT[i] = (s32)input[i];
    Xil_DCacheFlushRange((INTPTR)DNN_PTR_INPUT, YOLO_IN_LEN * sizeof(s32));

    /* 2. Clear stale output region so we can spot the writeback later. */
    Xil_DCacheInvalidateRange((INTPTR)DNN_PTR_OUTPUT, YOLO_OUT_LEN * sizeof(s32));

    /* 3. Kick. */
    s_done_flag = 0;
    reg_wr(DNN_REG_CTRL, DNN_CTRL_START);

    /* 4. Wait for IRQ or fall back to polling if GIC was never wired up. */
    u32 timeout = 1u << 24;
    if (s_gic != NULL) {
        while (!s_done_flag && --timeout) { /* spin until ISR sets flag */ }
    } else {
        while (!(reg_rd(DNN_REG_STATUS) & DNN_STATUS_DONE) && --timeout) {}
    }
    if (timeout == 0u) {
        xil_printf("[dnn_accel] TIMEOUT (status=0x%08x)\r\n",
                   reg_rd(DNN_REG_STATUS));
        return -1;
    }

    /* 5. Invalidate the output region so the next read pulls from DDR. */
    Xil_DCacheInvalidateRange((INTPTR)DNN_PTR_OUTPUT, YOLO_OUT_LEN * sizeof(s32));
    for (int i = 0; i < YOLO_OUT_LEN; ++i) output[i] = DNN_PTR_OUTPUT[i];
    return 0;
}

void dnn_accel_dump_regs(void) {
    xil_printf("[dnn_accel] CTRL=0x%08x STATUS=0x%08x CONFIG=0x%08x\r\n",
               reg_rd(DNN_REG_CTRL), reg_rd(DNN_REG_STATUS), reg_rd(DNN_REG_CONFIG));
    xil_printf("           IN_BASE=0x%08x OUT_BASE=0x%08x WGT_BASE=0x%08x\r\n",
               reg_rd(DNN_REG_INPUT_BASE), reg_rd(DNN_REG_OUTPUT_BASE),
               reg_rd(DNN_REG_WEIGHT_BASE));
}

/* Called from main once GIC is up. */
int dnn_accel_attach_irq(XScuGic *gic) { return dnn_irq_connect(gic); }
