Docker Setup
Add a docker_setup.sh script to automate Docker installation:

bash
#!/bin/bash
# Install Docker
curl -fsSL https://get.docker.com | sh
sudo usermod -aG docker $USER
newgrp docker

# Install Docker Compose
sudo apt install -y docker-compose-plugin
