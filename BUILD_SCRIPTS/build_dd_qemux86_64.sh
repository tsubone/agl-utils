#!/bin/bash

VER=4.0.3
if [ $# -eq 1 ]; then
    VER=$1
fi

MACHINE=qemux86-64
BRANCH=dab
AGL_VER=dab_${VER}.xml
AGL_SETUP_TARGET='agl-demo agl-devel'

echo "repo init -b ${BRANCH} -m ${AGL_VER} -u https://gerrit.automotivelinux.org/gerrit/AGL/AGL-repo"
repo init -b ${BRANCH} -m ${AGL_VER} -u https://gerrit.automotivelinux.org/gerrit/AGL/AGL-repo

echo "repo sync"
repo sync

export MACHINE=${MACHINE}

source meta-agl/scripts/aglsetup.sh -f -m ${MACHINE} ${AGL_SETUP_TARGET}

echo "DL_DIR=\"/home/YOCTO/downloads\"" >> conf/local.conf

bitbake agl-demo-platform
