#!/usr/bin/env bash
# Builds the CNOS ISO (run as root on Debian/Ubuntu with live-build installed)
set -euo pipefail
cd "$(dirname "$0")"
chmod +x config/hooks/live/*.hook.chroot config/includes.chroot/usr/local/bin/* || true
lb clean || true
lb config \
  --distribution trixie \
  --architectures amd64 \
  --archive-areas "main contrib non-free non-free-firmware" \
  --binary-images iso-hybrid \
  --debian-installer none \
  --bootappend-live "boot=live components quiet splash" \
  --iso-application "CNOS" \
  --iso-volume "CNOS"
lb build
mv -f live-image-amd64.hybrid.iso CNOS-amd64.iso
echo "Done: CNOS-amd64.iso"
