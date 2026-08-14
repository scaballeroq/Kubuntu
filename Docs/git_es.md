---
sidebar_position: 4
---

# Configuración de Git en Kubuntu

Esta guía detalla el entorno de control de versiones y el conjunto de herramientas optimizadas en la carpeta `Git`.

El entorno incluye el cliente clásico **Git**, el formateador visual de diferencias **Git-Delta**, la interfaz gráfica de terminal **Lazygit**, además de la utilidad oficial **GitHub CLI (gh)**.

---

## 1. Automatización de Git (`git.sh`)

El script principal de Git automatiza la instalación y define las mejores prácticas de control de versiones:

1. **Instalación de Git y Git-Delta**:
   ```bash
   sudo apt update
   sudo apt install -y git git-delta
   ```

2. **Configuración Global del Usuario**:
   ```bash
   git config --global user.name "Sergio Caballero"
   git config --global user.email "scaballeroq@gmail.com"
   ```

3. **Buenas Prácticas Modernas**:
   - Rama predeterminada: `main` (`init.defaultBranch main`).
   - Sincronización limpia: Rebase por defecto al hacer pull (`pull.rebase true`).
   - Editor por defecto: `nvim` (`core.editor nvim`).

4. **Resaltado Visual (Git-Delta)**:
   Mejora significativamente la legibilidad de las diferencias en consola reemplazando el paginador nativo y activando colores semánticos, navegación intuitiva y visualización mejorada de conflictos (`zdiff3`):
   ```bash
   git config --global core.pager "delta"
   git config --global interactive.diffFilter "delta --color-only"
   git config --global delta.navigate true
   git config --global delta.light false
   git config --global merge.conflictstyle zdiff3
   ```

5. **Instalación de Lazygit (TUI)**:
   Descarga e instala automáticamente el binario compilado de la última versión oficial desde GitHub según la arquitectura del sistema:
   ```bash
   ./Git/git.sh
   # O usando just:
   just git-setup
   ```

---

## 2. Cliente de GitHub en Consola (`github-cli.sh`)

Instala la herramienta oficial de GitHub (`gh`) que permite gestionar repositorios, Pull Requests, Issues y secretos directamente desde la terminal.

```bash
./Git/github-cli.sh
```

---

## Verificación

- **Git-Delta**: Ejecuta `git diff` en cualquier repositorio con cambios locales.
- **Lazygit**: Ejecuta `lazygit` dentro de un repositorio de Git.
- **GitHub CLI**: Ejecuta `gh --version` o inicia sesión con `gh auth login`.
