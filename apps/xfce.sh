#!/bin/bash
source config.sh

if [[ $osname == $archlinux ]]; then
    sudo pacman -S xorg-server xfce4 xdg-user-dirs lightdm lightdm-gtk-greeter networkmanager pulseaudio pavucontrol file-roller --noconfirm
    sudo systemctl enable lightdm.service
    sudo systemctl enable NetworkManager.service
fi

if [[ $osname == $debian ]]; then
    sudo tasksel install xfce-desktop
fi

if [[ $osname == $fedora ]]; then
    sudo dnf install @xfce-desktop-environment -y
    sudo systemctl enable lightdm
    sudo systemctl set-default graphical.target
    sudo dracut -f
fi

if [[ $osname == $ubuntu ]]; then
    $missing
fi
