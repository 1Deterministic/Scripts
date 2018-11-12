#!/bin/bash
source config.sh

# updates the system repos
sudo apt update

# removes any leftover packages
sudo apt autoremove -y

# system -----------------------------------------------------------------------

# adds the fstab lines
if [[ $add_fstab_lines == "yes" ]]; then
sudo bash -c "cat >> /etc/fstab <<- EOM
$fstab_lines
EOM"
fi

# adds the crypttab lines
if [[ $add_crypttab_lines == "yes" ]]; then
sudo bash -c "cat >> /etc/crypttab <<- EOM
$crypttab_lines
EOM"
fi

# kernel parameter that fixes audio
if [[ $fix_kernel_audio == "yes" ]]; then
sudo sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT=\"quiet\"/GRUB_CMDLINE_LINUX_DEFAULT=\"quiet snd_hda_intel\.power_save=0\"/' /etc/default/grub
sudo update-grub
fi

# fixes en-us language
if [[ $fix_en_US_location_bug == "yes" ]]; then
sudo bash -c "cat >> /etc/locale.gen <<- EOM
en_US.UTF-8 UTF-8
EOM"
sudo locale-gen
fi

# installs ufw firewall
if [[ $install_ufw_firewall == "yes" ]]; then
sudo apt install ufw -y
sudo ufw enable
sudo ufw default deny incoming
sudo ufw default allow outgoing
fi

# fixes sudden volume spikes
if [[ $fix_sudden_volume_spikes == "yes" ]]; then
sudo bash -c "cat >> /etc/pulse/daemon.conf <<- EOM
flat-volumes = no
EOM"
fi

# disables mouse acceleration 
if [[ $disable_mouse_acceleration == "yes" ]]; then
sudo mkdir /etc/X11/xorg.conf.d
sudo bash -c "cat >> /etc/X11/xorg.conf.d/50-mouse-acceleration.conf <<- EOM
Section \"InputClass\"
    Identifier \"My Mouse\"
    Driver \"libinput\"
    MatchIsPointer \"yes\"
    Option \"AccelProfile\" \"flat\"
EndSection
EOM"
fi

# installs Microsoft fonts
if [[ $install_ms_fonts == "yes" ]]; then
sudo apt install ttf-mscorefonts-installer -y
fi

# installs a lot of fonts
if [[ $install_kubuntu_fonts == "yes" ]]; then
sudo apt install fontconfig fontconfig-config fonts-cantarell fonts-crosextra-caladea fonts-crosextra-carlito fonts-dejavu fonts-dejavu-core fonts-dejavu-extra fonts-droid-fallback fonts-freefont-ttf fonts-liberation fonts-linuxlibertine fonts-noto-mono fonts-opensymbol fonts-sil-gentium fonts-sil-gentium-basic fonts-arphic-ukai fonts-arphic-uming fonts-beng fonts-beng-extra fonts-dejavu-core fonts-deva fonts-deva-extra fonts-droid-fallback fonts-freefont-ttf fonts-gargi fonts-gubbi fonts-gujr fonts-gujr-extra fonts-guru fonts-guru-extra fonts-indic fonts-kacst fonts-kacst-one fonts-kalapi fonts-knda fonts-lao fonts-liberation fonts-liberation2 fonts-lklug-sinhala fonts-lohit-beng-assamese fonts-lohit-beng-bengali fonts-lohit-deva fonts-lohit-gujr fonts-lohit-guru fonts-lohit-knda fonts-lohit-mlym fonts-lohit-orya fonts-lohit-taml fonts-lohit-taml-classical fonts-lohit-telu fonts-mlym fonts-nakula fonts-navilu fonts-noto-cjk fonts-noto-mono fonts-opensymbol fonts-orya fonts-orya-extra fonts-pagul fonts-sahadeva fonts-samyak-deva fonts-samyak-gujr fonts-samyak-mlym fonts-samyak-taml fonts-sarai fonts-sil-abyssinica fonts-sil-padauk fonts-taml fonts-telu fonts-telu-extra fonts-thai-tlwg fonts-tibetan-machine fonts-tlwg-garuda fonts-tlwg-garuda-ttf fonts-tlwg-kinnari fonts-tlwg-kinnari-ttf fonts-tlwg-laksaman fonts-tlwg-laksaman-ttf fonts-tlwg-loma fonts-tlwg-loma-ttf fonts-tlwg-mono fonts-tlwg-mono-ttf fonts-tlwg-norasi fonts-tlwg-norasi-ttf fonts-tlwg-purisa fonts-tlwg-purisa-ttf fonts-tlwg-sawasdee fonts-tlwg-sawasdee-ttf fonts-tlwg-typewriter fonts-tlwg-typewriter-ttf fonts-tlwg-typist fonts-tlwg-typist-ttf fonts-tlwg-typo fonts-tlwg-typo-ttf fonts-tlwg-umpush fonts-tlwg-umpush-ttf fonts-tlwg-waree fonts-tlwg-waree-ttf -y
fi

