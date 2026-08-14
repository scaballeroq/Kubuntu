---
sidebar_position: 8
---

# Container Management with Podman & Quadlets in Kubuntu

This guide details the **Podman** container architecture with **Quadlets** and **systemd** integration on Kubuntu.

Unlike traditional Docker, Podman is **daemonless** and **rootless** by default, running containers as user-managed systemd units.

---

## 1. Core Podman Installation (`install/podman-install.sh`)

Installs Podman, networking tools, and configures rootless operation:

```bash
./Podman/install/podman-install.sh
# Or using just:
just podman-install
```

### Components & Settings:
- **`podman`**, **`podman-compose`**, **`uidmap`**, **`slirp4netns`**, **`passt`**.
- **Overlay storage** with `fuse-overlayfs`.
- **User Linger**: `loginctl enable-linger "$USER"` to keep user containers running in the background.
- **SubUID/SubGID**: Allocation of `100000-165535` UID/GID ranges.
- **User Socket**: Enables `podman.socket` and exports `DOCKER_HOST="unix://$XDG_RUNTIME_DIR/podman/podman.sock"`.

---

## 2. Quadlets Setup (`install/quadlets-setup.sh`)

Quadlets allows defining declarative container, network, volume, and target files (`.container`, `.network`, `.volume`, `.target`) automatically translated into systemd user services.

```bash
./Podman/install/quadlets-setup.sh
# Or using just:
just quadlets-setup
```

---

## 3. Project Management CLI (`podman-utils`)

The [`Podman/lib/podman-utils.sh`](file:///home/caballero/Workspace/Repositorios/Linux/Kubuntu/Podman/lib/podman-utils.sh) CLI provides project creation, control, and monitoring:

```bash
# Create project from template
podman-utils create python-postgres my-api
podman-utils create fullstack my-app

# Start, check logs and status
podman-utils start my-api
podman-utils logs my-api
podman-utils status my-api

# Stop or destroy
podman-utils stop my-api
podman-utils destroy my-api
```

---

## 4. Available Project Templates

| Template | Components | Primary Use Case |
| :--- | :--- | :--- |
| `python-postgres` | Python API (Hot-Reload) + PostgreSQL 16 | REST APIs with FastAPI / Flask |
| `python-postgres-redis` | Python API + PostgreSQL + Redis | APIs with Celery workers / Cache |
| `fullstack` | Frontend (Node) + Backend (Python) + Postgres + Keycloak + Traefik | Complete web applications with OAuth2/OIDC |

---

## 5. Global Shared Services

- `traefik.container`: Global reverse proxy.
- `keycloak.container`: IAM authentication server.
- `postgres-global.container`: Multi-tenant PostgreSQL database.
- `redis-global.container`: Shared Redis caching instance.
