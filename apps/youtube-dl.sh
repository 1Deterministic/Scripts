#!/bin/bash
source config.sh

if [[ $osname == $archlinux ]]; then
    sudo pacman -S youtube-dl --noconfirm
fi

if [[ $osname == $debian ]]; then
    sudo apt install youtube-dl -y
fi

if [[ $osname == $fedora ]]; then
    sudo dnf install youtube-dl -y
fi

if [[ $osname == $ubuntu ]]; then
    sudo apt install youtube-dl -y
fi