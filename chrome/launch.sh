#!/bin/bash
google-chrome-stable \
  --user-data-dir=/tmp/guest-edge \
  --no-first-run \
  --disable-background-networking \
  --disable-sync \
  --user-agent="mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/126.0.0.0 safari/537.36 edg/126.0.0.0" \
  http://www.msftconnecttest.com/redirect