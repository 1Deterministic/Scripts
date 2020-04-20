#!/bin/bash
source config.sh

# common to all linux distros
if basedOn "$osname" "$linux"; then
    # code that has to be executed before downstream-specific distros
    # common to arch-based distros
    if basedOn "$osname" "$archlinux"; then
        # code that has to be executed before downstream-specific distros
        sudo pacman -S gnome gnome-software-packagekit-plugin --noconfirm
        sudo systemctl enable gdm NetworkManager
        # arch linux-specific
        if [[ "$osname" == "$archlinux" ]]; then
            :
        fi
        # code that has to be executed after downstream-specific distros
    # common to debian-based distros
    elif basedOn "$osname" "$debian"; then
        # code that has to be executed before downstream-specific distros
        # debian-specific
        if [[ "$osname" == "$debian" ]]; then
            sudo apt install gnome-core nautilus -y
            sudo systemctl enable gdm wpa_supplicant
            sudo systemctl set-default graphical.target
            sudo bash -c "cat strings/config-networkmanager-managed > /etc/NetworkManager/NetworkManager.conf"
            # as NetworkManager will be used, this will disable the default network handler
            sudo awk -i inplace '$0~/^allow-hotplug|^iface|^[" "]*address|^[" "]*netmask|^[" "]*gateway/{$0="# "$0};1' "/etc/network/interfaces"
        # common to ubuntu-based distros
        elif basedOn "$osname" "$ubuntu"; then
            # code that has to be executed before downstream-specific distros
            # ubuntu-specific
            if [[ "$osname" == "$ubuntu" ]]; then
                :
            fi
            # code that has to be executed after downstream-specific distros
        fi
        # code that has to be executed after downstream-specific distros
    # common to fedora-based distros
    elif basedOn "$osname" "$fedora"; then
        # code that has to be executed before downstream-specific distros
        sudo dnf groupinstall "GNOME Desktop Environment" -y
        sudo systemctl enable gdm
        sudo systemctl set-default graphical.target
        sudo dracut -f
        # fedora-specific
        if [[ "$osname" == "$fedora" ]]; then
            :
        fi
        # code that has to be executed after downstream-specific distros
    fi
    # code that has to be executed after downstream-specific distros
fi
