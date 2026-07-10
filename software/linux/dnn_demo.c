/* =============================================================================
 * dnn_demo.c — Linux userspace live-camera demo for the YOLO-Nano DNN
 *              accelerator on the ZedBoard (Zynq-7020).
 *
 *   ┌────────┐  YUYV   ┌──────────┐ 16x16 Q8.8 ┌──────────────┐  boxes ┌───────┐
 *   │ USB    │ ──────► │preprocess│ ─────────► │ accelerator  │ ─────► │stdout │
 *   │ camera │  V4L2   │ (Y→gray) │            │ 0x43C00000 + │        │  log  │
 *   │/dev/vid│  mmap   │  ↓16x16  │            │ DMA 0x1000_0 │        │       │
 *   └────────┘         └──────────┘            └──────────────┘        └───────┘
 *
 * Talks to the accelerator exactly like the bare-metal driver did, but through
 * /dev/mem (opened O_SYNC so the mapping is uncached — the accelerator's AXI-HP
 * port is not cache-coherent, and an uncached mapping means our writes land in
 * DDR before we kick it, with no manual cache maintenance).
 *
 * The DMA scratch at phys 0x10000000 is reserved in the device tree (no-map),
 * so the kernel never touches it. Register/offset map mirrors dnn_accel.h.
 *
 * Build (with the PetaLinux/Yocto SDK or sysroot gcc):
 *     $CC -O2 -Wall dnn_demo.c -o dnn_demo
 * Run on target:
 *     ./dnn_demo [/dev/video0]
 * ============================================================================= */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <stdint.h>
#include <errno.h>
#include <fcntl.h>
#include <unistd.h>
#include <time.h>
#include <signal.h>
#include <sys/ioctl.h>
#include <sys/mman.h>
#include <linux/videodev2.h>

#include "dnn_weights.h"
#include "dnn_weights_face.h"   /* trained face-in-quadrant detector */
#include "sim_input.h"

/* ---- Accelerator memory map (from software/vitis/src/dnn_accel.h) --------- */
#define ACCEL_BASE      0x43C00000u
#define ACCEL_SPAN      0x1000u             /* 4 KB register window */

#define DMA_BASE        0x10000000u         /* hardwired in the AXI master */
#define DMA_SPAN        0x00100000u         /* 1 MB reserved region        */

#define OFFS_INPUT      0x00000000u
#define OFFS_OUTPUT     0x00010000u
#define OFFS_WGT_L0     0x00080000u
#define OFFS_WGT_L3     (OFFS_WGT_L0 + 36u * 4u)   /* contiguous after L0 */

#define ACC_IDX_INPUT   (OFFS_INPUT  >> 2)
#define ACC_IDX_OUTPUT  (OFFS_OUTPUT >> 2)
#define ACC_IDX_WGT_L0  (OFFS_WGT_L0 >> 2)

/* Register offsets (byte) */
#define REG_CTRL        0x0000u
#define REG_STATUS      0x0004u
#define REG_CONFIG      0x0008u
#define REG_INPUT_BASE  0x0010u
#define REG_OUTPUT_BASE 0x0014u
#define REG_WEIGHT_BASE 0x0018u
#define REG_INPUT_SIZE  0x0020u
#define REG_OUTPUT_SIZE 0x0024u
#define REG_WGT_PL(i)   (0x0030u + ((i) * 0x04u))

#define CTRL_START      (1u << 0)
#define CTRL_LOAD_WGT   (1u << 1)
#define CTRL_SOFT_RST   (1u << 4)   /* pulses core reset for 16 cycles */
#define STATUS_DONE     (1u << 0)   /* STICKY: cleared by next START/LOAD */
#define STATUS_BUSY     (1u << 1)
#define STATUS_WGT_LOADED (1u << 2)
#define STATUS_SOFT_RST (1u << 5)

/* ---- SLCR: PL clock control ----------------------------------------------
 * The accelerator fails timing at the stock 100 MHz FCLK0 (WNS -4.257 ns →
 * max safe ~70 MHz). Reprogram the divisor for 50 MHz at startup:
 * IOPLL 1000 MHz / DIV0 / DIV1. */
#define SLCR_BASE       0xF8000000u
#define SLCR_SPAN       0x1000u
#define SLCR_UNLOCK_OFF 0x008u
#define SLCR_LOCK_OFF   0x004u
#define SLCR_FPGA0_CLK  0x170u
#define SLCR_UNLOCK_KEY 0x0000DF0Du
#define FCLK0_50MHZ     0x00200A00u  /* SRC=IOPLL, DIV0=10, DIV1=2 → 50 MHz */

/* ---- Tensor shapes ------------------------------------------------------- */
#define IN_H            16
#define IN_W            16
#define IN_LEN          (IN_H * IN_W)      /* 256 */
#define OUT_LEN         20
#define GRID_CELLS      4
#define PARAMS_PER_CELL 5
#define WGT_L0_LEN      36
#define WGT_L3_LEN      720

/* ---- Camera frame -------------------------------------------------------- */
#define FRAME_W         320
#define FRAME_H         240
#define FRAME_BYTES     (FRAME_W * FRAME_H * 2)   /* YUYV */

#define OBJ_THRESHOLD_Q88  ((int16_t)(0.30f * 256))

/* Weight-set selector: default = flashlight/bright-quadrant demo weights;
 * --face swaps in the trained face-in-quadrant detector + its threshold. */
static const int16_t *g_w0 = yolo_wgt_l0;
static const int16_t *g_w3 = yolo_wgt_l3;
static int g_obj_thr = (int)(0.30f * 256);
#define ACCEL_RETRIES      2        /* kick + (soft-reset recovery) retry */

/* ---- Single-object (--face/hand) detection tuning ------------------------- *
 * All knobs for threshold hysteresis + temporal smoothing live here so the
 * behaviour can be adjusted without hunting through decode(). Objectness is in
 * Q8.8 luma-contrast units (same scale as g_obj_thr). */
#define SMOOTH_WIN         7   /* temporal vote window, in frames             */
#define SMOOTH_ENTER_VOTES 4   /* votes (of WIN) to ACQUIRE a new cell        */
#define SMOOTH_HOLD_VOTES  2   /* votes (of WIN) to HOLD the locked cell      */
#define SMOOTH_ENTER_MUL   2   /* objectness must clear g_obj_thr*this to lock*/

/* ---- HDMI scanout core (hdmi_out.v) --------------------------------------- */
#define HDMI_BASE       0x43C10000u
#define HDMI_SPAN       0x1000u
#define FB_PHYS         0x10100000u          /* 2nd MB of the reserved region */
#define FB_W            640
#define FB_H            480
#define FB_BYTES        (FB_W * FB_H * 2)    /* YUYV */

#define HREG_CTRL       0x00    /* [0] en [1] yc_swap [2] cbcr_swap [3] testpat */
#define HREG_FB         0x04
#define HREG_STAT       0x08
#define HREG_I2C        0x0C    /* legacy bit-bang reg; pads removed, reads idle */

#define ADV7511_ADDR    0x39    /* 7-bit I2C address */

/* ---- AXI IIC hardware I2C master (axi_iic_hdmi in the BD) ------------------
 * Replaces the bit-bang pads: multi-register write bursts were unreliable and
 * chip reads mostly echoed the revision register. Dynamic-mode controller
 * (PG090): push address+data with START/STOP flags into the TX FIFO. */
#define IIC_BASE        0x43C20000u
#define IIC_SPAN        0x1000u
#define IIC_ISR         0x020   /* toggle-on-write; [1] = slave NACK */
#define IIC_SOFTR       0x040   /* write 0xA = soft reset */
#define IIC_CR          0x100   /* [0] enable [1] TX FIFO reset */
#define IIC_SR          0x104   /* [2] bus busy [6] RX empty [7] TX empty */
#define IIC_TX          0x108   /* [8] START [9] STOP | data byte */
#define IIC_RX          0x10C
#define IIC_RX_PIRQ     0x120

