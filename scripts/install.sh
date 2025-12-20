#!/usr/bin/env bash

proj_home="$(dirname $0)/.."

if uname | grep -q "Linux" ; then
    # TODO: Check linux distribution.
    if grep -qEi "(Microsoft|WSL)" /proc/version > /dev/null 2>&1 ; then
        $proj_home/scripts/install.deb-wsl.sh
    else
        $proj_home/scripts/install.deb-linux.sh
    fi
elif uname | grep -q "Darwin" ; then
    echo "nothing to do on Mac"
else
    $proj_home/scripts/install.windows.sh
fi
