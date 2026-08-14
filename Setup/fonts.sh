#!/bin/bash
# fonts.sh - Instalación de Fuentes de Desarrollo (Nerd Fonts) para Kubuntu

set -euo pipefail

# Directorio de destino
FONT_DIR="$HOME/.local/share/fonts"
mkdir -p "$FONT_DIR"

# Fuentes a descargar
FONTS=("FiraCode" "JetBrainsMono" "Hack" "CascadiaCode")

echo "ℹ️ Verificando e instalando Nerd Fonts..."

for font in "${FONTS[@]}"; do
    # Verificación robusta: buscar archivos .ttf o .otf de la fuente
    if find "$FONT_DIR" -maxdepth 1 -name "${font}*.{ttf,otf}" -print -quit 2>/dev/null | grep -q .; then
        echo "✅ $font ya está instalada. Saltando..."
    else
        echo "⬇️ Descargando $font..."
        wget -q --show-progress "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/${font}.tar.xz" -O "/tmp/${font}.tar.xz"
        echo "📦 Descomprimiendo $font..."
        tar -xf "/tmp/${font}.tar.xz" -C "$FONT_DIR"
        rm "/tmp/${font}.tar.xz"
    fi
done

# Actualizar la caché de fuentes del sistema
echo "ℹ️ Actualizando caché de fuentes (fc-cache)..."
fc-cache -f "$FONT_DIR"

echo "✅ Fuentes instaladas correctamente en $FONT_DIR."
