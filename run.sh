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

# window managers
# apps/bspwm.sh

# general system tweaks
# tweaks/remove-kde-bloat.sh
# tweaks/remove-gnome-bloat.sh
# tweaks/improve-font-rendering.sh
# tweaks/install-extra-fonts.sh
# tweaks/install-extra-codecs.sh
# tweaks/install-someonewhocares-hosts-file.sh
# tweaks/disable-xorg-mouse-acceleration.sh
# tweaks/fix-qt-looks-on-gtk-based-desktop-environments.sh # requires manually configuring the theme in kvantummanager and kvantum style, icon theme and fonts in qt5ct
# tweaks/install-vulkan.sh
# tweaks/install-extra-python-modules.sh
# tweaks/install-proton-ge.sh # you must install and run steam at least once before installing this
# tweaks/fix-vlc-youtube-links.sh
# tweaks/disable-ssh-password-authentication.sh
# tweaks/install-all-retroarch-cores.sh

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
# apps/gnome-calculator.sh
# apps/evince.sh
# apps/eye-of-gnome.sh
# apps/gnome-system-monitor.sh
# apps/gedit.sh
# apps/gnome-disk-utility.sh
# apps/totem.sh

# basic apps for xfce
# apps/xfce-goodies.sh
# apps/thunar.sh
# apps/ristretto.sh
# apps/pavucontrol.sh

# basic apps for window managers in general
# apps/urxvt.sh
# apps/feh.sh
# apps/dmenu.sh
# apps/compton.sh
# apps/lxappearance.sh # not a wm app but it's only used here at the moment
# apps/polybar.sh
# apps/dunst.sh

# general apps
# apps/syncthing.sh
# apps/firefox.sh
# apps/chromium.sh
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
# apps/freetube.sh # installs to /opt
# apps/protonmail-desktop.sh # installs to /opt
# apps/retroarch.sh
# apps/samba.sh
# apps/keepassxc.sh
# apps/openssh.sh
# apps/youtube-dl.sh

# development tools
# apps/git.sh
# apps/gcc.sh
# apps/vscodium.sh # installs to /opt
# apps/allegro.sh
# apps/arduino.sh
# apps/java.sh
# apps/eclipse.sh
# apps/android-studio.sh # installs to /opt
# apps/postgresql.sh
# apps/nodejs.sh
# apps/mysql-workbench.sh
# apps/apache-http.sh
# apps/php.sh
# apps/mariadb.sh
# apps/apache-tomcat.sh # installs to /opt
# apps/vulkan-sdk.sh
# apps/docker.sh
# apps/podman.sh