/* ---- Globals ------------------------------------------------------------- */
static volatile uint32_t *g_regs;   /* accelerator register window */
static volatile int32_t  *g_dma;    /* DMA scratch (word-addressed) */
static volatile uint32_t *g_hdmi;   /* scanout register window (or NULL) */
static volatile uint32_t *g_fb;     /* framebuffer (word access) */
static int g_mirror = 0;   /* selfie mirror: flip horizontally in BOTH the
                            * display blit and the preprocess, so capture,
                            * training, and inference share one orientation */
static int g_single = 0;   /* single-object decode: report only the argmax
                            * quadrant (for the trained hand/face detector) */
static int g_grid   = 2;   /* detection grid dim: 2 (flashlight 2x2x5) or 3
                            * (trained hand: 3x3, one objectness per FC output) */

static inline void     reg_wr(uint32_t off, uint32_t v) { g_regs[off >> 2] = v; }
static inline uint32_t reg_rd(uint32_t off)             { return g_regs[off >> 2]; }
static inline volatile int32_t *dma_at(uint32_t off)    { return &g_dma[off >> 2]; }

/* =============================================================================
 * Accelerator control
 * ============================================================================= */
static int accel_init(void) {
    uint32_t cfg = reg_rd(REG_CONFIG);
    uint32_t num_layers = cfg & 0xFF;
    printf("[accel] CONFIG=0x%08x  NUM_LAYERS=%u\n", cfg, num_layers);
    if (num_layers == 0 || num_layers == 0xFF) {
        fprintf(stderr, "[accel] ERROR: unresponsive at 0x%08x\n", ACCEL_BASE);
        return -1;
    }
    reg_wr(REG_INPUT_BASE,  ACC_IDX_INPUT);
    reg_wr(REG_OUTPUT_BASE, ACC_IDX_OUTPUT);
    reg_wr(REG_WEIGHT_BASE, ACC_IDX_WGT_L0);
    return 0;
}

static void accel_configure_sizes(void) {
    reg_wr(REG_INPUT_SIZE,  IN_LEN);
    reg_wr(REG_OUTPUT_SIZE, OUT_LEN);
    reg_wr(REG_WGT_PL(0), WGT_L0_LEN);
    reg_wr(REG_WGT_PL(1), 0);
    reg_wr(REG_WGT_PL(2), 0);
    reg_wr(REG_WGT_PL(3), WGT_L3_LEN);
    printf("[accel] sizes IN=%d OUT=%d WGT=[%d,0,0,%d]\n",
           IN_LEN, OUT_LEN, WGT_L0_LEN, WGT_L3_LEN);
}

static void accel_load_weights(void) {
    int i;
    volatile int32_t *w0 = dma_at(OFFS_WGT_L0);
    volatile int32_t *w3 = dma_at(OFFS_WGT_L3);
    for (i = 0; i < WGT_L0_LEN; ++i) w0[i] = (int32_t)g_w0[i];
    for (i = 0; i < WGT_L3_LEN; ++i) w3[i] = (int32_t)g_w3[i];

    reg_wr(REG_CTRL, CTRL_LOAD_WGT);
    for (int t = 0; t < 100000; ++t) {
        if (reg_rd(REG_STATUS) & STATUS_WGT_LOADED) {
            printf("[accel] weights loaded (t=%d)\n", t);
            return;
        }
    }
    printf("[accel] WARN: weights_loaded never asserted (status=0x%08x)\n",
           reg_rd(REG_STATUS));
}

/* Recovery: soft-reset the core (pipeline FSMs + layer stages), wait for the
 * reset pulse to expire and any in-flight AXI reads to drain, then reload
 * weights (the WL FSM's loaded flag is cleared by the reset). Config
 * registers survive a soft reset but rewriting them is free. */
static unsigned long g_recoveries = 0;
static void accel_recover(void) {
    reg_wr(REG_CTRL, CTRL_SOFT_RST);
    usleep(100);
    accel_configure_sizes();
    accel_load_weights();
    g_recoveries++;
}

static void decode_status(uint32_t s) {
    printf("  STATUS=0x%08x  layer_ready=0x%x layer_busy=0x%x wgt_loaded=%d busy=%d done=%d\n",
           s, (s >> 12) & 0xF, (s >> 8) & 0xF, (s >> 2) & 1, (s >> 1) & 1, s & 1);
}

/* Verbose one-shot inference used by --selftest: writes `input`, kicks, and
 * samples STATUS as it (hopefully) progresses. Returns 0 if DONE asserted. */
static int accel_run_verbose(const int16_t *input, int32_t *output) {
    volatile int32_t *in  = dma_at(OFFS_INPUT);
    volatile int32_t *out = dma_at(OFFS_OUTPUT);
    for (int i = 0; i < IN_LEN; ++i) in[i] = (int32_t)input[i];

    printf("[selftest] pre-START:  "); decode_status(reg_rd(REG_STATUS));
    reg_wr(REG_CTRL, CTRL_START);

    uint32_t last = 0xFFFFFFFF;
    for (int t = 0; t < 40; ++t) {
        uint32_t s = reg_rd(REG_STATUS);
        if (s != last) { printf("[selftest] t=%2d: ", t); decode_status(s); last = s; }
        if (s & STATUS_DONE) break;
        usleep(1000);
    }
    uint32_t s = reg_rd(REG_STATUS);
    if (!(s & STATUS_DONE)) {
        printf("[selftest] NOT DONE after settle; final: "); decode_status(s);
        return -1;
    }
    for (int i = 0; i < OUT_LEN; ++i) output[i] = out[i];
    printf("[selftest] DONE. outputs:\n");
    for (int i = 0; i < OUT_LEN; ++i)
        printf("  out[%2d] = 0x%08x (%d)\n", i, (uint32_t)output[i], output[i]);
    return 0;
}

/* returns 0 on success; fills output[OUT_LEN]. *statusp gets the final STATUS. */
static int accel_run(const int16_t *input, int32_t *output, uint32_t *statusp) {
    volatile int32_t *in  = dma_at(OFFS_INPUT);
    volatile int32_t *out = dma_at(OFFS_OUTPUT);
    for (int i = 0; i < IN_LEN; ++i) in[i] = (int32_t)input[i];

    /* DONE is now a sticky STATUS bit (cleared by our own START write) and
     * the hardware refuses START while the pipeline is mid-frame, so polling
     * is reliable. If a run still times out (e.g. an AXI hiccup), soft-reset
     * the core, reload weights and try once more. */
    uint32_t st = 0;
    for (int attempt = 0; attempt < ACCEL_RETRIES; ++attempt) {
        reg_wr(REG_CTRL, CTRL_START);
        for (int t = 0; t < 60000; ++t) {   /* ~ tens of ms wall budget */
            st = reg_rd(REG_STATUS);
            if (st & STATUS_DONE) break;
        }
        if (st & STATUS_DONE) {
            for (int i = 0; i < OUT_LEN; ++i) output[i] = out[i];
            if (statusp) *statusp = st;
            return 0;
        }
        accel_recover();   /* clean slate, then retry */
    }
    if (statusp) *statusp = st;
    return -1;
}

/* =============================================================================
 * HDMI video output: ADV7511 I2C init + framebuffer writer
 * ============================================================================= */
static inline void hreg_wr(uint32_t off, uint32_t v) { g_hdmi[off >> 2] = v; }
static inline uint32_t hreg_rd(uint32_t off)         { return g_hdmi[off >> 2]; }

static volatile uint32_t *g_iic;    /* axi_iic register window (or NULL) */
static inline void     ireg_wr(uint32_t off, uint32_t v) { g_iic[off >> 2] = v; }
static inline uint32_t ireg_rd(uint32_t off)             { return g_iic[off >> 2]; }

static void iic_reset(void) {
    ireg_wr(IIC_SOFTR, 0xA);
    usleep(100);
    ireg_wr(IIC_RX_PIRQ, 0x0F);
    ireg_wr(IIC_CR, 0x2);                  /* TX FIFO reset */
    ireg_wr(IIC_CR, 0x1);                  /* enable (dynamic mode) */
    ireg_wr(IIC_ISR, ireg_rd(IIC_ISR));    /* clear sticky flags (TOW) */
}

