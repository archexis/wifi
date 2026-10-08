#!/bin/bash
set -e

sudo cp dhclient.conf /etc/dhclient.conf
sudo cp nm/20-dhcp-dhclient.conf /etc/networkmanager/conf.d/
sudo cp nm/windows-profile.nmconnection /etc/networkmanager/system-connections/
sudo chmod 600 /etc/networkmanager/system-connections/windows-profile.nmconnection
sudo nmcli con reload
# nmcli con mod windows-profile wifi.ssid "YOUR_SSID" wifi-sec.psk "YOUR_PSK"
# nmcli con up windows-profile