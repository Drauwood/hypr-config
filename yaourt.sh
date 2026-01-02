#!/bin/bash

sudo pacman -S --needed base-devel git wget yajl
mkdir tmp
cd tmp
git clone https://aur.archlinux.org/package-query.git
cd package-query/
makepkg -si
cd ..
git clone https://aur.archlinux.org/yaourt.git
cd yaourt/
makepkg -si
cd ..
sudo rm -dR yaourt/ package-query/
cd ..
sudo rm -dR tmp
