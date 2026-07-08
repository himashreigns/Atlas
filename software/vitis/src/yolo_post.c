/* =============================================================================
 * yolo_post.c
 * ============================================================================= */
#include "yolo_post.h"
#include "xil_printf.h"

/* Q8.8 * u32 → integer in src-pixel space (rounded down). */
static inline u32 q88_mul_u32(s16 q, u32 v) {
    if (q < 0) return 0;
    return ((u32)q * v) >> 8;
}

int yolo_post_decode(const s32 *raw, yolo_box_t *out, u32 src_w, u32 src_h) {
    int kept = 0;
    const u32 grid_n  = 2;            /* 2x2 grid */
    const u32 cell_w  = src_w / grid_n;
    const u32 cell_h  = src_h / grid_n;

    for (u32 c = 0; c < YOLO_GRID_CELLS; ++c) {
        /* Accelerator writes ACC_W=32-bit MAC accumulators; take the low 16
         * bits as the Q8.8 field for the existing decode math. This is a
         * lossy narrow-cast — once real quantization is wired in we should
         * scale-shift here instead. */
        const s32 *p = raw + c * YOLO_PARAMS_PER_CELL;
        s16 cx_q88 = (s16)p[0];
        s16 cy_q88 = (s16)p[1];
        s16 w_q88  = (s16)p[2];
        s16 h_q88  = (s16)p[3];
        s16 conf   = (s16)p[4];

        if (conf < YOLO_OBJ_THRESHOLD_Q88) continue;

        u32 cell_col = c % grid_n;
        u32 cell_row = c / grid_n;
        u32 cx_px = cell_col * cell_w + q88_mul_u32(cx_q88, cell_w);
        u32 cy_px = cell_row * cell_h + q88_mul_u32(cy_q88, cell_h);
        u32 w_px  = q88_mul_u32(w_q88, src_w);
        u32 h_px  = q88_mul_u32(h_q88, src_h);

        u32 x0 = (cx_px > w_px / 2) ? cx_px - w_px / 2 : 0;
        u32 y0 = (cy_px > h_px / 2) ? cy_px - h_px / 2 : 0;
        u32 x1 = cx_px + w_px / 2; if (x1 > src_w) x1 = src_w;
        u32 y1 = cy_px + h_px / 2; if (y1 > src_h) y1 = src_h;

        out[kept].x0 = (u16)x0;
        out[kept].y0 = (u16)y0;
        out[kept].x1 = (u16)x1;
        out[kept].y1 = (u16)y1;
        out[kept].confidence_q88 = conf;
        out[kept].cell_idx = (u8)c;
        kept++;
    }
    return kept;
}

void yolo_post_print(const yolo_box_t *boxes, int n) {
    xil_printf("[yolo] %d detection%s\r\n", n, n == 1 ? "" : "s");
    for (int i = 0; i < n; ++i) {
        /* conf is Q8.8; print signed integer.fraction. xil_printf doesn't
         * support width/precision or %u/%lu, so hand-format the fraction. */
        s16 cq   = boxes[i].confidence_q88;
        s32 cint = (s32)(cq >> 8);            /* signed integer part */
        u32 mag  = (u32)((cq < 0) ? -cq : cq);
        u32 frac = ((mag & 0xFFU) * 100U) >> 8;
        const char *lead = (frac < 10) ? "0" : "";
        xil_printf("  cell=%d  box=[%d,%d -> %d,%d]  conf=%d.%s%d\r\n",
                   (int)boxes[i].cell_idx,
                   (int)boxes[i].x0, (int)boxes[i].y0,
                   (int)boxes[i].x1, (int)boxes[i].y1,
                   (int)cint, lead, (int)frac);
    }
}
