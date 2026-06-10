#!/usr/bin/env python3
"""
tf_golden_yolo_nano.py — YOLO-Nano golden reference
====================================================
Network : CONV(3×3,1→4) → POOL(2×2) → POOL(2×2) → FC(36→20)
Input   : 16×16 grayscale image
Output  : 20 values  =  4 grid-cells × (x, y, w, h, objectness)

Hardware Q-format / scale chain
---------------------------------
  After L0 CONV >>20 : hw_int ≈ TF_float        (scale = 1)
  After L1, L2 POOL  : same scale
  After L3 FC   >>20 : hw_int ≈ TF_float / 256  (scale = 256)

  expected_hw_int = round(TF_final_float / 256)

Output layout (20 values in row-major order):
  cell[r][c] for r,c ∈ {0,1}  (2×2 grid)
  Each cell: [x_offset, y_offset, width, height, objectness]
  Post-processing (sigmoid / exp) is done off-chip on the ARM core.

Writes
------
  golden_yolo_input.memh       256×16b  Q8.8  input image
  golden_yolo_wgts_l0.memh      36×16b  Q4.12 conv0 weights
  golden_yolo_wgts_l3.memh     720×16b  Q4.12 FC weights
  golden_yolo_output.memh      256×16b  expected HW int16 (padded to 256)
  golden_yolo_output.csv       index, tf_float, expected_hw_int
"""

import json, os, sys, hashlib
import numpy as np

os.environ.setdefault("TF_CPP_MIN_LOG_LEVEL", "3")
os.environ.setdefault("TF_ENABLE_ONEDNN_OPTS", "0")
import tensorflow as tf
tf.get_logger().setLevel("ERROR")

# ── Network geometry ──────────────────────────────────────────────────────────
H_IN, W_IN, C_IN = 16, 16, 1
C0_K, C0_OUT     = 3, 4    # L0 CONV  16×16×1 → 14×14×4
P1_K             = 2        # L1 POOL  14×14×4 → 7×7×4
P2_K             = 2        # L2 POOL  7×7×4   → 3×3×4 = 36  (floor(7/2)=3)
FC_IN, FC_OUT    = 36, 20   # L3 FC    36 → 20

GRID_H, GRID_W, PARAMS_PER_CELL = 2, 2, 5   # 4 cells × 5 params

# ── Fixed-point format ────────────────────────────────────────────────────────
Q_ACT    = 8
Q_WGT    = 12
Q_SHIFT  = 20
HW_SCALE = 256

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
    inp = np.array([(i % 256) << 8
                    for i in range(H_IN * W_IN * C_IN)],
                   dtype=np.int32).astype(np.int16)
    w0  = np.array([((i *  7 + 3) & 0xFF) << 4
                    for i in range(C0_K * C0_K * C_IN * C0_OUT)],
                   dtype=np.int32).astype(np.int16)
    w3  = np.array([((i * 11 + 7) & 0xFF) << 4
                    for i in range(FC_IN * FC_OUT)],
                   dtype=np.int32).astype(np.int16)
    return inp, w0, w3

# ── Bit-accurate HW simulation ────────────────────────────────────────────────
def hw_conv2d(x_i16, w_i16, K, C_out):
    H, W, C_in = x_i16.shape
    H_out, W_out = H - K + 1, W - K + 1
    patches = np.lib.stride_tricks.sliding_window_view(
        x_i16.astype(np.int64), (K, K, C_in))
    patches = patches.reshape(H_out, W_out, K * K * C_in)
    acc = patches @ w_i16.reshape(K * K * C_in, C_out).astype(np.int64)
    out = np.clip(acc >> Q_SHIFT, -32768, 32767).astype(np.int16)
    return np.maximum(0, out).astype(np.int16)

def hw_maxpool(x_i16, P):
    H, W, C = x_i16.shape
    Ho, Wo = H // P, W // P
    return x_i16[:Ho*P, :Wo*P, :].reshape(Ho, P, Wo, P, C).max(axis=(1, 3)).astype(np.int16)

def hw_fc(x_flat_i16, w_i16):
    acc = x_flat_i16.astype(np.int64) @ w_i16.astype(np.int64)
    return np.clip(acc >> Q_SHIFT, -32768, 32767).astype(np.int16)

def run_hw_sim(inp_i16, w0_i16, w3_i16):
    x = inp_i16.reshape(H_IN, W_IN, C_IN)
    x = hw_conv2d(x, w0_i16.reshape(C0_K, C0_K, C_IN, C0_OUT), C0_K, C0_OUT)
    x = hw_maxpool(x, P1_K)
    x = hw_maxpool(x, P2_K)
    x = hw_fc(x.flatten(), w3_i16.reshape(FC_IN, FC_OUT))
    return x  # (20,) int16

