#!/bin/bash
# meld.sh - Instalación de Meld para Kubuntu

set -euo pipefail

echo "ℹ️ Instalando Meld..."
sudo apt update
sudo apt install -y meld
echo "✅ Meld instalado."
