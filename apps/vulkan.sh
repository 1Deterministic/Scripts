#!/bin/bash
source config.sh

if [[ $osname == $archlinux ]]; then
    sudo pacman -S vulkan-mesa-layer vulkan-icd-loader vulkan-intel vulkan-radeon lib32-vulkan-mesa-layer lib32-vulkan-icd-loader lib32-vulkan-intel lib32-vulkan-radeon --noconfirm
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
