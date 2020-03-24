#!/bin/bash
source config.sh

# common to all linux distros
if basedOn "$osname" "$linux"; then
    # code that has to be executed before downstream-specific distros
    # common to arch-based distros
    if basedOn "$osname" "$archlinux"; then
        # code that has to be executed before downstream-specific distros
        sudo bash -c "cat strings/config-arch-repo >> /etc/pacman.conf"
        sudo pacman -Syyu
        sudo pacman -S git wget ufw --noconfirm
        sudo ufw enable
        sudo systemctl enable ufw
        sudo ufw default deny incoming
        sudo ufw default allow outgoing
        sudo ufw reload
        # arch linux-specific
        if [[ "$osname" == "$archlinux" ]]; then
            :
        fi
        # code that has to be executed after downstream-specific distros
    # common to debian-based distros
    elif basedOn "$osname" "$debian"; then
        # code that has to be executed before downstream-specific distros
        sudo apt install git wget ufw -y
        sudo ufw enable
        sudo systemctl enable ufw
        sudo ufw default deny incoming
        sudo ufw default allow outgoing
        # debian-specific
        if [[ "$osname" == "$debian" ]]; then
            sudo bash -c "cat strings/config-debian-repo > /etc/apt/sources.list"
            sudo dpkg --add-architecture i386
            sudo apt update
            sudo apt dist-upgrade -y
            sudo apt install 'firmware-[^microbit-micropython*]*' -y
        # common to ubuntu-based distros
        elif basedOn "$osname" "$ubuntu"; then
            # code that has to be executed before downstream-specific distros
            sudo apt install tasksel -y
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
        sudo dnf install gcc git wget linux-firmware microcode_ctl -y
        sudo dracut -f
        # fedora-specific
        if [[ "$osname" == "$fedora" ]]; then
            link_rpmfusionfree="https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm"
            link_rpmfusionnonfree="https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"
            sudo dnf install "$link_rpmfusionfree" "$link_rpmfusionnonfree" -y
        fi
        # code that has to be executed after downstream-specific distros
    fi
    # code that has to be executed after downstream-specific distros
fi