/* =============================================================================
 * main.c — bare-metal YOLO-Nano live-capture demo
 *
 *  ┌────────┐   YUYV   ┌──────────┐  16x16 Q8.8  ┌─────────────┐  boxes  ┌──────┐
 *  │ USB    │ ───────► │preprocess│ ───────────► │ accelerator │ ──────► │ UART │
 *  │ camera │          │          │              │ (AXI-Lite + │         │ log  │
 *  │ (OTG)  │          │          │              │  AXI-HP DMA)│         │      │
 *  └────────┘          └──────────┘              └─────────────┘         └──────┘
 *
 * Console output via UART1 → on-board Cypress USB-UART bridge → /dev/ttyACM0
 * on the host @ 115200 8N1. Use scripts/serial.sh to attach.
 *
 * Debug entry points (XSDB friendly):
 *   - main()                  : entry
 *   - dnn_accel_init()        : first AXI-Lite transaction → CONFIG read
 *   - usb_capture_init()      : USB host bring-up
 *   - dnn_accel_run_inference : per-frame kick
 *   - yolo_post_decode        : where boxes are emitted
 * ============================================================================= */

#include "xparameters.h"
#include "xil_printf.h"
#include "xil_cache.h"
#include "xil_exception.h"
#include "xscugic.h"
#include "sleep.h"
#include "xtime_l.h"

#include "dnn_accel.h"
#include "usb_capture.h"
#include "preprocess.h"
#include "yolo_post.h"
#include "yolo_weights.h"

/* exposed by dnn_accel.c */
int dnn_accel_attach_irq(XScuGic *gic);

/* libc constructor/destructor anchors that the Vitis BSP's crt0 doesn't
 * supply on its own. They run before main() / after exit() and we have
 * nothing to do in either. */
void _init(void) {}
void _fini(void) {}

/* Bare-metal UART1 poke used to confirm we reach main BEFORE anything else.
 * UART1 base 0xE0001000, SR offset 0x2C, TX FIFO 0x30. */
static void bm_uart_puts(const char *s) {
    volatile unsigned int *sr   = (volatile unsigned int *)0xE000102C;
    volatile unsigned int *fifo = (volatile unsigned int *)0xE0001030;
    while (*s) {
        int t = 0;
        while ((*sr & (1u << 4)) && (t++ < 1000000)) { }
        *fifo = (unsigned int)*s++;
    }
}

/* Hard-reprogram UART1 to a known-good 8N1 @ 115200 with UART_CLK = 100 MHz.
 *   UART_CLK_CTRL @ F8000154   → divisor 10, srcsel=IOPLL, CLKACT1 set
 *   CR            @ E0001000   → TX/RX enable, disable interrupts
 *   MR            @ E0001004   → 8 data bits, 1 stop, no parity, no clkdiv
 *   BAUDGEN       @ E0001018   → 124
 *   BAUDDIV       @ E0001034   → 6
 *   RTRIG/TXWM    left default; TXFIFO reset via CR bits */
static void uart1_hard_reinit(void) {
    volatile unsigned int *unlock       = (volatile unsigned int *)0xF8000008;
    volatile unsigned int *lock         = (volatile unsigned int *)0xF8000004;
    volatile unsigned int *uart_clk     = (volatile unsigned int *)0xF8000154;
    volatile unsigned int *uart_cr      = (volatile unsigned int *)0xE0001000;
    volatile unsigned int *uart_mr      = (volatile unsigned int *)0xE0001004;
    volatile unsigned int *uart_baudgen = (volatile unsigned int *)0xE0001018;
    volatile unsigned int *uart_bauddiv = (volatile unsigned int *)0xE0001034;
    volatile unsigned int *uart_ier     = (volatile unsigned int *)0xE0001008;
    volatile unsigned int *uart_idr     = (volatile unsigned int *)0xE000100C;

    *unlock = 0x0000DF0DU;
    /* UART_CLK: SRCSEL=IOPLL (00), DIVISOR=10, CLKACT1=1 */
    *uart_clk = (10u << 8) | (1u << 1);
    *lock   = 0x0000767BU;

    /* CR bit map (per Zynq TRM):
     *  [0] RXRST  [1] TXRST  [2] RXEN  [3] RXDIS
     *  [4] TXEN   [5] TXDIS  [7] STARTBRK  [8] STOPBRK */
    *uart_cr  = (1u << 0) | (1u << 1);     /* reset RX & TX */
    for (volatile int i = 0; i < 1000; ++i) { }
    *uart_idr = 0xFFFFFFFFU;
    *uart_mr  = 0x00000020U;               /* 8N1, no parity, PS clock direct */
    *uart_baudgen = 124u;
    *uart_bauddiv = 6u;
    *uart_cr  = (1u << 4) | (1u << 2) | (1u << 8);   /* TXEN | RXEN | STOPBRK */
    (void)uart_ier;
}

/* Send 5 identical bytes twice per second forever, using bare-metal poke.
 * If UART wiring is correct we see 'A''B''C''\r''\n' repeatedly. */
static void uart_bang_test(void) __attribute__((used));
static void uart_bang_test(void) {
    volatile unsigned int *sr   = (volatile unsigned int *)0xE000102C;
    volatile unsigned int *fifo = (volatile unsigned int *)0xE0001030;
    const char *pattern = "ABC\r\n";
    for (;;) {
        for (const char *p = pattern; *p; ++p) {
            int t = 0;
            while ((*sr & (1u << 4)) && (t++ < 1000000)) { }
            *fifo = (unsigned int)*p;
        }
        for (volatile int i = 0; i < 30000000; ++i) { }   /* ~ 0.5s */
    }
}

