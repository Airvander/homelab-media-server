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

