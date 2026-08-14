---
sidebar_position: 2
---

# Configuración del Sistema en Kubuntu

Esta guía detalla el proceso de configuración base, automontaje de partición de trabajo, compilación de kernel nativo `x86_64-v3`, personalización de KDE Plasma, salvapantallas 3D, optimización de la terminal y panel de administración web aplicados a un sistema Kubuntu (KDE Plasma).

Las configuraciones están automatizadas a través de los scripts ubicados en la carpeta `Setup`.

---

## 1. Post-Instalación Base (`post-install.sh`)

Prepara el sistema base configurando repositorios oficiales adicionales, instalando software esencial y configurando la aceleración por hardware.

1. **Actualización base del sistema**:
   ```bash
   sudo apt update && sudo apt upgrade -y
   ```

2. **Habilitación de repositorios Extra** (Universe, Multiverse, Restricted):
   ```bash
   sudo add-apt-repository -y universe
   sudo add-apt-repository -y multiverse
   sudo add-apt-repository -y restricted
   sudo apt update
   ```

3. **Software Esencial y Utilidades**:
   Instala utilidades de compilación y monitorización del sistema:
   - Compilación: `build-essential`, `cmake`, `linux-headers-$(uname -r)`
   - Rendimiento RAM: `zram-tools` (ZRAM con ZSTD)
   - Monitorización: `btop`, `htop`, `inxi`
   - Utilidades: `curl`, `fuse3`, `libfuse2t64`, `exfatprogs`, `p7zip`, `unrar`, `zip`, `unzip`, `bzip2`, `xz-utils`
   - Gráficos y Multimedia: `vlc`, `gimp`, `gparted`
   - Paquetes universales: `flatpak`, `plasma-discover-backend-flatpak`

4. **Codecs Multimedia y Aceleración HW**:
   ```bash
   sudo apt install -y kubuntu-restricted-extras libavcodec-extra ffmpeg mesa-va-drivers mesa-vdpau-drivers
   ```

---

## 2. Automontaje de Partición Workspace (`mount-workspace.sh`)

Monta automáticamente la partición de datos `/home/caballero/Workspace` mediante `/etc/fstab` usando su UUID o etiqueta de disco `Workspace`.
Utiliza las opciones `defaults,noatime,nofail` para evitar cualquier bloqueo del sistema durante el arranque si la partición secundaria estuviese desconectada.

```bash
./Setup/mount-workspace.sh
```

---

## 3. Compilador de Kernel Linux NATIVO x86_64-v3 (`build-custom-kernel.sh`)

Script que consulta la API de `kernel.org` (`https://www.kernel.org/releases.json`) para descargar la última versión estable oficial del Kernel Linux, configurar los flags para la CPU y compilar paquetes `.deb` nativos con optimizaciones de arquitectura `x86_64-v3`, -O3, latencia a **1000Hz** y **Preemption Dinámica**.

```bash
./Setup/build-custom-kernel.sh
# O usando just:
just build-kernel
```

---

## 4. Personalización de KDE Plasma (`kde-settings.sh`)

Configura opciones avanzadas de KDE Plasma vía CLI (`kwriteconfig5`/`kwriteconfig6`):
- **Luz Nocturna (Night Color)** a 3500K.
- **Touchpad**: Tap-to-click, scroll natural y gestos multitoque.
- **Energía**: Suspensión inteligente en batería y rendimiento sin suspensión en CA.
- **Tema Visual**: Breeze Dark con soporte de iconos Papirus.

```bash
./Setup/kde-settings.sh
# O usando just:
just kde
```

---

## 5. Salvapantallas 3D y Bloqueo (`screensaver-setup.sh`)

Instala la suite XScreenSaver con efectos 3D OpenGL (Matrix, GLMatrix, Tuberías, Flurry) y registra el demonio en autostart para activar el salvapantallas animado al bloquear la pantalla.

```bash
./Setup/screensaver-setup.sh
```

---

## 6. Entorno de Terminal y Shell (`shell.sh`, `fastfetch.sh` y `fonts.sh`)

Instala utilidades modernas de consola, tipografías para desarrollo (Nerd Fonts) y el prompt interactivo Starship.

### Utilidades Modernas de Terminal
Se instalan alternativas modernas a comandos clásicos: `eza`, `bat`, `fzf`, `zoxide`, `ripgrep` (`rg`), `fd-find` (`fd`), `duf`, `dust`, `procs`.

### Prompt Starship
Se configura `starship` en `~/.bashrc.d/starship.sh` y se aplica el diseño personalizado `Setup/starship.toml`.

---

## 7. Panel de Administración Web Cockpit (`cockpit.sh`)

Instala Cockpit con su suite completa de módulos para administrar el equipo desde el navegador:

- `cockpit-podman`: Gestión de contenedores Podman.
- `cockpit-machines`: Gestión visual de MVs en KVM/QEMU.
- `cockpit-storaged`: Estado de discos SSD/NVMe, LVM y datos SMART.
- `cockpit-networkmanager`: Configuración de interfaces y redes.
- `lm-sensors`: Monitorización de temperaturas de CPU/GPU y ventiladores.

Aplica protección en UFW (`sudo ufw limit 9090/tcp`) y utiliza el socket en segundo plano `cockpit.socket` para consumir 0 MB de RAM cuando no se está navegando. Acceso en [https://localhost:9090](https://localhost:9090).

---

## 8. Temas e Iconos de Escritorio (`apariencia.sh`)

Aplica paquetes de diseño para un entorno visual limpio y homogéneo con Papirus y Breeze.

---

## Verificación

Para comprobar que los componentes principales se instalaron y configuraron correctamente:

- **Kernel Optimizado**: Ejecuta `uname -r` o escribe `check-kernel` en la terminal.
- **Cockpit**: Ingresa a [https://localhost:9090](https://localhost:9090) desde tu navegador.
