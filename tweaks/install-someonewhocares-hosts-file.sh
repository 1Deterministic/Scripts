#!/bin/bash
source config.sh

link_someonewhocares_hosts="http://someonewhocares.org/hosts/hosts"

if [[ $osname == $archlinux ]]; then
    wget $link_someonewhocares_hosts -O /tmp/hosts
    sudo mv /tmp/hosts /etc/hosts
fi

if [[ $osname == $debian ]]; then
    wget $link_someonewhocares_hosts -O /tmp/hosts
    sudo mv /tmp/hosts /etc/hosts
fi

if [[ $osname == $fedora ]]; then
    wget $link_someonewhocares_hosts -O /tmp/hosts
    sudo mv /tmp/hosts /etc/hosts
fi

if [[ $osname == $ubuntu ]]; then
    wget $link_someonewhocares_hosts -O /tmp/hosts
    sudo mv /tmp/hosts /etc/hosts
fi