# improves font rendering
if [[ $improve_font_rendering == "yes" ]]; then
mkdir "/home/$username/.config"
mkdir "/home/$username/.config/fontconfig"
bash -c "cat >> /home/$username/.config/fontconfig/fonts.conf <<- EOM
<?xml version='1.0'?>
<!DOCTYPE fontconfig SYSTEM 'fonts.dtd'>
<fontconfig>
 <match target=\"font\">
  <edit mode=\"assign\" name=\"rgba\">
   <const>rgb</const>
  </edit>
 </match>
 <match target=\"font\">
  <edit mode=\"assign\" name=\"hinting\">
   <bool>true</bool>
  </edit>
 </match>
 <match target=\"font\">
  <edit mode=\"assign\" name=\"hintstyle\">
   <const>hintslight</const>
  </edit>
 </match>
 <match target=\"font\">
  <edit mode=\"assign\" name=\"antialias\">
   <bool>true</bool>
  </edit>
 </match>
</fontconfig>
EOM"]

bash -c "cat >> /home/$username/.Xresources <<- EOM
Xft.antialias: true
Xft.hinting: true
Xft.rgba: rgb
Xft.autohint: false
Xft.hintstyle: hintslight
Xft.lcdfilter: lcddefault
EOM"
xrdb -merge .Xresources
fc-cache -fv
sudo dpkg-reconfigure fontconfig-config
sudo dpkg-reconfigure fontconfig]]]
fi

# installs kde connect
if [[ $install_kde_connect == "yes" ]]; then
sudo apt install kdeconnect -y
sudo bash -c "cat >> /etc/ufw/applications.d/kdeconnect <<- EOM
[kdeconnect]
title=KDE Connect
description=KDE Connect
ports=1714:1764/tcp|1714:1764/udp
EOM"
sudo ufw allow kdeconnect
sudo ufw reload
fi

#installs cryptsetup
if [[ $install_cryptsetup == "yes" ]]; then
sudo apt install cryptsetup cryptsetup-initramfs -y
fi

# installs lvm 
if [[ $install_lvm == "yes" ]]; then
sudo apt install lvm2 -y
fi

# installs Ark
if [[ $install_ark == "yes" ]]; then
sudo apt install ark -y
fi

# installs KCalc
if [[ $install_kcalc == "yes" ]]; then
sudo apt install kcalc -y
fi

# installs Okular
if [[ $install_okular == "yes" ]]; then
sudo apt install okular okular-extra-backends -y
fi

# installs Spectacle
if [[ $install_spectacle == "yes" ]]; then
sudo apt install kde-spectacle -y
fi

# installs Gwenview
if [[ $install_gwenview == "yes" ]]; then
sudo apt install gwenview -y
fi

# installs PartitionManager
if [[ $install_partitionmanager == "yes" ]]; then
sudo apt install partitionmanager -y
fi

# installs Plasma Network Manager
if [[ $install_networkmanager == "yes" ]]; then
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

# drivers ----------------------------------------------------------------------

# installs all possible firmware
if [[ $install_all_possible_firmware == "yes" ]]; then
sudo apt install firmware-* -y
fi

# installs Nvidia legacy drivers for G94
if [[ $install_nvidia_340xx == "yes" ]]; then
sudo apt install linux-headers-$(uname -r) -y
sudo apt install nvidia-legacy-340xx-driver -y

