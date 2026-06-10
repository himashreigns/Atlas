#!/usr/bin/env python3
"""
tf_golden.py
============
Runs a REAL TensorFlow float32 inference on the LeNet-5 accelerator model.
Writes:
  golden_output_tf.memh   -- expected HW int16 values (for $readmemh)
  golden_output_tf.csv    -- raw TF float values, one per line (for compare_tf_vs_hw.py)
  golden_input.memh       -- input image (matches TB memory init)
  golden_weights_l0.memh  -- conv1 weights
  golden_weights_l2.memh  -- conv2 weights
  golden_meta.json        -- shapes, scale info, hashes

Hardware Q-format / scale derivation
-------------------------------------
  Input activations : Q8.8  (int16, scale 1/256)
  Weights           : Q4.12 (int16, scale 1/4096)
  Accumulator shift : >> 20 per layer

  Layer 1:
    TF  = sum(inp/256 * w/4096) = raw_sum / 2^20
    HW  = raw_sum >> 20         = raw_sum / 2^20
    => TF_float == HW_int (scale factor = 1)

  Layer 2 (inputs are now plain integers from layer 1, NOT Q8.8):
    TF  = sum(hw_l1_int * w/4096) = raw_sum2 / 4096
    HW  = raw_sum2 >> 20          = raw_sum2 / 2^20
    => TF / HW = 2^20 / 2^12 = 2^8 = 256

  Therefore:  expected_hw_int = round(TF_float / 256)
  Tolerance:  1 LSB  (float rounding vs integer truncation in the shift)
"""

import json, os, sys, hashlib
import numpy as np

os.environ.setdefault("TF_CPP_MIN_LOG_LEVEL", "3")
os.environ.setdefault("TF_ENABLE_ONEDNN_OPTS", "0")
import tensorflow as tf
tf.get_logger().setLevel("ERROR")

# Network shape
H_IN, W_IN, C_IN = 28, 28, 1
C1_K, C1_OUT     = 5, 6
P1_K             = 2
C2_K, C2_OUT     = 5, 16
P2_K             = 2

# Q-format
Q_ACT       = 8   # activations Q8.8
Q_WGT       = 12  # weights Q4.12
Q_ACC_SHIFT = 20  # accumulator shift
HW_OUTPUT_SCALE = 2 ** (Q_ACC_SHIFT - Q_WGT)  # = 256

def sha12(arr):
    return hashlib.sha256(arr.astype(np.int16).tobytes()).hexdigest()[:12]

def write_memh(path, data, comment=""):
    with open(path, "w") as f:
        if comment:
            f.write(f"// {comment}\n")
        for v in np.asarray(data).flatten():
            f.write(f"{int(v) & 0xFFFF:04x}\n")

def gen_patterns():
    """Generate the EXACT bit patterns the TB writes into hardware memory."""
    inp = np.array([(i % 256) << 8
                    for i in range(H_IN * W_IN * C_IN)],
                   dtype=np.int32).astype(np.int16)
    w0  = np.array([((i * 7  + 3) & 0xFF) << 4
                    for i in range(C1_K * C1_K * C_IN * C1_OUT)],
                   dtype=np.int32).astype(np.int16)
    w2  = np.array([((i * 13 + 5) & 0xFF) << 4
                    for i in range(C2_K * C2_K * C1_OUT * C2_OUT)],
                   dtype=np.int32).astype(np.int16)
    return inp, w0, w2

