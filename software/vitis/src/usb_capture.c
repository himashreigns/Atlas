/* =============================================================================
 * usb_capture.c — USB host + UVC capture scaffold
 *
 * Path A (USB_USE_TEST_PATTERN=1, default): generates a moving-checker frame
 * so the rest of the pipeline can be exercised on real hardware via XSDB +
 * serial. No USB traffic.
 *
 * Path B (USB_USE_TEST_PATTERN=0): drives the EHCI-style xusbps controller
 * in host mode. The scaffold sets up the driver, walks descriptors, and
 * leaves clearly labeled TODO blocks for the UVC class layer.
 * ============================================================================= */
#include "usb_capture.h"

#include "xil_printf.h"
#include "xil_types.h"
#include "xparameters.h"
#include "sleep.h"
#include <string.h>

#if !USB_USE_TEST_PATTERN
#include "xusbps.h"
#include "xusbps_hw.h"
#endif

static usb_capture_state_t s_state = {
    .width  = USB_FRAME_W,
    .height = USB_FRAME_H,
    .pixfmt = USB_PIXFMT_YUYV,
    .n_frames_captured = 0,
};

const usb_capture_state_t *usb_capture_state(void) { return &s_state; }

void usb_capture_dump(void) {
    xil_printf("[usb] frames=%lu  W=%lu H=%lu  fmt=%s  mode=%s\r\n",
               (unsigned long)s_state.n_frames_captured,
               (unsigned long)s_state.width,
               (unsigned long)s_state.height,
               s_state.pixfmt == USB_PIXFMT_YUYV ? "YUYV" : "MJPEG",
               USB_USE_TEST_PATTERN ? "TEST-PATTERN" : "UVC");
}

/* -----------------------------------------------------------------------------
 * Path A: test pattern
 * -------------------------------------------------------------------------- */
#if USB_USE_TEST_PATTERN

int usb_capture_init(void) {
    xil_printf("[usb] running in TEST-PATTERN mode (no USB traffic)\r\n");
    return 0;
}

int usb_capture_get_frame(u8 *dst) {
    /* Synthetic YUYV: moving horizontal bands of Y intensity, U/V = 0x80. */
    static u8 phase = 0;
    for (u32 y = 0; y < USB_FRAME_H; ++y) {
        u8 luma = (u8)((y + phase) & 0xFF);
        for (u32 x = 0; x < USB_FRAME_W; x += 2) {
            u32 i = (y * USB_FRAME_W + x) * 2;
            dst[i + 0] = luma;          /* Y0 */
            dst[i + 1] = 0x80;          /* U  */
            dst[i + 2] = luma;          /* Y1 */
            dst[i + 3] = 0x80;          /* V  */
        }
    }
    phase += 4;
    s_state.n_frames_captured++;
    return 0;
}

#else  /* ----- Path B: real UVC over xusbps ---------------------------------- */

static XUsbPs s_usb;

/* TODO: descriptor parsing helpers. These mirror the typical UVC bring-up. */
static int  usb_enumerate_device(void);                 /* Setup pipe walk    */
static int  uvc_negotiate_format(usb_pixfmt_t fmt,
                                  u32 w, u32 h, u32 fps);
static int  uvc_select_alt_setting(int iface, int alt); /* set_interface()    */
static int  uvc_start_iso_in(void);                     /* arm endpoint       */
static int  uvc_collect_frame(u8 *dst);                 /* reassembly         */

