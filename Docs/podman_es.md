---
sidebar_position: 8
---

# Gestión de Contenedores con Podman y Quadlets en Kubuntu

Esta guía detalla la arquitectura de contenedores **Podman** con soporte nativo de **Quadlets** e integración con **systemd** en Kubuntu.

A diferencia de Docker tradicional, Podman funciona de manera **sin demonio (daemonless)** y **sin privilegios de root (rootless)**, ejecutando los contenedores como servicios administrados directamente por systemd del usuario.

---

## 1. Instalación de Podman Core (`install/podman-install.sh`)

Instala Podman, herramientas de red y configuración rootless:

```bash
./Podman/install/podman-install.sh
# O usando just:
just podman-install
```

### Componentes y Configuración:
- **`podman`**, **`podman-compose`**, **`uidmap`**, **`slirp4netns`**, **`passt`**.
- **Almacenamiento overlay** con `fuse-overlayfs`.
- **Linger de usuario**: `loginctl enable-linger "$USER"` para permitir la ejecución persistente de contenedores tras el logout.
- **SubUID/SubGID**: Asignación de rangos `100000-165535`.
- **Socket de usuario**: Habilita `podman.socket` y exporta `DOCKER_HOST="unix://$XDG_RUNTIME_DIR/podman/podman.sock"`.

---

## 2. Configuración de Quadlets (`install/quadlets-setup.sh`)

Quadlets permite definir contenedores, redes y volúmenes mediante archivos declarativos (`.container`, `.network`, `.volume`, `.target`) que systemd convierte automáticamente en servicios de usuario.

```bash
./Podman/install/quadlets-setup.sh
# O usando just:
just quadlets-setup
```

---

## 3. CLI de Gestión de Proyectos (`podman-utils`)

El CLI [`Podman/lib/podman-utils.sh`](file:///home/caballero/Workspace/Repositorios/Linux/Kubuntu/Podman/lib/podman-utils.sh) permite crear, arrancar, detener y monitorear proyectos basados en plantillas:

```bash
# Crear un proyecto desde una plantilla
podman-utils create python-postgres mi-api
podman-utils create fullstack mi-app

# Iniciar, ver logs y estado
podman-utils start mi-api
podman-utils logs mi-api
podman-utils status mi-api

# Detener o destruir
podman-utils stop mi-api
podman-utils destroy mi-api
```

---

## 4. Plantillas de Proyectos Disponibles

| Plantilla | Componentes | Uso Principal |
| :--- | :--- | :--- |
| `python-postgres` | Python API (Hot-Reload) + PostgreSQL 16 | APIs REST con FastAPI / Flask |
| `python-postgres-redis` | Python API + PostgreSQL + Redis | APIs con colas Celery / Cache |
| `fullstack` | Frontend (Node) + Backend (Python) + Postgres + Keycloak + Traefik | Aplicaciones web completas con OAuth2/OIDC |

---

## 5. Servicios Globales Compartidos

Servicios comunes para reutilizar entre múltiples proyectos:
- `traefik.container`: Proxy inverso global.
- `keycloak.container`: Servidor de autenticación IAM.
- `postgres-global.container`: Base de datos PostgreSQL compartida.
- `redis-global.container`: Almacén en memoria Redis compartido.

Instalación:
```bash
podman-utils install-global traefik
podman-utils install-global postgres-global
```
