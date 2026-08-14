#!/bin/bash
# fastfetch.sh - Instalación y configuración de Fastfetch para Kubuntu

set -euo pipefail

echo "ℹ️ Instalando Fastfetch..."
sudo apt update
sudo apt install -y fastfetch

# Asegurar directorio de configuración
mkdir -p ~/.config/fastfetch

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Copiar configuración local
if [ -f "$SCRIPT_DIR/config.jsonc" ]; then
    echo "ℹ️ Aplicando configuración personalizada desde $SCRIPT_DIR/config.jsonc..."
    cp "$SCRIPT_DIR/config.jsonc" ~/.config/fastfetch/config.jsonc
fi

echo "✅ Fastfetch instalado y configurado."
fastfetch
