#!/bin/bash
source config.sh

link_virtualbox_key="https://www.virtualbox.org/download/oracle_vbox_2016.asc"
link_virtualbox_ext="https://download.virtualbox.org/virtualbox/5.2.16/Oracle_VM_VirtualBox_Extension_Pack-5.2.16.vbox-extpack"

if [[ $osname == $archlinux ]]; then
    sudo pacman -S virtualbox-host-modules-arch --noconfirm
    sudo pacman -S virtualbox --noconfirm
    git clone https://aur.archlinux.org/virtualbox-ext-oracle
    cd virtualbox-ext-oracle
    makepkg -si --noconfirm
    cd ..
    rm -rf virtualbox-ext-oracle
    sudo usermod -aG vboxusers $username
    fi

    if [[ $osname == $debianstable ]]; then
    sudo apt install dkms -y
    sudo apt install build-essential -y
    sudo apt install linux-headers-$(uname -r) -y
    sudo bash -c "cat strings/config-virtualbox-deb-repo > /etc/apt/sources.list.d/virtualbox.list"
    sudo mkdir /tmp/virtualbox
    sudo wget -q $link_virtualbox_key -O /tmp/virtualbox/virtualbox-key.asc
    sudo apt-key add /tmp/virtualbox/virtualbox-key.asc
    sudo apt update
    sudo apt install virtualbox-5.2 -y
    sudo gpasswd -a $username vboxusers
    sudo mkdir /tmp/virtualbox
    sudo wget $link_virtualbox_ext -O /tmp/virtualbox/virtualbox_ext.vbox-extpack
    sudo VBoxManage extpack install --replace /tmp/virtualbox/virtualbox_ext.vbox-extpack
    sudo rm -r /tmp/virtualbox
fi

if [[ $osname == $debiansid ]]; then
    sudo apt install dkms -y
    sudo apt install build-essential -y
    sudo apt install linux-headers-$(uname -r) -y
    sudo apt install virtualbox -y
    sudo gpasswd -a $username vboxusers
    sudo mkdir /tmp/virtualbox
    sudo wget $link_virtualbox_ext -O /tmp/virtualbox/virtualbox_ext.vbox-extpack
    sudo VBoxManage extpack install --replace /tmp/virtualbox/virtualbox_ext.vbox-extpack
    sudo rm -r /tmp/virtualbox
fi

if [[ $osname == $fedora ]]; then
    sudo dnf install dkms -y
    sudo dnf install kernel-devel -y
    sudo dnf install kernel-headers-$(uname -r) -y
    sudo dnf install VirtualBox -y
    sudo adduser $username -g vboxusers
    sudo usermod -a -G vboxusers $username
    sudo mkdir /tmp/virtualbox
    sudo wget $link_virtualbox_ext -O /tmp/virtualbox/virtualbox_ext.vbox-extpack
    sudo VBoxManage extpack install --replace /tmp/virtualbox/virtualbox_ext.vbox-extpack
    sudo rm -r /tmp/virtualbox
fi

if [[ $osname == $ubuntults ]]; then
    sudo apt install dkms -y
    sudo apt install build-essential -y
    sudo apt install linux-headers-$(uname -r) -y
    sudo apt install virtualbox -y
    sudo gpasswd -a $username vboxusers
    sudo apt install virtualbox-ext-pack -y
fi