#!/bin/bash
source config.sh

if [[ $osname == $archlinux ]]; then
sudo pacman -S keepassxc --noconfirm
fi

if [[ $osname == $debianstable ]]; then
$missing
fi

if [[ $osname == $debiansid ]]; then
$missing
fi

if [[ $osname == $fedora ]]; then
$missing
fi

if [[ $osname == $ubuntults ]]; then
$missing
fi
