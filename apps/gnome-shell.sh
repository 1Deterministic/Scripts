#!/bin/bash
source config.sh

if [[ $osname == $archlinux ]]; then
    sudo pacman -S gnome --noconfirm
    sudo pacman -S gnome-software-packagekit-plugin --noconfirm
    sudo systemctl enable gdm.service
    sudo systemctl enable NetworkManager.service
fi

if [[ $osname == $debianstable ]]; then
    sudo apt install gnome-core -y
fi

if [[ $osname == $debiansid ]]; then
    sudo apt install gnome-core -y
fi

if [[ $osname == $fedora ]]; then
    $missing
fi

if [[ $osname == $ubuntults ]]; then
    $missing
fi