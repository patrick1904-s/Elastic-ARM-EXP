#!/bin/sh
# POSIX-compatible script to run Minix in QEMU

ISO_FILE="minix_R3.3.0-588a35b.iso"
DISK_FILE="minix.img"

# Check if QEMU exists
if ! command -v qemu-system-i386 >/dev/null 2>&1; then
    echo "QEMU is not installed. Please install QEMU first."
    exit 1
fi

# Create disk if it doesn't exist
if [ ! -f "$DISK_FILE" ]; then
    echo "Creating virtual disk..."
    qemu-img create -f qcow2 "$DISK_FILE" 2G
fi

# Boot Minix
echo "Starting Minix OS..."
qemu-system-i386 -cdrom "$ISO_FILE" -hda "$DISK_FILE" -boot d -m 1024

