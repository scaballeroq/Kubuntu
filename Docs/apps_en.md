---
sidebar_position: 9
---

# Applications and Gaming in Kubuntu

This guide details desktop applications and gaming platforms configured in the `Apps` and `Juegos` directories.

---

## 1. Meld: Visual Diff & Merge Tool (`meld.sh`)

Meld is a graphical diff and merge tool for files, directories, and version-controlled repositories.

* **Installation**:
  ```bash
  sudo apt update
  sudo apt install -y meld
  # Or using just:
  just meld
  ```

---

## 2. Steam: Gaming Platform & Compatibility (`steam.sh`)

Installs Steam (native 32-bit architecture or Flatpak) along with **Proton-GE (Proton GloriousEggroll)** compatibility tool:

```bash
./Juegos/steam.sh
# Or using just:
just steam
```

---

## Verification

- **Meld**: Run `meld` in terminal or launch from KDE menu.
- **Steam**: Launch Steam from KDE Plasma application menu.
