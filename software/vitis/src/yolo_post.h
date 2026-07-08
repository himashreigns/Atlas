/* =============================================================================
 * yolo_post.h
 *
 * Decode YOLO-Nano output:
 *   raw[0..19] = 4 grid cells × (x, y, w, h, objectness), all int16 Q8.8.
 *
 *   - Cell (cx,cy) covers an 8x8 patch of the 16x16 input → image-space box.
 *   - x,y are relative to the cell origin, normalised to [0,1] in Q8.8.
 *   - w,h are normalised to the full image in Q8.8.
 *   - objectness > YOLO_OBJ_THRESHOLD → emit a detection.
 * ============================================================================= */
#ifndef YOLO_POST_H_
#define YOLO_POST_H_

#include "xil_types.h"
#include "dnn_accel.h"

#define YOLO_OBJ_THRESHOLD_Q88   ((s16)(0.30f * 256))   /* 0.30 confidence */

typedef struct {
    u16 x0, y0, x1, y1;   /* in source-frame pixel space (USB_FRAME_W/H) */
    s16 confidence_q88;
    u8  cell_idx;
} yolo_box_t;

/*
 * yolo_post_decode — returns the number of boxes written to `out`.
 *                    `out` should be sized for YOLO_GRID_CELLS entries.
 */
int yolo_post_decode(const s32 *raw, yolo_box_t *out, u32 src_w, u32 src_h);

void yolo_post_print(const yolo_box_t *boxes, int n);

#endif /* YOLO_POST_H_ */
