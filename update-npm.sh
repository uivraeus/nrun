#!/bin/bash
set -e
#MINOR_VER=$(npm -v | grep -o -E ^[0-9]+\.[0-9]+)
MAJOR_VER=$(npm -v | grep -o -E ^[0-9]+)
echo -n "Updating npm to latest minor version of major version ${MAJOR_VER} ..."
npm install -g npm@${MAJOR_VER} > /dev/null 2>&1
echo " -> $(npm -v)"
