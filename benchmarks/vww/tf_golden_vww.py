#!/usr/bin/env python3
"""
tf_golden_vww.py — VWW-Tiny golden reference
=============================================
Network : CONV(3×3,1→8) → POOL(2×2) → CONV(3×3,8→16) → POOL(2×2)
Input   : 24×24 grayscale image  (person / no-person visual wake-word)
Output  : 4×4×16 = 256 spatial feature activations

Hardware Q-format / scale chain
---------------------------------
  After L0 CONV >>20 : hw_int ≈ TF_float          (scale = 1)
  After L1 POOL      : same scale
  After L2 CONV >>20 : hw_int ≈ TF_float / 2^8    (scale = 256)
  After L3 POOL      : same scale  →  HW_SCALE = 256

  expected_hw_int = round(TF_final_float / 256)

Writes
------
  golden_vww_input.memh       576×16b  Q8.8  input image
  golden_vww_wgts_l0.memh      72×16b  Q4.12 conv0 weights
  golden_vww_wgts_l2.memh    1152×16b  Q4.12 conv2 weights
  golden_vww_output.memh      256×16b  expected HW int16
  golden_vww_output.csv       index, tf_float, expected_hw_int
"""

import json, os, sys, hashlib
import numpy as np

os.environ.setdefault("TF_CPP_MIN_LOG_LEVEL", "3")
os.environ.setdefault("TF_ENABLE_ONEDNN_OPTS", "0")
import tensorflow as tf
tf.get_logger().setLevel("ERROR")

# ── Network geometry ──────────────────────────────────────────────────────────
H_IN, W_IN, C_IN = 24, 24, 1
C0_K, C0_OUT     = 3, 8     # L0 CONV  24×24×1 → 22×22×8
P1_K             = 2         # L1 POOL  22×22×8 → 11×11×8
C2_K, C2_OUT     = 3, 16    # L2 CONV  11×11×8 → 9×9×16
P3_K             = 2         # L3 POOL  9×9×16  → 4×4×16 = 256

OUT_SIZE = 256  # 4*4*16

# ── Fixed-point format ────────────────────────────────────────────────────────
Q_ACT    = 8
Q_WGT    = 12
Q_SHIFT  = 20
HW_SCALE = 256   # identical to LeNet; two CONV layers → scale = 2^(SHIFT-WGT) = 256

def sha12(arr):
    return hashlib.sha256(arr.astype(np.int16).tobytes()).hexdigest()[:12]

def write_memh(path, data, comment=""):
    with open(path, "w") as f:
        if comment:
            f.write(f"// {comment}\n")
        for v in np.asarray(data, dtype=np.int32).flatten():
            f.write(f"{int(v) & 0xFFFF:04x}\n")

# ── Deterministic patterns ────────────────────────────────────────────────────
def gen_patterns():
    n_in = H_IN * W_IN * C_IN        # 576
    n_w0 = C0_K * C0_K * C_IN * C0_OUT   # 72
    n_w2 = C2_K * C2_K * C0_OUT * C2_OUT  # 1152

    inp = np.array([(i % 256) << 8
                    for i in range(n_in)], dtype=np.int32).astype(np.int16)
    w0  = np.array([((i *  7 + 3) & 0xFF) << 4
                    for i in range(n_w0)], dtype=np.int32).astype(np.int16)
    w2  = np.array([((i * 13 + 5) & 0xFF) << 4
                    for i in range(n_w2)], dtype=np.int32).astype(np.int16)
    return inp, w0, w2

# ── Bit-accurate HW simulation ────────────────────────────────────────────────
def hw_conv2d(x_i16, w_i16, K, C_out, relu=True):
    H, W, C_in = x_i16.shape
    H_out, W_out = H - K + 1, W - K + 1
    x64 = x_i16.astype(np.int64)
    patches = np.lib.stride_tricks.sliding_window_view(x64, (K, K, C_in))
    patches = patches.reshape(H_out, W_out, K * K * C_in)
    w64 = w_i16.reshape(K * K * C_in, C_out).astype(np.int64)
    acc = patches @ w64
    out = np.clip(acc >> Q_SHIFT, -32768, 32767).astype(np.int16)
    return np.maximum(0, out).astype(np.int16) if relu else out

def hw_maxpool(x_i16, P):
    H, W, C = x_i16.shape
    H_out, W_out = H // P, W // P
    x_ = x_i16[:H_out*P, :W_out*P, :]
    return x_.reshape(H_out, P, W_out, P, C).max(axis=(1, 3)).astype(np.int16)

def run_hw_sim(inp_i16, w0_i16, w2_i16):
    x = inp_i16.reshape(H_IN, W_IN, C_IN)
    x = hw_conv2d(x, w0_i16.reshape(C0_K, C0_K, C_IN, C0_OUT), C0_K, C0_OUT)
    x = hw_maxpool(x, P1_K)
    x = hw_conv2d(x, w2_i16.reshape(C2_K, C2_K, C0_OUT, C2_OUT), C2_K, C2_OUT)
    x = hw_maxpool(x, P3_K)
    return x.flatten().astype(np.int16)  # 256 values

