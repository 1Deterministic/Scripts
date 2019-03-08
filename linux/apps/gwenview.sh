#!/bin/bash
source config.sh

if [[ $osname == "arch-linux" ]]; then
sudo pacman -S gwenview --noconfirm
fi

if [[ $osname == "debian-9" ]]; then
sudo apt install gwenview -y
fi

if [[ $osname == "debian-sid" ]]; then
sudo apt install gwenview -y
fi

if [[ $osname == "fedora-29" ]]; then
sudo dnf install gwenview -y
fi

if [[ $osname == "ubuntu-18.04" ]]; then
$missing
fi