# fixes vsync issues
sudo bash -c "cat >> /etc/profile.d/kwin.sh <<- EOM
#!/bin/sh
export KWIN_TRIPLE_BUFFER=1
EOM"
fi

# installs virtualbox guest additions 
if [[ $virtualbox_guest_additions == "yes" ]]; then
sudo apt install linux-headers-$(uname -r) build-essential -y
sudo mkdir /tmp/vbox-iso
sudo wget http://download.virtualbox.org/virtualbox/5.2.16/VBoxGuestAdditions_5.2.16.iso -P /tmp/vbox-iso
sudo 7z x /tmp/vbox-iso/VBoxGuestAdditions_5.2.16.iso -o/tmp/vbox-iso
sudo chmod +x /tmp/vbox-iso/VBoxLinuxAdditions.run
sudo /tmp/vbox-iso/VBoxLinuxAdditions.run
sudo rm -rf /tmp/vbox-iso
sudo adduser $username vboxsf
fi

# installs qemu spice vdagent and qxl driver
if [[ $install_qemu_spice_qxl == "yes" ]]; then
sudo apt install spice-vdagent -y
sudo apt install xserver-xorg-video-qxl -y
fi

# extra ----------------------------------------------------------------------

# sets /etc/hosts file
if [[ $install_someonewhocares_hosts_file == "yes" ]]; then
sudo wget -q http://someonewhocares.org/hosts/hosts -O /etc/hosts
fi

# installs RetroArch
if [[ $install_retroarch == "yes" ]]; then
sudo apt install retroarch -y
sudo apt install libretro-* -y
sudo apt purge gnome-games-app -y
sudo adduser $username input
fi

# installs redshift
if [[ $install_redshift == "yes" ]]; then
sudo apt install redshift plasma-applet-redshift-control -y
fi

# installs samba
if [[ $install_samba == "yes" ]]; then
sudo apt install samba -y
sudo systemctl enable smbd
sudo smbpasswd -a $username
sudo bash -c "cat >> /etc/samba/smb.conf <<- EOM
$samba_lines
EOM"
sudo ufw allow samba
sudo ufw reload
fi

# installs Syncthing
if [[ $install_syncthing == "yes" ]]; then
sudo apt install syncthing -y
sudo systemctl enable syncthing@$username.service
sudo ufw allow syncthing
sudo ufw reload
fi

# installs Firefox
if [[ $install_firefox == "yes" ]]; then
sudo apt install firefox -y
fi

# installs Google Chrome
if [[ $install_google_chrome == "yes" ]]; then
sudo apt install libappindicator3-1 -y
sudo mkdir /tmp/google-chrome
sudo wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -P /tmp/google-chrome
sudo dpkg -i /tmp/google-chrome/google-chrome-stable_current_amd64.deb
sudo rm -r /tmp/google-chrome
fi

# installs VLC
if [[ $install_vlc == "yes" ]]; then
sudo apt install vlc -y
fi

# installs Clementine
if [[ $install_clementine == "yes" ]]; then
sudo apt install clementine -y
fi

# installs LibreOffice
if [[ $install_libreoffice == "yes" ]]; then
sudo apt install libreoffice libreoffice-kde -y
fi

# installs Virtualbox
if [[ $install_virtualbox == "yes" ]]; then
sudo apt install dkms -y
sudo apt install build-essential -y
sudo apt install linux-headers-$(uname -r) -y
sudo apt install virtualbox -y
sudo gpasswd -a $username vboxusers
sudo mkdir /tmp/virtualbox
sudo wget https://download.virtualbox.org/virtualbox/5.2.16/Oracle_VM_VirtualBox_Extension_Pack-5.2.16.vbox-extpack -P /tmp/virtualbox
sudo VBoxManage extpack install --replace /tmp/virtualbox/Oracle_VM_VirtualBox_Extension_Pack-5.2.16.vbox-extpack
sudo rm -r /tmp/virtualbox
fi

# installs qemu
if [[ $install_qemu == "yes" ]]; then
#https://wiki.debian.org/KVM
sudo apt install qemu-kvm -y
sudo apt install libvirt-clients -y
sudo apt install libvirt-daemon-system -y
sudo apt install virt-manager -y
sudo apt install libguestfs-tools -y
sudo adduser $username libvirt
sudo adduser $username libvirt-qemu
fi

