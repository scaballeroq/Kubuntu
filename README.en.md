# 🔧 Kubuntu Environment Configuration (KDE Plasma)

This repository contains an organized, modular, and automated collection of configuration scripts for **Kubuntu** systems (focused on KDE Plasma 6 and 5 across Kubuntu 24.04 LTS, 24.10, and 26.04 LTS).

The goal is to fully automate the setup of a professional, ultra-fast, secure, and visually polished developer workstation.

---

## 📂 Repository Structure

The configuration is modularly structured for maintainability and extensibility:

### 🐚 [Bash.Setup](./Bash.Setup/)
Modular Bash terminal core loaded via `~/.bashrc.d/`:
- **`aliases.sh`**: Shortcuts for frequent commands, Git, APT, Kernel check (`check-kernel`), Rust CLI tools, and virtualization.
- **`desktop_settings.sh`**: Optimizations and shortcuts for KDE Plasma (Night Color, Breeze themes, power management).
- **`environment.sh`**: Global environment variables (`EDITOR`, `PATH`, `UPDATE_ANTIGRAVITY_*`, customized `less` and `man` pagers).
- **`functions.sh`**: Collection of utility functions (backups, unified extraction, ISO burner, multimedia).
- **`history.sh`**: Persistent optimized history (10k/20k lines, deduplicated, timestamped).
- **`options.sh`**: Advanced shell behavior (`autocd`, `globstar`, typo correction).
- **`podman-functions.sh`**: Non-colliding functions for Podman and Quadlets container management.
- **`rclone_aliases.sh`**: Cloud sync shortcuts for Google Drive and OneDrive with `--fast-list` and `--tpslimit 10`.
- **`yt-dlp_aliases.sh`**: High-quality multimedia download helpers with Deno JS engine support.

### ⚙️ [Setup](./Setup/)
Operating system, hardware optimization, customization, and hardening scripts:
- **`post-install.sh`**: Master post-installation script (Universe, Multiverse, Restricted repos, ZRAM with ZSTD, Mesa/VA-API acceleration, PipeWire, Flatpak with Discover).
- **`mount-workspace.sh`**: Permanent automount configuration for the Workspace partition in `/etc/fstab` with `nofail`.
- **`build-custom-kernel.sh`**: Interactive Linux Kernel compiler optimized for `x86_64-v3`, -O3, low latency (1000Hz), generating native `.deb` packages.
- **`install-hwe-kernel.sh`**: Automated installer for the latest official Linux Kernel and HWE firmware.
- **`kubuntu-tuning.sh`**: Kernel `sysctl` performance tweaks for development (`inotify`, `max_map_count`, `swappiness = 10`) and `distrobox`.
- **`laptop-setup.sh`**: Developer laptop optimizations (`power-profiles-daemon`, `switcheroo-control`, touchpad tap-to-click, Bluetooth).
- **`kde-settings.sh`**: Automated KDE Plasma customization via CLI (Night Color, Touchpad, Powerdevil, Breeze Dark).
- **`fingerprint-setup.sh`**: Fingerprint unlocking and admin authentication (`fprintd`, PAM, sudo, polkit, SDDM).
- **`hp-printer-setup.sh`**: HP LaserJet Pro M15w printer configuration (USB/CUPS/HPLIP/plugin).
- **`screensaver-setup.sh`**: 3D / Matrix GL screensavers for lock screen.
- **`firefox.sh`**: Official native `.deb` Firefox installer from Mozilla APT with Pin-Priority 1000 (Snap-free).
- **`cockpit.sh`**: High-performance web administration console (Storage, KVM, Podman, Networking, UFW rate limiting).
- **`fastfetch.sh`** / **`config.jsonc`**: Aesthetic terminal summary on startup.
- **`fonts.sh`**: Development fonts installer (Nerd Fonts: JetBrainsMono, FiraCode, CascadiaCode, Hack).
- **`seguridad.sh`**: Security hardening with UFW firewall, KVM/virbr0 routing, Podman support, and Fail2ban.
- **`seguridad-dot.sh`**: DNS-over-TLS encrypted DNS with `systemd-resolved` and Cloudflare DNS.
- **`shell.sh`** / **`starship.toml`**: Modern Rust CLI tools (`eza`, `bat`, `fzf`, `zoxide`, `ripgrep`, etc.) and Starship prompt.
- **`apariencia.sh`**: Papirus and Breeze icon and desktop themes.
- **`yt-dlp-setup.sh`**: Multimedia processing dependencies (yt-dlp, FFmpeg, Deno).

