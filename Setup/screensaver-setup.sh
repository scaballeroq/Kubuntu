#!/bin/bash
# screensaver-setup.sh - Instalación y configuración de Salvapantallas (Screensaver 3D / Matrix) en Kubuntu

set -euo pipefail

echo "🎨 Configurando Salvapantallas (Screensaver 3D / Matrix) al bloquear el sistema en Kubuntu..."

# 1. Instalación de paquetes de XScreenSaver y efectos 3D OpenGL
echo "ℹ️ Instalando XScreenSaver y colecciones de salvapantallas 3D/GL vía APT..."
sudo apt update
sudo apt install -y \
    xscreensaver \
    xscreensaver-gl \
    xscreensaver-data-extra \
    xscreensaver-gl-extra \
    libgl1-mesa-dri \
    libglx-mesa0

# 2. Configurar autostart de XScreenSaver en el inicio de sesión
echo "ℹ️ Configurando inicio automático de XScreenSaver en autostart..."
mkdir -p ~/.config/autostart

cat <<EOF > ~/.config/autostart/xscreensaver.desktop
[Desktop Entry]
Type=Application
Name=XScreenSaver
Comment=Demonio de Salvapantallas 3D para bloqueo de pantalla
Exec=xscreensaver -nosplash
Hidden=false
NoDisplay=false
X-KDE-Autostart-enabled=true
EOF

# 3. Crear archivo de configuración prediseñado de XScreenSaver (~/.xscreensaver)
if [ ! -f "$HOME/.xscreensaver" ]; then
    echo "ℹ️ Creando archivo de configuración inicial ~/.xscreensaver..."
    cat <<EOF > "$HOME/.xscreensaver"
# Configuración predeterminada de XScreenSaver para Kubuntu
timeout:	0:05:00
cycle:	0:05:00
lock:	False
lockTimeout:	0:00:00
passwdTimeout:	0:00:30
visualID:	default
installColormap:    True
verbose:	False
timestamp:	True
splash:		False
splashDuration:	0:00:05
demoMode:	False
mode:		random
selected:	-1

# Colección de Hacks seleccionados (GLMatrix, Matrix, Cosmos, Sonar, Pipes, FlipFlop)
programs: \
				glmatrix -root				\n\
				xmatrix -root				\n\
				pipes -root				\n\
				sonar -root				\n\
				flipflop -root				\n\
				flurry -root				\n\
				endgame -root				\n\
				photopile -root				\n\
				starwars -root				\n\
				bsod -root				\n
EOF
    echo "✅ Archivo ~/.xscreensaver configurado."
fi

# 4. Lanzar demonio si no está activo
if ! pgrep -x "xscreensaver" > /dev/null; then
    echo "ℹ️ Arrancando demonio xscreensaver..."
    xscreensaver -nosplash >/dev/null 2>&1 &
fi

echo "================================================================="
echo "✅ Salvapantallas 3D/GL configurado con éxito en Kubuntu."
echo "💡 Puedes personalizar los efectos abriendo la GUI con el comando: xscreensaver-settings"
echo "================================================================="