# installs QBitTorrent
if [[ $install_qbittorrent == "yes" ]]; then
sudo apt install qbittorrent -y
fi

# installs GIMP
if [[ $install_gimp == "yes" ]]; then
sudo apt install gimp -y
fi

# installs Kdenlive
if [[ $install_kdenlive == "yes" ]]; then
sudo apt install kdenlive -y
fi

# installs Steam
if [[ $install_steam == "yes" ]]; then
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install steam -y
# fixes libcurl.so problems when starting some games
sudo apt install libcurl4
sudo ln -s /usr/lib/x86_64-linux-gnu/libcurl.so.4 /usr/lib/x86_64-linux-gnu/libcurl.so
# fixes Steam libGl.so.1 issue with 340xx driver
if [[ $install_nvidia_340xx == "yes" ]]; then
sudo apt install libgl1-nvidia-legacy-340xx-glx:i386 -y
echo "You installed the Nvidia legacy 340xx drivers, but Steam requires the newest one to be installed and it is not compatible. PLEASE SELECT THE CORRECT DRIVER TO LOAD (/usr/lib/nvidia/legacy-340xx), or the system will fallback to nouveau."
sudo update-glx --config nvidia
fi
fi

# installs minitube
if [[ $install_minitube == "yes" ]]; then
sudo apt install minitube -y
fi

# installs FreeTube
if [[ $install_freetube == "yes" ]]; then
sudo mkdir /tmp/freetube
sudo wget https://github.com/FreeTubeApp/FreeTube/releases/download/v0.4.0-beta/FreeTube-linux-x64.zip -P /tmp/freetube
sudo unzip /tmp/freetube/FreeTube-linux-x64.zip -d /opt
sudo chmod +x /opt/FreeTube-linux-x64/FreeTube
sudo bash -c "cat >> /usr/share/applications/freetube.desktop <<- EOM
[Desktop Entry]
Name=Free Tube
Comment=Youtube desktop client
GenericName=Youtube Client
X-GNOME-FullName=FreeTube
Exec=/opt/FreeTube-linux-x64/FreeTube %u
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=im-youtube
Categories=AudioVideo;Player;
StartupNotify=true
EOM"
sudo rm -r /tmp/freetube
fi

# installs VMware Player
if [[ $install_vmware_player == "yes" ]]; then
sudo apt install build-essential -y
sudo apt install linux-headers-$(uname -r) -y
sudo mkdir /tmp/vmware
sudo wget https://download3.vmware.com/software/player/file/VMware-Player-14.1.3-9474260.x86_64.bundle -P /tmp/vmware
sudo chmod +x /tmp/vmware/VMware-Player-14.1.3-9474260.x86_64.bundle
sudo /tmp/vmware/VMware-Player-14.1.3-9474260.x86_64.bundle --console --required --eulas-agreed
sudo adduser $username disk
sudo rm -r /tmp/vmware
fi

# installs VMware Workstation Pro
if [[ $install_vmware_pro == "yes" ]]; then
sudo apt install build-essential -y
sudo apt install linux-headers-$(uname -r) -y
sudo mkdir /tmp/vmware
sudo wget http://download3.vmware.com/software/wkst/file/VMware-Workstation-Full-14.1.3-9474260.x86_64.bundle -P /tmp/vmware
sudo chmod +x /tmp/vmware/VMware-Workstation-Full-14.1.3-9474260.x86_64.bundle
sudo /tmp/vmware/VMware-Workstation-Full-14.1.3-9474260.x86_64.bundle --console --required --eulas-agreed
sudo adduser $username disk
sudo rm -r /tmp/vmware
fi

