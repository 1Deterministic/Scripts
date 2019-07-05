#!/bin/bash

# basic information about the system
username=$USER
hostname=$HOSTNAME
osname=$(IFS="=" read -ra ADDR <<< $(cat /etc/os-release | grep PRETTY_NAME); echo ${ADDR[-1]} | cut -d'"' -f 2)

# should match /etc/os-release PRETTY_NAME string
debianstable="Debian GNU/Linux 9 (stretch)"
debiansid="Debian GNU/Linux 9 buster/sid"
ubuntults="Ubuntu 18.04.2 LTS"
fedora="Fedora 30 (Workstation Edition)"
archlinux="Arch Linux"

# what runs on these conditions
incompatible="echo This is incompatible with $osname"
missing="echo This is not implemented for $osname yet"