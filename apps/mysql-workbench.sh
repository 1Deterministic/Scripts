#!/bin/bash
source config.sh

if [[ $osname == "arch-linux" ]]; then
sudo pakku -S mysql-workbench
fi

if [[ $osname == "debian-9" ]]; then
sudo apt install mysql-workbench -y
fi

if [[ $osname == "debian-sid" ]]; then
sudo apt install mysql-workbench -y
fi

if [[ $osname == "fedora-29" ]]; then
$missing
fi

if [[ $osname == "ubuntu-18.04" ]]; then
sudo apt install mysql-workbench -y
fi

if [[ $osname == "windows-10" ]]; then
choco install mysql.workbench --version=6.2.5 --ignorechecksum -y 
fi
