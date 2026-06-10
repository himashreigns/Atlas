#!/usr/bin/env python3
"""
tf_golden_kws.py — KWS-CNN golden reference
============================================
Network : CONV(3×3,1→8) → POOL(2×2) → POOL(2×2) → FC(80→10)
Input   : 25×10 MFCC feature map  (25 time frames × 10 mel coefficients)
Output  : 10 keyword logits

Hardware Q-format / scale chain
---------------------------------
  Input  : Q8.8  (int16, ×2^-8  → float)
  Weights: Q4.12 (int16, ×2^-12 → float)
  After CONV  layer: acc >>20 → hw_int ≈ TF_float          (scale = 1)
  After POOL  layers: no shift, same scale
  After FC    layer: acc >>20 → hw_int ≈ TF_float / 2^8    (scale = 256)

  expected_hw_int = round(TF_final_float / 256)

Writes
------
  golden_kws_input.memh       250×16b  Q8.8  input MFCC frame
  golden_kws_wgts_l0.memh      72×16b  Q4.12 conv1 weights
  golden_kws_wgts_l3.memh     800×16b  Q4.12 FC weights
  golden_kws_output.memh      256×16b  expected HW int16 (padded to 256)
  golden_kws_output.csv       index, tf_float, expected_hw_int
"""

import json, os, sys, hashlib
import numpy as np

os.environ.setdefault("TF_CPP_MIN_LOG_LEVEL", "3")
os.environ.setdefault("TF_ENABLE_ONEDNN_OPTS", "0")
import tensorflow as tf
tf.get_logger().setLevel("ERROR")

# ── Network geometry ──────────────────────────────────────────────────────────
H_IN, W_IN, C_IN = 25, 10, 1      # MFCC input
C0_K, C0_OUT     = 3, 8           # L0 CONV
P1_K             = 2               # L1 POOL
P2_K             = 2               # L2 POOL
# After L0 CONV valid: (25-3+1)×(10-3+1)×8 = 23×8×8
# After L1 POOL: 11×4×8
# After L2 POOL: 5×2×8 = 80
FC_IN, FC_OUT    = 80, 10          # L3 FC

# ── Fixed-point format ────────────────────────────────────────────────────────
Q_ACT        = 8    # Q8.8 activations
Q_WGT        = 12   # Q4.12 weights
Q_SHIFT      = 20   # accumulator right-shift
HW_SCALE     = 256  # TF_float / HW_SCALE = expected_hw_int  (= 2^(Q_SHIFT-Q_WGT))

def sha12(arr):
    return hashlib.sha256(arr.astype(np.int16).tobytes()).hexdigest()[:12]

def write_memh(path, data, comment=""):
    with open(path, "w") as f:
        if comment:
            f.write(f"// {comment}\n")
        for v in np.asarray(data, dtype=np.int32).flatten():
            f.write(f"{int(v) & 0xFFFF:04x}\n")

# ── Deterministic pattern generation ─────────────────────────────────────────
def gen_patterns():
    n_in  = H_IN * W_IN * C_IN
    n_w0  = C0_K * C0_K * C_IN * C0_OUT
    n_w3  = FC_IN * FC_OUT

    inp = np.array([(i % 256) << 8
                    for i in range(n_in)], dtype=np.int32).astype(np.int16)
    w0  = np.array([((i *  7 + 3) & 0xFF) << 4
                    for i in range(n_w0)], dtype=np.int32).astype(np.int16)
    w3  = np.array([((i * 11 + 7) & 0xFF) << 4
                    for i in range(n_w3)], dtype=np.int32).astype(np.int16)
    return inp, w0, w3

# ── Bit-accurate hardware simulation (numpy) ──────────────────────────────────
def hw_conv2d(x_int16, w_int16, K, C_out):
    """Valid-padded 2-D convolution with >>Q_SHIFT truncation."""
    H, W, C_in = x_int16.shape
    H_out, W_out = H - K + 1, W - K + 1
    x64 = x_int16.astype(np.int64)
    w64 = w_int16.reshape(K * K * C_in, C_out).astype(np.int64)
    # sliding window view
    patches = np.lib.stride_tricks.sliding_window_view(x64, (K, K, C_in))
    # patches: (H_out, W_out, 1, K, K, C_in) → flatten inner dims
    patches = patches.reshape(H_out, W_out, K * K * C_in)
    acc = patches @ w64  # (H_out, W_out, C_out) int64
    out = np.clip(acc >> Q_SHIFT, -32768, 32767).astype(np.int16)
    return np.maximum(0, out).astype(np.int16)  # ReLU

