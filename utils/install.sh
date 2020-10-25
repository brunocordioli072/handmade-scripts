#!/bin/bash

install_deb_file() {
    local -r link="$1"
    file_path=/opt/deb_file.deb
    sudo wget $link -O $file_path
    sudo apt install $file_path
    sudo rm $file_path
}