#!/bin/bash
source config.sh

if [[ $osname == $archlinux ]]; then
    sudo pacman -S arduino arduino-avr-core --noconfirm
    sudo usermod -aG uucp $username
    sudo usermod -aG lock $username
fi

if [[ $osname == $debian ]]; then
    sudo apt install arduino -y
    sudo usermod -aG dialout $username
fi

if [[ $osname == $fedora ]]; then
    sudo dnf install arduino -y
    sudo usermod -aG dialout $username
    sudo usermod -aG lock $username
fi

if [[ $osname == $ubuntu ]]; then
    sudo apt install arduino -y
    sudo usermod -aG dialout $username
fi
