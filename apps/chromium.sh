#!/bin/bash
source config.sh

if [[ $osname == $archlinux ]]; then
    sudo pacman -S chromium --noconfirm
fi

if [[ $osname == $debian ]]; then
    sudo apt install chromium -y
fi

if [[ $osname == $fedora ]]; then
    sudo dnf install chromium -y
fi

if [[ $osname == $ubuntu ]]; then
    sudo apt install chromium -y
fi