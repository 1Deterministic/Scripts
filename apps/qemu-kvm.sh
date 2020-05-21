#!/bin/bash
source config.sh

# common to all linux distros
if basedOn "$osname" "$linux"; then
    # code that has to be executed before downstream-specific distros
    # common to arch-based distros
    if basedOn "$osname" "$archlinux"; then
        # code that has to be executed before downstream-specific distros
        sudo pacman -S qemu libvirt openbsd-netcat dmidecode virt-manager ebtables dnsmasq perl-sys-virt ovmf multipath-tools --noconfirm
        sudo usermod -aG libvirt "$username"
        sudo usermod -aG kvm "$username"
        sudo systemctl enable libvirtd
        sudo systemctl enable ebtables
        sudo systemctl enable dnsmasq
        sudo bash -c "cat strings/config-ovmf-nvram >> /etc/libvirt/qemu.conf"
        # arch linux-specific
        if [[ "$osname" == "$archlinux" ]]; then
            :
        fi
        # code that has to be executed after downstream-specific distros
    # common to debian-based distros
    elif basedOn "$osname" "$debian"; then
        # code that has to be executed before downstream-specific distros
        sudo apt install qemu-kvm libvirt-clients libvirt-daemon-system virt-manager libguestfs-tools -y
        sudo adduser "$username" libvirt
        sudo adduser "$username" libvirt-qemu
        # debian-specific
        if [[ "$osname" == "$debian" ]]; then
            :
        # common to ubuntu-based distros
        elif basedOn "$osname" "$ubuntu"; then
            # code that has to be executed before downstream-specific distros
            # ubuntu-specific
            if [[ "$osname" == "$ubuntu" ]]; then
                :
            fi
            # code that has to be executed after downstream-specific distros
        fi
        # code that has to be executed after downstream-specific distros
    # common to fedora-based distros
    elif basedOn "$osname" "$fedora"; then
        # code that has to be executed before downstream-specific distros
        sudo dnf install qemu-kvm libvirt virt-install bridge-utils virt-manager libguestfs-tools -y
        sudo usermod -a -G libvirt "$username"
        sudo usermod -a -G qemu "$username"
        sudo systemctl enable libvirtd
        sudo sed -i "s,--timeout 120,," "/etc/sysconfig/libvirtd"
        # fedora-specific
        if [[ "$osname" == "$fedora" ]]; then
            :
        fi
        # code that has to be executed after downstream-specific distros
    fi
    # code that has to be executed after downstream-specific distros
fi