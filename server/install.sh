#!/bin/bash
sudo apt update
sudo apt dist-upgrade -y
sudo apt install git zsh rsync flatpak curl build-essential fzf snap ntfs-3g uidmap -y

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo >> /home/cloudcrusader/.zshrc
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/cloudcrusader/.zshrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

brew install gcc
brew install nvm
brew install jandedobbeleer/oh-my-posh/oh-my-posh

# Install Docker
curl -sSL https://get.docker.com | sh
sudo usermod -aG docker $USER
dockerd-rootless-setuptool.sh install

export PATH=/usr/bin:$PATH
export DOCKER_HOST=unix:///run/user/1002/docker.sock
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
 [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

sudo loginctl enable-linger cloudcrusader

wget -qO- https://raw.githubusercontent.com/Botspot/pi-apps/master/install | bash
sudo curl -L --output /usr/bin/rpi-update https://raw.githubusercontent.com/Hexxeh/rpi-update/master/rpi-update && sudo chmod +x /usr/bin/rpi-update

eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/dracula.omp.json)"
nvm install --lts
nvm use --lts