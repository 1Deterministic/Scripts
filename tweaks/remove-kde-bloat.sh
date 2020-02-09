#!/bin/bash
source config.sh

if [[ $osname == $archlinux ]]; then
    sudo pacman -R konqueror write --noconfirm
fi

if [[ $osname == $debian ]]; then
    $missing
fi

if [[ $osname == $fedora ]]; then
    sudo dnf remove dnfdragora system-config-language firewall-config qt5-qdbusviewer calligra* kmail kaddressbook korganizer kolourpaint kcolorchooser kruler akregator falkon kget konqueror konversation krdc krfb ktorrent dragonplayer juk k3b kamoso kpat kmahjongg kmines mediawriter fedora-release-notes gnome-abrt kcharselect kgpg kmag kmousetool kmouth krusader gnome-disk-utility setroubleshoot ibus-cangjie im-chooser system-config-users qt5-qdbusviewer -y
fi

if [[ $osname == $ubuntu ]]; then
    $missing
fi
