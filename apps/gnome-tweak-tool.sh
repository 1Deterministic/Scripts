#!/bin/bash
source config.sh

if [[ $osname == $archlinux ]]; then
    sudo pacman -S gnome-tweak-tool --noconfirm
fi

if [[ $osname == $debian ]]; then
    sudo apt install gnome-tweak-tool -y
fi

if [[ $osname == $fedora ]]; then
    sudo dnf install gnome-tweak-tool -y
fi

if [[ $osname == $ubuntu ]]; then
    sudo apt install gnome-tweak-tool -y
fi
