---
sidebar_position: 1
---

# Security Configuration in Kubuntu

This guide details the security hardening process optimized for a developer workstation in Kubuntu, as automated in [`Setup/seguridad.sh`](file:///home/caballero/Workspace/Repositorios/Linux/Kubuntu/Setup/seguridad.sh).

The setup covers firewall rules compatible with KVM/Podman, SSH protection, Fail2ban, and DNS privacy.

---

## 1. Firewall (UFW) Configuration & KVM/Podman Routing

Uses Uncomplicated Firewall (UFW) configured to support virtual machines and containers seamlessly:

1. **Install UFW & Fail2ban**:
   ```bash
   sudo apt update
   sudo apt install -y ufw fail2ban
   ```

2. **KVM (`virbr0`) & Podman Compatibility (`DEFAULT_FORWARD_POLICY`)**:
   Enables packet forwarding in `/etc/default/ufw` to prevent UFW from breaking VM network traffic:
   ```bash
   sudo sed -i 's/^DEFAULT_FORWARD_POLICY=.*/DEFAULT_FORWARD_POLICY="ACCEPT"/' /etc/default/ufw
   sudo ufw route allow in on virbr0
   ```

3. **Policies & Rate Limiting**:
   - Default deny incoming (`sudo ufw default deny incoming`).
   - Default allow outgoing (`sudo ufw default allow outgoing`).
   - **SSH Rate Limiting**: `sudo ufw limit ssh` protects against brute-force attacks across any Wi-Fi network.
   - **Cockpit**: Protected with `sudo ufw limit 9090/tcp`.

4. **Fail2ban**:
   Enabled automatically (`sudo systemctl enable --now fail2ban.service`) to ban malicious IP attempts.

---

## 2. DNS Privacy (DNS-over-TLS) (`seguridad-dot.sh`)

Encrypts DNS queries via Cloudflare DNS using `systemd-resolved`:

```bash
./Setup/seguridad-dot.sh
```

Verify with:
```bash
resolvectl status
```
