#!/usr/bin/env bash

proj_home="$(dirname $0)/.."

if uname | grep -q "Linux" ; then
    if grep -qEi "(Microsoft|WSL)" /proc/version > /dev/null 2>&1 ; then
        "$proj_home/scripts/update-to-os.wsl.sh"
    else
        "$proj_home/scripts/update-to-os.linux.sh"
    fi
elif uname | grep -q "Darwin" ; then
    "$proj_home/scripts/update-to-os.mac.sh"
else
    "$proj_home/scripts/update-to-os.windows.sh"
fi
