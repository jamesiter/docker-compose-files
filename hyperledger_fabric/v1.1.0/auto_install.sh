#!/bin/bash

make setup

cat > /etc/docker/daemon.json << EOF
{
    "insecure-registries":["hub.ez-iso.com:80"],
    "registry-mirrors": ["http://hub.ez-iso.com:80", "https://pee6w651.mirror.aliyuncs.com"]
}
EOF

systemctl restart docker
systemctl enable docker

