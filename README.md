# 🔧 Kubuntu Environment Configuration (KDE Plasma)

Este repositorio contiene una colección organizada, modular y automatizada de scripts de configuración para sistemas **Kubuntu** (enfocado en KDE Plasma 6 y 5 sobre Kubuntu 24.04 LTS, 24.10 y 26.04 LTS).

El objetivo es automatizar completamente la puesta a punto de un entorno de desarrollo profesional, ultrarrápido, seguro y estéticamente pulido.

---

## 📂 Organización del Repositorio

La configuración está estructurada modularmente para facilitar el mantenimiento y la extensibilidad:

### 🐚 [Bash.Setup](./Bash.Setup/)
Núcleo modular de la terminal Bash cargado vía `~/.bashrc.d/`:
- **`aliases.sh`**: Atajos para comandos frecuentes, Git, APT, comprobación de Kernel (`check-kernel`), utilidades Rust y virtualización.
- **`desktop_settings.sh`**: Optimizaciones y atajos para KDE Plasma (Luz Nocturna, temas Breeze, energía).
- **`environment.sh`**: Variables globales de entorno (`EDITOR`, `PATH`, `UPDATE_ANTIGRAVITY_*`, personalización de `less` y `man`).
- **`functions.sh`**: Colección de funciones utilitarias (backups, extracción multiformato, ISOs, multimedia).
- **`history.sh`**: Historial persistente optimizado (10k/20k líneas, sin duplicados, con marcas de tiempo).
- **`options.sh`**: Comportamiento avanzado de shell (`autocd`, `globstar`, corrección de typos).
- **`podman-functions.sh`**: Funciones no colisionantes para gestión ágil de contenedores Podman y Quadlets.
- **`rclone_aliases.sh`**: Atajos de sincronización con Google Drive y OneDrive con `--fast-list` y `--tpslimit 10`.
- **`yt-dlp_aliases.sh`**: Descargas multimedia en alta calidad con soporte para motor JS Deno.

### ⚙️ [Setup](./Setup/)
Scripts de configuración del sistema operativo, hardware, personalización y endurecimiento:
- **`post-install.sh`**: Script maestro de post-instalación (Universe, Multiverse, Restricted, ZRAM con ZSTD, aceleración Mesa/VA-API, PipeWire y Flatpak con Discover).
- **`mount-workspace.sh`**: Configuración de automontaje permanente de la partición Workspace en `/etc/fstab` con `nofail`.
- **`build-custom-kernel.sh`**: Compilador interactivo de Kernel Linux optimizado para arquitectura `x86_64-v3`, -O3, baja latencia (1000Hz) y generación de paquetes `.deb`.
- **`install-hwe-kernel.sh`**: Instalación automatizada del último Kernel Linux oficial y Firmware HWE.
- **`kubuntu-tuning.sh`**: Optimizaciones de `sysctl` para desarrollo (`inotify`, `max_map_count`, `swappiness = 10`) y `distrobox`.
- **`laptop-setup.sh`**: Optimización para portátiles en Kubuntu (`power-profiles-daemon`, `switcheroo-control`, touchpad tap-to-click, bluetooth).
- **`kde-settings.sh`**: Personalización completa de KDE Plasma vía CLI (Luz Nocturna, Touchpad, energía, Breeze Dark).
- **`fingerprint-setup.sh`**: Autenticación por huella dactilar (`fprintd`, PAM, sudo, polkit, SDDM).
- **`hp-printer-setup.sh`**: Instalación y configuración de impresora HP LaserJet Pro M15w (USB/CUPS/HPLIP/plugin).
- **`screensaver-setup.sh`**: Salvapantallas 3D / Matrix al bloquear la pantalla.
- **`firefox.sh`**: Instalador oficial de Firefox nativo `.deb` desde Mozilla APT con Pin-Priority 1000 (sin Snap).
- **`cockpit.sh`**: Panel de administración web de alto rendimiento (Storage, KVM, Podman, Redes, rate limiting en UFW).
- **`fastfetch.sh`** / **`config.jsonc`**: Resumen estético del sistema al abrir la terminal.
- **`fonts.sh`**: Instalación de fuentes para desarrollo (Nerd Fonts: JetBrainsMono, FiraCode, CascadiaCode, Hack).
- **`seguridad.sh`**: Endurecimiento (hardening) del sistema mediante reglas seguras de UFW firewall, enrutamiento KVM/virbr0 y Fail2ban.
- **`seguridad-dot.sh`**: Configuración de DNS cifrado (DNS-over-TLS) con `systemd-resolved` y Cloudflare DNS.
- **`shell.sh`** / **`starship.toml`**: Herramientas CLI modernas en Rust (`eza`, `bat`, `fzf`, `zoxide`, `ripgrep`, etc.) y prompt Starship.
- **`apariencia.sh`**: Instalación de temas e iconos Papirus y Breeze.
- **`yt-dlp-setup.sh`**: Dependencias para procesamiento y descarga multimedia (yt-dlp, ffmpeg, Deno).

