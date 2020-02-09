#!/bin/bash
source config.sh

if [[ $osname == $archlinux ]]; then
    sudo pacman -S gnome gnome-software-packagekit-plugin --noconfirm
    sudo systemctl enable gdm.service
    sudo systemctl enable NetworkManager.service
fi

if [[ $osname == $debian ]]; then
    sudo apt install gnome-core nautilus -y
    sudo systemctl enable wpa_supplicant.service
    sudo bash -c "cat strings/config-networkmanager-managed > /etc/NetworkManager/NetworkManager.conf"
    # as NetworkManager will be used, this will disable the default network handler
    sudo awk -i inplace '$0~/^allow-hotplug|^iface|^[" "]*address|^[" "]*netmask|^[" "]*gateway/{$0="# "$0};1' "/etc/network/interfaces"
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
