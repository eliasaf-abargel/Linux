#!/bin/bash

# Function to log messages
log() {
    timestamp=$(date +"%Y-%m-%d %T")
    echo "[$timestamp] $1"
}

# Log start of script
log "Starting setup script..."

# Install curl
log "Installing curl..."
sudo apt-get update
sudo apt-get install -y curl
if [ $? -ne 0 ]; then
    log "Error: Failed to install curl"
    exit 1
fi
log "curl installed successfully"

# Install git
log "Installing git..."
sudo apt-get install -y git
if [ $? -ne 0 ]; then
    log "Error: Failed to install git"
    exit 1
fi
log "git installed successfully"

# Install docker
log "Installing docker..."
sudo apt-get install -y docker.io
if [ $? -ne 0 ]; then
    log "Error: Failed to install docker"
    exit 1
fi
log "docker installed successfully"

# Install docker-compose
log "Installing docker-compose..."
sudo apt-get install -y docker-compose
if [ $? -ne 0 ]; then
    log "Error: Failed to install docker-compose"
    exit 1
fi
log "docker-compose installed successfully"

# Add user to docker group
log "Adding user to docker group..."
sudo usermod -aG docker $USER
newgrp docker
if [ $? -ne 0 ]; then
    log "Error: Failed to add user to docker group"
    exit 1
fi
log "User added to docker group successfully"

# Install minikube
log "Installing minikube..."
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
if [ $? -ne 0 ]; then
    log "Error: Failed to install minikube"
    exit 1
fi
log "minikube installed successfully"

# Install additional tools for docker and Kubernetes
log "Installing additional tools for docker and Kubernetes..."
sudo apt-get install -y kubectl helm
if [ $? -ne 0 ]; then
    log "Error: Failed to install additional tools"
    exit 1
fi
log "Additional tools installed successfully"

# Start minikube
log "Starting minikube..."
minikube start
if [ $? -ne 0 ]; then
    log "Error: Failed to start minikube"
    exit 1
fi
log "minikube started successfully"

# Check minikube status
log "Checking minikube status..."
minikube status
if [ $? -ne 0 ]; then
    log "Error: minikube is not running properly"
    exit 1
fi
log "minikube is running successfully"

# Log completion of script
log "Setup script completed successfully!"
