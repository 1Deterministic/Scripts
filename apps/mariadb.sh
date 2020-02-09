#!/bin/bash
source config.sh

if [[ $osname == $archlinux ]]; then
    $missing
fi

if [[ $osname == $debian ]]; then
    sudo apt install mariadb-client mariadb-server -y
fi

if [[ $osname == $fedora ]]; then
    sudo dnf install mariadb-server -y
    sudo systemctl enable mariadb
fi

if [[ $osname == $ubuntu ]]; then
    $missing
fi