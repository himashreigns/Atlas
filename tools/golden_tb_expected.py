#!/usr/bin/env python3
"""Compute the exact expected L3 outputs for sim/tb_input.memh +
sim/tb_wgt_l0.memh / tb_wgt_l3.memh, using the layer functions from
golden_model.py (which are bit-exact vs the RTL). Emits a Verilog-friendly
list so the hardened TB can self-check every inference."""
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent))
from golden_model import conv3x3_relu, maxpool2x2, fc  # noqa: E402


def load_memh(path, signed_bits=None):
    vals = []
    for tok in Path(path).read_text().split():
        v = int(tok, 16)
        if signed_bits and v >= (1 << (signed_bits - 1)):
            v -= 1 << signed_bits
        vals.append(v)
    return vals


def main():
    sim = Path(__file__).parent.parent / "sim"
    # Input words are 32-bit; the accelerator takes the low 16 bits sign-cast.
    raw = load_memh(sim / "tb_input.memh")
    act = [(v & 0xFFFF) - 0x10000 if (v & 0x8000) else (v & 0xFFFF)
           for v in raw]
    assert len(act) == 256
    act16 = [act[r * 16:(r + 1) * 16] for r in range(16)]

    w0 = load_memh(sim / "tb_wgt_l0.memh", signed_bits=16)
    # L3 weights are consumed as 16-bit via the same DATA_W=16 load port.
    w3 = load_memh(sim / "tb_wgt_l3.memh", signed_bits=16)
    assert len(w0) == 36 and len(w3) == 720

    l0 = conv3x3_relu(act16, w0)
    l1 = maxpool2x2(l0, 14, 14, 4)
    l2 = maxpool2x2(l1, 7, 7, 4)
    l3 = fc(l2, w3)

    print("// expected L3 outputs for tb_input.memh (auto-generated)")
    for i, v in enumerate(l3):
        print(f"        expected[{i}] = 32'h{v & 0xFFFFFFFF:08X};")


if __name__ == "__main__":
    main()