/* poll SR until (SR & mask) == want; 0 on success */
static int iic_wait(uint32_t mask, uint32_t want) {
    for (int i = 0; i < 20000; ++i) {
        if ((ireg_rd(IIC_SR) & mask) == want) return 0;
        usleep(10);
    }
    return -1;
}
static int iic_idle(void) { return iic_wait(0x04, 0x00); }  /* bus not busy */

/* returns 0 on ACKed transfer, -1 on NACK/timeout */
static int adv_wr(uint8_t reg, uint8_t val) {
    if (iic_idle()) { iic_reset(); if (iic_idle()) return -1; }
    ireg_wr(IIC_ISR, ireg_rd(IIC_ISR));
    ireg_wr(IIC_TX, 0x100 | (ADV7511_ADDR << 1));   /* START, write */
    ireg_wr(IIC_TX, reg);
    ireg_wr(IIC_TX, 0x200 | val);                   /* data, STOP */
    if (iic_wait(0x80, 0x80)) return -1;            /* TX FIFO drained */
    if (iic_idle()) return -1;
    return (ireg_rd(IIC_ISR) & 0x2) ? -1 : 0;       /* slave NACK? */
}
static int adv_rd(uint8_t reg, uint8_t *val) {
    *val = 0;
    if (iic_idle()) { iic_reset(); if (iic_idle()) return -1; }
    ireg_wr(IIC_ISR, ireg_rd(IIC_ISR));
    ireg_wr(IIC_TX, 0x100 | (ADV7511_ADDR << 1));       /* START, write */
    ireg_wr(IIC_TX, reg);
    ireg_wr(IIC_TX, 0x100 | (ADV7511_ADDR << 1) | 1);   /* reSTART, read */
    ireg_wr(IIC_TX, 0x200 | 1);                         /* STOP after 1 byte */
    if (iic_wait(0x40, 0x00)) return -1;                /* RX not empty */
    *val = (uint8_t)(ireg_rd(IIC_RX) & 0xFF);
    /* NOTE: don't check ISR[1] here — the core flags the master's own
     * terminating NACK of a read as "TX error" (i2c-xiic ignores it too).
     * An address NACK shows up as the RX wait timing out instead. */
    return 0;
}

/* ADV7511 init — faithful port of the Linux kernel driver's sequence
 * (drivers/gpu/drm/bridge/adv7511). Key kernel lessons baked in:
 *   - most registers reset when HPD drops or the part powers down, so mask
 *     HPD FIRST (0xD6[7:6]=11 = HPD_SRC_NONE), then rewrite everything
 *   - the "input style" values in the datasheet don't match the hardware
 *     field encoding (style 1 -> hw 2)
 *   - CSC coefficient writes only latch inside the CSC_UPDATE_MODE window
 *     (0x1A bit5) — without it they are silently discarded
 * mode 0: DVI out + CSC YCbCr->RGB (kernel table). mode 1: HDMI + 4:2:2
 * passthrough. */
/* Verified plain write: the kernel's update_bits reads a SOFTWARE cache and
 * writes full bytes — chip reads are flaky here, so mirror that: compute the
 * full value, write it plainly, verify by readback, retry a few times. */
static int adv_wr_v(uint8_t reg, uint8_t val) {
    for (int t = 0; t < 5; ++t) {
        adv_wr(reg, val);
        uint8_t rb = 0;
        adv_rd(reg, &rb);
        if (rb == val) return 0;
        usleep(2000);
    }
    return -1;
}

static int adv7511_init(int mode) {
    iic_reset();

    /* probe: the chip must ACK its address and return rev 0x13/0x14 */
    uint8_t rev = 0;
    int pe = -1;
    for (int t = 0; t < 3 && pe; ++t) {
        if (t) iic_reset();
        pe = adv_rd(0x00, &rev);
    }
    if (pe) {
        /* SR reset value is 0xC0 (both FIFOs empty); ISR[1] = slave NACK,
         * SR[2] stuck = bus busy (SDA/SCL held), SR=0xFFFFFFFF = no decode */
        printf("[adv] ERROR: probe 0x%02x failed  SR=0x%08x ISR=0x%08x\n",
               ADV7511_ADDR, ireg_rd(IIC_SR), ireg_rd(IIC_ISR));
        return -1;
    }

    /* __adv7511_power_on: power up, then mask HPD so nothing resets us */
    int nacks = 0;
    nacks += adv_wr(0x41, 0x10) ? 1 : 0;
    nacks += adv_wr(0xD6, 0xC0) ? 1 : 0;   /* HPD_SRC_NONE */
    usleep(100000);
    nacks += adv_wr(0x41, 0x10) ? 1 : 0;
    usleep(20000);

    uint8_t sense = 0;
    adv_rd(0x42, &sense);
    printf("[adv] rev=0x%02x hpd/sense=0x%02x nacks=%d\n", rev, sense, nacks);

    /* regcache_sync equivalent: fixed registers (kernel table) */
    static const uint8_t fixed[][2] = {
        {0x98,0x03},{0x9A,0xE0},{0x9C,0x30},{0x9D,0x61},
        {0xA2,0xA4},{0xA3,0xA4},{0xE0,0xD0},{0xF9,0x00},{0x55,0x02},
    };
    for (unsigned i = 0; i < sizeof(fixed)/2; ++i)
        adv_wr(fixed[i][0], fixed[i][1]);

    /* link config: YCbCr 4:2:2, 8-bit, 1x clock, separate syncs,
     * style 1 (hardware encoding 2 — datasheet values don't match hw!),
     * right justification. Full-byte values, verified. */
    int e15 = adv_wr_v(0x15, 0x01);
    int e16 = adv_wr_v(0x16, (3 << 4) | (2 << 2));   /* 0x38 */
    adv_wr(0x48, 1 << 3);
    adv_wr(0xD0, 3 << 2);
    adv_wr(0xBA, 3 << 5);

    if (mode == 0) {
        /* CSC: kernel YCbCr->RGB table inside the CSC_UPDATE_MODE window.
         * Full-byte values: 0x18 = enable|scale|A1hi (enable written LAST),
         * 0x1A = update|A2hi during the window. */
        adv_wr(0x1A, 0x20 | 0x04);                  /* update mode + A2 hi */
        adv_wr(0x18, 0x07); adv_wr(0x19, 0x34);     /* A1 = 0x0734 */
        adv_wr(0x1B, 0xAD);                          /* A2 = 0x04AD */
        adv_wr(0x1C, 0x00); adv_wr(0x1D, 0x00);     /* A3 = 0x0000 */
        adv_wr(0x1E, 0x1C); adv_wr(0x1F, 0x1B);     /* A4 = 0x1C1B */
        adv_wr(0x20, 0x1D); adv_wr(0x21, 0xDC);     /* B1 = 0x1DDC */
        adv_wr(0x22, 0x04); adv_wr(0x23, 0xAD);     /* B2 = 0x04AD */
        adv_wr(0x24, 0x1F); adv_wr(0x25, 0x24);     /* B3 = 0x1F24 */
        adv_wr(0x26, 0x01); adv_wr(0x27, 0x35);     /* B4 = 0x0135 */
        adv_wr(0x28, 0x00); adv_wr(0x29, 0x00);     /* C1 = 0x0000 */
        adv_wr(0x2A, 0x04); adv_wr(0x2B, 0xAD);     /* C2 = 0x04AD */
        adv_wr(0x2C, 0x08); adv_wr(0x2D, 0x7C);     /* C3 = 0x087C */
        adv_wr(0x2E, 0x1B); adv_wr(0x2F, 0x77);     /* C4 = 0x1B77 */
        adv_wr(0x18, 0x80 | (2 << 5) | 0x07);       /* enable, scale x4: 0xC7 */
        adv_wr(0x1A, 0x04);                          /* close update window */
        adv_wr(0xAF, 0x04);                          /* DVI mode */
    } else {
        adv_wr(0x18, 0x07);                          /* CSC off */
        adv_wr_v(0x16, 0x81 | (3 << 4) | (2 << 2)); /* out 4:2:2 YCbCr */
        adv_wr(0xAF, 0x06);                          /* HDMI mode */
        adv_wr(0x55, 0x20);                          /* AVI: YCbCr 4:2:2 */
    }
    adv_wr(0x96, 0xF6);

    uint8_t r15 = 0, r16 = 0, r18 = 0;
    adv_rd(0x15, &r15); adv_rd(0x16, &r16); adv_rd(0x18, &r18);
    printf("[adv] init done (mode %d) 0x15=0x%02x(%s) 0x16=0x%02x(%s) 0x18=0x%02x\n",
           mode, r15, e15 ? "RETRY-FAIL" : "ok",
           r16, e16 ? "RETRY-FAIL" : "ok", r18);
    if (mode == 0) {
        /* CSC coefficients never verified over bit-bang — now we can look */
        printf("[adv] CSC 0x18-0x2F:");
        for (uint8_t r = 0x18; r <= 0x2F; ++r) {
            uint8_t v = 0; adv_rd(r, &v); printf(" %02x", v);
        }
        printf("\n");
    }
    return 0;
}