def run_tf_inference(inp_bits, w0_bits, w2_bits):
    """Build the Keras model with the hardware weights and run REAL TF inference."""
    # Convert bit patterns to float (dequantize)
    inp_f = (inp_bits.astype(np.float32) / (1 << Q_ACT)).reshape(1, H_IN, W_IN, C_IN)
    w0_f  = (w0_bits.astype(np.float32) / (1 << Q_WGT)).reshape(C1_K, C1_K, C_IN, C1_OUT)
    w2_f  = (w2_bits.astype(np.float32) / (1 << Q_WGT)).reshape(C2_K, C2_K, C1_OUT, C2_OUT)

    # Build LeNet body
    inputs = tf.keras.Input(shape=(H_IN, W_IN, C_IN))
    x = tf.keras.layers.Conv2D(C1_OUT, C1_K, padding="valid",
                               activation="relu", use_bias=False)(inputs)
    x = tf.keras.layers.MaxPool2D(P1_K)(x)
    x = tf.keras.layers.Conv2D(C2_OUT, C2_K, padding="valid",
                               activation="relu", use_bias=False)(x)
    x = tf.keras.layers.MaxPool2D(P2_K)(x)
    model = tf.keras.Model(inputs, x)

    # Install the exact hardware weights
    model.layers[1].set_weights([w0_f])
    model.layers[3].set_weights([w2_f])

    # Run the actual TF inference — this is the ground truth
    tf_out_float = model.predict(inp_f, verbose=0).flatten()  # shape (256,)
    return tf_out_float

def main(out_dir="."):
    print("=" * 62)
    print(" TensorFlow golden reference — LeNet-5 DNN accelerator")
    print("=" * 62)

    print("\n[1/3] Generating hardware-exact input/weight bit patterns...")
    inp, w0, w2 = gen_patterns()
    print(f"  input  {inp.shape}  int16 range [{inp.min()}, {inp.max()}]")
    print(f"  conv1w {w0.shape}   int16 range [{w0.min()}, {w0.max()}]")
    print(f"  conv2w {w2.shape} int16 range [{w2.min()}, {w2.max()}]")

    print("\n[2/3] Running TensorFlow float32 inference...")
    tf_out = run_tf_inference(inp, w0, w2)
    print(f"  TF output shape   : {tf_out.shape}")
    print(f"  TF float range    : [{tf_out.min():.4f}, {tf_out.max():.4f}]")
    print(f"  TF nonzero        : {(tf_out > 0).sum()} / {len(tf_out)}")

    print(f"\n[3/3] Converting TF floats → expected hardware int16...")
    print(f"  HW_OUTPUT_SCALE = 2^(Q_ACC_SHIFT - Q_WGT) = 2^{Q_ACC_SHIFT-Q_WGT} = {HW_OUTPUT_SCALE}")
    print(f"  expected_hw_int = round(TF_float / {HW_OUTPUT_SCALE})")
    golden_int = np.round(tf_out / HW_OUTPUT_SCALE)
    golden_int = np.clip(golden_int, -32768, 32767).astype(np.int16)
    padded = np.zeros(256, dtype=np.int16)
    padded[:len(golden_int)] = golden_int
    print(f"  golden int16 range : [{padded.min()}, {padded.max()}]")

    # Write memh for $readmemh in testbenches
    os.makedirs(out_dir, exist_ok=True)
    write_memh(os.path.join(out_dir, "golden_input.memh"),       inp,
               f"input 784x16b Q8.8 sha={sha12(inp)}")
    write_memh(os.path.join(out_dir, "golden_weights_l0.memh"),  w0,
               f"conv1 weights 150x16b Q4.12 sha={sha12(w0)}")
    write_memh(os.path.join(out_dir, "golden_weights_l2.memh"),  w2,
               f"conv2 weights 2400x16b Q4.12 sha={sha12(w2)}")
    write_memh(os.path.join(out_dir, "golden_output_tf.memh"),   padded,
               f"TF-derived expected HW output 256x16b sha={sha12(padded)}")

    # Write the raw TF float values to CSV — used by compare_tf_vs_hw.py
    csv_path = os.path.join(out_dir, "golden_output_tf.csv")
    with open(csv_path, "w") as f:
        f.write("index,tf_float,expected_hw_int\n")
        for i, (fv, iv) in enumerate(zip(tf_out, padded)):
            f.write(f"{i},{fv:.6f},{iv}\n")
    print(f"\n  Written {csv_path}")
    print(f"  Written golden_output_tf.memh")
    print(f"  sha(golden): {sha12(padded)}")
    print("=" * 62)
    return padded, tf_out

if __name__ == "__main__":
    main(sys.argv[1] if len(sys.argv) > 1 else ".")
