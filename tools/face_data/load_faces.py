#!/usr/bin/env python3
"""Load real grayscale face crops from whichever mirror fetch_faces.py landed.

Returns an (N, H, W) uint8 array of face-centered grayscale crops (0..255).
Falls back with a clear error if no dataset was downloaded — the hybrid plan
still needs a public bootstrap set.
"""
import os, glob, io, zipfile, tarfile
import numpy as np

HERE = os.path.dirname(os.path.abspath(__file__))


def _from_olivetti_mat(path):
    from scipy.io import loadmat
    m = loadmat(path)
    faces = m["faces"].astype(np.float32)          # (4096, 400), column-major 64x64
    imgs = faces.T.reshape(-1, 64, 64).transpose(0, 2, 1)  # -> (400,64,64) row-major
    imgs = (imgs / imgs.max() * 255.0).astype(np.uint8)
    return imgs


def _from_pgm_bytes(b):
    """Minimal binary PGM (P5) reader."""
    assert b[:2] == b"P5"
    idx = 2
    vals = []
    while len(vals) < 3:
        while idx < len(b) and b[idx:idx+1].isspace():
            idx += 1
        if b[idx:idx+1] == b"#":
            while b[idx:idx+1] not in (b"\n", b""):
                idx += 1
            continue
        s = idx
        while idx < len(b) and not b[idx:idx+1].isspace():
            idx += 1
        vals.append(int(b[s:idx]))
    w, h, _ = vals
    idx += 1
    data = np.frombuffer(b[idx:idx + w*h], dtype=np.uint8).reshape(h, w)
    return data


def _from_zip(path):
    imgs = []
    with zipfile.ZipFile(path) as z:
        for n in z.namelist():
            if n.lower().endswith(".pgm"):
                try:
                    imgs.append(_from_pgm_bytes(z.read(n)))
                except Exception:
                    pass
    return imgs


def _from_tgz_lfw(path):
    # sklearn LFW funneled: jpgs; use PIL
    from PIL import Image
    imgs = []
    with tarfile.open(path) as t:
        for m in t.getmembers():
            if m.name.lower().endswith((".jpg", ".jpeg", ".png")):
                f = t.extractfile(m)
                if f is None:
                    continue
                im = Image.open(io.BytesIO(f.read())).convert("L")
                imgs.append(np.asarray(im, dtype=np.uint8))
                if len(imgs) >= 1200:
                    break
    return imgs


def load_face_crops():
    cached = os.path.join(HERE, "face_crops.npy")
    if os.path.exists(cached):
        return np.load(cached)

    imgs = None
    mat = glob.glob(os.path.join(HERE, "raw_*olivetti*.mat")) + \
          glob.glob(os.path.join(HERE, "raw_*.mat"))
    zips = glob.glob(os.path.join(HERE, "raw_*.zip"))
    tgz = glob.glob(os.path.join(HERE, "raw_*lfw*.tgz")) + \
          glob.glob(os.path.join(HERE, "raw_*.tgz"))

    if mat:
        imgs = _from_olivetti_mat(mat[0])
    elif zips:
        imgs = np.stack([_resize(i, 64) for i in _from_zip(zips[0])])
    elif tgz:
        imgs = np.stack([_resize(i, 64) for i in _from_tgz_lfw(tgz[0])])

    if imgs is None or len(imgs) == 0:
        raise SystemExit("No face dataset found in tools/face_data/. "
                         "Run fetch_faces.py (needs network).")
    imgs = np.asarray(imgs, dtype=np.uint8)
    np.save(cached, imgs)
    print(f"[load_faces] {len(imgs)} face crops, shape {imgs.shape[1:]}")
    return imgs


def _resize(img, size):
    from PIL import Image
    return np.asarray(Image.fromarray(img).resize((size, size)), dtype=np.uint8)


if __name__ == "__main__":
    a = load_face_crops()
    print("faces:", a.shape, a.dtype, "range", a.min(), a.max())