/* Camera YUYV 320x240 -> framebuffer 640x480 (2x pixel doubling). Word-wise:
 * one source word (Y0 U Y1 V) becomes two FB words (Y0 U Y0 V)(Y1 U Y1 V),
 * each written to two consecutive rows. */
static void fb_blit_camera(const uint8_t *yuyv) {
    const uint32_t *src = (const uint32_t *)yuyv;
    for (int y = 0; y < 240; ++y) {
        volatile uint32_t *d0 = g_fb + (2*y)   * (FB_W/2);
        volatile uint32_t *d1 = g_fb + (2*y+1) * (FB_W/2);
        for (int x = 0; x < 160; ++x) {          /* 160 words per source row */
            uint32_t s  = src[y*160 + x];
            uint8_t y0 = s, u = s >> 8, y1 = s >> 16, v = s >> 24;
            uint32_t w0 = y0 | (u << 8) | (y0 << 16) | (v << 24);
            uint32_t w1 = y1 | (u << 8) | (y1 << 16) | (v << 24);
            /* w0/w1 are internally symmetric (both half-pixels equal), so a
             * horizontal flip is just reversing the destination word index. */
            int j0 = g_mirror ? (FB_W/2 - 1 - 2*x) : (2*x);
            int j1 = g_mirror ? (FB_W/2 - 2 - 2*x) : (2*x + 1);
            d0[j0] = w0; d0[j1] = w1;
            d1[j0] = w0; d1[j1] = w1;
        }
    }
}

/* Draw a rectangle border (camera coords, scaled 2x) into the FB. g_box_y sets
 * the luma (235=white for detection boxes, 16=black for guide boxes on a bright
 * scene). */
#define BOXC_U 128
#define BOXC_V 128
static int g_box_y = 235;
static void fb_hline(int fx0, int fx1, int fy, int thick) {
    if (fy < 0) fy = 0;
    uint32_t w = g_box_y | (BOXC_U << 8) | (g_box_y << 16) | (BOXC_V << 24);
    for (int t = 0; t < thick; ++t) {
        int yy = fy + t; if (yy >= FB_H) break;
        for (int x = fx0/2; x <= fx1/2 && x < FB_W/2; ++x)
            g_fb[yy * (FB_W/2) + x] = w;
    }
}
static void fb_vline(int fx, int fy0, int fy1, int thick) {
    uint32_t w = g_box_y | (BOXC_U << 8) | (g_box_y << 16) | (BOXC_V << 24);
    for (int y = fy0; y <= fy1 && y < FB_H; ++y)
        for (int t = 0; t < thick; ++t) {
            int xw = (fx + 2*t)/2;
            if (xw < FB_W/2) g_fb[y * (FB_W/2) + xw] = w;
        }
}
static void fb_draw_box(int cx0, int cy0, int cx1, int cy1) {
    int x0 = cx0*2, x1 = cx1*2, y0 = cy0*2, y1 = cy1*2;
    if (x1 >= FB_W) x1 = FB_W-1;
    if (y1 >= FB_H) y1 = FB_H-1;
    fb_hline(x0, x1, y0, 4);
    fb_hline(x0, x1, y1-3, 4);
    fb_vline(x0, y0, y1, 2);
    fb_vline(x1-3, y0, y1, 2);
}
/* High-contrast guide box: thick BLACK outer border + WHITE inner border, so
 * it's visible whether the scene behind it is bright or dark. */
static void fb_guide_box(int cx0, int cy0, int cx1, int cy1) {
    g_box_y = 16;  fb_draw_box(cx0, cy0, cx1, cy1);           /* black outer */
    g_box_y = 235; fb_draw_box(cx0+4, cy0+4, cx1-4, cy1-4);   /* white inner */
    g_box_y = 235;
}

/* =============================================================================
 * Preprocess: YUYV 320x240 → 16x16 grayscale Q8.8  (mirrors preprocess.c)
 * ============================================================================= */
static void preprocess(const uint8_t *yuyv, int16_t *q88) {
    const uint32_t sx = FRAME_W / IN_W;   /* 20 */
    const uint32_t sy = FRAME_H / IN_H;   /* 15 */
    for (uint32_t dy = 0; dy < IN_H; ++dy) {
        for (uint32_t dx = 0; dx < IN_W; ++dx) {
            uint32_t sum = 0, n = 0;
            uint32_t y0 = dy * sy, x0 = dx * sx;
            for (uint32_t yy = 0; yy < sy; ++yy) {
                uint32_t syy = y0 + yy;
                if (syy >= FRAME_H) break;
                const uint8_t *row = yuyv + syy * FRAME_W * 2;
                for (uint32_t xx = 0; xx < sx; ++xx) {
                    uint32_t sxx = x0 + xx;
                    if (sxx >= FRAME_W) break;
                    sum += row[sxx * 2];    /* Y byte */
                    n++;
                }
            }
            uint8_t luma = n ? (uint8_t)(sum / n) : 0;
            /* <<7 (not <<8): keeps all 0..255 lumas POSITIVE in s16 Q8.8 —
             * with <<8, luma >= 128 went negative and the CONV ReLU zeroed
             * out every bright region. The FC weights are scaled x2 to
             * compensate, so decoded confidences stay in full-luma units. */
            uint32_t ox = g_mirror ? (IN_W - 1 - dx) : dx;
            q88[dy * IN_W + ox] = (int16_t)((uint16_t)luma << 7);
        }
    }
}

/* =============================================================================
 * Postprocess: decode YOLO grid  (mirrors yolo_post.c)
 * ============================================================================= */
typedef struct { uint16_t x0, y0, x1, y1; int16_t conf; uint8_t cell; } box_t;

static inline uint32_t q88_mul(int16_t q, uint32_t v) {
    if (q < 0) return 0;
    return ((uint32_t)q * v) >> 8;
}

