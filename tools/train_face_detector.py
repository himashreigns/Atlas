#!/usr/bin/env python3
"""Train the fixed-topology face-in-quadrant detector and quantize it to the
exact integer weights the accelerator runs.

Topology (hardware-fixed): CONV(3x3,1->4,relu) -> MaxPool2 -> MaxPool2 ->
Flatten(36) -> Dense(20).  Output 20 = 4 cells x [x,y,w,h,objectness].

Deploy scale facts (see dnn_demo.c):
  * input activation = luma << 7   (0..32640, positive)
  * NO internal shift; conv/fc accumulate in s32; FC does a 32-bit-truncating
    MAC -> weights MUST stay small (like the demo's +/-1..8), NOT Q4.12.
  * app decode: value = raw[cell*5+p] >> 8 ; objectness kept if >> 8 >= ~77.

Quantization = post-training, small-integer, per-layer scale SEARCH, verified
against tools/golden_model.py (bit-exact HW oracle). ReLU/maxpool are
positively-homogeneous, so one global scale per layer bridges the training
input domain (luma/255) to the deploy domain (luma<<7).
"""
import os, sys, json
import numpy as np

os.environ.setdefault("TF_CPP_MIN_LOG_LEVEL", "3")
os.environ.setdefault("CUDA_VISIBLE_DEVICES", "-1")
import tensorflow as tf
tf.get_logger().setLevel("ERROR")

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import golden_model as gm   # bit-exact HW oracle

DATA = os.path.join(HERE, "face_data", "dataset.npz")

# ---- hardware index maps ----------------------------------------------------
# hw L2 feature index i = ci*9 + r*3 + c  (channel-major, from maxpool2x2)
# keras Flatten of (h=3,w=3,c=4) gives j = r*12 + c*4 + ci
HW2KERAS = np.array([r*12 + c*4 + ci
                     for ci in range(4) for r in range(3) for c in range(3)])


# ============================ model / training ===============================
def build_model():
    inp = tf.keras.Input((16, 16, 1))
    x = tf.keras.layers.Conv2D(4, 3, padding="valid", activation="relu",
                               use_bias=False, name="conv0")(inp)
    x = tf.keras.layers.MaxPool2D(2)(x)
    x = tf.keras.layers.MaxPool2D(2)(x)
    x = tf.keras.layers.Flatten()(x)
    # 20 raw outputs; we split obj/box in the loss
    out = tf.keras.layers.Dense(20, use_bias=False, name="head")(x)
    return tf.keras.Model(inp, out)


def split(y):
    y = tf.reshape(y, (-1, 4, 5))
    return y[..., :4], y[..., 4]        # box(4,4), obj(4,)


def make_loss():
    bce = tf.keras.losses.BinaryCrossentropy(from_logits=True)
    def loss(y_true, y_pred):
        # y_true packed: [box(16), obj(4)] -> reshape
        tb, to = split_true(y_true)
        pb, po = split(y_pred)
        l_obj = bce(to, po)
        mask = tf.expand_dims(to, -1)                    # box loss on face cells
        l_box = tf.reduce_sum(mask * tf.square(tf.nn.sigmoid(pb) - tb)) / (tf.reduce_sum(mask) + 1e-6)
        return l_obj + 0.5 * l_box
    return loss


def split_true(y_true):
    box = tf.reshape(y_true[:, :16], (-1, 4, 4))
    obj = y_true[:, 16:20]
    return box, obj


def pack_true(Obj, Box):
    return np.concatenate([Box.reshape(len(Box), 16), Obj], axis=1).astype(np.float32)


# ============================ fast int HW forward ============================
def hw_forward_np(X_luma_u8, w0, w3):
    """Vectorized integer forward matching golden_model semantics (int64 accum).
    X_luma_u8: (N,16,16) uint8. Returns raw (N,20) int64 and wrap-safe flag."""
    N = len(X_luma_u8)
    act = (X_luma_u8.astype(np.int64) << 7)               # luma<<7
    # conv 3x3 valid, 1->4, relu
    K = np.stack([w0[co*9:(co+1)*9].reshape(3, 3) for co in range(4)])  # (4,3,3)
    conv = np.zeros((N, 4, 14, 14), np.int64)
    for kr in range(3):
        for kc in range(3):
            patch = act[:, kr:kr+14, kc:kc+14]            # (N,14,14)
            for co in range(4):
                conv[:, co] += patch * K[co, kr, kc]
    conv = np.maximum(conv, 0)
    # maxpool 2x2 twice -> (N,4,3,3)  (7//2=3)
    def mp(a):
        n, c, h, w = a.shape
        ho, wo = h // 2, w // 2
        a = a[:, :, :ho*2, :wo*2].reshape(n, c, ho, 2, wo, 2)
        return a.max(axis=(3, 5))
    p1 = mp(conv)                                          # (N,4,7,7)
    p2 = mp(p1)                                            # (N,4,3,3)
    feat = p2.reshape(N, 4, 9)                             # channel-major -> i=ci*9+r*3+c
    feat = feat.reshape(N, 36)
    W3 = w3.reshape(20, 36)
    prod_max = 0
    raw = np.zeros((N, 20), np.int64)
    for o in range(20):
        p = feat * W3[o]                                   # (N,36)
        prod_max = max(prod_max, int(np.abs(p).max()))
        raw[:, o] = p.sum(axis=1)
    acc_max = int(np.abs(raw).max())
    return raw, prod_max, acc_max


