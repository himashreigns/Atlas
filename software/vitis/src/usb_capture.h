/* =============================================================================
 * usb_capture.h
 *
 * USB host + UVC video capture on the Zynq-7000 OTG controller (xilusbps).
 *
 * IMPORTANT — about the depth of this driver:
 *
 *   The Vitis BSP ships only the low-level controller driver (xusbps), which
 *   handles the EHCI-style hardware queue heads / transfer descriptors and
 *   bulk/interrupt/isochronous endpoints. A *device class* layer — for
 *   UVC (USB Video Class) — is NOT part of the BSP. That means a fully
 *   featured bare-metal video pipe would have to:
 *
 *     1. Implement USB enumeration (Setup pipe on EP0: device, config,
 *        interface, endpoint descriptors)
 *     2. Identify the UVC interface association descriptor + the
 *        VideoStreaming interface with its alternate settings
 *     3. Negotiate a probe/commit on EP0 (UVC class request 0x01 SET_CUR
 *        to VS_PROBE_CONTROL with the desired frame_index / format_index /
 *        dwMaxPayloadTransferSize)
 *     4. Switch to the right alternate interface to provision the iso
 *        endpoint bandwidth
 *     5. Issue periodic isochronous IN transfers; reassemble payload
 *        across UVC packet headers (BFH/EOF flags)
 *
 * This file ships the SCAFFOLD: enumeration up to step 2 and an isochronous
 * IN loop driven by xusbps. Steps 3–5 are hooked but marked TODO so they can
 * be filled in once a specific camera (MJPEG vs YUYV, 640x480 vs 320x240) is
 * picked. See README "USB capture status" section.
 *
 * For a fully working pipeline today, point usb_capture_get_frame() at a
 * test pattern (USB_USE_TEST_PATTERN=1) — this is what the demo build does
 * by default, so the rest of the system (accelerator, postproc, serial)
 * can be brought up end-to-end while the UVC class layer is finished.
 * ============================================================================= */
#ifndef USB_CAPTURE_H_
#define USB_CAPTURE_H_

#include "xil_types.h"

#define USB_FRAME_W     320
#define USB_FRAME_H     240
#define USB_FRAME_BYTES (USB_FRAME_W * USB_FRAME_H * 2)   /* YUYV 16 bpp */

/* When set, usb_capture_get_frame() returns a deterministic synthetic frame.
 * Useful for end-to-end bring-up before UVC enumeration is wired. */
#ifndef USB_USE_TEST_PATTERN
#define USB_USE_TEST_PATTERN 1
#endif

typedef enum {
    USB_PIXFMT_YUYV = 0,
    USB_PIXFMT_MJPEG = 1
} usb_pixfmt_t;

typedef struct {
    u32          width;
    u32          height;
    usb_pixfmt_t pixfmt;
    u32          n_frames_captured;
} usb_capture_state_t;

/*
 * usb_capture_init — power up controller, configure as host, enumerate device.
 *   Returns 0 on success, negative on error.
 *   When USB_USE_TEST_PATTERN==1 this is a no-op that just primes state.
 */
int usb_capture_init(void);

/*
 * usb_capture_get_frame — blocks until the next complete frame is in `dst`.
 *   `dst` must be USB_FRAME_BYTES large; YUYV format.
 *   Returns 0 on success, negative on error/timeout.
 */
int usb_capture_get_frame(u8 *dst);

/* Diagnostic / debug */
const usb_capture_state_t *usb_capture_state(void);
void usb_capture_dump(void);

#endif /* USB_CAPTURE_H_ */
