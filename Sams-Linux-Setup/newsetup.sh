#!/bin/bash

# Adds minimize and maximize button next to the close button - For a windows like layout
gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close"

# Removes vim-tiny and adds the full version of vim
sudo apt remove --assume-yes vim-tiny
sudo apt update
sudo apt install --assume-yes vim

# Installs Gnome Tweak Tool
sudo apt install gnome-tweak-tool -y

# Enables firewall for enhanced security
sudo ufw enable
sudo ufw status
echo "Would you like to install the graphical interface for firewall?"
read firewallAns
if [ ${firewallAns:0:1} == "y" || ${firewallAns:0:1} == "Y" ]
then
	sudo apt install gufw -y
else
	echo "Not installing Firewall GUI..."
fi

# Installs Steam
echo "Would you like to install Steam?"
read steamAns
if [ ${steamAns:0:1} == "y" || ${steamAns:0:1} == "Y" ]
then    
	sudo apt-get install steam -y
else
	echo "Not installing Steam..."
fi

# Installs PlayOnLinux
echo "Would you like to install PlayOnLinux?"
echo "This program enables you to run any Windows game or Windows application"
read playAns
if [ ${playAns:0:1} == "y" || ${playAns:0:1} == "Y" ]
then
	sudo apt-get install playonlinux -y
else
	echo "Not installing PlayOnLinux..."
fi

# Installs full multimedia support
sudo apt-get install ubuntu-restricted-extras

# Installs Chrome
echo "Would you like to install Google Chrome?"
read googleAns
if [ ${googleAns:0:1} == "y" || ${googleAns:0:1} == "Y" ]
then
	sudo apt install gdebi-core
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
	sudo gdebi google-chrome-stable_current_amd64.deb
else
	echo "Not installing Google Chrome..."
fi
