#!/bin/bash
set -euxo pipefail
# Ensure nginx target dir exists and clear old files
if [ ! -d /usr/share/nginx/html ]; then
  mkdir -p /usr/share/nginx/html
fi
rm -rf /usr/share/nginx/html/*
