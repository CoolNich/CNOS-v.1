# CNOS

A Debian-based Linux OS for gaming, office work and running Windows (.exe) apps.
Built automatically as a bootable ISO by GitHub Actions.

**Included:** AMD GPU drivers (amdgpu/RADV), XFCE desktop, Calamares installer, Wine, Proton (Steam), Lutris, Bottles,
GameMode, MangoHud, LibreOffice, OnlyOffice, zram, and low-latency sysctl / I/O tuning.

## Get the ISO
1. Go to **Actions > Build ISO > Run workflow**.
2. When it finishes (about 30-60 min), download the `CNOS-iso` artifact.
3. Flash the ISO to a USB with Ventoy or balenaEtcher. Test it in a VM first.

## Build locally (Debian/Ubuntu)
    sudo apt install live-build debootstrap xorriso squashfs-tools
    sudo ./build.sh

## Customize
- Add or remove apps: `config/package-lists/cnos.list.chroot`
- Tuning and setup steps: `config/hooks/live/`
- Extra files copied into the OS: `config/includes.chroot/`

## Notes
- Windows apps run through Wine/Proton. Some anti-cheat games and Adobe apps won't work.
- AMD GPU: uses the open-source amdgpu + Mesa (RADV Vulkan) drivers, preinstalled. No driver install needed. Use `radeontop` to monitor GPU load.
- This is a Linux OS with Windows compatibility, not a Linux/Windows hybrid kernel.
