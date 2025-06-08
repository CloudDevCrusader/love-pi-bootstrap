#!/bin/bash
# https://community-scripts.github.io/ProxmoxVE/scripts?id=all-templates

curl -L https://mirrors.apqa.cn/proxmox/debian/pveport.gpg | sudo tee /usr/share/keyrings/pveport.gpg >/dev/null
echo "deb [deb=arm64 signed-by=/usr/share/keyrings/pveport.gpg] https://mirrors.apqa.cn/proxmox/debian/pve bookworm port" | sudo tee  /etc/apt/sources.list.d/pveport.list
sudo apt update && sudo apt upgrade
sudo apt install ifupdown2 
sudo apt install proxmox-ve postfix open-iscsi pve-edk2-firmware-aarch64

