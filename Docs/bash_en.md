---
sidebar_position: 3
---

# Bash Configuration in Kubuntu

This guide details the terminal (Bash) configuration and modular utilities in the `Bash.Setup` directory.

---

## 1. Modular Environment Loading

Scripts are dynamically loaded by adding this block to `~/.bashrc`:

```bash
if [ -d "$HOME/.bashrc.d" ]; then
    for script in "$HOME/.bashrc.d"/*.sh; do
        [ -r "$script" ] && source "$script"
    done
    unset script
fi
```

---

## 2. System Aliases & Helpers (`aliases.sh`)

### 📦 APT Package Shortcuts
- `update` -> `sudo apt update`
- `upgrade` -> `sudo apt upgrade -y`
- `install` -> `sudo apt install`
- `remove` -> `sudo apt remove`
- `search` -> `apt search`
- `clean` -> `sudo apt autoremove -y && sudo apt clean`
- `list` -> `apt list --upgradable`

### 🐧 Kernel Monitoring (`check-kernel`)
Compares your active kernel (`uname -r`) against the latest stable release on `kernel.org`:
```bash
check-kernel
```

### 🖥️ KVM / Libvirt Shortcuts
- `vms`: Lists all virtual machines (`virsh list --all`).
- `vmstart <vm>`: Starts a VM.
- `vmstop <vm>`: Gracefully shuts down a VM.
- `vminfo <vm>`: Displays VM domain information.
