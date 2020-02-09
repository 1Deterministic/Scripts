#!/bin/bash
source config.sh

if [[ $osname == $archlinux ]]; then
    $missing
fi

if [[ $osname == $debian ]]; then
    sudo apt install eog -y
fi

if [[ $osname == $fedora ]]; then
    sudo dnf install eog -y
fi

if [[ $osname == $ubuntu ]]; then
    sudo apt install eog -y
fi
