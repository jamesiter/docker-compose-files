#!/usr/bin/env bash

# Install docker on Ubuntu/Debian system

install_docker() {
	echo "Install Docker..."
	cat scripts/docker.sh | sh
cat > /etc/docker/daemon.json << EOF
{
    "insecure-registries":["hub.ez-iso.com:80"],
    "registry-mirrors": ["http://hub.ez-iso.com:80", "https://pee6w651.mirror.aliyuncs.com"]
}
EOF
        
        systemctl restart docker
        systemctl enable docker
	#nohup sudo docker daemon --api-cors-header="*" -H tcp://0.0.0.0:2375 -H unix:///var/run/docker.sock&
	echo "Docker Installation Done"
}

install_docker_compose() {
	echo "Install Docker-Compose..."
	command -v "curl" >/dev/null 2>&1 || sudo apt-get update && apt-get install curl -y
        yum install docker-compose -y
	docker-compose --version
	echo "Docker-Compose Installation Done"
}

command -v "docker" >/dev/null 2>&1 && echo "Docker already installed" || install_docker

command -v "docker-compose" >/dev/null 2>&1 && echo "Docker-Compose already installed" || install_docker_compose
