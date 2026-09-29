#!/bin/bash
# Launch brainrotloader in QEMU
set -e
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
IMG="$SCRIPT_DIR/boot.img"
QEMU="qemu-system-x86_64"

if [ ! -f "$IMG" ]; then
  echo "boot.img not found, building..."
  if command -v nasm >/dev/null 2>&1; then
    nasm -f bin "$SCRIPT_DIR/boot.asm" -o "$IMG"
  else
    echo "Error: nasm not installed and boot.img missing." >&2
    exit 1
  fi
fi

exec "$QEMU" -drive format=raw,file="$IMG"
