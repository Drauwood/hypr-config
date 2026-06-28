#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
RESET='\033[0m'

IsRoot() {
    if [[ $EUID -ne 0 ]]; then
        echo ":: This script must be run as root..." >> result.txt
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
        echo -e "$GREEN[ ✔ ]$RESET pacman --noconfirm -Sy" >> result.txt ||
        echo -e "$RED[ x ]$RESET pacman --noconfirm -Sy" >> result.txt
}

InstallXorg() {
    echo ":: Install xorg..."
    sudo pacman --noconfirm -S xorg-server xorg-xinit xorg-xset xorg-xsetroot xorg-xrandr xorg-xrdb xorg-server-devel &&
        echo -e "$GREEN[ ✔ ]$RESET Install xorg" >> result.txt ||
        echo -e "$RED[ x ]$RESET Install xorg" >> result.txt
}

InstallMainPackeges() {
    echo ":: Install Programs..."
    sudo pacman --noconfirm -S hyprland hyprpaper uwsm libnewt hyprshot waybar firefox neovim alacritty mc ranger smplayer cmake btop numlockx udiskie pamixer feh zip unzip transmission-gtk ripgrep fzf nodejs npm &&
        echo -e "$GREEN[ ✔ ]$RESET Install Programs" >> result.txt ||
        echo -e "$RED[ x ]$RESET Install Programs" >> result.txt
}

InstallFont() {
    echo ":: Install Fonts..."
    sudo pacman --noconfirm -S ttf-liberation ttf-dejavu opendesktop-fonts ttf-bitstream-vera ttf-arphic-ukai ttf-arphic-uming ttf-jetbrains-mono-nerd &&
        echo -e "$GREEN[ ✔ ]$RESET Install Fonts" >> result.txt ||
        echo -e "$RED[ x ]$RESET Install Fonts" >> result.txt
}

InstallOrUpdateBaseBasedevel() {
    echo ":: Update or install base, base-devel packeges..."
    sudo pacman --noconfirm -S base base-devel &&
        echo -e "$GREEN[ ✔ ]$RESET Update or install base, base-devel packeges" >> result.txt ||
        echo -e "$RED[ x ]$RESET Update or install base, base-devel packeges" >> result.txt
}

InstallLib() {
    echo ":: Update or install lib's packeges..."
    sudo pacman --noconfirm -S libxcursor libxrandr libxinerama libxi libxkbcommon &&
        echo -e "$GREEN[ ✔ ]$RESET Update or install lib's packeges" >> result.txt ||
        echo -e "$RED[ x ]$RESET Update or install lib's packeges" >> result.txt
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
        echo -e "$GREEN[ ✔ ]$RESET Copy Nvim configs" >> result.txt ||
        echo -e "$RED[ x ]$RESET Copy Nvim configs" >> result.txt
}

#IsRoot
HelloScreen
UpdateReposytoryesDB

#InstallXorg
InstallMainPackeges
InstallFont
InstallOrUpdateBaseBasedevel
#InstallLib
#InstallLogin

CopyConfigs &&
    echo -e "$GREEN[ ✔ ]$RESET Copy configs" >> result.txt ||
    echo -e "$RED[ x ]$RESET Copy configs" >> result.txt
#MakeExecutable
NvimCopy

cat result.txt
rm result.txt