static int decode(const int32_t *raw, box_t *out) {
    int kept = 0;
    const uint32_t grid = 2;
    const uint32_t cw = FRAME_W / grid, ch = FRAME_H / grid;

    /* Single-object mode (--face/hand): exactly one target in one quadrant, so
     * report only the highest-objectness cell (argmax) if it clears threshold,
     * and draw a box over that whole quadrant. Sidesteps the per-cell threshold
     * firing several cells and the box-regression params being tiny. */
    if (g_single) {
        const int gd = g_grid;                 /* 2 or 3 */
        const int ncells = gd * gd;
        const uint32_t gcw = FRAME_W / gd, gch = FRAME_H / gd;
        /* per-cell objectness (3x3: FC output c; 2x2: [x,y,w,h,obj] layout) */
        int32_t score[16];
        int best = -1; int32_t bestc = -0x7fffffff;
        for (int c = 0; c < ncells; ++c) {
            int32_t o = (gd == 3) ? (raw[c] >> 8) : (raw[c * PARAMS_PER_CELL + 4] >> 8);
            score[c] = o;
            if (o > bestc) { bestc = o; best = c; }
        }

        /* Threshold with hysteresis: a *new* cell must clear a high bar
         * (g_obj_thr * SMOOTH_ENTER_MUL) to become a candidate, but the cell
         * we are already locked onto only has to clear the base threshold.
         * Keeps the box from flickering off on a single marginal frame while
         * still rejecting noise before a lock exists. */
        static int locked_cell = -1;
        int32_t enter = g_obj_thr * SMOOTH_ENTER_MUL;
        int cand = -1;
        if (best >= 0) {
            int32_t bar = (best == locked_cell) ? g_obj_thr : enter;
            if (bestc >= bar) cand = best;
        }

        /* Temporal smoothing: majority vote over the last SMOOTH_WIN frames. */
        static int hist[SMOOTH_WIN]; static int hinit = 0; static int hp = 0;
        if (!hinit) { for (int i = 0; i < SMOOTH_WIN; ++i) hist[i] = -1; hinit = 1; }
        hist[hp] = cand; hp = (hp + 1) % SMOOTH_WIN;
        int votes[16] = {0};
        for (int i = 0; i < SMOOTH_WIN; ++i) if (hist[i] >= 0) votes[hist[i]]++;
        int win = -1, wv = 0;
        for (int c = 0; c < ncells; ++c) if (votes[c] > wv) { wv = votes[c]; win = c; }

        /* Vote hysteresis: acquiring a new cell needs a solid majority; holding
         * the currently locked cell needs far fewer votes so the box stays put
         * through brief occlusions / dropouts instead of blinking. */
        int need = (win == locked_cell) ? SMOOTH_HOLD_VOTES : SMOOTH_ENTER_VOTES;
        if (win < 0 || wv < need) { locked_cell = -1; return 0; }
        locked_cell = win;

        /* box fills the whole winning cell */
        uint32_t col = win % gd, row = win / gd;
        out[0].x0 = col * gcw; out[0].y0 = row * gch;
        out[0].x1 = (col + 1) * gcw; out[0].y1 = (row + 1) * gch;
        /* report the *winning* cell's own confidence (not the current-frame
         * argmax, which may briefly be a different cell during a handoff). */
        int32_t cc = score[win]; if (cc < 0) cc = 0; if (cc > 32767) cc = 32767;
        out[0].conf = (int16_t)cc;
        out[0].cell = (uint8_t)win;
        return 1;
    }

    for (uint32_t c = 0; c < GRID_CELLS; ++c) {
        const int32_t *p = raw + c * PARAMS_PER_CELL;
        /* Scale-shift decode: the FC accumulator works on luma<<8
         * activations, so >>8 recovers clean Q8.8 with no wraparound (the
         * old s16 narrow-cast overflowed for any contrast >= 128 luma).
         * With the bright-quadrant weights, conf = (corner - center)
         * regional luma contrast in 0..1.0 Q8.8. */
        int32_t cx32 = p[0] >> 8, cy32 = p[1] >> 8;
        int32_t w32  = p[2] >> 8, h32  = p[3] >> 8;
        int32_t c32  = p[4] >> 8;
        if (c32 < g_obj_thr) continue;
        int16_t cx = (int16_t)(cx32 > 255 ? 255 : (cx32 < 0 ? 0 : cx32));
        int16_t cy = (int16_t)(cy32 > 255 ? 255 : (cy32 < 0 ? 0 : cy32));
        int16_t w  = (int16_t)(w32  > 255 ? 255 : (w32  < 0 ? 0 : w32));
        int16_t h  = (int16_t)(h32  > 255 ? 255 : (h32  < 0 ? 0 : h32));
        int16_t conf = (int16_t)(c32 > 32767 ? 32767 : c32);

        uint32_t col = c % grid, row = c / grid;
        uint32_t cxp = col * cw + q88_mul(cx, cw);
        uint32_t cyp = row * ch + q88_mul(cy, ch);
        uint32_t wp = q88_mul(w, FRAME_W), hp = q88_mul(h, FRAME_H);

        uint32_t x0 = (cxp > wp / 2) ? cxp - wp / 2 : 0;
        uint32_t y0 = (cyp > hp / 2) ? cyp - hp / 2 : 0;
        uint32_t x1 = cxp + wp / 2; if (x1 > FRAME_W) x1 = FRAME_W;
        uint32_t y1 = cyp + hp / 2; if (y1 > FRAME_H) y1 = FRAME_H;

        out[kept].x0 = x0; out[kept].y0 = y0;
        out[kept].x1 = x1; out[kept].y1 = y1;
        out[kept].conf = conf; out[kept].cell = c;
        kept++;
    }
    return kept;
}

/* =============================================================================
 * V4L2 mmap streaming capture
 * ============================================================================= */
#define NBUF 4
struct vbuf { void *start; size_t length; };
static int          g_vfd = -1;
static struct vbuf  g_vbuf[NBUF];
static int          g_nbuf = 0;

static int xioctl(int fd, unsigned long req, void *arg) {
    int r;
    do { r = ioctl(fd, req, arg); } while (r == -1 && errno == EINTR);
    return r;
}

static int camera_open(const char *dev) {
    g_vfd = open(dev, O_RDWR | O_NONBLOCK, 0);
    if (g_vfd < 0) { perror("open video"); return -1; }

    struct v4l2_format fmt;
    memset(&fmt, 0, sizeof fmt);
    fmt.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
    fmt.fmt.pix.width       = FRAME_W;
    fmt.fmt.pix.height      = FRAME_H;
    fmt.fmt.pix.pixelformat = V4L2_PIX_FMT_YUYV;
    fmt.fmt.pix.field       = V4L2_FIELD_NONE;
    if (xioctl(g_vfd, VIDIOC_S_FMT, &fmt) < 0) { perror("S_FMT"); return -1; }
    if (fmt.fmt.pix.pixelformat != V4L2_PIX_FMT_YUYV ||
        fmt.fmt.pix.width != FRAME_W || fmt.fmt.pix.height != FRAME_H) {
        fprintf(stderr, "[cam] driver gave %ux%u fmt=0x%08x (wanted %ux%u YUYV)\n",
                fmt.fmt.pix.width, fmt.fmt.pix.height,
                fmt.fmt.pix.pixelformat, FRAME_W, FRAME_H);
        /* continue anyway — many cams accept it */
    }

    struct v4l2_requestbuffers req;
    memset(&req, 0, sizeof req);
    req.count = NBUF;
    req.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
    req.memory = V4L2_MEMORY_MMAP;
    if (xioctl(g_vfd, VIDIOC_REQBUFS, &req) < 0) { perror("REQBUFS"); return -1; }
    g_nbuf = req.count;

    for (int i = 0; i < g_nbuf; ++i) {
        struct v4l2_buffer b;
        memset(&b, 0, sizeof b);
        b.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
        b.memory = V4L2_MEMORY_MMAP;
        b.index = i;
        if (xioctl(g_vfd, VIDIOC_QUERYBUF, &b) < 0) { perror("QUERYBUF"); return -1; }
        g_vbuf[i].length = b.length;
        g_vbuf[i].start = mmap(NULL, b.length, PROT_READ | PROT_WRITE,
                               MAP_SHARED, g_vfd, b.m.offset);
        if (g_vbuf[i].start == MAP_FAILED) { perror("mmap buf"); return -1; }
    }
    for (int i = 0; i < g_nbuf; ++i) {
        struct v4l2_buffer b;
        memset(&b, 0, sizeof b);
        b.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
        b.memory = V4L2_MEMORY_MMAP;
        b.index = i;
        if (xioctl(g_vfd, VIDIOC_QBUF, &b) < 0) { perror("QBUF"); return -1; }
    }
    enum v4l2_buf_type t = V4L2_BUF_TYPE_VIDEO_CAPTURE;
    if (xioctl(g_vfd, VIDIOC_STREAMON, &t) < 0) { perror("STREAMON"); return -1; }
    printf("[cam] %s streaming %dx%d YUYV, %d buffers\n", dev, FRAME_W, FRAME_H, g_nbuf);
    return 0;
}

