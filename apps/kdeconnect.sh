#!/bin/bash
source config.sh

if [[ $osname == $archlinux ]]; then
    sudo pacman -S kdeconnect sshfs --noconfirm
    sudo bash -c "cat strings/ufw-kdeconnect > /etc/ufw/applications.d/kdeconnect"
    sudo ufw allow kdeconnect
    sudo ufw reload
fi

if [[ $osname == $debian ]]; then
    sudo apt install kdeconnect -y
    sudo bash -c "cat strings/ufw-kdeconnect > /etc/ufw/applications.d/kdeconnect"
    sudo ufw allow kdeconnect
    sudo ufw reload
fi

if [[ $osname == $fedora ]]; then
    sudo dnf install kde-connect -y
    sudo firewall-cmd --add-service=kdeconnect --permanent
    sudo firewall-cmd --reload
fi

if [[ $osname == $ubuntu ]]; then
    sudo apt install kdeconnect -y
    sudo bash -c "cat strings/ufw-kdeconnect > /etc/ufw/applications.d/kdeconnect"
    sudo ufw allow kdeconnect
    sudo ufw reload
fi
