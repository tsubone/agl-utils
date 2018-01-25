#!/bin/bash

MACHINE=qemux86-64
BRANCH=eel
AGL_VER=eel_5.0.0.xml
AGL_SETUP_TARGET='agl-demo agl-devel'

echo "repo init -b ${BRANCH} -m ${AGL_VER} -u https://gerrit.automotivelinux.org/gerrit/AGL/AGL-repo"
repo init -b ${BRANCH} -m ${AGL_VER} -u https://gerrit.automotivelinux.org/gerrit/AGL/AGL-repo

echo "repo sync"
repo sync

export MACHINE=${MACHINE}

source meta-agl/scripts/aglsetup.sh -f -m ${MACHINE} ${AGL_SETUP_TARGET}

echo "DL_DIR=\"/home/YOCTO/downloads\"" >> conf/local.conf

bitbake agl-demo-platform
