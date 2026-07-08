# USB Webcam Compatibility Check — ZedBoard Linux Project

**Context for the reviewer:**
I'm evaluating a USB webcam to use with an Avnet ZedBoard (Zynq-7020 FPGA + ARM
Cortex-A9) running embedded Linux. The camera will connect to the ZedBoard's
USB OTG port through a micro-USB OTG adapter. Linux V4L2 with the standard
`uvcvideo` driver will be used to capture frames at ~320×240 or similar.
Budget target: ~$10 local shop, generic brand OK.

**Please review the attached photo of the camera packaging / specs and tell
me: is this camera likely to work? Answer YES / MAYBE / NO with a one-line
reason.**

---

## Green flags (want to see at least one)

- ✅ Says "UVC" or "USB Video Class" anywhere
- ✅ "Plug and play" / "No driver required" / "Universal driver"
- ✅ "Compatible with Windows / Mac / Linux" (Linux mention is a very
  strong signal for UVC)
- ✅ USB 2.0
- ✅ Resolution VGA (640×480) up to 1080p (1920×1080)
- ✅ Powered by USB only (no external power adapter)
- ✅ YUYV / YUY2 / MJPEG format mentioned in specs

## Red flags (deal-breakers)

- ❌ "Windows only" or "Requires driver CD/installation"
- ❌ 4K / Ultra HD resolution (may need USB 3.0 and more power than
  ZedBoard can supply)
- ❌ Wireless / WiFi camera (not USB)
- ❌ Requires external power adapter (too much current draw)
- ❌ No mention of any OS compatibility at all (packaging that lists
  zero requirements is suspicious)

## Neutral / doesn't matter

- Frame rate (30 fps or higher is fine, we downsample heavily)
- Autofocus feature (nice to have, not required)
- Built-in microphone (unused)
- Brand — Logitech is ideal but any generic brand that ships UVC is fine
- Fixed vs adjustable focus

## Decision rule

- **1+ green flag AND no red flag** → likely YES
- **No mention of anything, but "USB webcam" + USB 2.0** → MAYBE (~85%
  chance it's UVC anyway; most generic webcams are)
- **Any red flag** → NO, look for another one

## Verification trick at the shop

Ask the shopkeeper: "Can I plug it into a Windows/Mac computer briefly?
If it opens the built-in Camera app without installing anything, I'll buy
it." If it just works → it's UVC → it'll work on the ZedBoard's Linux too.
