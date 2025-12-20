#!/usr/bin/env bash

proj_home="$(dirname $0)/.."

if uname | grep -q "Linux" ; then
    "$proj_home/scripts/update-from-os.linux.sh"
elif uname | grep -q "Darwin" ; then
    "$proj_home/scripts/update-from-os.mac.sh"
else
    "$proj_home/scripts/update-from-os.windows.sh"
fi