def hw_maxpool(x_int16, P):
    H, W, C = x_int16.shape
    H_out, W_out = H // P, W // P
    x_ = x_int16[:H_out*P, :W_out*P, :]
    return x_.reshape(H_out, P, W_out, P, C).max(axis=(1, 3)).astype(np.int16)

def hw_fc(x_int16_flat, w_int16):
    """Flat FC: w_int16 shape (N_in, N_out)."""
    acc = x_int16_flat.astype(np.int64) @ w_int16.astype(np.int64)
    return np.clip(acc >> Q_SHIFT, -32768, 32767).astype(np.int16)

def run_hw_sim(inp_i16, w0_i16, w3_i16):
    x = inp_i16.reshape(H_IN, W_IN, C_IN)
    x = hw_conv2d(x, w0_i16.reshape(C0_K, C0_K, C_IN, C0_OUT), C0_K, C0_OUT)
    x = hw_maxpool(x, P1_K)
    x = hw_maxpool(x, P2_K)
    x = hw_fc(x.flatten(), w3_i16.reshape(FC_IN, FC_OUT))
    return x  # (FC_OUT,) int16

# ── TensorFlow float32 reference ──────────────────────────────────────────────
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
    print(" TensorFlow golden reference — KWS-CNN")
    print(" CONV(3×3,1→8) → POOL → POOL → FC(80→10)")
    print("=" * 62)

    print("\n[1/4] Generating deterministic patterns …")
    inp, w0, w3 = gen_patterns()
    print(f"  input  {inp.shape}  int16 [{inp.min()}, {inp.max()}]")
    print(f"  conv0w {w0.shape}  int16 [{w0.min()}, {w0.max()}]")
    print(f"  fc3w   {w3.shape}  int16 [{w3.min()}, {w3.max()}]")

    print("\n[2/4] Running bit-accurate HW simulation …")
    hw_out = run_hw_sim(inp, w0, w3)
    print(f"  hw_out shape : {hw_out.shape}  int16")
    print(f"  hw_out values: {hw_out}")
    print(f"  nonzero      : {(hw_out != 0).sum()} / {len(hw_out)}")

    print("\n[3/4] Running TF float32 inference …")
    tf_out = run_tf(inp, w0, w3)
    tf_expected = np.round(tf_out / HW_SCALE).astype(np.int16)
    print(f"  TF float range : [{tf_out.min():.2f}, {tf_out.max():.2f}]")
    print(f"  TF/256 (expect): {tf_expected}")
    max_diff = int(np.max(np.abs(hw_out.astype(np.int32) - tf_expected.astype(np.int32))))
    print(f"  Max |hw - tf/256|: {max_diff} LSBs")

    print("\n[4/4] Writing memh files …")
    os.makedirs(out_dir, exist_ok=True)

    padded = np.zeros(256, dtype=np.int16)
    padded[:FC_OUT] = hw_out

    write_memh(os.path.join(out_dir, "golden_kws_input.memh"),    inp,
               f"KWS input 250x16b Q8.8 sha={sha12(inp)}")
    write_memh(os.path.join(out_dir, "golden_kws_wgts_l0.memh"),  w0,
               f"KWS conv0 weights 72x16b Q4.12 sha={sha12(w0)}")
    write_memh(os.path.join(out_dir, "golden_kws_wgts_l3.memh"),  w3,
               f"KWS FC3 weights 800x16b Q4.12 sha={sha12(w3)}")
    write_memh(os.path.join(out_dir, "golden_kws_output.memh"),   padded,
               f"KWS expected HW output 256x16b sha={sha12(padded)}")

    csv_path = os.path.join(out_dir, "golden_kws_output.csv")
    with open(csv_path, "w") as f:
        f.write("index,tf_float,tf_div256,hw_sim_int16\n")
        for i in range(FC_OUT):
            f.write(f"{i},{tf_out[i]:.6f},{tf_expected[i]},{hw_out[i]}\n")

    meta = {
        "workload": "KWS-CNN", "network": "CONV(3x3,1->8)-POOL-POOL-FC(80->10)",
        "in_shape": [H_IN, W_IN, C_IN], "out_size": FC_OUT,
        "hw_output_scale": HW_SCALE,
        "hw_nonzero": int((hw_out != 0).sum()),
        "max_lsb_diff": max_diff,
        "sha_input": sha12(inp), "sha_output": sha12(padded)
    }
    with open(os.path.join(out_dir, "golden_kws_meta.json"), "w") as f:
        json.dump(meta, f, indent=2)

    print(f"  sha(output): {sha12(padded)}")
    print("=" * 62)
    return padded, tf_out

if __name__ == "__main__":
    main(sys.argv[1] if len(sys.argv) > 1 else ".")
