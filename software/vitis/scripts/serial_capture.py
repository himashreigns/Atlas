#!/usr/bin/env python3
"""serial_capture.py — robust ZedBoard UART capture via pyserial.

Tracks any /dev/ttyACM* (the port number bumps every power cycle as the
USB device re-enumerates). Reopens automatically when the current port
disappears. Writes raw bytes + a periodic hex dump to a log file for
forensic analysis if text decoding shows garbage."""
import sys
import time
import glob
import os
import serial

BAUD = 115200
OUT  = sys.argv[1] if len(sys.argv) > 1 else "logs/serial.log"


def pick_port():
    candidates = sorted(glob.glob("/dev/ttyACM*"))
    return candidates[0] if candidates else None


def open_serial():
    """Wait for any /dev/ttyACM* to appear and open it. Retries forever."""
    while True:
        port = pick_port()
        if port:
            try:
                s = serial.Serial(
                    port=port,
                    baudrate=BAUD,
                    bytesize=serial.EIGHTBITS,
                    parity=serial.PARITY_NONE,
                    stopbits=serial.STOPBITS_ONE,
                    timeout=0.2,
                    rtscts=False,
                    dsrdtr=False,
                    xonxoff=False,
                )
                sys.stderr.write(f"[serial] OPEN {port} @ {BAUD} 8N1\n")
                sys.stderr.flush()
                return s, port
            except (OSError, serial.SerialException) as e:
                sys.stderr.write(f"[serial] {port}: {e}; retry\n")
                sys.stderr.flush()
        time.sleep(0.5)


def main():
    s, port = open_serial()
    with open(OUT, "ab", buffering=0) as out:
        while True:
            try:
                if not os.path.exists(port):
                    # device went away (power cycle); reopen
                    sys.stderr.write(f"[serial] {port} disappeared; reopening\n")
                    sys.stderr.flush()
                    try: s.close()
                    except Exception: pass
                    s, port = open_serial()
                    continue
                data = s.read(4096)
                if data:
                    out.write(data)
                    out.flush()
            except (OSError, serial.SerialException) as e:
                sys.stderr.write(f"[serial] read error: {e}; reopen\n")
                sys.stderr.flush()
                try: s.close()
                except Exception: pass
                time.sleep(0.5)
                s, port = open_serial()


if __name__ == "__main__":
    main()
