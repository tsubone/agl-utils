#!/bin/bash

MACHINE=h3ulcb 

repo init -b eel -m eel_5.0.0.xml -u https://gerrit.automotivelinux.org/gerrit/AGL/AGL-repo
repo sync

export MACHINE=${MACHINE}

source meta-agl/scripts/aglsetup.sh -m $MACHINE -b build agl-devel agl-demo agl-netboot agl-appfw-smack agl-localdev

echo "DL_DIR=\"/home/YOCTO/downloads\"" >> conf/local.conf

bitbake agl-demo-platform
