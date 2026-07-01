#!/bin/bash

RED='\033[0;31m[ ERROR ]\033[0m'
GREEN='\033[0;32m[ OK ]\033[0m'

IsRoot() {
    if [[ $EUID -ne 0 ]]; then
        echo ":: This script must be run as root..."
        exit 1
    fi
}

HelloScreen() {
    echo '==========================================================='
    echo ':: Hyprland Install Script'
    echo ':: Author: Drauwood'
    echo ':: GitHub: https://github.com/Drauwood'
    echo '==========================================================='
}

UpdateReposytoryesDB() {
    echo ":: Updating system..."
    sudo pacman --noconfirm -Sy &&
        echo -e "$GREEN pacman --noconfirm -Sy" >> result.txt ||
        echo -e "$RED pacman --noconfirm -Sy" >> result.txt
}

InstallXorg() {
    echo ":: Install xorg..."
    sudo pacman --noconfirm -S xorg-server xorg-xinit xorg-xset xorg-xsetroot xorg-xrandr xorg-xrdb xorg-server-devel &&
        echo -e "$GREEN Install xorg" >> result.txt ||
        echo -e "$RED Install xorg" >> result.txt
}

InstallMainPackeges() {
    echo ":: Install Programs..."
    sudo pacman --noconfirm -S hyprland hyprpaper uwsm libnewt hyprshot waybar firefox neovim alacritty mc ranger smplayer cmake btop numlockx udiskie pamixer feh zip unzip transmission-gtk ripgrep fzf nodejs npm &&
        echo -e "$GREEN Install Programs" >> result.txt ||
        echo -e "$RED Install Programs" >> result.txt
}

InstallFont() {
    echo ":: Install Fonts..."
    sudo pacman --noconfirm -S ttf-liberation ttf-dejavu opendesktop-fonts ttf-bitstream-vera ttf-arphic-ukai ttf-arphic-uming ttf-jetbrains-mono-nerd &&
        echo -e "$GREEN Install Fonts" >> result.txt ||
        echo -e "$RED Install Fonts" >> result.txt
}

InstallOrUpdateBasedevel() {
    echo ":: Update or install base-devel..."
    sudo pacman --noconfirm -S base-devel &&
        echo -e "$GREEN Update or install base-devel" >> result.txt ||
        echo -e "$RED Update or install base-devel" >> result.txt
}

InstallLib() {
    echo ":: Update or install lib's..."
    sudo pacman --noconfirm -S libxcursor libxrandr libxinerama libxi libxkbcommon &&
        echo -e "$GREEN Update or install lib's" >> result.txt ||
        echo -e "$RED Update or install lib's" >> result.txt
}

InstallLogin() {
    echo ":: Install GDM..."
    sudo pacman --noconfirm -S gdm
    sudo systemctl enable gdm
}

CopyConfigs() {
    cp -rf .config ~/
    cp -rf .bash_profile ~/
    cp -rf .bashrc ~/
}

MakeExecutable() {
    chmod +x ~/.config/polybar/launch.sh
    chmod +x ~/.config/polybar/launch_additional.sh
}

NvimCopy() {
    echo ":: Copy Nvim configs..."
    git clone https://github.com/Drauwood/nvim.git ~/.config/nvim &&
        echo -e "$GREEN Copy Nvim configs" >> result.txt ||
        echo -e "$RED Copy Nvim configs" >> result.txt
}

#IsRoot
HelloScreen
UpdateReposytoryesDB

#InstallXorg
InstallMainPackeges
InstallFont
InstallOrUpdateBasedevel
#InstallLib
#InstallLogin

CopyConfigs &&
    echo -e "$GREEN Copy configs" >> result.txt ||
    echo -e "$RED Copy configs" >> result.txt
#MakeExecutable
NvimCopy

cat result.txt
rm result.txt