# ── TensorFlow reference ──────────────────────────────────────────────────────
def run_tf(inp_i16, w0_i16, w3_i16):
    inp_f = (inp_i16.astype(np.float32) / (1 << Q_ACT)).reshape(1, H_IN, W_IN, C_IN)
    w0_f  = (w0_i16.astype(np.float32) / (1 << Q_WGT)).reshape(C0_K, C0_K, C_IN, C0_OUT)
    w3_f  = (w3_i16.astype(np.float32) / (1 << Q_WGT)).reshape(FC_IN, FC_OUT)

    inputs = tf.keras.Input(shape=(H_IN, W_IN, C_IN))
    x = tf.keras.layers.Conv2D(C0_OUT, C0_K, padding="valid",
                               activation="relu", use_bias=False)(inputs)
    x = tf.keras.layers.MaxPool2D(P1_K)(x)
    x = tf.keras.layers.MaxPool2D(P2_K)(x)
    x = tf.keras.layers.Flatten()(x)
    x = tf.keras.layers.Dense(FC_OUT, use_bias=False)(x)
    model = tf.keras.Model(inputs, x)
    model.layers[1].set_weights([w0_f])
    model.layers[5].set_weights([w3_f])  # layers: Input,Conv,Pool,Pool,Flatten,Dense
    return model.predict(inp_f, verbose=0).flatten()

# ── Main ──────────────────────────────────────────────────────────────────────
def main(out_dir="."):
    print("=" * 62)
    print(" TensorFlow golden reference — YOLO-Nano")
    print(" CONV(3×3,1→4) → POOL → POOL → FC(36→20)")
    print(" 2×2 grid, 5 params/cell: [x, y, w, h, conf]")
    print("=" * 62)

    print("\n[1/4] Generating deterministic patterns …")
    inp, w0, w3 = gen_patterns()

    print("\n[2/4] Running bit-accurate HW simulation …")
    hw_out = run_hw_sim(inp, w0, w3)
    print(f"  hw_out (20 detection params): {hw_out}")
    print(f"  nonzero : {(hw_out != 0).sum()} / 20")

    print("\n[3/4] Running TF float32 inference …")
    tf_out = run_tf(inp, w0, w3)
    tf_expected = np.round(tf_out / HW_SCALE).astype(np.int16)
    max_diff = int(np.max(np.abs(hw_out.astype(np.int32) - tf_expected.astype(np.int32))))
    print(f"  TF float   : {tf_out}")
    print(f"  TF/256     : {tf_expected}")
    print(f"  Max |hw - tf/256|: {max_diff} LSBs")

    print("\n[4/4] Writing memh files …")
    os.makedirs(out_dir, exist_ok=True)

    padded = np.zeros(256, dtype=np.int16)
    padded[:FC_OUT] = hw_out

    write_memh(os.path.join(out_dir, "golden_yolo_input.memh"),    inp,
               f"YOLO input 256x16b Q8.8 sha={sha12(inp)}")
    write_memh(os.path.join(out_dir, "golden_yolo_wgts_l0.memh"),  w0,
               f"YOLO conv0 weights 36x16b Q4.12 sha={sha12(w0)}")
    write_memh(os.path.join(out_dir, "golden_yolo_wgts_l3.memh"),  w3,
               f"YOLO FC3 weights 720x16b Q4.12 sha={sha12(w3)}")
    write_memh(os.path.join(out_dir, "golden_yolo_output.memh"),   padded,
               f"YOLO expected HW output 256x16b sha={sha12(padded)}")

    csv_path = os.path.join(out_dir, "golden_yolo_output.csv")
    with open(csv_path, "w") as f:
        f.write("index,param,tf_float,tf_div256,hw_sim_int16\n")
        params = ["x", "y", "w", "h", "conf"]
        for i in range(FC_OUT):
            cell = i // PARAMS_PER_CELL
            param = params[i % PARAMS_PER_CELL]
            f.write(f"{i},cell{cell}_{param},{tf_out[i]:.6f},{tf_expected[i]},{hw_out[i]}\n")

    meta = {
        "workload": "YOLO-Nano",
        "network": "CONV(3x3,1->4)-POOL-POOL-FC(36->20)",
        "grid": f"{GRID_H}x{GRID_W}", "params_per_cell": PARAMS_PER_CELL,
        "in_shape": [H_IN, W_IN, C_IN], "out_size": FC_OUT,
        "hw_output_scale": HW_SCALE, "hw_nonzero": int((hw_out != 0).sum()),
        "max_lsb_diff": max_diff,
        "sha_input": sha12(inp), "sha_output": sha12(padded)
    }
    with open(os.path.join(out_dir, "golden_yolo_meta.json"), "w") as f:
        json.dump(meta, f, indent=2)

    print(f"  sha(output): {sha12(padded)}")
    print("=" * 62)
    return padded, tf_out

if __name__ == "__main__":
    main(sys.argv[1] if len(sys.argv) > 1 else ".")
