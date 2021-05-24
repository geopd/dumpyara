#!/bin/bash

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    if [[ "$(command -v apt)" != "" ]]; then
        sudo apt install unace zip unzip p7zip-full sharutils uudeview mpack arj cabextract device-tree-compiler liblzma-dev python3-pip brotli liblz4-tool axel gawk aria2 detox cpio rename
        wget http://archive.ubuntu.com/ubuntu/pool/multiverse/{p/p7zip-rar/p7zip-rar_16.02-2_amd64.deb,r/rar/rar_5.5.0-1_amd64.deb,u/unrar-nonfree/unrar_5.5.8-1_amd64.deb}
        sudo dpkg -i p7zip* rar* unrar*
        rm -rf p7zip* rar* unrar*
    elif [[ "$(command -v pacman)" != "" ]]; then
        sudo pacman -Sy --noconfirm unace unrar zip unzip p7zip sharutils uudeview arj cabextract file-roller dtc python-pip brotli axel gawk aria2 detox cpio
    fi
    PIP=pip3
elif [[ "$OSTYPE" == "darwin"* ]]; then
    brew install protobuf xz brotli lz4 aria2
    PIP=pip
fi

"$PIP" install backports.lzma protobuf pycrypto docopt zstandard twrpdtgen
