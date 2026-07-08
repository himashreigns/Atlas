#!/usr/bin/env bash
# =============================================================================
# serial.sh — attach a serial monitor to the ZedBoard UART1 (Cypress USB-UART
# bridge → /dev/ttyACM0 by default).
#
# Usage:
#     ./software/vitis/scripts/serial.sh           # auto-detect, picocom
#     ./software/vitis/scripts/serial.sh /dev/ttyACM1
#     TTY_TOOL=screen ./software/vitis/scripts/serial.sh
# =============================================================================
set -euo pipefail

DEVICE="${1:-}"
BAUD="${BAUD:-115200}"
TOOL="${TTY_TOOL:-picocom}"

# --- Auto-detect device --------------------------------------------------------
if [[ -z "$DEVICE" ]]; then
    for cand in /dev/ttyACM0 /dev/ttyACM1 /dev/ttyUSB0 /dev/ttyUSB1; do
        if [[ -e "$cand" ]]; then DEVICE="$cand"; break; fi
    done
fi
if [[ -z "$DEVICE" || ! -e "$DEVICE" ]]; then
    echo "ERROR: no serial device found. Try plugging the USB-UART cable in or"
    echo "       pass an explicit /dev/tty* as the first argument."
    echo "       (dmesg | tail will show which ttyACM/ttyUSB Linux assigned.)"
    exit 1
fi

# --- Permission check ----------------------------------------------------------
if [[ ! -r "$DEVICE" || ! -w "$DEVICE" ]]; then
    echo "WARNING: $DEVICE is not user-readable. You may need to:"
    echo "    sudo usermod -aG dialout \"\$USER\"    # then log out / back in"
    echo "  or run this script with sudo."
fi

# --- Launch terminal ----------------------------------------------------------
echo "Attaching $TOOL to $DEVICE @ $BAUD"
case "$TOOL" in
    picocom)
        exec picocom -b "$BAUD" --imap lfcrlf --omap crcrlf "$DEVICE"
        ;;
    screen)
        exec screen "$DEVICE" "$BAUD"
        ;;
    minicom)
        exec minicom -D "$DEVICE" -b "$BAUD" -o
        ;;
    *)
        echo "Unknown TTY_TOOL=$TOOL (picocom|screen|minicom)"
        exit 1
        ;;
esac
