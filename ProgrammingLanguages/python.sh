#!/bin/bash
# python.sh - Python Installation via Mise for Kubuntu

set -euo pipefail

if ! command -v mise &> /dev/null; then
    echo "❌ Error: 'mise' no está instalado. Ejecuta primero './mise.sh'."
    exit 1
fi

echo "ℹ️ Instalando dependencias de compilación para Python..."
sudo apt update
sudo apt install -y \
    build-essential libssl-dev zlib1g-dev \
    libbz2-dev libreadline-dev libsqlite3-dev curl \
    libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev \
    libffi-dev liblzma-dev

echo "ℹ️ Instalando Python 3.13..."
mise use --global python@3.13

echo "ℹ️ Actualizando pip..."
mise exec python@3.13 -- python -m pip install --upgrade pip

echo "✅ Python 3.13 instalado correctamente."
