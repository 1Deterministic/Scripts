#!/bin/bash
source config.sh

# common to all linux distros
if basedOn "$osname" "$linux"; then
    # code that has to be executed before downstream-specific distros
    link_virtualbox_ext52="https://download.virtualbox.org/virtualbox/5.2.16/Oracle_VM_VirtualBox_Extension_Pack-5.2.16.vbox-extpack"
    link_virtualbox_ext61="https://download.virtualbox.org/virtualbox/6.1.2/Oracle_VM_VirtualBox_Extension_Pack-6.1.2.vbox-extpack"
    # common to arch-based distros
    if basedOn "$osname" "$archlinux"; then
        # code that has to be executed before downstream-specific distros
        sudo pacman -S virtualbox-host-modules-arch virtualbox --noconfirm
        sudo usermod -aG vboxusers "$username"
        mkdir "/tmp/virtualbox"
        wget "$link_virtualbox_ext61" -O "/tmp/virtualbox/Oracle_VM_VirtualBox_Extension_Pack-6.1.2.vbox-extpack"
        sudo VBoxManage extpack install --replace "/tmp/virtualbox/Oracle_VM_VirtualBox_Extension_Pack-6.1.2.vbox-extpack"
        rm -r "/tmp/virtualbox"
        # arch linux-specific
        if [[ "$osname" == "$archlinux" ]]; then
            :
        fi
        # code that has to be executed after downstream-specific distros
    # common to debian-based distros
    elif basedOn "$osname" "$debian"; then
        # code that has to be executed before downstream-specific distros
        sudo apt install dkms build-essential linux-headers-$(uname -r) virtualbox -y
        sudo gpasswd -a "$username" vboxusers
        mkdir "/tmp/virtualbox"
        # debian-specific
        if [[ "$osname" == "$debian" ]]; then
            wget "$link_virtualbox_ext52" -O "/tmp/virtualbox/Oracle_VM_VirtualBox_Extension_Pack-5.2.16.vbox-extpack"
            sudo VBoxManage extpack install --replace "/tmp/virtualbox/Oracle_VM_VirtualBox_Extension_Pack-5.2.16.vbox-extpack"
        # common to ubuntu-based distros
        elif basedOn "$osname" "$ubuntu"; then
            # code that has to be executed before downstream-specific distros
            wget "$link_virtualbox_ext61" -O "/tmp/virtualbox/Oracle_VM_VirtualBox_Extension_Pack-6.1.2.vbox-extpack"
            sudo VBoxManage extpack install --replace "/tmp/virtualbox/Oracle_VM_VirtualBox_Extension_Pack-6.1.2.vbox-extpack"
            # ubuntu-specific
            if [[ "$osname" == "$ubuntu" ]]; then
                :
            fi
            # code that has to be executed after downstream-specific distros
        fi
        # code that has to be executed after downstream-specific distros
        rm -r "/tmp/virtualbox"
    # common to fedora-based distros
    elif basedOn "$osname" "$fedora"; then
        # code that has to be executed before downstream-specific distros
        sudo dnf install dkms install kernel-devel kernel-headers-$(uname -r) VirtualBox -y
        sudo adduser "$username" -g vboxusers
        sudo usermod -a -G vboxusers "$username"
        mkdir "/tmp/virtualbox"
        wget "$link_virtualbox_ext61" -O "/tmp/virtualbox/Oracle_VM_VirtualBox_Extension_Pack-6.1.2.vbox-extpack"
        sudo VBoxManage extpack install --replace "/tmp/virtualbox/Oracle_VM_VirtualBox_Extension_Pack-6.1.2.vbox-extpack"
        rm -r "/tmp/virtualbox"
        # fedora-specific
        if [[ "$osname" == "$fedora" ]]; then
            :
        fi
        # code that has to be executed after downstream-specific distros
    fi
    # code that has to be executed after downstream-specific distros
fi
