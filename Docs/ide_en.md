---
sidebar_position: 5
---

# Development Environments (IDEs) in Kubuntu

This guide details the installation and setup of developer editors and IDE suites in the `IDE` directory.

The environment covers terminal-based **Neovim** (powered by LazyVim), desktop **Visual Studio Code**, AI client **OpenCode**, and the full **Google Antigravity Desktop 2.0 / CLI / IDE** suite.

---

## 1. Neovim & LazyVim (`neovim.sh`)

Installs and configures an ultra-fast, modular terminal IDE using Neovim and LazyVim starter.

```bash
./IDE/neovim.sh
# Or using just:
just nvim
```

---

## 2. Visual Studio Code (`vscode.sh`)

Automates VS Code installation from Microsoft's official APT repository:

```bash
./IDE/vscode.sh
# Or using just:
just vscode
```

---

## 3. Google Antigravity Desktop 2.0, CLI & IDE (`antigravity.sh`, `antigravity-cli.sh`, `antigravity-ide.sh`)

Comprehensive scripts for installation and automated updates:

- **Google Antigravity Desktop 2.0 (`antigravity.sh`)**: Tarball deployment to `/opt/antigravity`, `/usr/local/bin/update-antigravity` helper, desktop entry, high-res icon, and Chromium sandbox permissions (`4755`).
- **Google Antigravity CLI (`antigravity-cli.sh`)**: Terminal CLI (`agy`) installer.
- **Google Antigravity IDE Engine (`antigravity-ide.sh`)**: Standalone IDE engine with `/usr/local/bin/update-antigravity-ide` helper.

```bash
just antigravity
just antigravity-cli
just antigravity-ide
```

---

## 4. OpenCode AI CLI/Editor (`opencode.sh`)

Automated installation of OpenCode AI CLI with version pin support:

```bash
./IDE/opencode.sh
# Or specify a version:
./IDE/opencode.sh 1.18.13
# Or using just:
just opencode
```

---

## Verification

- **Neovim**: Run `nvim` in terminal.
- **VS Code**: Run `code` or launch from KDE application menu.
- **Google Antigravity**: Run `antigravity` in terminal or launch from KDE menu.
- **OpenCode**: Run `opencode --version`.
