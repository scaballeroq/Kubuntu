---
sidebar_position: 4
---

# Git Configuration in Kubuntu

This guide details the version control environment and tools provided in the `Git` directory.

The setup includes **Git**, syntax highlighter **Git-Delta**, terminal user interface **Lazygit**, and **GitHub CLI (gh)**.

---

## 1. Git Automation (`git.sh`)

1. **Install Git & Git-Delta**:
   ```bash
   sudo apt update
   sudo apt install -y git git-delta
   ```

2. **User Global Settings**:
   ```bash
   git config --global user.name "Sergio Caballero"
   git config --global user.email "scaballeroq@gmail.com"
   ```

3. **Modern Best Practices**:
   - Default branch: `main`.
   - Rebase on pull: `pull.rebase true`.
   - Default editor: `nvim`.

4. **Visual Highlight (Git-Delta)**:
   ```bash
   git config --global core.pager "delta"
   git config --global interactive.diffFilter "delta --color-only"
   git config --global delta.navigate true
   git config --global delta.light false
   git config --global merge.conflictstyle zdiff3
   ```

5. **Lazygit (TUI)**:
   Automatically downloads and installs the latest official release for your CPU architecture (`x86_64` / `arm64`).

---

## 2. GitHub CLI (`github-cli.sh`)

Installs the official GitHub CLI (`gh`):

```bash
./Git/github-cli.sh
# Or using just:
just git-setup
```

---

## Verification

- **Git-Delta**: Run `git diff` on any repository with changes.
- **Lazygit**: Run `lazygit` inside a git directory.
- **GitHub CLI**: Run `gh --version` or authenticate via `gh auth login`.
