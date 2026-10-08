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
sudo ./scripts/apply.sh
nmcli con mod windows-profile wifi.ssid "YOUR_SSID" wifi-sec.psk "YOUR_PSK"
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