/* Blocks (via select) until a frame is ready, copies Y-plane pointer into cb. */
static int camera_grab(void (*cb)(const uint8_t *, void *), void *ctx) {
    fd_set fds; FD_ZERO(&fds); FD_SET(g_vfd, &fds);
    struct timeval tv = { .tv_sec = 2, .tv_usec = 0 };
    int r = select(g_vfd + 1, &fds, NULL, NULL, &tv);
    if (r <= 0) { if (r == 0) fprintf(stderr, "[cam] select timeout\n"); return -1; }

    struct v4l2_buffer b;
    memset(&b, 0, sizeof b);
    b.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
    b.memory = V4L2_MEMORY_MMAP;
    if (xioctl(g_vfd, VIDIOC_DQBUF, &b) < 0) { perror("DQBUF"); return -1; }

    cb((const uint8_t *)g_vbuf[b.index].start, ctx);

    if (xioctl(g_vfd, VIDIOC_QBUF, &b) < 0) { perror("QBUF"); return -1; }
    return 0;
}

/* Cleanly tear down streaming so the UVC device isn't left wedged for the next
 * run: STREAMOFF, unmap buffers, release them, and close the fd. Safe to call
 * more than once. Runs on normal exit AND from the SIGINT/SIGTERM handler. */
static void camera_close(void) {
    if (g_vfd < 0) return;
    enum v4l2_buf_type t = V4L2_BUF_TYPE_VIDEO_CAPTURE;
    xioctl(g_vfd, VIDIOC_STREAMOFF, &t);
    for (int i = 0; i < g_nbuf; ++i) {
        if (g_vbuf[i].start && g_vbuf[i].start != MAP_FAILED)
            munmap(g_vbuf[i].start, g_vbuf[i].length);
        g_vbuf[i].start = NULL;
    }
    /* Release the buffer set (count=0) so the driver frees its queue. */
    struct v4l2_requestbuffers req;
    memset(&req, 0, sizeof req);
    req.count = 0;
    req.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
    req.memory = V4L2_MEMORY_MMAP;
    xioctl(g_vfd, VIDIOC_REQBUFS, &req);
    close(g_vfd);
    g_vfd = -1;
    g_nbuf = 0;
}

/* =============================================================================
 * Main
 * ============================================================================= */
static int16_t s_q88[IN_LEN];
static int g_use_hdmi = 0;
static int g_quiet = 0;    /* --quiet: log only on detection-count changes
                            * (keeps the RAM-backed boot log tiny for autostart) */

static void on_frame(const uint8_t *yuyv, void *ctx) {
    (void)ctx;
    preprocess(yuyv, s_q88);
    if (g_use_hdmi)
        fb_blit_camera(yuyv);   /* while the V4L2 buffer is still dequeued */
}

static double now_us(void) {
    struct timespec ts;
    clock_gettime(CLOCK_MONOTONIC, &ts);
    return ts.tv_sec * 1e6 + ts.tv_nsec / 1e3;
}

/* Ctrl-C / kill: ask the capture loop to exit so we can STREAMOFF the camera
 * cleanly. Without this the UVC device is left streaming and the next run
 * gets "select timeout". */
static volatile sig_atomic_t g_stop = 0;
static void on_signal(int sig) { (void)sig; g_stop = 1; }

