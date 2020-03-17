#!/bin/bash
source config.sh

if [[ $osname == $archlinux ]]; then
    $missing
fi

if [[ $osname == $debian ]]; then
    sudo apt install nodejs npm -y
    npm config set ignore-scripts true
fi

if [[ $osname == $fedora ]]; then
    sudo dnf install nodejs -y
    npm config set ignore-scripts true
fi

if [[ $osname == $ubuntu ]]; then
    $missing
fi
