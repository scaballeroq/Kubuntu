---
sidebar_position: 5
---

# Entornos de Desarrollo (IDEs) en Kubuntu

Esta guía detalla la instalación y configuración de los editores y herramientas de desarrollo integradas presentes en la carpeta `IDE`.

El entorno cubre el editor de consola moderno **Neovim** (potenciado con LazyVim), el editor de escritorio **Visual Studio Code**, el cliente de IA **OpenCode** y la suite completa de **Google Antigravity Desktop 2.0 / CLI / IDE**.

---

## 1. Neovim y LazyVim (`neovim.sh`)

Instala y configura un entorno de edición ultrarrápido y modular en la terminal utilizando Neovim y la distribución preconfigurada LazyVim.

```bash
./IDE/neovim.sh
# O usando just:
just nvim
```

---

## 2. Visual Studio Code (`vscode.sh`)

Automatiza la instalación del popular editor Visual Studio Code desde los repositorios oficiales de Microsoft para garantizar actualizaciones automáticas seguras.

```bash
./IDE/vscode.sh
# O usando just:
just vscode
```

---

## 3. Google Antigravity Desktop 2.0, CLI e IDE (`antigravity.sh`, `antigravity-cli.sh`, `antigravity-ide.sh`)

Scripts completos para la instalación y actualización de la plataforma de IA de Google Antigravity:

- **Google Antigravity Desktop 2.0 (`antigravity.sh`)**: Gestiona la descarga del tarball desde Google CDN, despliegue en `/opt/antigravity`, helper `/usr/local/bin/update-antigravity`, lanzador `.desktop`, icono en alta resolución y permisos `4755` del sandbox de Chromium.
- **Google Antigravity CLI (`antigravity-cli.sh`)**: Instalador de la CLI de terminal (`agy`).
- **Google Antigravity IDE Engine (`antigravity-ide.sh`)**: Instalador del motor IDE independiente con `/usr/local/bin/update-antigravity-ide`.

```bash
just antigravity
just antigravity-cli
just antigravity-ide
```

---

## 4. OpenCode AI CLI/Editor (`opencode.sh`)

Instalación automatizada del cliente de IA OpenCode con control de versión explícito:

```bash
./IDE/opencode.sh
# O especifica una versión:
./IDE/opencode.sh 1.18.13
# O usando just:
just opencode
```

---

## Verificación

- **Neovim**: Ejecuta `nvim` en tu terminal.
- **VS Code**: Ejecuta `code` o búscalo en el menú de aplicaciones de KDE.
- **Google Antigravity**: Ejecuta `antigravity` en la terminal o busca "Antigravity" en el menú de aplicaciones.
- **OpenCode**: Ejecuta `opencode --version`.
