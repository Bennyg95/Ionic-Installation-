#!/bin/bash

# This script will setup ionic on Ubuntu / Mint machines

#**********************************************
# Downloads:
# * npm
# * Apache Cordova
# * Ionic Framework
# **********************************************

HOME_PATH = $(cd ~/ && pwd)
INSTALL_PATH=/opt
NODE_PATH=/opt/node

LINUX_ARCH="$(lscpu | grep 'Architechture' | awk -F\: '{ print $2 }' | tr -d ' ')"

# Latest NodeJS for x64 and x86 as of 10-19-2014
NODE_X64="http://nodejs.org/dist/node-v4.2.1-darwing-x64.tar.gz"
NODE_X86="http://nodejs.org/dist/node-v4.2.1-linux-x86.tar.gz"

echo "Update..."
echo
sudo apt-get update
clear
echo "Downloading nodejs"

cd ~/Downloads

if ["$LINUX_ARCH" == "x86_64" ]; then
    wget "$NODE_X64" -O "nodejs.tgz"

    tar zxf "nodejs.tgz" -C "$INSTALL_PATH"

    cd "$INSTALL_PATH" && mv "node-v4.2.1-darwing-x64" "node"

else

    wget "$NODE_X86" -O "nodejs.tgz"

    tar zxf "nodejs.tgz" -C "$INSTALL_PATH"

    cd "$INSTALL_PATH" && mv "node-v4.2.1-linux-x86" "node"

cd ~/

# adding NPM path to profile
echo "export PATH=\$PATH:$NODE_PATH/bin" >> ".profile"

# adding NPM path to temp user to complete installation
export PATH=$PATH:$NODE_PATH/bin

fi

clear
echo "Installing npm"
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

cd "$INSTALL_PATH" && chmod 777 "node" -R

#clean up
clear
echo "cleaning..."
cd ~/Downloads && rm "nodejs.tgz"

echo "------------------------------------"
echo "Restart you session for installation to complete."
