#!/bin/bash
source config.sh

link_virtualbox_ext52="https://download.virtualbox.org/virtualbox/5.2.16/Oracle_VM_VirtualBox_Extension_Pack-5.2.16.vbox-extpack"
link_virtualbox_ext61="https://download.virtualbox.org/virtualbox/6.1.2/Oracle_VM_VirtualBox_Extension_Pack-6.1.2.vbox-extpack"

if [[ $osname == $archlinux ]]; then
    sudo pacman -S virtualbox-host-modules-arch virtualbox --noconfirm
    sudo usermod -aG vboxusers $username
    mkdir /tmp/virtualbox
    wget $link_virtualbox_ext61 -O /tmp/virtualbox/virtualbox_ext.vbox-extpack
    sudo VBoxManage extpack install --replace /tmp/virtualbox/virtualbox_ext.vbox-extpack
    rm -r /tmp/virtualbox
fi

if [[ $osname == $debian ]]; then
    sudo apt install dkms build-essential linux-headers-$(uname -r) virtualbox -y
    sudo gpasswd -a $username vboxusers
    mkdir /tmp/virtualbox
    wget $link_virtualbox_ext52 -O /tmp/virtualbox/virtualbox_ext.vbox-extpack
    sudo VBoxManage extpack install --replace /tmp/virtualbox/virtualbox_ext.vbox-extpack
    rm -r /tmp/virtualbox
fi

if [[ $osname == $fedora ]]; then
    sudo dnf install dkms install kernel-devel kernel-headers-$(uname -r) VirtualBox -y
    sudo adduser $username -g vboxusers
    sudo usermod -a -G vboxusers $username
    mkdir /tmp/virtualbox
    wget $link_virtualbox_ext61 -O /tmp/virtualbox/virtualbox_ext.vbox-extpack
    sudo VBoxManage extpack install --replace /tmp/virtualbox/virtualbox_ext.vbox-extpack
    rm -r /tmp/virtualbox
fi

if [[ $osname == $ubuntu ]]; then
    sudo apt install dkms -y build-essential linux-headers-$(uname -r) virtualbox -y
    sudo usermod -a -G vboxusers $username
    mkdir /tmp/virtualbox
    wget $link_virtualbox_ext52 -O /tmp/virtualbox/virtualbox_ext.vbox-extpack
    sudo VBoxManage extpack install --replace /tmp/virtualbox/virtualbox_ext.vbox-extpack
    rm -r /tmp/virtualbox
fi