### 🖥️ [Virtualizacion](./Virtualizacion/)
- **`virtualization.sh`**: High-performance KVM/QEMU setup with Libvirt, Virt-Manager, PipeWire audio passthrough, `br0` bridge, VirtIO drivers, and tuned `virtual-host`.
- **`notas_virtualizacion_kubuntu.md`**: Virtualization guide and best practices for Kubuntu.

### 💻 [IDE](./IDE/)
- **`antigravity.sh`**: Google Antigravity Desktop 2.0 (complete installer + `/usr/local/bin/update-antigravity` helper).
- **`antigravity-cli.sh`**: Google Antigravity CLI (`agy`).
- **`antigravity-ide.sh`**: Google Antigravity IDE Engine with `/usr/local/bin/update-antigravity-ide` helper.
- **`opencode.sh`**: OpenCode AI CLI and Editor.
- **`neovim.sh`**: Modular Neovim powered by LazyVim and LSPs.
- **`vscode.sh`**: Visual Studio Code from Microsoft's official repository.

### 🛠️ [Git](./Git/)
- **`git.sh`**: Git configuration, Delta (syntax-highlighted diffs), and Lazygit (TUI).
- **`github-cli.sh`**: GitHub CLI (`gh`) installer.

### ⚡ [ProgrammingLanguages](./ProgrammingLanguages/)
Modern runtime management powered by **Mise**:
- **`mise.sh`**: Mise version manager installer.
- **`nodejs.sh`**: Node.js LTS (22) and `pnpm`/`yarn` via Corepack.
- **`python.sh`**: Python 3.13 and pip upgrade.
- **`rust.sh`**: Rust via rustup and cargo-binstall.
- **`dotnet.sh`**: .NET SDK 10 via Mise.
- **`java.sh`**: OpenJDK and AutoFirma dependencies.
- **`angular.sh`**: Angular CLI via Mise.
- **`gemini.sh`**: Gemini CLI via Mise / npm.

### 🐳 [Podman](./Podman/)
Professional container management with **Podman + Quadlets + systemd**:
- **`install/podman-install.sh`**: Rootless Podman, fuse-overlayfs, subuids/subgids, and systemd socket.
- **`install/quadlets-setup.sh`**: systemd directory structure for Quadlets.
- **`lib/podman-utils.sh`**: CLI for managing Quadlet projects and global services.
- **Templates**: `python-postgres`, `python-postgres-redis`, `fullstack` (Traefik, Keycloak, Postgres, Frontend, Backend).
- **Shared Services**: `traefik`, `keycloak`, `postgres-global`, `redis-global`.

### 📦 [Apps](./Apps/) & 🎮 [Juegos](./Juegos/)
- **`meld.sh`**: Graphical diff and merge tool.
- **`steam.sh`**: Native Steam (32-bit), Flatpak fallback, and Proton-GE compatibility.

---

## 🚀 Usage with Justfile

The repository includes a [`justfile`](./justfile) to execute any recipe quickly:

```bash
# Full system setup
just setup-all

# Individual tasks
just post-install    # Base system and repositories
just workspace       # Workspace partition automount
just laptop          # Developer laptop optimizations
just fingerprint     # Fingerprint unlock
just kde             # KDE Plasma customization
just shell           # Modern terminal (eza, bat, starship)
just virtualization  # KVM / QEMU / Virt-Manager
just firefox         # Official native .deb Firefox (Snap-free)
just ides            # Neovim, VS Code, Antigravity, OpenCode
just languages       # Node, Python, Rust, .NET, Java
just podman-install  # Rootless Podman with Quadlets
```

---

## 🐚 Manual Shell Setup

To load the shell modules in any session:

```bash
mkdir -p ~/.bashrc.d
ln -s $(pwd)/Bash.Setup/*.sh ~/.bashrc.d/
```

Add this to your `~/.bashrc`:
```bash
if [ -d "$HOME/.bashrc.d" ]; then
    for script in "$HOME/.bashrc.d"/*.sh; do
        [ -r "$script" ] && source "$script"
    done
    unset script
fi
```

---

*Maintained by [caballero](https://github.com/scaballeroq)*
