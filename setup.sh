#!/bin/bash

# Add apt Repositories
sudo add-apt-repository ppa:flatpak/stable
sudo curl -sS https://downloads.1password.com/linux/keys/1password.asc | \
sudo gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg
sudo echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/$(dpkg --print-architecture) stable main" |
sudo tee /etc/apt/sources.list.d/1password.list
sudo mkdir -p /etc/debsig/policies/AC2D62742012EA22/
sudo curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol | \
sudo tee /etc/debsig/policies/AC2D62742012EA22/1password.pol
sudo mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22
sudo curl -sS https://downloads.1password.com/linux/keys/1password.asc | \
sudo gpg --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg
sudo apt update
sudo apt full-upgrade

sudo apt install git zsh rsync flatpak curl fzf snap ntfs-3g gnome-terminal gnome-software-plugin-flatpak \
    uidmap android-sdk-platform-tools gnome-commander gnome-shell-extensions gnome-shell-extension-manager apper -y

# Install Ohmyzsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Pi-Apps

wget -qO- https://raw.githubusercontent.com/Botspot/pi-apps/master/install | bash

~/pi-apps/manage install "More RAM"
~/pi-apps/manage install "Synapse"
~/pi-apps/manage install "BleachBit"
~/pi-apps/manage install "Snap Store"
~/pi-apps/manage install "Brave"
~/pi-apps/manage install "Oh my Posh"
~/pi-apps/manage install "Timeshift"

# rpi-update https://github.com/Hexxeh/rpi-update

sudo curl -L --output /usr/bin/rpi-update https://raw.githubusercontent.com/Hexxeh/rpi-update/master/rpi-update && sudo chmod +x /usr/bin/rpi-update

# Install Docker

curl -sSL https://get.docker.com | sh
sudo usermod -aG docker $USER
dockerd-rootless-setuptool.sh install
export PATH=/usr/bin:$PATH
export DOCKER_HOST=unix:///run/user/1002/docker.sock
sudo loginctl enable-linger cloudcrusader

# Flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Install Coder

curl -L https://coder.com/install.sh | sh

## Install Ohmyzsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

omz plugin enable nvm zsh-interactive-cd zsh-navigation-tools docker pip python ubuntu rsync history ssh sudo urltool
# Install 1password

curl -sSO https://downloads.1password.com/linux/tar/stable/aarch64/1password-latest.tar.gz
sudo tar -xf 1password-latest.tar.gz && sudo mkdir -p /opt/1Password
sudo mv 1password-*/* /opt/1Password
Sudo /opt/1Password/after-install.sh

# 1password-cli (op)

sudo apt install 1password-cli

# Install SDK Man
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install java 21.0.4-tem
#sdk default java 21.0.4-tem

# Install JDownloader

chmod a+x ./scripts/jdownloader2.installer.sh
sh ./scripts/jdownloader2.installer.sh

# Install NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

nvm install --lts

# install distrobox
curl -s https://raw.githubusercontent.com/89luca89/distrobox/main/install | sudo sh
