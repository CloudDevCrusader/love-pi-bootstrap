#!/bin/bash

# Portrainer

docker volume create portainer_data

docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:2.21.2

# JDownloader

chmod a+x ./scripts/jdownloader2.installer.sh
./scripts/jdownloader2.installer.sh

# Fonts
oh-my-posh font install Hack

oh-my-posh font install Meslo

flatpak install sabnzb