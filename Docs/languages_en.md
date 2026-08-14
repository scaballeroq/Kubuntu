---
sidebar_position: 6
---

# Programming Languages Management in Kubuntu

This guide details the installation, management, and maintenance of programming languages and SDKs in the `ProgrammingLanguages` directory.

Runtimes and SDKs are centrally managed via **Mise** and **Rustup**, automated through `justfile` recipes.

---

## 1. Mise Runtime Manager (`mise.sh`)

Mise is a modern CLI version manager replacing `asdf`, `nvm`, or `pyenv`.

1. **Official APT Repository & Installation**:
   ```bash
   sudo apt update
   sudo apt install -y curl gpg
   sudo mkdir -p -m 755 /etc/apt/keyrings
   curl -fsSL https://mise.jdx.dev/gpg-key.pub | sudo gpg --dearmor -o /etc/apt/keyrings/mise-archive-keyring.gpg
   echo "deb [signed-by=/etc/apt/keyrings/mise-archive-keyring.gpg arch=$(dpkg --print-architecture)] https://mise.jdx.dev/deb stable main" | sudo tee /etc/apt/sources.list.d/mise.list > /dev/null
   sudo apt update
   sudo apt install -y mise
   ```

2. **Shell Activation**:
   Modularly loaded via `~/.bashrc.d/mise.sh`:
   ```bash
   eval "$(mise activate bash)"
   ```

---

## 2. Language Runtimes & SDKs

### Node.js (`nodejs.sh` & `angular.sh`)
* **Node.js LTS (22)** with Corepack enabled for `pnpm` and `yarn`:
  ```bash
  mise use --global node@22
  mise exec node@22 -- corepack enable
  ```
* **Angular CLI**:
  ```bash
  mise use --global npm:@angular/cli@latest
  ```

### Python (`python.sh`)
* **Python 3.13** and pip upgrade:
  ```bash
  mise use --global python@3.13
  mise exec python@3.13 -- python -m pip install --upgrade pip
  ```

### .NET SDK (`dotnet.sh`)
* **.NET SDK 10**:
  ```bash
  mise use --global dotnet@10
  ```

### Gemini CLI (`gemini.sh`)
* **Google Gemini CLI**:
  ```bash
  mise use --global npm:@google/gemini-cli@latest
  ```

---

## 3. Rust Environment (`rust.sh`)

Managed via standard **Rustup**:
```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path
```
Includes `cargo-binstall` for downloading pre-compiled Rust CLI binaries without local compilation.

---

## 4. OpenJDK Java (`java.sh`)

```bash
sudo apt install -y default-jre default-jdk libnss3-tools
```

---

## 5. Automation (`justfile`)

```bash
just languages      # Install all languages
just node           # Node.js LTS
just python         # Python 3.13
just rust           # Rust + Cargo
just dotnet         # .NET SDK 10
just java           # OpenJDK
just gemini         # Gemini CLI
```
