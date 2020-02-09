#!/bin/bash
source config.sh

if [[ $osname == $archlinux ]]; then
    $missing
fi

if [[ $osname == $debian ]]; then
    sudo apt install apache2 libapache2-mod-php7.3 -y
fi

if [[ $osname == $fedora ]]; then
    sudo dnf install httpd -y
    sudo systemctl enable httpd
fi

if [[ $osname == $ubuntu ]]; then
    $missing
fi