#!/bin/bash
source config.sh

if [[ $osname == $archlinux ]]; then
    sudo bash -c "cat strings/config-arch-repo >> /etc/pacman.conf"
    sudo pacman -Syyu

    sudo pacman -S git wget --noconfirm

    sudo pacman -S ufw --noconfirm
    sudo ufw enable
    sudo systemctl enable ufw
    sudo ufw default deny incoming
    sudo ufw default allow outgoing
    sudo ufw reload
fi

if [[ $osname == $debian ]]; then
    sudo bash -c "cat strings/config-debian-repo > /etc/apt/sources.list"

    sudo dpkg --add-architecture i386
    sudo apt update
    sudo apt dist-upgrade -y

    sudo apt install git wget -y

    sudo apt install ufw -y
    sudo ufw enable
    sudo systemctl enable ufw
    sudo ufw default deny incoming
    sudo ufw default allow outgoing
    
    sudo apt install 'firmware-[^microbit-micropython*]*' -y
fi

if [[ $osname == $fedora ]]; then
    link_rpmfusionfree="https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm"
    link_rpmfusionnonfree="https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"

    sudo dnf install $link_rpmfusionfree -y
    sudo dnf install $link_rpmfusionnonfree -y

    sudo dnf install gcc git wget linux-firmware microcode_ctl -y
    sudo dracut -f
fi

if [[ $osname == $ubuntu ]]; then
    sudo apt install git wget tasksel -y

    sudo apt install ufw -y
    sudo ufw enable
    sudo systemctl enable ufw
    sudo ufw default deny incoming
    sudo ufw default allow outgoing
fi
