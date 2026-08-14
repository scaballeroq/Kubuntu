#!/bin/bash
# shell.sh - Instalación de herramientas modernas de terminal y prompt Starship para Kubuntu

set -euo pipefail

echo "ℹ️ Instalando utilidades de terminal modernas..."
sudo apt update
sudo apt install -y \
    eza \
    bat \
    fzf \
    zoxide \
    ripgrep \
    fd-find \
    duf 2>/dev/null || sudo apt install -y eza bat fzf zoxide ripgrep fd-find duf tealdeer || true

# En Ubuntu/Debian, bat y fd se instalan como batcat y fdfind
echo "ℹ️ Configurando symlinks locales para bat y fd..."
mkdir -p ~/.local/bin
[ -f /usr/bin/batcat ] && ln -sf /usr/bin/batcat ~/.local/bin/bat
[ -f /usr/bin/fdfind ] && ln -sf /usr/bin/fdfind ~/.local/bin/fd

echo "✅ Utilidades de terminal instaladas correctamente."

echo "ℹ️ Instalando prompt ultra-rápido Starship..."
curl -sS https://starship.rs/install.sh | sh -s -- -y

# Configuración Modular
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
mkdir -p ~/.config

if [ -f "$SCRIPT_DIR/starship.toml" ]; then
    echo "ℹ️ Enlazando configuración personalizada de Starship..."
    ln -sf "$SCRIPT_DIR/starship.toml" ~/.config/starship.toml
fi

echo "================================================================="
echo "✅ Terminal y Starship configurados correctamente para Kubuntu."
echo "💡 Reinicia tu terminal o ejecuta: source ~/.bashrc"
echo "================================================================="
