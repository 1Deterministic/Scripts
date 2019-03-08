#!/bin/bash
source config.sh

if [[ $osname == "arch-linux" ]]; then
sudo pacman -S git --noconfirm
fi

if [[ $osname == "debian-9" ]]; then
sudo apt install git -y
fi

if [[ $osname == "debian-sid" ]]; then
sudo apt install git -y
fi

if [[ $osname == "fedora-29" ]]; then
sudo dnf install git -y
fi

if [[ $osname == "ubuntu-18.04" ]]; then
sudo apt install git -y
fi