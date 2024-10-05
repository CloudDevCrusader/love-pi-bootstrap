#!/bin/bash

# Install Pi-Apps

wget -qO- https://raw.githubusercontent.com/Botspot/pi-apps/master/install | bash

~/pi-apps/manage install "More RAM"

# Add apt Repositories
sudo add-apt-repository ppa:flatpak/stable
sudo apt update
sudo apt install flatpak curl gnome-software-plugin-flatpak uidmap -y

## Install Docker

curl -sSL https://get.docker.com | sh
sudo usermod -aG docker $USER
dockerd-rootless-setup.sh install

# Flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

## Install Apt Packages

sudo apt install fzf git curl zsh snap -y

# Snap Packages

snap install snap-store

## Install Ohmyzsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install 1password

curl -sSO https://downloads.1password.com/linux/tar/stable/aarch64/1password-latest.tar.gz
sudo tar -xf 1password-latest.tar.gz
sudo mkdir -p /opt/1Password
sudo mv 1password-*/* /opt/1Password

# Install SDK Man
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install java
sdk default java 

# Install NVM

