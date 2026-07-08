#!/usr/bin/env python3
# golden_model.py — bit-exact reference for the YOLO-Nano accelerator.
#
# Mirrors the RTL exactly:
#   Layer 0  CONV 3x3, 1->4, 16x16 -> 14x14x4, ReLU
#   Layer 1  POOL 2x2, 14x14x4 -> 7x7x4  (MAX)
#   Layer 2  POOL 2x2, 7x7x4  -> 3x3x4   (MAX)
#   Layer 3  FC  36 -> 20                (no bias, no activation)
#
# Input generation matches usb_capture.c's synthetic pattern:
#   YUYV 320x240 where luma[y,x] = (y + phase) & 0xFF, phase starts at 0
#   and advances by 4 each frame.
# Preprocess mirrors preprocess.c: 20x15 pixel-average blocks, then <<8 to Q8.8.
#
# Weights come from software/vitis/src/yolo_weights.c (both arrays).
#
# The RTL accumulator wraps into ACC_W=32 bits, so all math is done modulo 2^32
# and interpreted as int32 for comparisons.

import argparse
import re
import sys
from pathlib import Path

INT32_MASK = 0xFFFFFFFF
INT32_MIN  = -2**31
INT32_MAX  =  2**31 - 1

USB_FRAME_W = 320
USB_FRAME_H = 240
YOLO_IN_W   = 16
YOLO_IN_H   = 16
STRIDE_X    = USB_FRAME_W // YOLO_IN_W   # 20
STRIDE_Y    = USB_FRAME_H // YOLO_IN_H   # 15


def to_s32(x: int) -> int:
    x &= INT32_MASK
    return x - (1 << 32) if x & (1 << 31) else x


def load_weights_c(path: Path):
    """Return (wgt_l0, wgt_l3) parsed from yolo_weights.c."""
    text = path.read_text()
    def parse_array(name: str):
        m = re.search(
            rf'const\s+s16\s+{name}\s*\[[^\]]*\]\s*=\s*\{{(.*?)\}}\s*;',
            text, re.DOTALL)
        if not m:
            sys.exit(f"could not find array {name} in {path}")
        nums = re.findall(r'-?\d+', m.group(1))
        return [int(n) for n in nums]
    return parse_array('yolo_wgt_l0'), parse_array('yolo_wgt_l3')


def synth_luma(phase: int):
    """Return 2-D list [y][x] of Y-luma matching usb_capture_get_frame."""
    return [[(y + phase) & 0xFF for _ in range(USB_FRAME_W)]
            for y in range(USB_FRAME_H)]


def preprocess_to_q88(luma):
    """Return 16x16 list of s16 Q8.8 mirroring preprocess.c exactly.
    preprocess.c does `(s16)((u16)luma << 8)`, which wraps values with
    luma>=128 into the negative s16 range. Reproduce the same wrap so the
    downstream CONV layer sees identical inputs."""
    out = [[0] * YOLO_IN_W for _ in range(YOLO_IN_H)]
    for dy in range(YOLO_IN_H):
        for dx in range(YOLO_IN_W):
            y0 = dy * STRIDE_Y
            x0 = dx * STRIDE_X
            s = 0
            n = 0
            for yy in range(STRIDE_Y):
                for xx in range(STRIDE_X):
                    s += luma[y0 + yy][x0 + xx]
                    n += 1
            avg = s // n if n else 0
            u = (avg & 0xFF) << 8               # Q8.8 as u16
            out[dy][dx] = u - 65536 if u & 0x8000 else u
    return out


