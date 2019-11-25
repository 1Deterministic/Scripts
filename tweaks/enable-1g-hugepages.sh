#!/bin/bash
source config.sh

if [[ $osname == $archlinux ]]; then
    sudo bash -c "cat strings/config-hugepages > /usr/lib/sysctl.d/10-hugepages.conf"
fi

if [[ $osname == $debian ]]; then
    sudo bash -c "cat strings/config-hugepages > /usr/lib/sysctl.d/10-hugepages.conf"
fi

if [[ $osname == $fedora ]]; then
    sudo bash -c "cat strings/config-hugepages > /usr/lib/sysctl.d/10-hugepages.conf"
fi

if [[ $osname == $ubuntu ]]; then
    sudo bash -c "cat strings/config-hugepages > /usr/lib/sysctl.d/10-hugepages.conf"
fi 