# installs ProtonMail desktop
if [[ $install_protonmail_desktop == "yes" ]]; then
sudo mkdir /tmp/protonmail
sudo wget https://raw.githubusercontent.com/protonmail-desktop/application/master/app/static/Icon.png -O /tmp/protonmail/icon.png
sudo wget https://github.com/protonmail-desktop/application/releases/download/v0.5.9/protonmail-desktop-0.5.9-x86_64.AppImage -O /tmp/protonmail/protonmail
sudo mkdir /opt/protonmail
sudo mv /tmp/protonmail/icon.png /opt/protonmail
sudo mv /tmp/protonmail/protonmail /opt/protonmail
sudo chmod +x /opt/protonmail/protonmail
sudo bash -c "cat >> /usr/share/applications/protonmail.desktop <<- EOM
[Desktop Entry]
Name=Proton Mail
Comment=Secure Email desktop client
GenericName=Mail Client
X-GNOME-FullName=Proton Mail
Exec=/opt/protonmail/protonmail %u
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/opt/protonmail/icon.png
Categories=Network;
StartupNotify=true
EOM"
sudo rm -r /tmp/protonmail
fi

# development -----------------------------------------------------------------

# installs git
if [[ $install_git == "yes" ]]; then
sudo apt install git -y
fi

# installs GitKraken
if [[ $install_gitkraken == "yes" ]]; then
sudo apt install gconf2 gvfs-bin -y
sudo apt install libgnome-keyring-common libgnome-keyring-dev
sudo mkdir /tmp/gitkraken
sudo wget http://ftp.br.debian.org/debian/pool/main/o/openssl/libssl1.0.0_1.0.1t-1+deb8u8_amd64.deb -P /tmp/gitkraken
sudo dpkg -i /tmp/gitkraken/libssl1.0.0_1.0.1t-1+deb8u8_amd64.deb
sudo wget https://release.gitkraken.com/linux/gitkraken-amd64.deb -P /tmp/gitkraken
sudo dpkg -i /tmp/gitkraken/gitkraken-amd64.deb
sudo rm -r /tmp/gitkraken
fi

# installs Microsoft Visual Studio Code
if [[ $install_vscode == "yes" ]]; then
sudo mkdir /tmp/code
sudo wget https://packages.microsoft.com/keys/microsoft.asc -P /tmp/code
sudo apt-key add /tmp/code/microsoft.asc
sudo rm -r /tmp/code
sudo bash -c "cat >> /etc/apt/sources.list.d/vscode.list <<- EOM
deb [arch=amd64] http://packages.microsoft.com/repos/vscode stable main
EOM"
sudo apt update
sudo apt install code -y
fi
    
# installs Allegro 5
if [[ $install_allegro5 == "yes" ]]; then
sudo apt install liballegro5-dev -y
fi

# installs Arduino IDE
if [[ $install_arduino == "yes" ]]; then
sudo apt install arduino -y
sudo adduser $username dialout
fi

# installs Eclipse
if [[ $install_eclipse == "yes" ]]; then
sudo apt install openjdk-8-jdk -y
sudo mkdir /tmp/eclipse
sudo wget http://eclipse.c3sl.ufpr.br/technology/epp/downloads/release/photon/R/eclipse-java-photon-R-linux-gtk-x86_64.tar.gz -P /tmp/eclipse
sudo tar -zxvf /tmp/eclipse/eclipse-java-photon-R-linux-gtk-x86_64.tar.gz -C /usr/
sudo wget http://eclipse.c3sl.ufpr.br/technology/epp/downloads/release/photon/R/eclipse-jee-photon-R-linux-gtk-x86_64.tar.gz -P /tmp/eclipse
sudo tar -zxvf /tmp/eclipse/eclipse-jee-photon-R-linux-gtk-x86_64.tar.gz -C /usr/
sudo wget http://eclipse.c3sl.ufpr.br/technology/epp/downloads/release/photon/R/eclipse-cpp-photon-R-linux-gtk-x86_64.tar.gz -P /tmp/eclipse
sudo tar -zxvf /tmp/eclipse/eclipse-cpp-photon-R-linux-gtk-x86_64.tar.gz -C /usr/
sudo rm -r /tmp/eclipse
sudo ln -s /usr/eclipse/eclipse /usr/bin/eclipse
sudo bash -c "cat >> /usr/share/applications/eclipse.desktop <<- EOM
[Desktop Entry]
Encoding=UTF-8
Name=Eclipse 4.7
Comment=Eclipse
Exec=/usr/bin/eclipse
Icon=/usr/eclipse/icon.xpm
Categories=Development;IDE;
Terminal=false  
Type=Application   
StartupNotify=false
EOM"
sudo update-java-alternatives --jre-headless --jre --set java-1.8.0-openjdk-amd64
fi

