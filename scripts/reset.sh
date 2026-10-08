#!/bin/bash
pkill -9 -i firefox
pkill -9 -i spotify
nmcli con down windows-profile
sleep 3
nmcli con up windows-profile
sleep 10
curl -m 8 -a "mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/126.0.0.0 safari/537.36 edg/126.0.0.0" -i http://www.msftconnecttest.com/redirect | grep -e http -e location