# ============================ quantize + search ==============================
def quantize(kernel0, kernel3, s0, s3):
    w0 = np.round(kernel0[:, :, 0, :].transpose(2, 0, 1).reshape(4, 9).reshape(-1) * s0)
    # kernel0: (3,3,1,4) -> want [co*9+kr*3+kc]
    w0 = np.zeros(36)
    for co in range(4):
        for kr in range(3):
            for kc in range(3):
                w0[co*9+kr*3+kc] = round(kernel0[kr, kc, 0, co] * s0)
    w3 = np.zeros(720)
    for o in range(20):
        for hw_i in range(36):
            w3[o*36+hw_i] = round(kernel3[HW2KERAS[hw_i], o] * s3)
    return (np.clip(w0, -32768, 32767).astype(np.int64),
            np.clip(w3, -32768, 32767).astype(np.int64))


def evaluate(raw, Obj, thr):
    """Detection metrics on integer raw outputs vs labels."""
    conf = raw.reshape(len(raw), 4, 5)[:, :, 4] >> 8       # (N,4) app decode
    has_face = Obj.max(1) > 0.5
    pred_cell = conf.argmax(1)
    pred_has = conf.max(1) >= thr
    # positives: predicted-present AND correct cell
    true_cell = Obj.argmax(1)
    tp = (has_face & pred_has & (pred_cell == true_cell)).sum()
    fn = (has_face & ~(pred_has & (pred_cell == true_cell))).sum()
    fp = (~has_face & pred_has).sum()
    tn = (~has_face & ~pred_has).sum()
    prec = tp / (tp + fp + 1e-9)
    rec = tp / (tp + fn + 1e-9)
    f1 = 2*prec*rec / (prec+rec+1e-9)
    return dict(f1=f1, prec=prec, rec=rec, tp=int(tp), fp=int(fp),
                fn=int(fn), tn=int(tn))


