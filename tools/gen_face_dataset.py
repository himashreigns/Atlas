#!/usr/bin/env python3
"""Build a synthetic 16x16 'face in a quadrant' dataset that matches the live
camera preprocess domain (grayscale, heavy downsample blur, luma 0..255).

Each sample is a 16x16 uint8 luma image. Labels:
  obj[4]      : 1.0 for the 2x2 grid cell whose quadrant holds the face, else 0
  box[4,4]    : (x,y,w,h) for the face cell (fractions; x,y in-cell, w,h of frame)

Grid cell order matches the hardware decode:  c = row*2 + col,  row,col in {0,1}
so cell 0=TL, 1=TR, 2=BL, 3=BR.

Domain randomization (crucial for a 756-weight net): brightness/contrast,
rotation, blur, sensor noise, varied backgrounds, and hard negatives (bright
non-face blobs) so the net learns face-shape, not just 'bright region'.
"""
import os, sys
import numpy as np
from PIL import Image, ImageFilter

sys.path.insert(0, os.path.join(os.path.dirname(os.path.abspath(__file__)), "face_data"))
from load_faces import load_face_crops   # noqa: E402

G = 16                     # input grid
HALF = G // 2              # 8 px quadrant
rng = np.random.default_rng(1234)


def _rand_background():
    """A varied non-face background at 16x16 (flat + gradient + low-freq noise)."""
    base = rng.integers(10, 130)
    img = np.full((G, G), base, np.float32)
    # linear gradient
    if rng.random() < 0.7:
        gx, gy = rng.uniform(-1, 1), rng.uniform(-1, 1)
        xs, ys = np.meshgrid(np.linspace(-1, 1, G), np.linspace(-1, 1, G))
        img += (gx * xs + gy * ys) * rng.uniform(10, 60)
    # low-frequency blobs
    for _ in range(rng.integers(0, 3)):
        cy, cx = rng.uniform(0, G, 2)
        r = rng.uniform(2, 6)
        yy, xx = np.mgrid[0:G, 0:G]
        img += rng.uniform(-40, 40) * np.exp(-((yy-cy)**2 + (xx-cx)**2) / (2*r*r))
    img += rng.normal(0, 6, (G, G))
    return img


def _place_face(canvas, face, quad):
    """Composite a jittered face crop into quadrant `quad` (0..3) of canvas.
    Returns (x,y,w,h) box: x,y = face center as fraction of the cell,
    w,h = face size as fraction of the whole 16x16 frame."""
    row, col = quad // 2, quad % 2
    # target face size ~ one quadrant, with jitter (can slightly exceed)
    fs = int(rng.uniform(6, 10))
    fim = Image.fromarray(face.astype(np.uint8))
    if rng.random() < 0.5:
        fim = fim.transpose(Image.FLIP_LEFT_RIGHT)
    fim = fim.rotate(rng.uniform(-20, 20), resample=Image.BILINEAR, expand=False)
    fim = fim.resize((fs, fs), Image.BILINEAR)
    fim = fim.filter(ImageFilter.GaussianBlur(rng.uniform(0.3, 1.1)))  # downsample blur
    fpatch = np.asarray(fim, np.float32)
    # brightness/contrast randomization
    fpatch = (fpatch - fpatch.mean()) * rng.uniform(0.6, 1.3) + rng.uniform(60, 200)

    # top-left of the face within the canvas: centered in the quadrant + jitter
    cy0, cx0 = row * HALF, col * HALF
    jitter = HALF - fs
    oy = cy0 + (rng.integers(0, max(1, jitter+1)) if jitter > 0 else jitter // 2)
    ox = cx0 + (rng.integers(0, max(1, jitter+1)) if jitter > 0 else jitter // 2)
    oy = int(np.clip(oy, 0, G - fs)); ox = int(np.clip(ox, 0, G - fs))
    # alpha blend so faces sit in the scene rather than hard-paste
    a = rng.uniform(0.75, 1.0)
    canvas[oy:oy+fs, ox:ox+fs] = (a * fpatch + (1-a) * canvas[oy:oy+fs, ox:ox+fs])

    # box label
    fcx, fcy = ox + fs/2, oy + fs/2
    x = (fcx - col*HALF) / HALF          # in-cell fraction 0..1
    y = (fcy - row*HALF) / HALF
    w = fs / G                            # fraction of frame
    h = fs / G
    return float(np.clip(x, 0, 1)), float(np.clip(y, 0, 1)), float(w), float(h)


def _hard_negative(canvas):
    """Bright non-face blob(s) — teaches the net not to fire on brightness."""
    for _ in range(rng.integers(1, 3)):
        cy, cx = rng.uniform(0, G, 2)
        r = rng.uniform(2, 5)
        yy, xx = np.mgrid[0:G, 0:G]
        canvas += rng.uniform(60, 160) * np.exp(-((yy-cy)**2+(xx-cx)**2)/(2*r*r))
    return canvas


def build(n, faces, seed=None):
    global rng
    if seed is not None:
        rng = np.random.default_rng(seed)
    X = np.zeros((n, G, G), np.uint8)
    Yobj = np.zeros((n, 4), np.float32)
    Ybox = np.zeros((n, 4, 4), np.float32)
    for i in range(n):
        img = _rand_background()
        r = rng.random()
        if r < 0.55:                                   # face sample
            quad = int(rng.integers(0, 4))
            face = faces[rng.integers(0, len(faces))]
            x, y, w, h = _place_face(img, face, quad)
            Yobj[i, quad] = 1.0
            Ybox[i, quad] = (x, y, w, h)
        elif r < 0.80:                                 # hard negative
            img = _hard_negative(img)
        # else: plain background (easy negative)
        X[i] = np.clip(img, 0, 255).astype(np.uint8)
    return X, Yobj, Ybox


def main():
    faces = load_face_crops()
    Xtr, Otr, Btr = build(12000, faces, seed=1)
    Xva, Ova, Bva = build(2000, faces, seed=999)
    out = os.path.join(os.path.dirname(os.path.abspath(__file__)), "face_data", "dataset.npz")
    np.savez_compressed(out, Xtr=Xtr, Otr=Otr, Btr=Btr, Xva=Xva, Ova=Ova, Bva=Bva)
    print(f"[gen] train {Xtr.shape} val {Xva.shape} -> {out}")
    print(f"[gen] train face-rate {Otr.max(1).mean():.2f}  val {Ova.max(1).mean():.2f}")


if __name__ == "__main__":
    main()
