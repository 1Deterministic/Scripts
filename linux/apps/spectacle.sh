#!/bin/bash
source config.sh

if [[ $osname == "arch-linux" ]]; then
sudo pacman -S spectacle --noconfirm
fi

if [[ $osname == "debian-9" ]]; then
sudo apt install kde-spectacle -y
fi

if [[ $osname == "debian-sid" ]]; then
sudo apt install kde-spectacle -y
fi

if [[ $osname == "fedora-29" ]]; then
sudo dnf install spectacle -y
fi

if [[ $osname == "ubuntu-18.04" ]]; then
$missing
fi