int main(int argc, char **argv) {
    /* Line-buffer stdout so the log is useful when the autostart init script
     * redirects it to a file: glibc otherwise switches to 4 KB block buffering
     * on a non-tty, and the sparse --quiet output would never reach the log. */
    setvbuf(stdout, NULL, _IOLBF, 0);

    /* argv[1] is the video device only when it isn't a --flag */
    const char *dev = (argc > 1 && argv[1][0] != '-') ? argv[1] : "/dev/video0";

    /* Pre-scan for --face so the trained weights are selected BEFORE the
     * accelerator weight load below (the main flag loop runs later). */
    for (int a = 1; a < argc; ++a)
        if (strcmp(argv[a], "--face") == 0) {
            g_w0 = face_wgt_l0; g_w3 = face_wgt_l3;
            g_obj_thr = FACE_OBJ_THRESHOLD_Q88;
            g_mirror = 1;   /* model is trained on mirrored capture data */
            g_single = 1;   /* one hand -> argmax cell box */
            g_grid   = 3;   /* 3x3 grid: objectness = FC outputs 0..8 */
            printf("[weights] trained 3x3 HAND detector (thr=%d, mirrored)\n", g_obj_thr);
        }

    int fd = open("/dev/mem", O_RDWR | O_SYNC);
    if (fd < 0) { perror("open /dev/mem"); return 1; }

    g_regs = mmap(NULL, ACCEL_SPAN, PROT_READ | PROT_WRITE, MAP_SHARED, fd, ACCEL_BASE);
    if (g_regs == MAP_FAILED) { perror("mmap regs"); return 1; }
    g_dma = mmap(NULL, DMA_SPAN, PROT_READ | PROT_WRITE, MAP_SHARED, fd, DMA_BASE);
    if (g_dma == MAP_FAILED) { perror("mmap dma"); return 1; }
    printf("[mem] regs@%p dma@%p (phys 0x%08x / 0x%08x)\n",
           (void*)g_regs, (void*)g_dma, ACCEL_BASE, DMA_BASE);

    /* Clock the PL at 50 MHz: the accelerator fails timing at the stock
     * 100 MHz (WNS -4.257 ns → max safe ~70 MHz). Also soft-reset the core
     * so we always start from a clean pipeline no matter what ran before. */
    volatile uint32_t *slcr = mmap(NULL, SLCR_SPAN, PROT_READ | PROT_WRITE,
                                   MAP_SHARED, fd, SLCR_BASE);
    if (slcr != MAP_FAILED) {
        slcr[SLCR_UNLOCK_OFF >> 2] = SLCR_UNLOCK_KEY;
        uint32_t before = slcr[SLCR_FPGA0_CLK >> 2];
        slcr[SLCR_FPGA0_CLK >> 2] = FCLK0_50MHZ;
        printf("[clk] FCLK0 0x%08x -> 0x%08x (50 MHz, timing-safe)\n",
               before, slcr[SLCR_FPGA0_CLK >> 2]);
        munmap((void *)slcr, SLCR_SPAN);
    } else {
        fprintf(stderr, "[clk] WARN: SLCR mmap failed; staying at boot clock\n");
    }
    usleep(100);
    reg_wr(REG_CTRL, CTRL_SOFT_RST);
    usleep(100);

    if (accel_init() != 0) return 1;
    accel_configure_sizes();
    accel_load_weights();

    /* ---- video output (needs the HDMI bitstream) --------------------------
     * --hdmi[=mode]   : enable live video out (mode 0 DVI+CSC, 1 HDMI 4:2:2)
     * --hdmi-test[=m] : ADV7511 init + color-bar test pattern, then exit
     *                   (the scanout keeps running — look at the monitor)   */
    int use_hdmi = 0, hdmi_mode = 0, hdmi_test = 0;
    for (int a = 1; a < argc; ++a) {
        if (strncmp(argv[a], "--hdmi-poke", 11) == 0) {
            hdmi_test = 0; use_hdmi = 0;
            /* just map the windows; handled after mapping below */
            g_hdmi = (void *)1;   /* sentinel replaced by real mmap next */
        }
        if (strncmp(argv[a], "--hdmi-test", 11) == 0) {
            hdmi_test = 1;
            if (argv[a][11] == '=') hdmi_mode = atoi(argv[a] + 12);
        } else if (strncmp(argv[a], "--hdmi", 6) == 0) {
            use_hdmi = 1;
            if (argv[a][6] == '=') hdmi_mode = atoi(argv[a] + 7);
        } else if (strcmp(argv[a], "--quiet") == 0) {
            g_quiet = 1;
        } else if (strcmp(argv[a], "--face") == 0) {
            g_w0 = face_wgt_l0; g_w3 = face_wgt_l3;
            g_obj_thr = FACE_OBJ_THRESHOLD_Q88;
        }
    }
    int hdmi_poke = (g_hdmi == (void *)1);
    if (hdmi_poke) g_hdmi = NULL;
    if (use_hdmi || hdmi_test || hdmi_poke) {
        /* Self-contained clock/port bring-up so the video path works no
         * matter which FSBL booted the board:
         *   FPGA1_CLK_CTRL: FCLK1 = IOPLL/40/1 = 25 MHz (pixel clock)
         *   AFI1: force S_AXI_HP1 to 32-bit (reset default is 64-bit; an
         *   FSBL built before the HDMI design never programs it) */
        volatile uint32_t *slcr2 = mmap(NULL, SLCR_SPAN, PROT_READ | PROT_WRITE,
                                        MAP_SHARED, fd, SLCR_BASE);
        volatile uint32_t *afi1 = mmap(NULL, 0x1000, PROT_READ | PROT_WRITE,
                                       MAP_SHARED, fd, 0xF8009000);
        if (slcr2 != MAP_FAILED) {
            slcr2[SLCR_UNLOCK_OFF >> 2] = SLCR_UNLOCK_KEY;
            slcr2[0x180 >> 2] = 0x00500800;   /* FCLK1 = 25 MHz (ps7_init split) */
            slcr2[0x188 >> 2] = 0;            /* FPGA1_THR_CNT: the old FSBL
                                               * parks unused FCLK1 with the
                                               * throttle counter = 1, which
                                               * STOPS the clock outright. */
            printf("[clk] FCLK1 -> 0x%08x (25 MHz pixel clock)\n",
                   slcr2[0x180 >> 2]);
            munmap((void *)slcr2, SLCR_SPAN);
        }
        if (afi1 != MAP_FAILED) {
            afi1[0x00 >> 2] = 1;   /* RDCHAN_CTRL: 32-bit */
            afi1[0x14 >> 2] = 1;   /* WRCHAN_CTRL: 32-bit */
            printf("[afi] HP1 width forced to 32-bit\n");
            munmap((void *)afi1, 0x1000);
        }
        usleep(1000);
        g_hdmi = mmap(NULL, HDMI_SPAN, PROT_READ | PROT_WRITE, MAP_SHARED,
                      fd, HDMI_BASE);
        g_fb = mmap(NULL, FB_BYTES, PROT_READ | PROT_WRITE, MAP_SHARED,
                    fd, FB_PHYS);
        g_iic = mmap(NULL, IIC_SPAN, PROT_READ | PROT_WRITE, MAP_SHARED,
                     fd, IIC_BASE);
        if (g_hdmi == MAP_FAILED || g_fb == MAP_FAILED || g_iic == MAP_FAILED) {
            perror("mmap hdmi/fb/iic"); return 1;
        }
        int mono = 0;
        for (int a = 1; a < argc; ++a)
            if (strcmp(argv[a], "--mono") == 0) mono = 1;
        if (!hdmi_poke) {
        hreg_wr(HREG_FB, FB_PHYS);
        /* enable + yc_swap (bit1): the ADV7511's 16-bit bus wants chroma on
         * the byte lane the RTL calls Y — verified with the color-bar pattern
         * (without it: tinted bars with chroma striping as luma).
         * --mono restores the grayscale fallback (bit5) from the bit-bang days */
        hreg_wr(HREG_CTRL, 0x1 | 0x2 | (mono ? 0x20 : 0x0) | (hdmi_test ? 0x8 : 0x0));
        usleep(50000);
        printf("[hdmi] frames=%lu (must advance)\n",
               (unsigned long)((hreg_rd(HREG_STAT) >> 8) & 0xFF));
        adv7511_init(hdmi_mode);
        }
        if (hdmi_test) {
            printf("[hdmi] test pattern up — color bars should be visible.\n"
                   "       frames=%lu overrun=%lu\n",
                   (unsigned long)((hreg_rd(HREG_STAT) >> 8) & 0xFF),
                   (unsigned long)(hreg_rd(HREG_STAT) & 1));
            return 0;
        }
        /* clear framebuffer to black (Y=16, U=V=128) */
        for (int i = 0; i < FB_BYTES/4; ++i)
            g_fb[i] = 0x10 | (0x80 << 8) | (0x10 << 16) | (0x80u << 24);
        g_use_hdmi = 1;
    }

    /* --hdmi-poke REG [VAL]: raw ADV7511 register read/poke (hex), then exit.
     * Live CSC / mode experiments without rebuild cycles. */
    if (argc > 2 && strcmp(argv[1], "--hdmi-poke") == 0) {
        if (!g_iic) { fprintf(stderr, "need hdmi mapping\n"); return 1; }
        iic_reset();
        unsigned reg = strtoul(argv[2], NULL, 16);
        if (argc > 3) {
            unsigned val = strtoul(argv[3], NULL, 16);
            int e = adv_wr((uint8_t)reg, (uint8_t)val);
            uint8_t rb = 0; adv_rd((uint8_t)reg, &rb);
            printf("[adv] 0x%02x <= 0x%02x (rb 0x%02x)%s\n",
                   reg, val, rb, e ? " WRITE-NACK" : "");
        } else {
            uint8_t rb = 0;
            int e = adv_rd((uint8_t)reg, &rb);
            printf("[adv] 0x%02x == 0x%02x%s\n", reg, rb, e ? " READ-NACK" : "");
        }
        return 0;
    }

    /* --selftest: run one inference on the golden sim input (no camera) so we
     * can tell whether the board completes the SAME data that matches golden in
     * simulation. Decisively separates "app/camera problem" from "hardware". */
    if (argc > 1 && strcmp(argv[1], "--selftest") == 0) {
        int16_t si[IN_LEN];
        for (int i = 0; i < IN_LEN; ++i) si[i] = (int16_t)sim_input[i];
        int32_t out[OUT_LEN];
        printf("[selftest] feeding golden sim input (%d words)\n", IN_LEN);
        int rc = accel_run_verbose(si, out);
        printf("[selftest] result: %s\n", rc == 0 ? "COMPLETED" : "TIMED OUT (pipeline stalled)");
        return rc == 0 ? 0 : 2;
    }

    /* Install signal handlers BEFORE opening the camera so a Ctrl-C at any
     * point after this still tears streaming down cleanly. Not SA_RESTART:
     * we want select()/ioctl() to return EINTR so the loop notices g_stop. */
    struct sigaction sa;
    memset(&sa, 0, sizeof sa);
    sa.sa_handler = on_signal;
    sigaction(SIGINT,  &sa, NULL);
    sigaction(SIGTERM, &sa, NULL);

    if (camera_open(dev) != 0) return 1;

    /* --view: live ASCII map of the preprocessed 16x16 luma grid — shows
     * exactly what the network sees and where to aim the light. */
    if (argc > 1 && strcmp(argv[1], "--view") == 0) {
        const char ramp[] = " .:-=+*#%@";
        for (int fcount = 0; fcount < 200 && !g_stop; ++fcount) {
            if (camera_grab(on_frame, NULL) != 0) continue;
            if (fcount % 10) continue;
            printf("\n    0123456789012345   (16x16 luma; @ = bright)\n");
            for (int y = 0; y < IN_H; ++y) {
                printf("%2d  ", y);
                for (int x = 0; x < IN_W; ++x) {
                    int l = s_q88[y * IN_W + x] >> 7;
                    putchar(ramp[(l * 9) / 255]);
                }
                putchar('\n');
            }
        }
        camera_close();
        return 0;
    }

    /* --capture LABEL COUNT: record COUNT preprocessed 16x16 luma frames tagged
     * LABEL (0=TL 1=TR 2=BL 3=BR quadrant the face is in, 4=empty) appended to
     * /tmp/face_capture.bin. Each record = 1 label byte + 256 luma bytes. Run
     * once per quadrant + empty to build a fine-tune set. Combine with --hdmi
     * to watch yourself and aim. */
    for (int a = 1; a < argc; ++a) {
        if (strcmp(argv[a], "--capture") == 0 && a + 2 < argc) {
            int label = atoi(argv[a+1]);
            int count = atoi(argv[a+2]);
            FILE *cf = fopen("/tmp/face_capture.bin", "ab");
            if (!cf) { perror("open capture file"); camera_close(); return 1; }
            printf("[capture] label=%d count=%d -> /tmp/face_capture.bin\n", label, count);
            /* Live-preview phase: grab+blit so the monitor shows live video and
             * you can line your face up in the target quarter. ~8 s. */
            printf("[capture] LIVE PREVIEW — position your face; recording in 8s\n");
            double pv0 = now_us();
            int last_sec = -1;
            while ((now_us() - pv0) < 8e6 && !g_stop) {
                if (camera_grab(on_frame, NULL) != 0) { usleep(30000); continue; }
                int sec = (int)((now_us() - pv0) / 1e6);
                if (sec != last_sec) { last_sec = sec;
                    printf("  recording in %d...\n", 8 - sec); fflush(stdout); }
            }
            printf("[capture] RECORDING now — hold position\n"); fflush(stdout);
            int got = 0;
            unsigned char rec[1 + IN_LEN];
            rec[0] = (unsigned char)label;
            while (got < count && !g_stop) {
                if (camera_grab(on_frame, NULL) != 0) { usleep(50000); continue; }
                for (int i = 0; i < IN_LEN; ++i) {
                    int l = s_q88[i] >> 7;              /* luma 0..255 */
                    rec[1 + i] = (unsigned char)(l < 0 ? 0 : (l > 255 ? 255 : l));
                }
                fwrite(rec, 1, sizeof rec, cf);
                got++;
                if ((got % 20) == 0) { printf("  %d/%d\n", got, count); fflush(stdout); }
                usleep(40000);                          /* ~25 fps, spread poses */
            }
            fclose(cf);
            printf("[capture] wrote %d frames (label %d)\n", got, label);
            camera_close();
            return 0;
        }
    }

    /* --guided: one continuous, mirrored, on-screen-guided capture session for
     * all 5 labels. The monitor never freezes: it shows live mirrored video the
     * whole time with a box marking the target quarter. Box BLINKS while you get
     * ready, then goes SOLID+double while it records ~150 frames. Empty = full
     * border (leave the frame). Writes /tmp/face_capture.bin. */
    for (int a = 1; a < argc; ++a) if (strcmp(argv[a], "--guided") == 0) {
        g_mirror = 1;
        /* 3x3 grid of camera boxes (320x240) = cells 0..8 (row*3+col), then
         * label 9 = EMPTY (full-frame border, leave the frame). */
        static const int qb[10][4] = {
            {6,4,101,76},   {113,4,208,76},   {220,4,314,76},     /* top row */
            {6,84,101,156}, {113,84,208,156}, {220,84,314,156},   /* mid row */
            {6,164,101,236},{113,164,208,236},{220,164,314,236},  /* bot row */
            {6,6,314,234} };                                       /* empty */
        static const char *nm[10] = {
            "TOP-LEFT","TOP-MIDDLE","TOP-RIGHT",
            "MIDDLE-LEFT","CENTER","MIDDLE-RIGHT",
            "BOTTOM-LEFT","BOTTOM-MIDDLE","BOTTOM-RIGHT",
            "EMPTY (leave the frame)"};
        FILE *cf = fopen("/tmp/face_capture.bin", "wb");
        if (!cf) { perror("capture file"); camera_close(); return 1; }
        for (int L = 0; L < 10 && !g_stop; ++L) {
            printf("\n[guided] === label %d: %s ===\n", L, nm[L]);
            /* preview: ~6 s, blinking box */
            double t0 = now_us(); int fr = 0;
            while ((now_us() - t0) < 6e6 && !g_stop) {
                if (camera_grab(on_frame, NULL) != 0) { usleep(30000); continue; }
                if (((fr / 10) & 1) == 0)
                    fb_guide_box(qb[L][0], qb[L][1], qb[L][2], qb[L][3]);
                fr++;
                int s = 6 - (int)((now_us() - t0) / 1e6);
                if (fr % 25 == 0) { printf("  get ready (%s) %d...\n", nm[L], s); fflush(stdout); }
            }
            /* record: 100 frames, solid double box */
            printf("[guided] RECORDING %s\n", nm[L]); fflush(stdout);
            unsigned char rec[1 + IN_LEN]; rec[0] = (unsigned char)L;
            int got = 0;
            while (got < 100 && !g_stop) {
                if (camera_grab(on_frame, NULL) != 0) { usleep(40000); continue; }
                fb_guide_box(qb[L][0], qb[L][1], qb[L][2], qb[L][3]);      /* solid = recording */
                fb_guide_box(qb[L][0]+8, qb[L][1]+8, qb[L][2]-8, qb[L][3]-8);
                for (int i = 0; i < IN_LEN; ++i) {
                    int l = s_q88[i] >> 7;
                    rec[1 + i] = (unsigned char)(l < 0 ? 0 : (l > 255 ? 255 : l));
                }
                fwrite(rec, 1, sizeof rec, cf);
                got++;
                usleep(40000);
            }
            printf("[guided] wrote %d frames for %s\n", got, nm[L]);
        }
        fclose(cf);
        printf("[guided] done — /tmp/face_capture.bin ready\n");
        camera_close();
        return 0;
    }

    printf("[main] entering capture loop (Ctrl-C to stop)\n");
    unsigned long frames = 0, dets = 0, stalls = 0;
    int32_t out[OUT_LEN];
    box_t boxes[GRID_CELLS];
    double fps_t0 = now_us();
    unsigned fps_frames = 0;
    int prev_n = -1;   /* last detection count, for --quiet edge logging */

    while (!g_stop) {
        if (camera_grab(on_frame, NULL) != 0) { if (g_stop) break; usleep(100000); continue; }

        uint32_t st = 0;
        double t0 = now_us();
        int rc = accel_run(s_q88, out, &st);
        double t1 = now_us();
        frames++; fps_frames++;

        /* live camera FPS once a second regardless of accel state */
        double nowt = now_us();
        double fps = fps_frames * 1e6 / (nowt - fps_t0);

        if (rc == 0) {
            int n = decode(out, boxes);
            dets += n;
            if (g_use_hdmi)
                for (int i = 0; i < n; ++i)
                    fb_draw_box(boxes[i].x0, boxes[i].y0,
                                boxes[i].x1, boxes[i].y1);
            /* Per-cell raw confidences (luma-contrast units) + scene range:
             * makes the detector observable even below threshold. */
            int lmin = 255, lmax = 0;
            for (int i = 0; i < IN_LEN; ++i) {
                int l = s_q88[i] >> 7;
                if (l < lmin) lmin = l;
                if (l > lmax) lmax = l;
            }
            /* In --quiet mode print only when the detection count changes,
             * so an unattended autostart run doesn't fill the tmpfs log. */
            if (!g_quiet || n != prev_n) {
            printf("[frame %lu] cam %.1f fps | accel %.1f us | %d det | "
                   "conf={%ld,%ld,%ld,%ld} luma=[%d..%d]\n",
                   frames, fps, t1 - t0, n,
                   (long)(out[4] >> 8), (long)(out[9] >> 8),
                   (long)(out[14] >> 8), (long)(out[19] >> 8),
                   lmin, lmax);
            for (int i = 0; i < n; ++i) {
                int16_t cq = boxes[i].conf;
                printf("    cell=%d box=[%u,%u->%u,%u] conf=%d.%02u\n",
                       boxes[i].cell, boxes[i].x0, boxes[i].y0,
                       boxes[i].x1, boxes[i].y1, cq >> 8,
                       (unsigned)((cq & 0xFF) * 100u >> 8));
            }
            fflush(stdout);
            }
            prev_n = n;
        } else {
            stalls++;
            if ((frames % 15) == 0) {
                /* Honest live status: camera + accelerator front-half work;
                 * back-half (layers 2,3) stalls — see project notes. */
                printf("[frame %lu] cam %.1f fps | accel STALL "
                       "(layer_ready=0x%x layer_busy=0x%x) | %lutotal\n",
                       frames, fps, (st >> 12) & 0xF, (st >> 8) & 0xF, stalls);
            }
        }
        if (nowt - fps_t0 > 1e6) { fps_t0 = nowt; fps_frames = 0; }
    }

    printf("\n[main] stopping: %lu frames, %lu detections, %lu stalls, "
           "%lu recoveries\n", frames, dets, stalls, g_recoveries);
    camera_close();   /* STREAMOFF so the next run isn't wedged */
    return 0;
}
