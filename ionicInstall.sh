#!/bin/bash

# This script will setup ionic on Ubuntu / Mint machines

#**********************************************
# Downloads:
# * npm
# * Apache Cordova
# * Ionic Framework
# **********************************************

cd
INSTALL_PATH=/opt
NODE_PATH=/opt/node

LINUX_ARCH="$(lscpu | grep 'Architechture' | awk -F\: '{ print $2 }' | tr -d ' ')"

echo "Update..."
echo
sudo apt-get update

clear
echo "Downloading nodejs"

cd ~/Downloads

if ["$LINUX_ARCH" == "x86_64" ]; then
    wget "http://nodejs.org/dist/node-v4.2.1-linux-x64.tar.gz"

    tar xvzf "node-v4.2.1-linux-x64.tar.gz"

else

    wget "http://nodejs.org/dist/node-v4.2.1-linux-x86.tar.gz"

    tar xvzf "node-v4.2.1-linux-x86.tar.gz"

cd

fi

sudo apt-get install nodejs
sudo apt-get install npm

#install apache cordova
clear
echo "Installing cordova"
sudo npm install -g cordova

clear
echo "update cordova"
sudo npm update -g cordova

sudo apt-get install ia32-libs

sudo apt-get install lib32z1 lib32ncurses5 lib32bz2-1.0

#install ionic
clear
echo "Installing ionic"
sudo npm install -g ionic

#clean up
clear
echo "------------------------------------"
echo "Restart you session for installation to complete."
