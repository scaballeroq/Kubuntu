#!/bin/bash
# install-hwe-kernel.sh - Instalación automatizada del último Kernel Linux Oficial y Firmware HWE en Kubuntu / Ubuntu

set -euo pipefail

# 1. Auditoría de Sistema y Codename
CODENAME=$(grep '^VERSION_CODENAME=' /etc/os-release | cut -d= -f2 || true)
if [ -z "$CODENAME" ]; then
    CODENAME=$(lsb_release -sc 2>/dev/null || echo "noble")
fi

echo "================================================================="
echo "🐧 INSTALADOR DE KERNEL LINUX OFICIAL Y FIRMWARE (HWE)"
echo "================================================================="
echo "💻 Distribución: Kubuntu ($CODENAME)"
echo "📌 Kernel activo: $(uname -r)"
echo "================================================================="

# 2. Actualizar Índices de Paquetes
echo "ℹ️ Actualizando listas de paquetes de APT..."
sudo apt update

# 3. Instalación del Kernel y Firmware HWE
echo "ℹ️ Instalando Kernel Linux y Firmware más reciente..."
sudo apt install -y \
    linux-generic-hwe-${CODENAME} 2>/dev/null || sudo apt install -y linux-generic linux-headers-generic linux-image-generic

sudo apt install -y \
    linux-firmware \
    intel-microcode \
    amd64-microcode

# 4. Actualizar el gestor de arranque GRUB
echo "ℹ️ Actualizando GRUB..."
sudo update-grub

echo "================================================================="
echo "✅ Instalación del Kernel Linux Oficial completada con éxito."
echo "📌 Nuevo kernel disponible: $(dpkg -l | grep -E "linux-image-[0-9]" | tail -n 1 | awk '{print $2, $3}')"
echo "================================================================="

read -rp "¿Deseas reiniciar el sistema ahora para arrancar con el nuevo kernel? (s/N): " REBOOT_NOW || true
if [[ "${REBOOT_NOW:-n}" =~ ^[Ss]$ ]]; then
    echo "🔄 Reiniciando sistema..."
    sudo reboot
fi
