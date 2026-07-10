#!/usr/bin/env python3
"""Train the 3x3 (9-cell) hand-position detector and quantize into the EXISTING
36->20 FC (no bitstream change): cell objectness c=0..8 -> FC outputs 0..8,
outputs 9..19 zeroed. Bit-exact verified vs golden_model.py. Emits
dnn_weights_face.h; the app reads raw[0..8] as the 3x3 objectness grid.
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
import train_face_detector as F   # quantize(), hw_forward_np(), emit_header()

CAP = os.path.join(HERE, "face_data", "hand3x3.bin")
rng = np.random.default_rng(7)


def load():
    d = np.fromfile(CAP, dtype=np.uint8).reshape(-1, 257)
    labels = d[:, 0].astype(int); imgs = d[:, 1:].reshape(-1, 16, 16).astype(np.float32)
    tr, va = [], []
    for lab in range(10):
        idx = np.where(labels == lab)[0]; tr += list(idx[:80]); va += list(idx[80:])
    return imgs[tr], labels[tr], imgs[va], labels[va]


def aug(X, Y, m=12):
    oX, oY = [], []
    for _ in range(m):
        for x, y in zip(X, Y):
            a = (x - x.mean()) * rng.uniform(0.75, 1.3) + x.mean() + rng.uniform(-20, 20)
            a += rng.normal(0, 4, a.shape); a = np.roll(a, (rng.integers(-1, 2), rng.integers(-1, 2)), (0, 1))
            oX.append(np.clip(a, 0, 255)); oY.append(y)
    return np.array(oX, np.float32), np.array(oY, int)


def obj(Y):
    o = np.zeros((len(Y), 9), np.float32)
    for i, y in enumerate(Y):
        if y < 9: o[i, y] = 1.0
    return o


def evaluate9(raw, Yva, thr):
    conf = raw[:, :9] >> 8
    pred = conf.argmax(1); has = conf.max(1) >= thr
    tp = fp = fn = tn = 0
    for i, y in enumerate(Yva):
        if y == 9:
            tn += int(not has[i]); fp += int(has[i])
        else:
            ok = has[i] and pred[i] == y
            tp += int(ok); fn += int(not ok)
    acc = (tp + tn) / len(Yva)
    prec = tp / (tp + fp + 1e-9); rec = tp / (tp + fn + 1e-9)
    f1 = 2 * prec * rec / (prec + rec + 1e-9)
    return dict(acc=acc, f1=f1, prec=prec, rec=rec, tp=tp, fp=fp, fn=fn, tn=tn)


def main():
    Xtr, Ytr, Xva, Yva = load()
    Xa, Ya = aug(Xtr, Ytr)
    print(f"[data] train {len(Xtr)}->aug {len(Xa)}  val {len(Xva)}")
    inp = tf.keras.Input((16, 16, 1))
    x = tf.keras.layers.Conv2D(4, 3, activation="relu", use_bias=False, name="conv0")(inp)
    x = tf.keras.layers.MaxPool2D(2)(x); x = tf.keras.layers.MaxPool2D(2)(x)
    x = tf.keras.layers.Flatten()(x)
    out = tf.keras.layers.Dense(9, use_bias=False, name="head")(x)
    model = tf.keras.Model(inp, out)
    model.compile(tf.keras.optimizers.Adam(2e-3), tf.keras.losses.BinaryCrossentropy(from_logits=True))
    model.fit((Xa/255)[..., None], obj(Ya), validation_data=((Xva/255)[..., None], obj(Yva)),
              epochs=90, batch_size=128, verbose=2,
              callbacks=[tf.keras.callbacks.ReduceLROnPlateau(factor=0.5, patience=6, min_lr=1e-4),
                         tf.keras.callbacks.EarlyStopping(patience=14, restore_best_weights=True)])

    k0 = model.get_layer("conv0").get_weights()[0]          # (3,3,1,4)
    k9 = model.get_layer("head").get_weights()[0]           # (36,9)
    k20 = np.zeros((36, 20), np.float32); k20[:, :9] = k9    # pad to 20 (rows 9..19 = 0)

    print("\n[quant] scale search (9-cell, real val frames) ...")
    S32 = 2**30; best = None
    for s0 in [1,2,3,4,6,8,12,16,24,32]:
        for s3 in [1,2,3,4,6,8,12,16,24,32]:
            w0, w3 = F.quantize(k0, k20, s0, s3)
            if np.abs(w0).max()==0 or np.abs(w3[:9*36]).max()==0: continue
            raw, pm, am = F.hw_forward_np(Xva.astype(np.uint8), w0, w3)
            if pm>=S32 or am>=S32: continue
            bt=None
            for thr in range(5,300,5):
                m=evaluate9(raw,Yva,thr)
                if bt is None or m["acc"]>bt[1]["acc"]: bt=(thr,m)
            thr,m=bt
            if best is None or m["acc"]>best[0]: best=(m["acc"],s0,s3,thr,m,w0,w3,pm,am)
    acc,s0,s3,thr,m,w0,w3,pm,am=best
    print(f"[quant] s0={s0} s3={s3} thr={thr}  acc={m['acc']:.3f} "
          f"(tp{m['tp']} fp{m['fp']} fn{m['fn']} tn{m['tn']})  headroom x{2**31/max(pm,am,1):.0f}")
    print(f"[quant] w0[{w0.min()},{w0.max()}] w3[{w3.min()},{w3.max()}]")

    mism=0
    for i in range(len(Xva)):
        a16=[[int(Xva[i][yy][xx])<<7 for xx in range(16)] for yy in range(16)]
        l3=gm.fc(gm.maxpool2x2(gm.maxpool2x2(gm.conv3x3_relu(a16,list(w0)),14,14,4),7,7,4),list(w3))
        rn,_,_=F.hw_forward_np(Xva[i:i+1].astype(np.uint8),w0,w3)
        mism+=int(not np.array_equal(np.array(l3,np.int64),rn[0]))
    print(f"[verify] golden vs numpy: {mism}/{len(Xva)} mismatches")

    F.emit_header(w0,w3,s0,s3,thr,m)
    p=os.path.join(os.path.dirname(HERE),"software","linux","dnn_weights_face.h")
    s=open(p).read().replace("face-in-quadrant detector","3x3 HAND-position detector (9 cells, live-trained)")
    open(p,"w").write(s)
    json.dump(dict(grid="3x3",cells=9,s0=s0,s3=s3,threshold=thr,acc=float(m['acc']),
                   golden_mismatches=mism),open(os.path.join(HERE,"face_data","hand3x3_meta.json"),"w"),indent=2)
    print("[done] wrote dnn_weights_face.h (3x3 hand, 9 cells)")


if __name__ == "__main__":
    main()
