#!/usr/bin/env bash
# =============================================================================
# sd_copy.sh — copy BOOT.BIN onto a mounted FAT32 SD card for ZedBoard SD boot.
#
# Safety:
#   * Refuses to write to anything outside the given mount point.
#   * Refuses to write to /, /home, /boot, /usr, /var (whitelist of refusals).
#   * Confirms with the user unless --yes is passed.
#   * Verifies the destination filesystem is FAT (vfat/exfat).
#
# Usage:
#     ./software/vitis/scripts/sd_copy.sh /run/media/$USER/<LABEL>
#     ./software/vitis/scripts/sd_copy.sh --yes /media/sd
# =============================================================================
set -euo pipefail

YES=0
MOUNT=""
while [[ $# -gt 0 ]]; do
    case "$1" in
        --yes|-y) YES=1; shift ;;
        -h|--help)
            echo "Usage: $0 [--yes] <mount-point-of-SD>"; exit 0 ;;
        *) MOUNT="$1"; shift ;;
    esac
done

REPO_ROOT="$(cd "$(dirname "$0")/../../.." && pwd)"
BOOT_BIN="$REPO_ROOT/software/vitis/workspace/BOOT.BIN"

if [[ ! -f "$BOOT_BIN" ]]; then
    echo "ERROR: $BOOT_BIN not found. Build it first:"
    echo "    xsct software/vitis/scripts/build_boot_bin.tcl"
    exit 1
fi

if [[ -z "$MOUNT" ]]; then
    echo "Usage: $0 <mount-point-of-SD>"
    echo
    echo "Currently mounted candidate FAT filesystems:"
    findmnt -no TARGET,SOURCE,FSTYPE -t vfat,exfat || true
    exit 2
fi

# --- safety: reject obviously wrong targets -----------------------------------
case "$(readlink -f "$MOUNT")" in
    /|/home|/home/*|/boot|/boot/*|/usr|/usr/*|/var|/var/*|/etc|/etc/*)
        echo "REFUSING to write to $MOUNT (looks like a system path)."; exit 3 ;;
esac

if [[ ! -d "$MOUNT" ]]; then
    echo "ERROR: $MOUNT is not a directory / not mounted."
    exit 4
fi

# --- safety: confirm filesystem type ------------------------------------------
FSTYPE="$(findmnt -no FSTYPE --target "$MOUNT" || true)"
case "$FSTYPE" in
    vfat|exfat|msdos) ;;
    "")
        echo "ERROR: $MOUNT is not a mount point."; exit 5 ;;
    *)
        echo "WARNING: $MOUNT is $FSTYPE, not FAT. ZedBoard BootROM expects FAT32."
        if [[ $YES -ne 1 ]]; then
            read -r -p "Continue anyway? [y/N] " ans
            [[ "$ans" =~ ^[Yy] ]] || exit 6
        fi
        ;;
esac

# --- show plan + confirm -------------------------------------------------------
DEV="$(findmnt -no SOURCE --target "$MOUNT" || echo '?')"
SIZE="$(stat -c %s "$BOOT_BIN")"
echo "About to copy:"
echo "    src   : $BOOT_BIN  ($SIZE bytes)"
echo "    dst   : $MOUNT/BOOT.BIN"
echo "    fs    : $FSTYPE on $DEV"
if [[ $YES -ne 1 ]]; then
    read -r -p "Proceed? [y/N] " ans
    [[ "$ans" =~ ^[Yy] ]] || { echo "Aborted."; exit 0; }
fi

cp "$BOOT_BIN" "$MOUNT/BOOT.BIN"
sync
echo "Copied. Flushing..."

# --- show what's there now ----------------------------------------------------
ls -lh "$MOUNT/BOOT.BIN"
echo
echo "Safe to eject:  udisksctl unmount -b $DEV  &&  udisksctl power-off -b ${DEV%[0-9]*}"
echo
echo "Set ZedBoard boot-mode jumpers JP7..JP11 = (GND, GND, 3V3, 3V3, GND) for SD."
echo "Insert SD, cycle power. UART comes up on /dev/ttyACM0 (115200 8N1)."