# ── TensorFlow reference ──────────────────────────────────────────────────────
def run_tf(inp_i16, w0_i16, w2_i16):
    inp_f = (inp_i16.astype(np.float32) / (1 << Q_ACT)).reshape(1, H_IN, W_IN, C_IN)
    w0_f  = (w0_i16.astype(np.float32) / (1 << Q_WGT)).reshape(C0_K, C0_K, C_IN, C0_OUT)
    w2_f  = (w2_i16.astype(np.float32) / (1 << Q_WGT)).reshape(C2_K, C2_K, C0_OUT, C2_OUT)

    inputs = tf.keras.Input(shape=(H_IN, W_IN, C_IN))
    x = tf.keras.layers.Conv2D(C0_OUT, C0_K, padding="valid",
                               activation="relu", use_bias=False)(inputs)
    x = tf.keras.layers.MaxPool2D(P1_K)(x)
    x = tf.keras.layers.Conv2D(C2_OUT, C2_K, padding="valid",
                               activation="relu", use_bias=False)(x)
    x = tf.keras.layers.MaxPool2D(P3_K)(x)
    model = tf.keras.Model(inputs, x)
    model.layers[1].set_weights([w0_f])
    model.layers[3].set_weights([w2_f])
    return model.predict(inp_f, verbose=0).flatten()

# ── Main ──────────────────────────────────────────────────────────────────────
def main(out_dir="."):
    print("=" * 62)
    print(" TensorFlow golden reference — VWW-Tiny")
    print(" CONV(3×3,1→8) → POOL → CONV(3×3,8→16) → POOL")
    print("=" * 62)

    print("\n[1/4] Generating deterministic patterns …")
    inp, w0, w2 = gen_patterns()

    print("\n[2/4] Running bit-accurate HW simulation …")
    hw_out = run_hw_sim(inp, w0, w2)
    print(f"  hw_out shape : {hw_out.shape}  int16")
    print(f"  hw_out range : [{hw_out.min()}, {hw_out.max()}]")
    print(f"  nonzero      : {(hw_out != 0).sum()} / {len(hw_out)}")

    print("\n[3/4] Running TF float32 inference …")
    tf_out = run_tf(inp, w0, w2)
    tf_expected = np.round(tf_out / HW_SCALE).astype(np.int16)
    max_diff = int(np.max(np.abs(hw_out.astype(np.int32) - tf_expected.astype(np.int32))))
    print(f"  TF float range : [{tf_out.min():.2f}, {tf_out.max():.2f}]")
    print(f"  Max |hw - tf/256|: {max_diff} LSBs")

    print("\n[4/4] Writing memh files …")
    os.makedirs(out_dir, exist_ok=True)
    write_memh(os.path.join(out_dir, "golden_vww_input.memh"),    inp,
               f"VWW input 576x16b Q8.8 sha={sha12(inp)}")
    write_memh(os.path.join(out_dir, "golden_vww_wgts_l0.memh"),  w0,
               f"VWW conv0 weights 72x16b Q4.12 sha={sha12(w0)}")
    write_memh(os.path.join(out_dir, "golden_vww_wgts_l2.memh"),  w2,
               f"VWW conv2 weights 1152x16b Q4.12 sha={sha12(w2)}")
    write_memh(os.path.join(out_dir, "golden_vww_output.memh"),   hw_out,
               f"VWW expected HW output 256x16b sha={sha12(hw_out)}")

    csv_path = os.path.join(out_dir, "golden_vww_output.csv")
    with open(csv_path, "w") as f:
        f.write("index,tf_float,tf_div256,hw_sim_int16\n")
        for i, (fv, ev, hv) in enumerate(zip(tf_out, tf_expected, hw_out)):
            f.write(f"{i},{fv:.6f},{ev},{hv}\n")

    meta = {
        "workload": "VWW-Tiny",
        "network": "CONV(3x3,1->8)-POOL-CONV(3x3,8->16)-POOL",
        "in_shape": [H_IN, W_IN, C_IN], "out_size": OUT_SIZE,
        "hw_output_scale": HW_SCALE,
        "hw_nonzero": int((hw_out != 0).sum()),
        "max_lsb_diff": max_diff,
        "sha_input": sha12(inp), "sha_output": sha12(hw_out)
    }
    with open(os.path.join(out_dir, "golden_vww_meta.json"), "w") as f:
        json.dump(meta, f, indent=2)

    print(f"  sha(output): {sha12(hw_out)}")
    print("=" * 62)
    return hw_out, tf_out

if __name__ == "__main__":
    main(sys.argv[1] if len(sys.argv) > 1 else ".")
