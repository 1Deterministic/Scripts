#!/bin/bash
source config.sh

if [[ $osname == $archlinux ]]; then
    sudo pacman -S gnome --noconfirm
    sudo pacman -S gnome-software-packagekit-plugin --noconfirm
    sudo systemctl enable gdm.service
    sudo systemctl enable NetworkManager.service
fi

if [[ $osname == $debian ]]; then
    sudo apt install gnome-core -y
    sudo apt install nautilus -y
fi

if [[ $osname == $fedora ]]; then
    sudo dnf groupinstall "GNOME Desktop Environment" -y
    sudo systemctl enable gdm
    sudo systemctl set-default graphical.target
    sudo dracut -f
fi

if [[ $osname == $ubuntu ]]; then
    $missing
fi
