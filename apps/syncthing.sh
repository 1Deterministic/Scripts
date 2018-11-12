#!/bin/bash
source config.sh

if [[ $osname == "arch-linux" ]]; then
sudo pakku -S syncthing
sudo systemctl enable syncthing@$username.service
sudo ufw allow syncthing
sudo ufw reload
fi

if [[ $osname == "debian-9" ]]; then
sudo apt install syncthing -y
sudo systemctl enable syncthing@$username.service
sudo bash -c "cat >> /etc/ufw/applications.d/syncthing-server <<- EOM
[syncthing]
title=Syncthing
description=Sycthing file synchronisation
ports=22000/tcp|21027/udp
EOM"
sudo ufw allow syncthing
sudo ufw reload
fi

if [[ $osname == "debian-sid" ]]; then
sudo apt install syncthing -y
sudo systemctl enable syncthing@$username.service
sudo ufw allow syncthing
sudo ufw reload
fi

if [[ $osname == "fedora-29" ]]; then
sudo dnf install syncthing -y
sudo systemctl enable syncthing@$username.service
sudo firewall-cmd --add-service=syncthing --permanent
sudo firewall-cmd --reload
fi

if [[ $osname == "ubuntu-18.04" ]]; then
sudo apt install syncthing -y
sudo systemctl enable syncthing@$username.service
sudo bash -c "cat >> /etc/ufw/applications.d/syncthing-server <<- EOM
[syncthing]
title=Syncthing
description=Sycthing file synchronisation
ports=22000/tcp|21027/udp
EOM"
sudo ufw allow syncthing
sudo ufw reload
fi

if [[ $osname == "windows-10" ]]; then
choco install syncthing --ignorechecksum -y
echo start "Syncthing" /low "C:\ProgramData\chocolatey\bin\syncthing.exe" -no-console -no-browser > "C:\Users\$username\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\syncthing.bat"
fi