### 🖥️ [Virtualizacion](./Virtualizacion/)
- **`virtualization.sh`**: Entorno KVM/QEMU de alto rendimiento completo con Libvirt, Virt-Manager, PipeWire audio, bridge `br0`, drivers VirtIO y tuned `virtual-host`.
- **`notas_virtualizacion_kubuntu.md`**: Guía paso a paso y mejores prácticas de virtualización en Kubuntu.

### 💻 [IDE](./IDE/)
- **`antigravity.sh`**: Google Antigravity Desktop 2.0 (instalador completo + actualizador `/usr/local/bin/update-antigravity`).
- **`antigravity-cli.sh`**: CLI de Google Antigravity (`agy`).
- **`antigravity-ide.sh`**: Motor IDE de Google Antigravity con actualizador `/usr/local/bin/update-antigravity-ide`.
- **`opencode.sh`**: OpenCode AI CLI y Editor.
- **`neovim.sh`**: Neovim modular potenciado con LazyVim y LSPs.
- **`vscode.sh`**: Visual Studio Code desde el repositorio oficial de Microsoft.

### 🛠️ [Git](./Git/)
- **`git.sh`**: Instalación y configuración de Git, Delta (diffs coloreados) y Lazygit (TUI).
- **`github-cli.sh`**: Instalación y autenticación de GitHub CLI (`gh`).

### ⚡ [ProgrammingLanguages](./ProgrammingLanguages/)
Gestión moderna de runtimes con **Mise**:
- **`mise.sh`**: Instalador del gestor de versiones Mise.
- **`nodejs.sh`**: Node.js LTS (22) y activación de `pnpm`/`yarn` vía Corepack.
- **`python.sh`**: Python 3.13 y actualización de pip.
- **`rust.sh`**: Rust vía rustup y cargo-binstall.
- **`dotnet.sh`**: .NET SDK 10 vía Mise.
- **`java.sh`**: OpenJDK y dependencias de AutoFirma.
- **`angular.sh`**: Angular CLI vía Mise.
- **`gemini.sh`**: Gemini CLI vía Mise / npm.

### 🐳 [Podman](./Podman/)
Gestión profesional de contenedores con **Podman + Quadlets + systemd**:
- **`install/podman-install.sh`**: Instalación de Podman rootless, fuse-overlayfs, subuids/subgids y socket systemd.
- **`install/quadlets-setup.sh`**: Configuración de systemd para Quadlets.
- **`lib/podman-utils.sh`**: CLI para gestión de proyectos y servicios globales.
- **Templates**: `python-postgres`, `python-postgres-redis`, `fullstack` (Traefik, Keycloak, Postgres, Frontend, Backend).
- **Servicios Compartidos**: `traefik`, `keycloak`, `postgres-global`, `redis-global`.

### 📦 [Apps](./Apps/) y 🎮 [Juegos](./Juegos/)
- **`meld.sh`**: Herramienta visual de comparación y resolución de conflictos (diff viewer).
- **`steam.sh`**: Steam nativo (32 bits), Flatpak fallback y compatibilidad Proton-GE.

---

## 🚀 Uso con Justfile

El repositorio incluye un archivo [`justfile`](./justfile) para ejecutar cualquier configuración de forma rápida:

```bash
# Configuración completa del sistema
just setup-all

# Tareas individuales
just post-install    # Base del sistema y repositorios
just workspace       # Montaje automático de partición Workspace
just laptop          # Optimización para portátiles de desarrollo
just fingerprint     # Huella dactilar
just kde             # Personalización de KDE Plasma 6 / 5
just shell           # Terminal moderna (eza, bat, starship)
just virtualization  # KVM / QEMU / Virt-Manager
just firefox         # Firefox oficial .deb (sin snap)
just ides            # Neovim, VS Code, Antigravity, OpenCode
just languages       # Node, Python, Rust, .NET, Java
just podman-install  # Podman rootless con Quadlets
```

---

## 🐚 Configuración Manual de la Shell

Para cargar los módulos de shell en cualquier sesión:

```bash
mkdir -p ~/.bashrc.d
ln -s $(pwd)/Bash.Setup/*.sh ~/.bashrc.d/
```

Añade esto a tu `~/.bashrc`:
```bash
if [ -d "$HOME/.bashrc.d" ]; then
    for script in "$HOME/.bashrc.d"/*.sh; do
        [ -r "$script" ] && source "$script"
    done
    unset script
fi
```

---

*Mantenido por [caballero](https://github.com/scaballeroq)*
