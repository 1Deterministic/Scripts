#!/bin/bash
source config.sh

if [[ $osname == "arch-linux" ]]; then
sudo pacman install python --noconfirm
sudo pacman install python-pip --noconfirm
fi

if [[ $osname == "debian-9" ]]; then
sudo apt install python3 -y
sudo apt install python3-pip -y
fi

if [[ $osname == "debian-sid" ]]; then
sudo apt install python3 -y
sudo apt install python3-pip -y
fi

if [[ $osname == "fedora-29" ]]; then
sudo dnf install python -y
sudo dnf install python-pip -y
fi

if [[ $osname == "ubuntu-18.04" ]]; then
sudo apt install python3 -y
sudo apt install python3-pip -y
fi
