windows-profile
===============

engineering config set for cisco ise networks - positions as windows on any wifi

structure
---------
dhclient.conf               - windows dhcp fingerprint
nm/20-dhcp-dhclient.conf    - nm dhcp client switch
nm/windows-profile.nmconnection - template profile mac hostname vendor
firefox/user.js             - quiet profile prefs
chrome/launch.sh            - edge-ua chrome launcher
scripts/apply.sh            - install configs reload nm
scripts/reset.sh            - kill noise reconnect ncsi verify

usage
-----
# 1. install system configs (dhclient + nm dhcp client)
sudo ./scripts/apply.sh

# 2. create Guest profile with windows fingerprint + MAC randomization
nmcli con add type wifi con-name windows-profile ifname wlan0 ssid Guest
nmcli con mod windows-profile wifi-sec.key-mgmt wpa-psk
nmcli con mod windows-profile wifi-sec.psk "YOUR_PSK"
nmcli con mod windows-profile 802-11-wireless.mac-address a0:29:42:8c:8e:ad
nmcli con mod windows-profile 802-11-wireless.mac-address-randomization default
nmcli con mod windows-profile ipv4.method auto
nmcli con mod windows-profile ipv4.dhcp-hostname desktop-369dn1d
nmcli con mod windows-profile ipv4.dhcp-client-id 01:a0:29:42:8c:8e:ad
nmcli con mod windows-profile ipv4.dhcp-vendor-class-identifier "msft 5.0"
nmcli con mod windows-profile ipv6.method disabled
nmcli con mod windows-profile connection.autoconnect yes

# 3. connect and verify
nmcli con up windows-profile
./scripts/reset.sh

firefox: copy user.js to profile dir or start with -profile
chrome:  ./chrome/launch.sh

requirements
------------
dhclient 4.4+
networkmanager
google-chrome-stable
firefox

notes
-----
mac a0:29:42:8c:8e:ad must match host hardware
dhcp request list matches windows 10/11 option 55
msftconnecttest ncsi 302 confirms ise windows profile
mac-address-randomization=default required (never breaks DHCP on some APs)
guest network: IP 10.22.48.0/22, GW 10.22.48.1, DNS 10.22.5.30