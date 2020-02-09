#!/bin/bash
source config.sh

if [[ $osname == $archlinux ]]; then
    $missing
fi

if [[ $osname == $debian ]]; then
    sudo apt install php7.3 php7.3-mysql -y
fi

if [[ $osname == $fedora ]]; then
    sudo dnf -y install php php-cli php-php-gettext php-mbstring php-mcrypt php-mysqlnd php-pear php-curl php-gd php-xml php-bcmath php-zip -y
fi

if [[ $osname == $ubuntu ]]; then
    $missing
fi