/* Force-enable FCLK0 in case ps7_init didn't (it doesn't on some Vivado
 * generations because the EMIT_MASKWRITE mask for FPGA0_CLK_CTRL excludes
 * bit 0). Writes via CPU AXI which may succeed where direct DAP writes do not. */
static void force_fclk0_enable(void) {
    volatile unsigned int *slcr_unlock = (volatile unsigned int *)0xF8000008;
    volatile unsigned int *fclk0_ctrl  = (volatile unsigned int *)0xF8000170;
    *slcr_unlock = 0xDF0Du;
    *fclk0_ctrl  = 0x00200501u;   /* CLKACT=1, DIVISOR0=5, DIVISOR1=2, SRC=IO PLL */
}

/* DDR-resident frame buffer (sized for USB_FRAME_BYTES). 128 KB max for a
 * 320x240 YUYV frame.  Place in a section the BSP marks as cacheable; cache
 * mgmt is handled inside the modules that DMA the data. */
static u8  s_yuyv_frame[USB_FRAME_BYTES] __attribute__((aligned(64)));
static s16 s_q88_input[YOLO_IN_LEN]      __attribute__((aligned(64)));
static s32 s_output[YOLO_OUT_LEN]        __attribute__((aligned(64)));
static yolo_box_t s_boxes[YOLO_GRID_CELLS];

static XScuGic s_gic;

/* ---- GIC setup ----------------------------------------------------------- */
static int gic_setup(void) {
    XScuGic_Config *cfg = XScuGic_LookupConfig(XPAR_SCUGIC_SINGLE_DEVICE_ID);
    if (!cfg) { xil_printf("[gic] LookupConfig FAIL\r\n"); return -1; }
    int s = XScuGic_CfgInitialize(&s_gic, cfg, cfg->CpuBaseAddress);
    if (s != XST_SUCCESS) { xil_printf("[gic] CfgInit FAIL %d\r\n", s); return -1; }

    Xil_ExceptionInit();
    Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_IRQ_INT,
        (Xil_ExceptionHandler)XScuGic_InterruptHandler, &s_gic);
    Xil_ExceptionEnable();
    return 0;
}

/* ---- Stats --------------------------------------------------------------- */
typedef struct {
    u32 frames;
    u32 detections;
    u32 errors;
} stats_t;
static stats_t s_stats;

static void print_banner(void) {
    xil_printf("\r\n");
    xil_printf("==================================================\r\n");
    xil_printf(" YOLO-Nano live capture — Zynq + DNN accelerator\r\n");
    xil_printf("  build: %s %s\r\n", __DATE__, __TIME__);
    xil_printf("==================================================\r\n");
}

int main(void) {
    uart1_hard_reinit();
    bm_uart_puts("\r\n[main] entered\r\n");
    /* Uncomment the next line and rebuild to bang UART forever for probing.
     * uart_bang_test(); */
    force_fclk0_enable();
    bm_uart_puts("[main] FCLK0 forced on\r\n");

    Xil_DCacheEnable();
    Xil_ICacheEnable();

    print_banner();

    if (gic_setup() != 0) {
        xil_printf("[main] GIC setup failed; continuing in poll mode\r\n");
    }

    /* Accelerator bring-up */
    if (dnn_accel_init() != 0) {
        xil_printf("[main] FATAL: accelerator not responding\r\n");
        return -1;
    }
    if (dnn_accel_attach_irq(&s_gic) != 0) {
        xil_printf("[main] WARN: IRQ attach failed; will poll\r\n");
    }
    dnn_accel_dump_regs();
    dnn_accel_configure_yolo_sizes();
    dnn_accel_load_weights(yolo_wgt_l0, yolo_wgt_l3);

    /* USB capture bring-up */
    if (usb_capture_init() != 0) {
        xil_printf("[main] USB init failed\r\n");
        /* Continue: test pattern mode still works without USB */
    }
    usb_capture_dump();

    xil_printf("[main] entering capture loop. Halt with XSDB 'stop'.\r\n");

    while (1) {
        if (usb_capture_get_frame(s_yuyv_frame) != 0) {
            s_stats.errors++;
            xil_printf("[main] frame fetch FAIL (errors=%d)\r\n",
                       (int)s_stats.errors);
            sleep(1);
            continue;
        }

        preprocess_yuyv_to_q88(s_yuyv_frame, s_q88_input);

        /* Time the accelerator run using the ARM global timer (COUNTS_PER_SECOND
         * is the timer's tick rate; on Zynq-7020 that's CPU_3x_2x = 333.33 MHz).
         * Convert to microseconds for a demo-friendly number. */
        XTime t_start, t_end;
        XTime_GetTime(&t_start);
        if (dnn_accel_run_inference(s_q88_input, s_output) != 0) {
            s_stats.errors++;
            xil_printf("[main] inference FAIL (#%d)\r\n", (int)s_stats.errors);
            dnn_accel_dump_regs();
            sleep(2);   /* throttle so the log stays readable while we debug */
            continue;
        }
        XTime_GetTime(&t_end);
        u32 usec = (u32)((t_end - t_start) * 1000000u / COUNTS_PER_SECOND);

        int n = yolo_post_decode(s_output, s_boxes, USB_FRAME_W, USB_FRAME_H);
        s_stats.frames++;
        s_stats.detections += (u32)n;

        if (n > 0) {
            xil_printf("[frame %d] [accel %d us] ", (int)s_stats.frames, (int)usec);
            yolo_post_print(s_boxes, n);
        } else if ((s_stats.frames % 30u) == 0u) {
            /* Heartbeat once a second-ish so the operator sees the loop is live */
            xil_printf("[frame %d] [accel %d us] no detections (cum total=%d)\r\n",
                       (int)s_stats.frames, (int)usec,
                       (int)s_stats.detections);
        }
    }

    Xil_DCacheDisable();
    Xil_ICacheDisable();
    return 0;
}
