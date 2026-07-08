# Zynq PS ↔ DNN accelerator bring-up (Vitis flow)

End-to-end bring-up of the YOLO-Nano accelerator with a USB camera on the
ZedBoard OTG port, using the Vitis Classic bare-metal flow and XSDB/serial
for debug.

```
┌──────────────────────── ZedBoard ──────────────────────────┐
│                                                            │
│  USB OTG ───► PS USB0 ───► (UVC frames in DDR)             │
│                                                            │
│  Cortex-A9  ─► M_AXI_GP0 ─► AXI-Lite ─► DNN accel ctrl     │
│         ▲                                ▲                 │
│         │ UART1                          │ done IRQ        │
│         ▼                                ▼                 │
│   /dev/ttyACM0   ◄────── PS GIC ◄── irq_done               │
│                                                            │
│  DNN accel ─► AXI master ─► S_AXI_HP0 ─► DDR3 (1 GB)        │
│                                                            │
└────────────────────────────────────────────────────────────┘
```

## Build flow at a glance

```
┌─────────────────────┐   build_zynq_system.tcl
│  Vivado: HW build   │ ───────────────────────► .xsa (hardware handoff)
└─────────────────────┘
           │
           ▼
┌─────────────────────┐   create_platform.tcl
│ XSCT: HW platform   │ ───────────────────────► dnn_platform (standalone BSP)
└─────────────────────┘
           │
           ▼
┌─────────────────────┐   create_app.tcl
│ XSCT: build app     │ ───────────────────────► dnn_yolo_app.elf
└─────────────────────┘
           │
           ▼
┌─────────────────────┐   program_and_run.tcl (or debug.tcl)
│ XSDB: program + run │ ───────────────────────► live on board
└─────────────────────┘
```

---

## Step 1 — Generate weight C arrays (one-time)

```bash
python3 software/vitis/scripts/memh_to_c.py \
    benchmarks/yolo_nano/golden_yolo_wgts_l0.memh \
    benchmarks/yolo_nano/golden_yolo_wgts_l3.memh \
    > software/vitis/src/yolo_weights.c
```

This produces `software/vitis/src/yolo_weights.c` (already done — re-run only
if you re-train the network).

## Step 2 — Build the hardware

```bash
cd ~/Desktop/dnn_opt
vivado -mode batch -source scripts/build_zynq_system.tcl
```

Produces:
- `build/dnn_zynq_yolo/dnn_zynq_yolo.runs/impl_1/system_wrapper.bit`
- `build/dnn_zynq_yolo/dnn_zynq_yolo.xsa`

## Step 3 — Create the Vitis platform + app

```bash
xsct software/vitis/scripts/create_platform.tcl
xsct software/vitis/scripts/create_app.tcl
```

Produces `software/vitis/workspace/dnn_yolo_app/Release/dnn_yolo_app.elf`.

> **Vitis 2025.2 note** — XSCT still ships in 2025.2 and accepts the Classic
> `platform create` / `app create` API (confirmed). It emits a deprecation
> banner pointing at the new `vitis -s <script>.py` Python flow. The XSCT
> scripts here work as-is; migrating to the Python flow is a future cleanup,
> not required for this bring-up.

## Step 4 — Pick a boot path

### 4a. JTAG-driven (fast iteration)

Two terminals are the most useful layout:

**Terminal A — Serial monitor**
```bash
./software/vitis/scripts/serial.sh
# auto-detects /dev/ttyACM0 (Cypress USB-UART) and uses picocom @ 115200
# Set TTY_TOOL=screen or =minicom if you prefer another front-end.
```

**Terminal B — XSDB**
```bash
xsdb software/vitis/scripts/program_and_run.tcl   # run the app
# or, for a breakpoint-on-main session:
xsdb -interactive software/vitis/scripts/debug.tcl
```

### 4b. SD-boot standalone (no host attached)

Useful for demos or once the app is debugged. The BootROM expects a `BOOT.BIN`
(FSBL + bitstream + app ELF, stitched by `bootgen`) in the root of the first
FAT32 partition.

```bash
# 1) Build the boot image
xsct software/vitis/scripts/build_boot_bin.tcl
# → software/vitis/workspace/BOOT.BIN

# 2) Copy to a mounted SD card (refuses anything outside the given mount)
./software/vitis/scripts/sd_copy.sh /media/$USER/<SD-LABEL>
```

ZedBoard boot-mode jumpers for SD:

| JP7  | JP8  | JP9   | JP10  | JP11 |
|------|------|-------|-------|------|
| GND  | GND  | 3V3   | 3V3   | GND  |

