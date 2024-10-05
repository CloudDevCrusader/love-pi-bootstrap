#!/bin/bash

# Add apt Repositories
sudo add-apt-repository ppa:flatpak/stable
sudo apt update
sudo apt install git flatpak curl gnome-terminal gnome-software-plugin-flatpak uidmap -y

# Install Pi-Apps

wget -qO- https://raw.githubusercontent.com/Botspot/pi-apps/master/install | bash

~/pi-apps/manage install "More RAM"
~/pi-apps/manage install "Snap Store"
~/pi-apps/manage install "Brave"
~/pi-apps/manage install "Oh my Posh"
~/pi-apps/manage install "Timeshift"

## Install Docker

curl -sSL https://get.docker.com | sh
sudo usermod -aG docker $USER
dockerd-rootless-setup.sh install

# Flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

## Install Apt Packages

sudo apt install fzf zsh snap fuse-3g  -y

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

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
nvm install --lts