# Kubuntu Environment Configuration Justfile

# Instala todo el entorno (Post-install, Workspace, Laptop, Fingerprint, Tuning, Screensaver, Shell, Seguridad, Fuentes, Virtualización, Cockpit, IDEs, Git, Lenguajes, etc.)
setup-all: post-install workspace laptop fingerprint tuning screensaver shell security security-dot fonts virtualization mise cockpit ides git-setup languages yt-dlp fastfetch apariencia kde firefox meld steam
    echo "🚀 Entorno completo de Kubuntu configurado. Por favor, reinicia el sistema."

# =============================================================================
# CONFIGURACIÓN BASE DEL SISTEMA
# =============================================================================

# Configuración base post-instalación (Universe, Multiverse, Restricted, ZRAM, Mesa, PipeWire)
post-install:
    ./Setup/post-install.sh

# Automontaje permanente de la partición Workspace (/home/caballero/Workspace) en /etc/fstab
workspace:
    ./Setup/mount-workspace.sh

# Compilador de Kernel Linux optimizado para x86_64-v3 y ajustado a tu portátil
build-kernel:
    ./Setup/build-custom-kernel.sh

# Instalación del último Kernel Linux Oficial y Firmware HWE
kernel-hwe:
    ./Setup/install-hwe-kernel.sh

# Optimización para portátiles de desarrollo (Touchpad, Batería, Bluetooth, KDE)
laptop:
    ./Setup/laptop-setup.sh

# Autenticación y desbloqueo por huella dactilar (fprintd, PAM, sudo, polkit)
fingerprint:
    ./Setup/fingerprint-setup.sh

# Configuración e instalación de impresora HP LaserJet Pro M15w (USB)
printer:
    ./Setup/hp-printer-setup.sh

# Optimizaciones avanzadas de Kubuntu (Sysctl, Distrobox)
tuning:
    ./Setup/kubuntu-tuning.sh

# Configuración de salvapantallas 3D/Matrix al bloquear la pantalla
screensaver:
    ./Setup/screensaver-setup.sh

# Utilidades de terminal y prompt (eza, bat, fzf, starship)
shell:
    ./Setup/shell.sh

# Seguridad básica (UFW firewall)
security:
    ./Setup/seguridad.sh

# Seguridad avanzada (DNS-over-TLS)
security-dot:
    ./Setup/seguridad-dot.sh

# Fuentes de desarrollo (Nerd Fonts)
fonts:
    ./Setup/fonts.sh

# Personalización de KDE Plasma (Luz nocturna, Touchpad, Breeze Dark)
kde:
    ./Setup/kde-settings.sh

# Información estética del sistema
fastfetch:
    ./Setup/fastfetch.sh

# Apariencia (temas e iconos)
apariencia:
    ./Setup/apariencia.sh

# Multimedia (yt-dlp, ffmpeg)
yt-dlp:
    ./Setup/yt-dlp-setup.sh

# =============================================================================
# CONFIGURACIÓN DE RED Y VIRTUALIZACIÓN
# =============================================================================

# Configuración de KVM/QEMU de alto rendimiento
virtualization:
    ./Virtualizacion/virtualization.sh

# Administración Web (Cockpit)
cockpit:
    ./Setup/cockpit.sh

# =============================================================================
# CONTROL DE VERSIONES
# =============================================================================

# Git, Delta, Lazygit, GH CLI
git-setup:
    ./Git/git.sh
    ./Git/github-cli.sh

# =============================================================================
# GESTORES DE RUNTIMES
# =============================================================================

# Gestor de versiones Mise
mise:
    ./ProgrammingLanguages/mise.sh

# =============================================================================
# LENGUAJES DE PROGRAMACIÓN
# =============================================================================

# Todos los lenguajes
languages: node python rust dotnet java angular gemini
    echo "✅ Lenguajes instalados."

# Node.js LTS (22)
node:
    ./ProgrammingLanguages/nodejs.sh

# Python (3.13)
python:
    ./ProgrammingLanguages/python.sh

# Rust
rust:
    ./ProgrammingLanguages/rust.sh

# .NET SDK
dotnet:
    ./ProgrammingLanguages/dotnet.sh

# Java (OpenJDK)
java:
    ./ProgrammingLanguages/java.sh

# Angular CLI
angular:
    ./ProgrammingLanguages/angular.sh

# Gemini CLI
gemini:
    ./ProgrammingLanguages/gemini.sh

# =============================================================================
# ENTORNOS DE DESARROLLO (IDEs)
# =============================================================================

# Todos los IDEs
ides: nvim vscode antigravity antigravity-cli antigravity-ide opencode
    echo "✅ IDEs instalados."

# Neovim + LazyVim
nvim:
    ./IDE/neovim.sh

# Visual Studio Code
vscode:
    ./IDE/vscode.sh

# Google Antigravity Desktop 2.0 (Completo)
antigravity:
    ./IDE/antigravity.sh

# Google Antigravity CLI (agy)
antigravity-cli:
    ./IDE/antigravity-cli.sh

# Google Antigravity IDE Engine
antigravity-ide:
    ./IDE/antigravity-ide.sh

# OpenCode AI CLI/Editor
opencode:
    ./IDE/opencode.sh

# =============================================================================
# NAVEGADORES, APPS Y JUEGOS
# =============================================================================

# Firefox nativo (.deb)
firefox:
    ./Setup/firefox.sh

# Meld (diff viewer)
meld:
    ./Apps/meld.sh

# Steam y herramientas de juegos
steam:
    ./Juegos/steam.sh

# =============================================================================
# PODMAN (QUADLETS)
# =============================================================================

# Instalación base de Podman rootless
podman-install:
    ./Podman/install/podman-install.sh

# Configuración inicial de Quadlets (systemd)
quadlets-setup:
    ./Podman/install/quadlets-setup.sh
