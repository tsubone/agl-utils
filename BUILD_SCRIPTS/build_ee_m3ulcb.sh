#!/bin/bash

VER=5.0.0
if [ $# -eq 1 ]; then
    VER=$1
fi

MACHINE=m3ulcb 
BRANCH=eel
AGL_VER=eel_${VER}.xml
AGL_SETUP_TARGET='agl-demo agl-devel'

WORK_TOP=`pwd`

repo init -b ${BRANCH} -m ${AGL_VER} -u https://gerrit.automotivelinux.org/gerrit/AGL/AGL-repo
repo sync

export MACHINE=${MACHINE}

mkdir -p $HOME/Downloads
cd $HOME/Downloads
cp /home/YOCTO/pkg/renesas/v2.23.0/*.zip .

cd $WORK_TOP

source meta-agl/scripts/aglsetup.sh -f -m ${MACHINE} ${AGL_SETUP_TARGET}

echo "DL_DIR=\"/home/YOCTO/downloads\"" >> conf/local.conf

bitbake agl-demo-platform