int usb_capture_init(void) {
    XUsbPs_Config *cfg = XUsbPs_LookupConfig(XPAR_XUSBPS_0_DEVICE_ID);
    if (!cfg) { xil_printf("[usb] LookupConfig FAIL\r\n"); return -1; }

    int s = XUsbPs_CfgInitialize(&s_usb, cfg, cfg->BaseAddress);
    if (s != XST_SUCCESS) { xil_printf("[usb] CfgInit FAIL %d\r\n", s); return -1; }

    XUsbPs_DeviceReset(&s_usb);
    /* Switch controller to HOST mode (CM=11). The xusbps driver in older BSPs
     * does not expose a public host-mode entrypoint, so we poke the USBMODE
     * register directly. */
    XUsbPs_WriteReg(cfg->BaseAddress, XUSBPS_MODE_OFFSET,
                    XUSBPS_MODE_CM_HOST_MASK);
    usleep(1000);

    if (usb_enumerate_device() != 0)        return -2;
    if (uvc_negotiate_format(USB_PIXFMT_YUYV,
                              USB_FRAME_W, USB_FRAME_H, 30) != 0) return -3;
    if (uvc_start_iso_in() != 0)            return -4;

    xil_printf("[usb] UVC pipe up, %lux%lu YUYV @ 30 fps\r\n",
               (unsigned long)USB_FRAME_W, (unsigned long)USB_FRAME_H);
    return 0;
}

int usb_capture_get_frame(u8 *dst) {
    int rc = uvc_collect_frame(dst);
    if (rc == 0) s_state.n_frames_captured++;
    return rc;
}

/* -----------------------------------------------------------------------------
 * UVC implementation TODOs
 * --------------------------------------------------------------------------
 *  - usb_enumerate_device():
 *      a) Issue SET_ADDRESS to 1
 *      b) GET_DESCRIPTOR(DEVICE) → confirm vendor/product
 *      c) GET_DESCRIPTOR(CONFIG) → walk Interface Association + VideoControl
 *         + VideoStreaming descriptors. Cache:
 *           .vc_iface, .vs_iface, .iso_ep_addr, .iso_ep_max_pkt
 *           .format_index (YUYV), .frame_index (the WxH we want)
 *      d) SET_CONFIGURATION 1
 *
 *  - uvc_negotiate_format():
 *      Build a 26-byte VS_PROBE_CONTROL struct:
 *        bmHint=1, bFormatIndex, bFrameIndex, dwFrameInterval=333333
 *        (30 fps in 100 ns ticks), rest 0.
 *      SET_CUR (bRequest 0x01, wValue 0x0100, wIndex=vs_iface)
 *      GET_CUR back → device fills dwMaxPayloadTransferSize / dwMaxVideoFrameSize
 *      SET_CUR commit (wValue 0x0200)
 *
 *  - uvc_select_alt_setting():
 *      SET_INTERFACE(vs_iface, alt) where alt provides the iso bandwidth that
 *      matches the negotiated dwMaxPayloadTransferSize.
 *
 *  - uvc_start_iso_in():
 *      Allocate N iTDs in a contiguous DMA-safe pool (Xil_MemMap'd uncached
 *      or use Xil_DCacheFlushRange around fills). Queue them on the iso
 *      schedule. xusbps driver: XUsbPs_EpDataBufferReceive() once available
 *      or directly manipulate ep_queue when running host-mode.
 *
 *  - uvc_collect_frame():
 *      Iterate packets, strip the 12-byte UVC payload header per packet,
 *      reassemble until EOF bit (header[1] & 0x02) → return when full frame
 *      bytes received or pixfmt-specific marker found.
 *
 * Recommended bring-up order: get GET_DESCRIPTOR(DEVICE) working first
 * (visible on a USB analyzer or via xil_printf hexdumps), then descriptor
 * walk, then iso. Use XSDB hbreak in uvc_negotiate_format() to step the
 * PROBE/COMMIT exchange.
 * ---------------------------------------------------------------------------*/

static int usb_enumerate_device(void) {
    xil_printf("[usb] enumerate_device: TODO\r\n");
    return -1;
}
static int uvc_negotiate_format(usb_pixfmt_t fmt, u32 w, u32 h, u32 fps) {
    (void)fmt; (void)w; (void)h; (void)fps;
    xil_printf("[usb] uvc_negotiate_format: TODO\r\n");
    return -1;
}
static int uvc_select_alt_setting(int iface, int alt) {
    (void)iface; (void)alt;
    return -1;
}
static int uvc_start_iso_in(void) {
    xil_printf("[usb] uvc_start_iso_in: TODO\r\n");
    return -1;
}
static int uvc_collect_frame(u8 *dst) {
    (void)dst;
    return -1;
}

#endif /* USB_USE_TEST_PATTERN */
