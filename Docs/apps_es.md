---
sidebar_position: 9
---

# Aplicaciones y Juegos en Kubuntu

Esta guía detalla la instalación de software y herramientas de escritorio, así como plataformas de ocio digital descritas en las carpetas `Apps` y `Juegos`.

---

## 1. Meld: Comparación Visual de Archivos (`meld.sh`)

Meld es una herramienta gráfica para comparar y fusionar diferencias entre archivos, directorios y repositorios de control de versiones. Es ideal para resolver conflictos de mezcla en Git.

* **Instalación**:
  ```bash
  sudo apt update
  sudo apt install -y meld
  # O usando just:
  just meld
  ```

---

## 2. Steam: Plataforma de Juegos y Compatibilidad (`steam.sh`)

Permite instalar Steam nativo (32 bits / i386) o Flatpak junto con la capa de compatibilidad **Proton-GE (Proton GloriousEggroll)**:

```bash
./Juegos/steam.sh
# O usando just:
just steam
```

---

## Verificación

- **Meld**: Ejecuta `meld` en consola o ábrelo desde el menú de aplicaciones de KDE Plasma.
- **Steam**: Lanza Steam desde el menú de aplicaciones de KDE Plasma.
