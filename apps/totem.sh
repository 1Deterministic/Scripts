#!/bin/bash
source config.sh

if [[ $osname == $archlinux ]]; then
    sudo pacman -S totem --noconfirm
fi

if [[ $osname == $debian ]]; then
    sudo apt install totem -y
fi

if [[ $osname == $fedora ]]; then
    sudo dnf install totem -y
fi

if [[ $osname == $ubuntu ]]; then
    sudo apt install totem -y
fi
