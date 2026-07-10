#!/usr/bin/env python3
"""Train the hand-in-quadrant detector on REAL captured camera frames and
quantize to the exact integer weights the accelerator runs.

Data: tools/face_data/hand_capture.bin (1 label byte + 256 luma bytes/record;
label 0..3 = quadrant with the hand, 4 = empty). Reuses the face trainer's
verified quantization + bit-exact golden_model check. Emits dnn_weights_face.h
(the --face flag loads it), so deploying is just a rebuild.
"""
import os, sys, json
import numpy as np
os.environ.setdefault("TF_CPP_MIN_LOG_LEVEL", "3")
os.environ.setdefault("CUDA_VISIBLE_DEVICES", "-1")
import tensorflow as tf
tf.get_logger().setLevel("ERROR")

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import golden_model as gm
import train_face_detector as F   # reuse build_model, quantize, hw_forward_np, evaluate, emit_header

CAP = os.path.join(HERE, "face_data", "hand_capture.bin")
rng = np.random.default_rng(7)


def load():
    d = np.fromfile(CAP, dtype=np.uint8).reshape(-1, 257)
    labels = d[:, 0].astype(np.int64)
    imgs = d[:, 1:].reshape(-1, 16, 16).astype(np.float32)
    tr, va = [], []
    for lab in range(5):
        idx = np.where(labels == lab)[0]
        tr += list(idx[:120]); va += list(idx[120:])
    return imgs[tr], labels[tr], imgs[va], labels[va]


def augment(X, Y, mult=10):
    oX, oY = [], []
    for _ in range(mult):
        for x, y in zip(X, Y):
            a = x.copy()
            a = (a - a.mean()) * rng.uniform(0.75, 1.3) + a.mean() + rng.uniform(-20, 20)
            a += rng.normal(0, 4, a.shape)
            a = np.roll(a, (rng.integers(-1, 2), rng.integers(-1, 2)), axis=(0, 1))
            oX.append(np.clip(a, 0, 255)); oY.append(y)
    return np.array(oX, np.float32), np.array(oY, np.int64)


def targets(Y):
    """20 outputs = 4 cells x [x,y,w,h,obj]. Active cell: box centered & cell-
    filling, obj=1. Empty / other cells: obj=0, box=0."""
    obj = np.zeros((len(Y), 4), np.float32)
    box = np.zeros((len(Y), 4, 4), np.float32)
    for i, y in enumerate(Y):
        if y < 4:
            obj[i, y] = 1.0
            box[i, y] = (0.5, 0.5, 0.5, 0.5)   # centered in cell, ~half-frame -> fills cell
    return obj, box


def main():
    Xtr, Ytr, Xva, Yva = load()
    Xa, Ya = augment(Xtr, Ytr, 10)
    print(f"[data] train {len(Xtr)}->aug {len(Xa)}  val {len(Xva)}")
    xt = (Xa/255.0)[..., None]; xv = (Xva/255.0)[..., None]
    ot, bt = targets(Ya); ov, bv = targets(Yva)
    yt = F.pack_true(ot, bt); yv = F.pack_true(ov, bv)

    model = F.build_model()
    model.compile(optimizer=tf.keras.optimizers.Adam(2e-3), loss=F.make_loss())
    cbs = [tf.keras.callbacks.ReduceLROnPlateau(factor=0.5, patience=6, min_lr=1e-4),
           tf.keras.callbacks.EarlyStopping(patience=14, restore_best_weights=True)]
    model.fit(xt, yt, validation_data=(xv, yv), epochs=90, batch_size=128, verbose=2, callbacks=cbs)

    k0 = model.get_layer("conv0").get_weights()[0]
    k3 = model.get_layer("head").get_weights()[0]

    # integer scale search on the REAL val frames, verified wrap-safe
    print("\n[quant] searching integer scales (val = real captured frames) ...")
    Ova = np.zeros((len(Yva), 4), np.float32)
    for i, y in enumerate(Yva):
        if y < 4: Ova[i, y] = 1.0
    S32 = 2**30
    best = None
    for s0 in [1,2,3,4,6,8,12,16,24,32]:
        for s3 in [1,2,3,4,6,8,12,16,24,32]:
            w0, w3 = F.quantize(k0, k3, s0, s3)
            if np.abs(w0).max()==0 or np.abs(w3).max()==0: continue
            raw, pm, am = F.hw_forward_np(Xva.astype(np.uint8), w0, w3)
            if pm>=S32 or am>=S32: continue
            bt2=None
            for thr in range(10,400,5):
                m=F.evaluate(raw, Ova, thr)
                if bt2 is None or m["f1"]>bt2[1]["f1"]: bt2=(thr,m)
            thr,m=bt2
            if best is None or m["f1"]>best[0]:
                best=(m["f1"],s0,s3,thr,m,w0,w3,pm,am)
    f1,s0,s3,thr,m,w0,w3,pm,am=best
    print(f"[quant] s0={s0} s3={s3} thr={thr} F1={m['f1']:.3f} prec={m['prec']:.3f} rec={m['rec']:.3f} "
          f"(tp{m['tp']} fp{m['fp']} fn{m['fn']} tn{m['tn']})")
    print(f"[quant] s32 headroom x{2**31/max(pm,am,1):.1f}  w0[{w0.min()},{w0.max()}] w3[{w3.min()},{w3.max()}]")

    # bit-exact confirmation vs golden_model
    mism=0
    for i in range(len(Xva)):
        a16=[[int(Xva[i][yy][xx])<<7 for xx in range(16)] for yy in range(16)]
        l3=gm.fc(gm.maxpool2x2(gm.maxpool2x2(gm.conv3x3_relu(a16,list(w0)),14,14,4),7,7,4),list(w3))
        rn,_,_=F.hw_forward_np(Xva[i:i+1].astype(np.uint8),w0,w3)
        mism += int(not np.array_equal(np.array(l3,np.int64), rn[0]))
    print(f"[verify] golden vs numpy mismatches: {mism}/{len(Xva)}")

    F.emit_header(w0,w3,s0,s3,thr,m)
    # relabel header comment as hand
    p=os.path.join(os.path.dirname(HERE),"software","linux","dnn_weights_face.h")
    s=open(p).read().replace("face-in-quadrant detector","HAND-in-quadrant detector (trained on live camera)")
    open(p,"w").write(s)
    json.dump(dict(s0=s0,s3=s3,threshold=thr,f1=float(m['f1']),golden_mismatches=mism,
                   w0=[int(w0.min()),int(w0.max())],w3=[int(w3.min()),int(w3.max())]),
              open(os.path.join(HERE,"face_data","hand_meta.json"),"w"),indent=2)
    print("[done] wrote dnn_weights_face.h (HAND)")


if __name__ == "__main__":
    main()