# ---- Layer 0: CONV 3x3, ReLU -----------------------------------------------
def conv3x3_relu(act_16, wgt_l0):
    K, IN_C, OUT_C = 3, 1, 4
    ROWS, COLS = 16, 16
    OUT_R, OUT_C_ = 14, 14
    out = [0] * (OUT_C * OUT_R * OUT_C_)
    for co in range(OUT_C):
        for r in range(OUT_R):
            for c in range(OUT_C_):
                acc = 0
                for ci in range(IN_C):
                    for kr in range(K):
                        for kc in range(K):
                            a = act_16[r + kr][c + kc]  # ci=0 only
                            w = wgt_l0[co * IN_C * K * K + ci * K * K + kr * K + kc]
                            acc = to_s32(acc + (a * w))
                if acc < 0:
                    acc = 0
                out[co * OUT_R * OUT_C_ + r * OUT_C_ + c] = acc
    return out       # length 4*14*14 = 784


# ---- Layer 1/2: MAX-pool 2x2 -----------------------------------------------
def maxpool2x2(act_flat, in_h, in_w, in_c):
    out_h, out_w = in_h // 2, in_w // 2
    out = [0] * (in_c * out_h * out_w)
    for ci in range(in_c):
        for r in range(out_h):
            for c in range(out_w):
                mx = None
                for pr in range(2):
                    for pc in range(2):
                        idx = ci * in_h * in_w + (r * 2 + pr) * in_w + (c * 2 + pc)
                        v = to_s32(act_flat[idx])
                        mx = v if mx is None else max(mx, v)
                out[ci * out_h * out_w + r * out_w + c] = mx
    return out


# ---- Layer 3: FC 36 -> 20 (no bias, no ReLU; s32-wrap MAC) -----------------
def fc(act_flat, wgt_l3, fc_in=36, fc_out=20):
    # RTL: for FC layer, DATA_W=32=ACC_W so product = (act*wgt) truncated to
    # low 32 bits. We simulate the exact same wrap.
    out = [0] * fc_out
    for o in range(fc_out):
        acc = 0
        for i in range(fc_in):
            a = to_s32(act_flat[i])
            w = wgt_l3[o * fc_in + i]
            # 32-bit signed multiply, keep low 32 bits (RTL truncation)
            p = to_s32((a * w) & INT32_MASK)
            acc = to_s32(acc + p)
        out[o] = acc
    return out


def flatten2d(m):
    return [v for row in m for v in row]


def run(phase: int, wgt_l0, wgt_l3):
    luma  = synth_luma(phase)
    q88   = preprocess_to_q88(luma)
    l0    = conv3x3_relu(q88, wgt_l0)
    l1    = maxpool2x2(l0, 14, 14, 4)
    l2    = maxpool2x2(l1, 7, 7, 4)
    l3    = fc(l2, wgt_l3, fc_in=36, fc_out=20)
    return l0, l1, l2, l3


def hex_row(vals, n=20):
    return " ".join(f"{v & INT32_MASK:08X}" for v in vals[:n])


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--weights",
                    default="software/vitis/src/yolo_weights.c",
                    help="path to yolo_weights.c")
    ap.add_argument("--phase", type=int, default=0,
                    help="synthetic input phase (usb_capture bumps by 4/frame)")
    ap.add_argument("--frames", type=int, default=1,
                    help="dump N successive frames")
    args = ap.parse_args()

    root = Path(__file__).resolve().parent.parent
    wgt_path = (root / args.weights).resolve()
    wgt_l0, wgt_l3 = load_weights_c(wgt_path)
    assert len(wgt_l0) == 36,  f"wgt_l0 len {len(wgt_l0)}"
    assert len(wgt_l3) == 720, f"wgt_l3 len {len(wgt_l3)}"

    for k in range(args.frames):
        phase = (args.phase + 4 * k) & 0xFF
        l0, l1, l2, l3 = run(phase, wgt_l0, wgt_l3)
        print(f"=== frame {k} (phase={phase}) ===")
        print(f"L0 head (CONV+ReLU, 20 of 784): {hex_row(l0)}")
        print(f"L1 head (POOL,     20 of 196): {hex_row(l1)}")
        print(f"L2 all  (POOL,     36 total):  {hex_row(l2, 36)}")
        print(f"L3 all  (FC,       20 total):  {hex_row(l3, 20)}")


if __name__ == "__main__":
    main()
