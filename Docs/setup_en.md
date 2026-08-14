---
sidebar_position: 2
---

# System Setup in Kubuntu

This guide details the base configuration, Workspace partition automounting, native `x86_64-v3` kernel compilation, KDE Plasma customization, 3D screensaver setup, terminal enhancements, and web administration console applied to a Kubuntu (KDE Plasma) workstation.

All setups are automated through scripts in the `Setup` directory.

---

## 1. Base Post-Installation (`post-install.sh`)

Prepares the base system by enabling official repositories, installing essential packages, and configuring hardware acceleration.

1. **System update**:
   ```bash
   sudo apt update && sudo apt upgrade -y
   ```

2. **Enable Extra Repositories** (Universe, Multiverse, Restricted):
   ```bash
   sudo add-apt-repository -y universe
   sudo add-apt-repository -y multiverse
   sudo add-apt-repository -y restricted
   sudo apt update
   ```

3. **Essential Software and Utilities**:
   - Compilation: `build-essential`, `cmake`, `linux-headers-$(uname -r)`
   - Memory Optimization: `zram-tools` (ZRAM with ZSTD)
   - Monitoring: `btop`, `htop`, `inxi`
   - Utilities: `curl`, `fuse3`, `libfuse2t64`, `exfatprogs`, `p7zip`, `unrar`, `zip`, `unzip`, `bzip2`, `xz-utils`
   - Graphics & Multimedia: `vlc`, `gimp`, `gparted`
   - Universal Packages: `flatpak`, `plasma-discover-backend-flatpak`

4. **Multimedia Codecs & Hardware Acceleration**:
   ```bash
   sudo apt install -y kubuntu-restricted-extras libavcodec-extra ffmpeg mesa-va-drivers mesa-vdpau-drivers
   ```

---

## 2. Workspace Partition Automount (`mount-workspace.sh`)

Automatically mounts the `/home/caballero/Workspace` data partition via `/etc/fstab` using UUID or `Workspace` label.
Uses `defaults,noatime,nofail` to prevent any system hang during boot if the drive is disconnected.

```bash
./Setup/mount-workspace.sh
```

---

## 3. Native x86_64-v3 Linux Kernel Compiler (`build-custom-kernel.sh`)

Queries `kernel.org` API (`https://www.kernel.org/releases.json`) to download the latest stable Linux Kernel, applies `x86_64-v3` optimization flags, -O3, **1000Hz** low latency, and **Dynamic Preemption**, producing installable `.deb` packages.

```bash
./Setup/build-custom-kernel.sh
# Or using just:
just build-kernel
```

---

## 4. KDE Plasma Customization (`kde-settings.sh`)

Configures advanced KDE Plasma settings via CLI (`kwriteconfig5`/`kwriteconfig6`):
- **Night Color** at 3500K.
- **Touchpad**: Tap-to-click, natural scroll, multi-finger gestures.
- **Power Management**: Balanced battery suspension, high performance on AC.
- **Visual Style**: Breeze Dark with Papirus icon integration.

```bash
./Setup/kde-settings.sh
# Or using just:
just kde
```

---

## 5. 3D Matrix Screensaver (`screensaver-setup.sh`)

Installs XScreenSaver OpenGL 3D collection (Matrix, GLMatrix, Pipes, Flurry) and registers autostart for animated screen locking.

```bash
./Setup/screensaver-setup.sh
```

---

## 6. Terminal & Shell (`shell.sh`, `fastfetch.sh`, `fonts.sh`)

Installs modern CLI tools, development typography (Nerd Fonts), and the fast Starship prompt.

### Modern CLI Tools
Replaces traditional tools with modern Rust-based equivalents: `eza`, `bat`, `fzf`, `zoxide`, `ripgrep` (`rg`), `fd-find` (`fd`), `duf`, `dust`, `procs`.

---

## 7. Web Management Console - Cockpit (`cockpit.sh`)

Installs Cockpit with full module suite:
- `cockpit-podman`: Podman container management.
- `cockpit-machines`: KVM/QEMU VM management.
- `cockpit-storaged`: NVMe/SSD health, LVM, and SMART metrics.
- `cockpit-networkmanager`: Network interface management.
- `lm-sensors`: CPU/GPU temperature and fan speed monitoring.

Configures UFW rate limiting (`sudo ufw limit 9090/tcp`) and uses on-demand socket activation (`cockpit.socket`) for 0 MB RAM idle footprint. Accessible at [https://localhost:9090](https://localhost:9090).

---

## 8. Desktop Appearance (`apariencia.sh`)

Applies clean styling with Papirus and Breeze Dark themes.
