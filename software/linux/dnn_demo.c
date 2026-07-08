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
#define ACCEL_RETRIES      2        /* kick + (soft-reset recovery) retry */

/* ---- Globals ------------------------------------------------------------- */
static volatile uint32_t *g_regs;   /* accelerator register window */
static volatile int32_t  *g_dma;    /* DMA scratch (word-addressed) */

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
    for (i = 0; i < WGT_L0_LEN; ++i) w0[i] = (int32_t)yolo_wgt_l0[i];
    for (i = 0; i < WGT_L3_LEN; ++i) w3[i] = (int32_t)yolo_wgt_l3[i];

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
            q88[dy * IN_W + dx] = (int16_t)((uint16_t)luma << 8);
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
    for (uint32_t c = 0; c < GRID_CELLS; ++c) {
        const int32_t *p = raw + c * PARAMS_PER_CELL;
        int16_t cx = (int16_t)p[0], cy = (int16_t)p[1];
        int16_t w  = (int16_t)p[2], h  = (int16_t)p[3];
        int16_t conf = (int16_t)p[4];
        if (conf < OBJ_THRESHOLD_Q88) continue;

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

static void on_frame(const uint8_t *yuyv, void *ctx) {
    (void)ctx;
    preprocess(yuyv, s_q88);
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
    const char *dev = (argc > 1) ? argv[1] : "/dev/video0";

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

    printf("[main] entering capture loop (Ctrl-C to stop)\n");
    unsigned long frames = 0, dets = 0, stalls = 0;
    int32_t out[OUT_LEN];
    box_t boxes[GRID_CELLS];
    double fps_t0 = now_us();
    unsigned fps_frames = 0;

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
            printf("[frame %lu] cam %.1f fps | accel %.1f us | %d det\n",
                   frames, fps, t1 - t0, n);
            for (int i = 0; i < n; ++i) {
                int16_t cq = boxes[i].conf;
                printf("    cell=%d box=[%u,%u->%u,%u] conf=%d.%02u\n",
                       boxes[i].cell, boxes[i].x0, boxes[i].y0,
                       boxes[i].x1, boxes[i].y1, cq >> 8,
                       (unsigned)((cq & 0xFF) * 100u >> 8));
            }
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
