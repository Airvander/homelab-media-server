# Homelab Media Server (Ubuntu + Plex)

A minimal media server setup on Ubuntu Server, following [TechHut's guide](https://medium.com/@TechHutTV/turning-an-old-pc-laptop-into-a-media-server-84619f647a12).

## Features
- Ubuntu Server 22.04 LTS
- Plex Media Server (auto-updated via APT)
- SSH remote management
- Disabled suspend-on-lid-close for laptops

## Setup
1. **Install Ubuntu Server**:  
   - Flash ISO via Rufus/Popsicle.
   - Disable LVM, enable OpenSSH during install.

2. **Install Plex**:  
   ```bash
   wget https://downloads.plex.tv/plex-media-server-new/1.19.3.2852-219a9974e/debian/plexmediaserver_1.19.3.2852-219a9974e_amd64.deb
   sudo dpkg -i plexmediaserver_*.deb
   sudo systemctl enable --now plexmediaserver

3.Access Plex:
Open http://<server-ip>:32400/web.

SSH: Port 22 (change to a custom port for security).

Lid Suspend: Disabled in /etc/systemd/logind.conf.

# Homelab Media Server (Ubuntu + Docker)

Combines:
1. **Native Plex Setup** (for direct installs)  
2. **Dockerized Services** (Portainer, Jellyfin, etc.) from [TechHut’s guide](https://www.youtube.com/watch?v=SNYnOYWoeAw).

## Features
- Ubuntu Server 22.04 LTS
- **Option 1**: Native Plex (auto-updated via APT)
- **Option 2**: Dockerized Plex/Jellyfin + other services
- Portainer for GUI Docker management
- SSH remote access

## Setup
### 1. Ubuntu Server
- Follow [ubuntu_setup.md](docs/ubuntu_setup.md) for installation.

### 2. Docker
```bash
# Run the setup script
chmod +x scripts/docker_setup.sh
./scripts/docker_setup.sh

3. Deploy Services
bash
# Start Portainer (Docker management UI)
cd docker/portainer
docker compose up -d
Access Portainer at http://<server-ip>:9000.

4. Plex (Choose One)
Native Install: See docs/ubuntu_setup.md.

Dockerized:

bash
cd docker/plex
docker compose up -d
