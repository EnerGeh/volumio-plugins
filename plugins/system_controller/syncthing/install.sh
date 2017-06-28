#!/bin/bash

# I just followed straight forward the manual on https://apt.syncthing.net
echo "Adding Syncthing Release PGP keys"
curl -s https://syncthing.net/release-key.txt | sudo apt-key add -
echo "Adding the Syncthing stable channel to APT sources"
echo "deb https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list

echo "Installing Syncthing package"
sudo apt-get update
# Install the required packages via apt-get
sudo apt-get -y install syncthing

echo "Going to Syncthing Service"
cd /lib/systemd/system/
echo "Starting Syncthing Service"
systemctl start syncthing@volumio.service
systemctl status syncthing@volumio.service
echo "Verifying web access"
curl - I 127.0.0.1:8384
# If you need to differentiate install for armhf and i386 you can get the variable like this
#DPKG_ARCH=`dpkg --print-architecture`
# Then use it to differentiate your install

#requred to end the plugin install
echo "plugininstallend"

