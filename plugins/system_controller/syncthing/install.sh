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

echo "Creating Syncthing Service"
cp Syncthing/etc/system/syncthing.service ~/.config/systemd/user/syncthing.service
echo "Starting Syncthing Service"
systemctl --user start syncthing.service
# If you need to differentiate install for armhf and i386 you can get the variable like this
#DPKG_ARCH=`dpkg --print-architecture`
# Then use it to differentiate your install

#requred to end the plugin install
echo "plugininstallend"

