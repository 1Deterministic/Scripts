#!/bin/bash
source config.sh

if [[ $osname == $archlinux ]]; then
    sudo pacman -S lutris --noconfirm
fi

if [[ $osname == $debian ]]; then
    $missing
fi

if [[ $osname == $fedora ]]; then
    sudo dnf install lutris -y
fi

if [[ $osname == $ubuntu ]]; then
    $missing
fi
