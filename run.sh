#!/bin/bash

# grant execution permission to all .sh files
find . -name "*.sh" -exec chmod +x {} \;

# your linux user must have access to sudo

# uncomment the lines you want to install

# there are scripts missing for some distros, it should give you a message if you try to run one of them

# some packages are taken for granted by the scripts and will be installed in pre-configure.sh
# ./pre-configure.sh

# desktop environments
# apps/kde-plasma.sh
# apps/gnome-shell.sh
# apps/xfce.sh

# general system tweaks
# tweaks/remove-kde-bloat.sh
# tweaks/remove-gnome-bloat.sh
# tweaks/improve-font-rendering.sh
# tweaks/install-extra-fonts.sh
# tweaks/install-extra-codecs.sh
# tweaks/install-someonewhocares-hosts-file.sh
# tweaks/fix-sudden-volume-spikes.sh
# tweaks/disable-xorg-mouse-acceleration.sh
# tweaks/fix-qt-looks-on-gtk-based-desktop-environments.sh
# tweaks/install-vulkan.sh
# tweaks/install-extra-python-modules.sh

# basic apps for kde
# apps/ark.sh
# apps/kdeconnect.sh
# apps/kcalc.sh
# apps/okular.sh
# apps/spectacle.sh
# apps/gwenview.sh
# apps/partitionmanager.sh

# basic apps for gnome
# apps/gnome-tweak-tool.sh

# basic apps for xfce
# apps/xfce-goodies.sh

# general apps
# apps/syncthing.sh
# apps/firefox.sh
# apps/google-chrome.sh
# apps/clementine.sh
# apps/libreoffice.sh
# apps/vlc.sh
# apps/virtualbox.sh
# apps/qemu-kvm.sh
# apps/qbittorrent.sh
# apps/gimp.sh
# apps/kdenlive.sh
# apps/steam.sh
# apps/lutris.sh
# apps/freetube.sh
# apps/vmware-player.sh
# apps/vmware-pro.sh
# apps/protonmail-desktop.sh
# apps/retroarch.sh
# apps/samba.sh
# apps/keepassxc.sh
# apps/openssh.sh
# apps/youtube-dl.sh

# development tools
# apps/git.sh
# apps/gitkraken.sh
# apps/vscodium.sh
# apps/allegro.sh
# apps/arduino.sh
# apps/eclipse.sh
# apps/android-studio.sh
# apps/pycharm-community.sh
# apps/postgresql.sh
# apps/nodejs.sh
# apps/mysql-workbench.sh
# apps/lamp-stack.sh
# apps/apache-tomcat.sh
