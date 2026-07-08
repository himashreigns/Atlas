/* =============================================================================
 * preprocess.h
 *
 *   YUYV(USB_FRAME_W x USB_FRAME_H) → grayscale(16 x 16) Q8.8 fixed-point.
 *
 *   1. Extract Y channel from packed YUYV (every other byte)
 *   2. Box-filter average down to 16x16
 *   3. Cast Y[0..255] → Q8.8 by left-shift 8 (so pixel value lands in
 *      bits [15:8] and fractional bits are 0).
 * ============================================================================= */
#ifndef PREPROCESS_H_
#define PREPROCESS_H_

#include "xil_types.h"
#include "usb_capture.h"
#include "dnn_accel.h"   /* YOLO_IN_H / YOLO_IN_W */

void preprocess_yuyv_to_q88(const u8 *yuyv_frame, s16 *q88_out);

#endif /* PREPROCESS_H_ */
