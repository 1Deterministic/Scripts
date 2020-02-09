#!/bin/bash
source config.sh

if [[ $osname == $archlinux ]]; then
    sudo pacman -S steam steam-native-runtime --noconfirm
fi

if [[ $osname == $debian ]]; then
    sudo apt install steam libcurl4 -y
    sudo ln -s /usr/lib/x86_64-linux-gnu/libcurl.so.4 /usr/lib/x86_64-linux-gnu/libcurl.so
fi

if [[ $osname == $fedora ]]; then
    sudo dnf install steam -y
fi

if [[ $osname == $ubuntu ]]; then
    sudo apt install steam xboxdrv -y
fi
