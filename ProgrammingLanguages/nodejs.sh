#!/bin/bash
# nodejs.sh - Node.js Installation via Mise for Kubuntu

set -euo pipefail

if ! command -v mise &> /dev/null; then
    echo "❌ Error: 'mise' no está instalado. Ejecuta primero './mise.sh'."
    exit 1
fi

echo "ℹ️ Instalando dependencias de compilación para paquetes nativos de Node.js..."
sudo apt update
sudo apt install -y build-essential curl python3 g++ make

echo "ℹ️ Instalando Node.js LTS (22)..."
mise use --global node@22

echo "ℹ️ Configurando Corepack (pnpm/yarn)..."
# Corepack viene con Node y gestiona pnpm/yarn sin instalaciones globales manuales
mise exec node@22 -- corepack enable
mise reshim

echo "✅ Node.js 22, npm y corepack (pnpm/yarn) configurados correctamente."
