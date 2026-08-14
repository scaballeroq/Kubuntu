#!/bin/bash
# ==============================================================================
# DNS-OVER-TLS CON SYSTEMD-RESOLVED (seguridad-dot.sh) - Kubuntu
# ==============================================================================
# Este script configura DNS cifrado (DNS-over-TLS) para mejorar la privacidad
# en las consultas DNS. Evita que terceros o ISPs intercepten tus peticiones.
# ==============================================================================

set -euo pipefail

echo "🚀 Iniciando configuración de DNS cifrado (DNS-over-TLS)..."

# 1. Verificar systemd-resolved
if ! systemctl list-unit-files | grep -q systemd-resolved; then
    echo "   - systemd-resolved no detectado. Procediendo a la instalación..."
    sudo apt update
    sudo apt install -y systemd-resolved
fi

# 2. Crear archivo de configuración para DNS-over-TLS (Cloudflare DNS)
sudo mkdir -p /etc/systemd/resolved.conf.d/

sudo tee /etc/systemd/resolved.conf.d/dot.conf > /dev/null <<'EOF'
[Resolve]
DNS=1.1.1.1 1.0.0.1 2606:4700:4700::1111 2606:4700:4700::1001
DNSSEC=yes
DNSOverTLS=yes
FallbackDNS=8.8.8.8 8.8.4.4
EOF

# 3. Habilitar, arrancar y reiniciar el servicio
sudo systemctl enable --now systemd-resolved
sudo systemctl restart systemd-resolved

# 4. Configurar el sistema para usar este nuevo DNS interno
if ! grep -q "127.0.0.53" /etc/resolv.conf 2>/dev/null; then
    echo "   - Creando enlace simbólico a la configuración de systemd-resolved..."
    sudo ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf
fi

echo "================================================================="
echo "✅ DNS-over-TLS configurado correctamente en Kubuntu."
echo "💡 Puedes verificar el estado con el comando: resolvectl status"
echo "================================================================="
