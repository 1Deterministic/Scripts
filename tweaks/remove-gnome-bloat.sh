#!/bin/bash
source config.sh

if [[ $osname == $archlinux ]]; then
    sudo pacman -R gnome-boxes gnome-calendar gnome-books gnome-contacts gnome-documents gnome-maps gnome-music gnome-photos simple-scan gnome-todo gnome-weather totem epiphany --noconfirm
    # removing cheese breaks gnome-control-center
    sudo rm /usr/share/applications/avahi-discover.desktop
    sudo rm /usr/share/applications/bssh.desktop
    sudo rm /usr/share/applications/bvnc.desktop
    sudo rm /usr/share/applications/qv4l2.desktop
    sudo rm /usr/share/applications/qvidcap.desktop
    sudo rm /usr/share/applications/nm-connection-editor.desktop
fi

if [[ $osname == $debian ]]; then
    sudo apt purge mutt tracker gnome-logs gnome-disk-utility gnome-contacts yelp totem evince gedit gnome-calculator gnome-characters gnome-font-viewer gnome-system-monitor eog baobab -y
    sudo apt autoremove -y
fi

if [[ $osname == $fedora ]]; then
    sudo dnf remove gnome-boxes gnome-calendar cheese gnome-contacts simple-scan gnome-abrt gnome-documents evolution gnome-photos gnome-maps gnome-weather gnome-clocks rhythmbox totem libreoffice* evince yelp flatpak -y
fi

if [[ $osname == $ubuntu ]]; then
    $missing
fi