Insert SD, cycle power, watch the same serial console as before — but no
XSDB attach is needed. (You can still attach XSDB at any point via JTAG;
the FSBL has already initialised the PS so `stop` / `bt` / `mrd` work the
same.)

`debug.tcl` arms breakpoints on `main`, `dnn_accel_init`,
`dnn_accel_run_inference`, and `yolo_post_decode`. While stopped, useful
XSDB commands:

| Command                          | What it does                              |
|----------------------------------|-------------------------------------------|
| `stop`                           | halt the A9                              |
| `con`                            | resume                                   |
| `stp` / `nxt`                    | step in / step over                      |
| `bt`                             | backtrace                                |
| `locals`                         | print locals in current frame            |
| `rrd`                            | dump CPU registers                       |
| `mrd 0x43C00000 8`               | read 8 words from accelerator base       |
| `mrd 0x10010000 20`              | read 20 words of accelerator output      |
| `mwr 0x43C00000 1`               | manually pulse the START bit             |
| `bpadd -addr usb_capture_get_frame` | break in the camera path              |

---

## Status of each layer

| Layer                           | State          | Where                               |
|---------------------------------|----------------|-------------------------------------|
| Vivado block design (PS+PL)     | scripted       | `scripts/build_zynq_system.tcl`     |
| AXI-Lite ctrl + AXI master wraps| in repo, ready | `rtl/ps_integration/*.v`            |
| Vitis BSP / standalone domain   | scripted       | `software/vitis/scripts/`           |
| Accelerator driver              | working        | `software/vitis/src/dnn_accel.[ch]` |
| Image preprocessing             | working        | `software/vitis/src/preprocess.[ch]`|
| YOLO-Nano postproc              | working        | `software/vitis/src/yolo_post.[ch]` |
| USB capture (test-pattern)      | working        | `USB_USE_TEST_PATTERN=1` (default)  |
| USB capture (real UVC)          | **scaffold**   | `usb_capture.c` TODO blocks         |

### About the USB UVC scaffold

The Vitis BSP provides only the low-level USB controller driver (`xusbps`),
not a UVC class driver. The scaffold in `usb_capture.c` brings up the
controller in host mode and lays out the enumeration / probe-commit /
iso-IN flow with detailed TODO comments. By default the build uses a
**synthetic test pattern** so you can verify the whole pipeline
(accelerator + preproc + postproc + serial output) on real hardware via
XSDB and serial *before* you finish the UVC class layer.

When you're ready to wire in a real camera, flip
`USB_USE_TEST_PATTERN` to 0 (in `usb_capture.h`) and implement the
five TODOs in `usb_capture.c`. The bring-up sequence the file documents
mirrors what a USB analyser would show on `usbmon`. Set XSDB breakpoints
inside `uvc_negotiate_format()` to single-step the SET_CUR/GET_CUR pair
on EP0.

---

## Memory map cheat-sheet

| Region              | Address       | Size  | Notes                            |
|---------------------|---------------|-------|----------------------------------|
| Accelerator ctrl    | 0x43C00000    | 64 KB | M_AXI_GP0 → AXI-Lite             |
| DMA pool (reserved) | 0x10000000    | 16 MB | S_AXI_HP0 window                 |
|   ├ input  (16×16)  | 0x10000000    |   512B| Q8.8 i16                         |
|   ├ output (20)     | 0x10010000    |    40B| Q8.8 i16                         |
|   ├ wgts L0 (36)    | 0x10080000    |    72B| Q4.12 i16                        |
|   └ wgts L3 (720)   | 0x10080C00    |  1.4KB| Q4.12 i16                        |

The bottom 16 MB at 0x10000000 is reserved by the AXI master wrapper's
`BASE_ADDR` parameter — it's intentionally above the FSBL / app code
region (which sits at 0x100000 for standalone Zynq builds) and below the
512 MB heap top.

---

## Troubleshooting

| Symptom on serial                              | Likely cause                  |
|-------------------------------------------------|-------------------------------|
| `[dnn_accel] ERROR: accelerator unresponsive`   | wrong base addr / bit not loaded |
| `[dnn_accel] WARN: weights_loaded never asserted` | HP port stalled — check rst |
| `[dnn_accel] TIMEOUT (status=0x00000002)` (busy) | accelerator stuck in a layer |
| `[usb] LookupConfig FAIL`                       | PS USB0 not enabled in BD     |
| Nothing at all on UART                          | wrong tty / wrong baud / wrong jumper |

When `dnn_accel_dump_regs()` prints `0xDEADBEEF` for any value, the
AXI-Lite bridge returned the default case — that means the address you
read isn't decoded. Check `DNN_ACCEL_BASE_ADDR` matches the BD address
assignment (0x43C00000).
