/* =============================================================================
 * preprocess.c — YUYV → 16x16 grayscale Q8.8
 * ============================================================================= */
#include "preprocess.h"

#include <string.h>

void preprocess_yuyv_to_q88(const u8 *yuyv_frame, s16 *q88_out) {
    /* Source: USB_FRAME_W x USB_FRAME_H, packed YUYV (2 bytes/pixel).
     * Destination: YOLO_IN_W x YOLO_IN_H Q8.8. */
    const u32 src_w = USB_FRAME_W;
    const u32 src_h = USB_FRAME_H;
    const u32 dst_w = YOLO_IN_W;
    const u32 dst_h = YOLO_IN_H;

    const u32 stride_x = src_w / dst_w;   /* 320/16 = 20 */
    const u32 stride_y = src_h / dst_h;   /* 240/16 = 15 */

    for (u32 dy = 0; dy < dst_h; ++dy) {
        for (u32 dx = 0; dx < dst_w; ++dx) {
            u32 sum = 0;
            u32 n   = 0;
            u32 y0  = dy * stride_y;
            u32 x0  = dx * stride_x;
            for (u32 yy = 0; yy < stride_y; ++yy) {
                u32 sy = y0 + yy;
                if (sy >= src_h) break;
                const u8 *row = yuyv_frame + sy * src_w * 2;
                for (u32 xx = 0; xx < stride_x; ++xx) {
                    u32 sx = x0 + xx;
                    if (sx >= src_w) break;
                    /* Y is at byte offset 0 of each YUYV pixel (every 2 bytes) */
                    sum += row[sx * 2];
                    n++;
                }
            }
            u8 luma = (n > 0) ? (u8)(sum / n) : 0;
            /* Q8.8: shift by 8 so the integer part sits in bits [15:8]. */
            q88_out[dy * dst_w + dx] = (s16)((u16)luma << 8);
        }
    }
}