def main():
    d = np.load(DATA)
    Xtr, Otr, Btr = d["Xtr"], d["Otr"], d["Btr"]
    Xva, Ova, Bva = d["Xva"], d["Ova"], d["Bva"]

    # train on normalized luma for stable optimization
    xt = (Xtr.astype(np.float32) / 255.0)[..., None]
    xv = (Xva.astype(np.float32) / 255.0)[..., None]
    yt = pack_true(Otr, Btr)
    yv = pack_true(Ova, Bva)

    model = build_model()
    model.compile(optimizer=tf.keras.optimizers.Adam(2e-3), loss=make_loss())
    print("[train] fitting float model ...")
    cbs = [tf.keras.callbacks.ReduceLROnPlateau(factor=0.5, patience=6, min_lr=1e-4),
           tf.keras.callbacks.EarlyStopping(patience=14, restore_best_weights=True)]
    model.fit(xt, yt, validation_data=(xv, yv), epochs=120, batch_size=128,
              verbose=2, callbacks=cbs)

    k0 = model.get_layer("conv0").get_weights()[0]         # (3,3,1,4)
    k3 = model.get_layer("head").get_weights()[0]          # (36,20)

    # ---- scale search verified with the fast int forward ----
    print("\n[quant] searching integer scales ...")
    S32_MARGIN = 2**30          # require 2x headroom vs the 32-bit FC MAC limit
    best = None
    for s0 in [1, 2, 3, 4, 6, 8, 12, 16, 24, 32]:
        for s3 in [1, 2, 3, 4, 6, 8, 12, 16, 24, 32]:
            w0, w3 = quantize(k0, k3, s0, s3)
            if np.abs(w0).max() == 0 or np.abs(w3).max() == 0:
                continue
            raw, prod_max, acc_max = hw_forward_np(Xva, w0, w3)
            if prod_max >= S32_MARGIN or acc_max >= S32_MARGIN:
                continue           # too close to the s32 wrap boundary
            best_t = None
            for thr in range(20, 400, 5):
                m = evaluate(raw, Ova, thr)
                if best_t is None or m["f1"] > best_t[1]["f1"]:
                    best_t = (thr, m)
            thr, m = best_t
            score = m["f1"]
            if best is None or score > best[0]:
                best = (score, s0, s3, thr, m, w0, w3, prod_max, acc_max)
    score, s0, s3, thr, m, w0, w3, prod_max, acc_max = best
    headroom = 2**31 / max(prod_max, acc_max, 1)
    print(f"[quant] best s0={s0} s3={s3} thr={thr}  "
          f"F1={m['f1']:.3f} prec={m['prec']:.3f} rec={m['rec']:.3f} "
          f"(tp{m['tp']} fp{m['fp']} fn{m['fn']} tn{m['tn']})")
    print(f"[quant] s32 headroom x{headroom:.1f} (prod_max={prod_max} acc_max={acc_max})")
    print(f"[quant] w0 range [{w0.min()},{w0.max()}]  w3 range [{w3.min()},{w3.max()}]")

    # ---- bit-exact confirmation via golden_model on a subset ----
    print("[verify] confirming vs golden_model.py (bit-exact) ...")
    nchk = 300
    mism = 0
    for i in range(nchk):
        act = gm.preprocess_from_luma16(Xva[i]) if hasattr(gm, "preprocess_from_luma16") else None
        # build 16x16 s16 luma<<7 directly (bypass 320x240 preprocess)
        a16 = [[int(Xva[i][yy][xx]) << 7 for xx in range(16)] for yy in range(16)]
        l0 = gm.conv3x3_relu(a16, list(w0))
        l1 = gm.maxpool2x2(l0, 14, 14, 4)
        l2 = gm.maxpool2x2(l1, 7, 7, 4)
        l3 = gm.fc(l2, list(w3))
        raw_g = np.array(l3, np.int64)
        raw_np, _, _ = hw_forward_np(Xva[i:i+1], w0, w3)
        if not np.array_equal(raw_g, raw_np[0]):
            mism += 1
    print(f"[verify] golden vs numpy mismatches: {mism}/{nchk}")

    # ---- emit weights header + metadata ----
    emit_header(w0, w3, s0, s3, thr, m)
    meta = dict(s0=s0, s3=s3, threshold=thr, metrics={k: (float(v) if isinstance(v, float) else v) for k, v in m.items()},
                w0_range=[int(w0.min()), int(w0.max())], w3_range=[int(w3.min()), int(w3.max())],
                golden_mismatches=mism)
    json.dump(meta, open(os.path.join(HERE, "face_data", "train_meta.json"), "w"), indent=2)
    print("[done] wrote software/linux/dnn_weights_face.h and train_meta.json")


def emit_header(w0, w3, s0, s3, thr, m):
    path = os.path.join(os.path.dirname(HERE), "software", "linux", "dnn_weights_face.h")
    with open(path, "w") as f:
        f.write("/* dnn_weights_face.h — TRAINED face-in-quadrant detector.\n")
        f.write(f" * Topology CONV(3x3,1->4)-POOL-POOL-FC(36->20). scales s0={s0} s3={s3}.\n")
        f.write(f" * Suggested OBJ_THRESHOLD (raw>>8) = {thr}.\n")
        f.write(f" * Bootstrap (Olivetti public faces). Val F1={m['f1']:.3f} "
                f"prec={m['prec']:.3f} rec={m['rec']:.3f}.\n")
        f.write(" * Generated by tools/train_face_detector.py — do not edit by hand. */\n")
        f.write("#ifndef DNN_WEIGHTS_FACE_H\n#define DNN_WEIGHTS_FACE_H\n#include <stdint.h>\n\n")
        f.write(f"#define FACE_OBJ_THRESHOLD_Q88 {thr}\n\n")
        f.write("static const int16_t face_wgt_l0[36] = {\n")
        f.write("  " + ", ".join(str(int(v)) for v in w0) + "\n};\n\n")
        f.write("static const int16_t face_wgt_l3[720] = {\n")
        for o in range(20):
            row = w3[o*36:(o+1)*36]
            f.write("  " + ", ".join(str(int(v)) for v in row) + ",\n")
        f.write("};\n\n#endif\n")


if __name__ == "__main__":
    main()
