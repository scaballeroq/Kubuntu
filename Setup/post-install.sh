#!/bin/bash
# post-install.sh - Script maestro de post-instalación para Kubuntu / Ubuntu
# Compatible con Kubuntu 24.04 LTS, 24.10 y 26.04 LTS (KDE Plasma)

set -euo pipefail

# Detectar versión/codename de Kubuntu/Ubuntu
CODENAME=$(grep '^VERSION_CODENAME=' /etc/os-release | cut -d= -f2 || true)
if [ -z "$CODENAME" ]; then
    CODENAME=$(lsb_release -sc 2>/dev/null || echo "plucky")
fi

echo "🚀 Iniciando configuración base y modernización de Kubuntu ($CODENAME)..."

# 1. Habilitar Repositorios Extra (Universe, Multiverse y Restricted)
echo "ℹ️ Habilitando repositorios universe, multiverse y restricted..."
sudo apt update
sudo apt install -y curl ca-certificates gnupg lsb-release software-properties-common

sudo add-apt-repository -y universe 2>/dev/null || true
sudo add-apt-repository -y multiverse 2>/dev/null || true
sudo add-apt-repository -y restricted 2>/dev/null || true

echo "ℹ️ Actualizando listas de paquetes y actualizando sistema..."
sudo apt update
sudo apt upgrade -y

# 2. Compresión de Memoria ZRAM (Evita bloqueos del sistema al compilar y mejora rendimiento)
echo "ℹ️ Instalando y configurando SWAP comprimida en RAM (ZRAM con ZSTD)..."
sudo apt install -y zram-tools 2>/dev/null || true
if [ -f /etc/default/zramswap ]; then
    sudo sed -i 's/^#*ALGORITHM=.*/ALGORITHM=zstd/' /etc/default/zramswap
    sudo sed -i 's/^#*PERCENT=.*/PERCENT=50/' /etc/default/zramswap
    sudo systemctl restart zramswap.service 2>/dev/null || true
fi

# 3. Stack Gráfico y Aceleración HW (Mesa / VA-API / VDPAU)
echo "ℹ️ Instalando controladores gráficos Mesa y aceleración de hardware (VA-API / VDPAU)..."
sudo apt install -y \
    mesa-va-drivers \
    mesa-vdpau-drivers \
    mesa-utils \
    va-driver-all \
    vainfo 2>/dev/null || sudo apt install -y mesa-va-drivers mesa-vdpau-drivers mesa-utils vainfo || true

# 4. Codecs Multimedia y FFmpeg (Kubuntu Restricted Extras)
echo "ℹ️ Instalando codecs multimedia y FFmpeg..."
echo "ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true" | sudo debconf-set-selections 2>/dev/null || true
sudo DEBIAN_FRONTEND=noninteractive apt install -y \
    kubuntu-restricted-extras \
    ffmpeg \
    libavcodec-extra \
    gstreamer1.0-plugins-base \
    gstreamer1.0-plugins-good \
    gstreamer1.0-plugins-bad \
    gstreamer1.0-plugins-ugly \
    gstreamer1.0-libav 2>/dev/null || sudo DEBIAN_FRONTEND=noninteractive apt install -y kubuntu-restricted-extras ffmpeg libavcodec-extra || true

# 5. Sistema de Audio de Alta Fidelidad (PipeWire + WirePlumber)
echo "ℹ️ Habilitando servidor de audio moderno PipeWire y WirePlumber..."
sudo apt install -y \
    pipewire \
    pipewire-alsa \
    pipewire-pulse \
    pipewire-jack \
    wireplumber 2>/dev/null || true

systemctl --user enable --now pipewire pipewire-pulse wireplumber 2>/dev/null || true

# 6. Integración de Flatpak & Flathub en KDE Discover
echo "ℹ️ Configurando Flatpak y Flathub para KDE Plasma (Discover)..."
sudo apt install -y flatpak plasma-discover-backend-flatpak 2>/dev/null || true
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo 2>/dev/null || true

# 7. Software Esencial de Sistema y Microcódigo
echo "ℹ️ Instalando utilidades esenciales para Kubuntu..."
sudo apt install -y \
    build-essential \
    linux-headers-$(uname -r) \
    cmake \
    curl \
    btop \
    htop \
    inxi \
    fuse3 \
    libfuse2t64 \
    exfatprogs \
    vlc \
    gimp \
    gparted \
    7zip \
    p7zip-full \
    unrar \
    zip \
    unzip \
    bzip2 \
    xz-utils \
    fastfetch \
    intel-microcode \
    amd64-microcode 2>/dev/null || true

# 8. Limpieza de Paquetes Antiguos
echo "ℹ️ Limpiando paquetes obsoletos..."
sudo apt autoremove -y
sudo apt clean

echo "================================================================="
echo "✅ Kubuntu ($CODENAME) ha sido actualizado y modernizado con éxito."
echo "💡 Se recomienda reiniciar el equipo para arrancar con el nuevo entorno, Mesa y ZRAM."
echo "================================================================="
