#!/bin/bash
source config.sh

link_apache_tomcat="https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.30/bin/apache-tomcat-9.0.30.tar.gz"

if [[ $osname == $archlinux ]]; then
    mkdir /tmp/apache-tomcat
    wget $link_apache_tomcat -O /tmp/apache-tomcat/apache-tomcat.tar.gz
    sudo tar xvzf /tmp/apache-tomcat/apache-tomcat.tar.gz --directory /opt
    sudo chmod +x -R /opt/apache-tomcat-9.0.30
    rm -r /tmp/apache-tomcat
fi

if [[ $osname == $debian ]]; then
    mkdir /tmp/apache-tomcat
    wget $link_apache_tomcat -O /tmp/apache-tomcat/apache-tomcat.tar.gz
    sudo tar xvzf /tmp/apache-tomcat/apache-tomcat.tar.gz --directory /opt
    sudo chmod +x -R /opt/apache-tomcat-9.0.30
    rm -r /tmp/apache-tomcat
fi

if [[ $osname == $fedora ]]; then
    mkdir /tmp/apache-tomcat
    wget $link_apache_tomcat -O /tmp/apache-tomcat/apache-tomcat.tar.gz
    sudo tar xvzf /tmp/apache-tomcat/apache-tomcat.tar.gz --directory /opt
    sudo chmod +x -R /opt/apache-tomcat-9.0.30
    rm -r /tmp/apache-tomcat
fi

if [[ $osname == $ubuntu ]]; then
    mkdir /tmp/apache-tomcat
    wget $link_apache_tomcat -O /tmp/apache-tomcat/apache-tomcat.tar.gz
    sudo tar xvzf /tmp/apache-tomcat/apache-tomcat.tar.gz --directory /opt
    sudo chmod +x -R /opt/apache-tomcat-9.0.30
    rm -r /tmp/apache-tomcat
fi
