#!/bin/bash
source config.sh

if [[ $osname == "arch-linux" ]]; then
sudo mkdir /tmp/tomcat
sudo wget http://ftp.unicamp.br/pub/apache/tomcat/tomcat-9/v9.0.16/bin/apache-tomcat-9.0.16.zip -P /tmp/tomcat
sudo unzip /tmp/tomcat/apache-tomcat-9.0.16.zip -d /opt
sudo chown $username -R /opt/apache-tomcat-9.0.16
sudo chmod +x -R /opt/apache-tomcat-9.0.16
sudo rm -r /tmp/tomcat
fi

if [[ $osname == "debian-9" ]]; then
sudo mkdir /tmp/tomcat
sudo wget http://ftp.unicamp.br/pub/apache/tomcat/tomcat-9/v9.0.16/bin/apache-tomcat-9.0.16.zip -P /tmp/tomcat
sudo unzip /tmp/tomcat/apache-tomcat-9.0.16.zip -d /opt
sudo chown $username -R /opt/apache-tomcat-9.0.16
sudo chmod +x -R /opt/apache-tomcat-9.0.16
sudo rm -r /tmp/tomcat
fi

if [[ $osname == "debian-sid" ]]; then
sudo mkdir /tmp/tomcat
sudo wget http://ftp.unicamp.br/pub/apache/tomcat/tomcat-9/v9.0.16/bin/apache-tomcat-9.0.16.zip -P /tmp/tomcat
sudo unzip /tmp/tomcat/apache-tomcat-9.0.16.zip -d /opt
sudo chown $username -R /opt/apache-tomcat-9.0.16
sudo chmod +x -R /opt/apache-tomcat-9.0.16
sudo rm -r /tmp/tomcat
fi

if [[ $osname == "fedora-29" ]]; then
$missing
fi

if [[ $osname == "ubuntu-18.04" ]]; then
sudo mkdir /tmp/tomcat
sudo wget http://ftp.unicamp.br/pub/apache/tomcat/tomcat-9/v9.0.16/bin/apache-tomcat-9.0.16.zip -P /tmp/tomcat
sudo unzip /tmp/tomcat/apache-tomcat-9.0.16.zip -d /opt
sudo chown $username -R /opt/apache-tomcat-9.0.16
sudo chmod +x -R /opt/apache-tomcat-9.0.16
sudo rm -r /tmp/tomcat
fi