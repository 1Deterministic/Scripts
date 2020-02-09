#!/bin/bash
source config.sh

if [[ $osname == $archlinux ]]; then
    sudo pacman -S kvantum-qt5 qt5ct --noconfirm
    sudo bash -c "cat strings/config-kvantum >> /etc/environment"
fi

if [[ $osname == $debian ]]; then
    sudo apt install qt5-style-kvantum qt5ct -y
    sudo bash -c "cat strings/config-kvantum >> /etc/environment"
fi

if [[ $osname == $fedora ]]; then
    sudo dnf install kvantum qt5ct -y
    sudo bash -c "cat strings/config-kvantum >> /etc/environment"
fi

if [[ $osname == $ubuntu ]]; then
    sudo dnf install kvantum qt5ct -y
    sudo bash -c "cat strings/config-kvantum >> /etc/environment"
fi
