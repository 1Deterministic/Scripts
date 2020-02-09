#!/bin/bash
source config.sh

if [[ $osname == $archlinux ]]; then
    sudo pacman -S qemu libvirt openbsd-netcat dmidecode virt-manager ebtables dnsmasq perl-sys-virt ovmf multipath-tools --noconfirm
    sudo usermod -aG libvirt $username
    sudo usermod -aG kvm $username
    sudo systemctl enable libvirtd
    sudo systemctl enable ebtables
    sudo systemctl enable dnsmasq
    sudo bash -c "cat strings/config-ovmf-nvram >> /etc/libvirt/qemu.conf"
fi

if [[ $osname == $debian ]]; then
    sudo apt install qemu-kvm libvirt-clients libvirt-daemon-system virt-manager libguestfs-tools -y
    sudo adduser $username libvirt
    sudo adduser $username libvirt-qemu
fi

if [[ $osname == $fedora ]]; then
    sudo dnf install qemu-kvm libvirt virt-install bridge-utils virt-manager libguestfs-tools -y
    sudo usermod -a -G libvirt $username
    sudo usermod -a -G qemu $username
    sudo systemctl enable libvirtd
    sudo sed -i "s/--timeout 120//" "/etc/sysconfig/libvirtd"
fi

if [[ $osname == $ubuntu ]]; then
    $missing
fi
