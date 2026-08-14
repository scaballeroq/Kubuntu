#!/bin/bash
# ==============================================================================
# ENDURECIMIENTO DE SEGURIDAD PARA DESARROLLADOR (seguridad.sh) - Kubuntu
# ==============================================================================
# Configuración de Firewall (UFW) compatible con KVM/QEMU, Podman y Wi-Fi Móvil:
#   - Cortafuegos UFW (Bloqueo de entrada, navegación permitida)
#   - Habilitar Forwarding para Virtualización KVM (virbr0) y Podman
#   - Limitación anti fuerza bruta para SSH
#   - Protección automatizada con Fail2ban
# ==============================================================================

set -euo pipefail

echo "🚀 Iniciando el proceso de endurecimiento de seguridad del sistema en Kubuntu..."

# 1. Instalación de UFW y Fail2ban
echo "ℹ️ Paso 1: Instalando UFW y Fail2ban vía APT..."
sudo apt update
sudo apt install -y ufw fail2ban

# 2. Configurar compatibilidad con KVM/QEMU y Podman (DEFAULT_FORWARD_POLICY)
echo "ℹ️ Configurando enrutamiento de red para KVM (virbr0) y Podman..."
if [ -f /etc/default/ufw ]; then
    sudo sed -i 's/^DEFAULT_FORWARD_POLICY=.*/DEFAULT_FORWARD_POLICY="ACCEPT"/' /etc/default/ufw
fi

# 3. Establecer las políticas de seguridad por defecto
echo "ℹ️ Estableciendo políticas por defecto (Denegar entrada, permitir salida)..."
sudo ufw default deny incoming
sudo ufw default allow outgoing

# 4. Reglas específicas para KVM y Podman
echo "ℹ️ Permitiendo tráfico de interfaces virtuales (virbr0)..."
sudo ufw route allow in on virbr0 2>/dev/null || true
sudo ufw allow in on virbr0 2>/dev/null || true

# 5. Protección Anti Fuerza Bruta de SSH
echo "ℹ️ Aplicando rate-limit anti fuerza bruta para SSH (Port 22)..."
sudo ufw limit ssh

# 6. Activar el Firewall UFW
echo "ℹ️ Activando Firewall UFW..."
sudo ufw --force enable

# 7. Configuración de Fail2ban
echo "ℹ️ Configurando Fail2ban..."
sudo tee /etc/fail2ban/jail.local > /dev/null <<'EOF'
[DEFAULT]
bantime  = 1h
findtime = 10m
maxretry = 5
ignoreip = 127.0.0.1/8 ::1

[sshd]
enabled = true
port    = ssh
backend = systemd
EOF

sudo systemctl enable --now fail2ban
sudo systemctl restart fail2ban

echo "================================================================="
echo "✅ Proceso de seguridad completado con éxito en Kubuntu."
echo "================================================================="
