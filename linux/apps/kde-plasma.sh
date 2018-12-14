#!/bin/bash
source config.sh

if [[ $osname == "arch-linux" ]]; then
sudo pacman -S plasma-meta kdebase kde-gtk-config networkmanager print-manager cups haveged --noconfirm
sudo systemctl enable haveged NetworkManager sddm org.cups.cupsd.service
sudo pacman -S xdg-user-dirs --noconfirm
fi

if [[ $osname == "debian-9" ]]; then
sudo apt install kde-plasma-desktop sddm-theme-debian-breeze -y
sudo systemctl enable sddm
sudo apt install plasma-nm -y
sudo systemctl enable wpa_supplicant.service
sudo bash -c "cat > /etc/NetworkManager/NetworkManager.conf <<- EOM
[main]
plugins=ifupdown,keyfile

[ifupdown]
managed=true

[device]
wifi.scan-rand-mac-address=no
EOM"
fi

if [[ $osname == "debian-sid" ]]; then
sudo apt install kde-plasma-desktop sddm-theme-debian-breeze -y
sudo systemctl enable sddm
sudo apt install plasma-nm -y
sudo systemctl enable wpa_supplicant.service
sudo bash -c "cat > /etc/NetworkManager/NetworkManager.conf <<- EOM
[main]
plugins=ifupdown,keyfile

[ifupdown]
managed=true

[device]
wifi.scan-rand-mac-address=no
EOM"
fi

if [[ $osname == "fedora-29" ]]; then
$missing
fi

if [[ $osname == "ubuntu-18.04" ]]; then
$missing
fi
