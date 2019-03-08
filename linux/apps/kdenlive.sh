#!/bin/bash
source config.sh

if [[ $osname == "arch-linux" ]]; then
sudo pacman -S kdenlive frei0r-plugins --noconfirm
fi

if [[ $osname == "debian-9" ]]; then
sudo apt install kdenlive -y
fi

if [[ $osname == "debian-sid" ]]; then
sudo apt install kdenlive -y
fi

if [[ $osname == "fedora-29" ]]; then
sudo dnf install kdenlive -y
fi

if [[ $osname == "ubuntu-18.04" ]]; then
sudo apt install kdenlive -y
fi