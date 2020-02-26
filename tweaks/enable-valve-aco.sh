#!/bin/bash
source config.sh

if [[ $osname == $archlinux ]]; then
    sudo bash -c "cat strings/config-aco >> /etc/environment"
fi

if [[ $osname == $debian ]]; then
    $missing
fi

if [[ $osname == $fedora ]]; then
    $missing
fi

if [[ $osname == $ubuntu ]]; then
    $missing
fi
