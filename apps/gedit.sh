#!/bin/bash
source config.sh

if [[ $osname == $archlinux ]]; then
    $missing
fi

if [[ $osname == $debian ]]; then
    sudo apt install gedit -y
fi

if [[ $osname == $fedora ]]; then
    sudo dnf install gedit -y
fi

if [[ $osname == $ubuntu ]]; then
    sudo apt install gedit -y
fi
