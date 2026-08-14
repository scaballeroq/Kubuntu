---
sidebar_position: 7
---

# High-Performance Virtualization (KVM/QEMU) in Kubuntu

This guide details the installation, configuration, and optimization of the KVM/QEMU virtualization environment provided in [`Virtualizacion/virtualization.sh`](file:///home/caballero/Workspace/Repositorios/Linux/Kubuntu/Virtualizacion/virtualization.sh).

The setup leverages **KVM**, **QEMU**, **Virt-Manager**, native **PipeWire** audio passthrough, **nftables** firewall backend, **`vhost_vsock`** memory sockets, and nested virtualization.

---

## 1. Package Installation (`virtualization.sh`)

Installs QEMU, Libvirt, Virt-Manager, OVMF UEFI firmware with TPM 2.0 support, and performance tools:

```bash
./Virtualizacion/virtualization.sh
# Or using just:
just virtualization
```

---

## 2. Kernel Acceleration, Nested KVM & `vhost_vsock`

1. **Nested KVM**:
   - Sets `nested=1` in `/etc/modprobe.d/kvm_intel.conf` or `kvm_amd.conf` to allow running containers or nested hypervisors inside VMs.
2. **Network and Socket Acceleration**:
   - Loads `vhost_net` and `vhost_vsock` kernel modules in `/etc/modules-load.d/kvm-vhost.conf` for ultra-fast host-to-guest communication.

---

## 3. Native PipeWire Audio Passthrough (`/etc/libvirt/qemu.conf`)

Enables QEMU VMs to output audio directly to the user's PipeWire sound server without permission issues:

```ini
user = "caballero"
group = "kvm"
```

---

## 4. Nftables Firewall Backend (`/etc/libvirt/network.conf`)

Configures `firewall_backend = "nftables"` to integrate seamlessly with modern Linux packet filtering.

---

## 5. VirtIO Windows Drivers

Automatically downloads the latest stable Fedora `virtio-win.iso` to `~/Descargas/virtio-drivers/virtio-win.iso` for storage (`viostor`) and network (`NetKVM`) drivers.

---

## 6. Modular Sockets & Tuned Profile (`virtual-host`)

```bash
sudo systemctl enable --now virtqemud.socket virtnetworkd.socket virtstoraged.socket
sudo systemctl enable --now tuned.service
sudo tuned-adm profile virtual-host
```