# installs Android Studio
if [[ $install_android_studio == "yes" ]]; then
sudo apt install lib32stdc++6 unzip -y
sudo mkdir /tmp/android-studio
sudo wget https://dl.google.com/dl/android/studio/ide-zips/3.1.0.16/android-studio-ide-173.4670197-linux.zip -P /tmp/android-studio
sudo unzip /tmp/android-studio/android-studio-ide-173.4670197-linux.zip -d /opt
sudo rm -r /tmp/android-studio
sudo bash -c "cat >> /usr/share/applications/jetbrains-studio.desktop <<- EOM
[Desktop Entry]
Version=1.0
Type=Application
Name=Android Studio
Icon=/opt/android-studio/bin/studio.png
Exec=\"/opt/android-studio/bin/studio.sh\" %f
Comment=The Drive to Develop
Categories=Development;IDE;
Terminal=false
StartupWMClass=jetbrains-studio
EOM"
sudo mkdir /opt/android-sdk
sudo chown $username -R /opt/android-sdk
fi

# installs Pycharm Community
if [[ $install_pycharm_community == "yes" ]]; then
sudo apt install python3-pip -y
sudo mkdir /tmp/pycharm-community
sudo wget https://download.jetbrains.com/python/pycharm-community-2018.1.2.tar.gz -P /tmp/pycharm-community
sudo tar xvzf /tmp/pycharm-community/pycharm-community-2018.1.2.tar.gz --directory /opt
sudo rm -r /tmp/pycharm-community
sudo bash -c "cat >> /usr/share/applications/jetbrains-pycharm-ce.desktop <<- EOM
[Desktop Entry]
Version=1.0
Type=Application
Name=PyCharm Community Edition
Icon=/opt/pycharm-community-2018.1.2/bin/pycharm.png
Exec=\"/opt/pycharm-community-2018.1.2/bin/pycharm.sh\" %f
Comment=The Drive to Develop
Categories=Development;IDE;
Terminal=false
StartupWMClass=jetbrains-pycharm-ce
EOM"
fi
    
# installs eyed3
if [[ $install_eyed3 == "yes" ]]; then
sudo pip3 install eyed3
fi

# installs xlsxwriter
if [[ $install_xlsxwriter == "yes" ]]; then
sudo pip3 install xlsxwriter
fi

# installs Nuitka
if [[ $install_nuitka == "yes" ]]; then
sudo pip3 install nuitka
fi

# installs Kivy
if [[ $install_kivy == "yes" ]]; then
sudo apt install git -y
sudo pip3 install cython
sudo pip3 install pygame
sudo pip3 install git+https://github.com/kivy/kivy.git@master
fi

# installs MySQL Workbench
if [[ $install_mysql_workbench == "yes" ]]; then
sudo apt install mysql-workbench -y
fi

# installs lamp-server
if [[ $install_lamp_server == "yes" ]]; then
# installs MariaDB Server
sudo apt install mariadb-client -y
sudo apt install mariadb-server -y

# installs PHP 7.0 and MySQL connector
sudo apt install php7.3 -y
sudo apt install php7.3-mysql -y

# installs Apache and PHP plugin for Apache
sudo apt install apache2 -y
sudo apt install libapache2-mod-php7.3 -y
fi

# installs Apache Tomcat
if [[ $install_apache_tomcat == "yes" ]]; then
sudo apt install unzip -y
sudo mkdir /tmp/tomcat
sudo wget http://ftp.unicamp.br/pub/apache/tomcat/tomcat-9/v9.0.12/bin/apache-tomcat-9.0.12.zip -P /tmp/tomcat
sudo unzip /tmp/tomcat/apache-tomcat-9.0.12.zip -d /opt
sudo chown $username -R /opt/apache-tomcat-9.0.12
sudo chmod +x -R /opt/apache-tomcat-9.0.12
sudo rm -r /tmp/tomcat
fi

sudo apt autoremove -y

# reboots the system
sudo reboot