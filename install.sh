#!/bin/bash

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
    echo ":: Updating system..." >> result.txt
    sudo pacman --noconfirm -Sy &&
        echo "[ OK ] pacman --noconfirm -Sy" >> result.txt ||
        echo "[ ERROR ] pacman --noconfirm -Sy" >> result.txt
}

InstallXorg() {
    echo ":: Install xorg..." >> result.txt
    sudo pacman --noconfirm -S xorg-server xorg-xinit xorg-xset xorg-xsetroot xorg-xrandr xorg-xrdb xorg-server-devel &&
        echo "[ OK ] Install xorg" >> result.txt ||
        echo "[ ERROR ] Install xorg" >> result.txt
}

InstallMainPackeges() {
    echo ":: Install Programs..." >> result.txt
    sudo pacman --noconfirm -S hyprland hyprpaper uwsm libnewt hyprshot waybar firefox neovim alacritty mc ranger smplayer cmake btop numlockx udiskie pamixer feh zip unzip transmission-gtk ripgrep fzf nodejs npm &&
        echo "[ OK ] Install Programs" >> result.txt ||
        echo "[ ERROR ] Install Programs" >> result.txt
}

InstallFont() {
    echo ":: Install Fonts..." >> result.txt
    sudo pacman --noconfirm -S ttf-liberation ttf-dejavu opendesktop-fonts ttf-bitstream-vera ttf-arphic-ukai ttf-arphic-uming ttf-jetbrains-mono-nerd &&
        echo "[ OK ] Install Fonts" >> result.txt ||
        echo "[ ERROR ] Install Fonts" >> result.txt
}

InstallOrUpdateBaseBasedevel() {
    echo ":: Update or install base, base-devel packeges..." >> result.txt
    sudo pacman --noconfirm -S base base-devel &&
        echo "[ OK ] Update or install base, base-devel packeges" >> result.txt ||
        echo "[ ERROR ] Update or install base, base-devel packeges" >> result.txt
}

InstallLib() {
    echo ":: Update or install lib's packeges..." >> result.txt
    sudo pacman --noconfirm -S libxcursor libxrandr libxinerama libxi libxkbcommon &&
        echo "[ OK ] Update or install lib's packeges" >> result.txt ||
        echo "[ ERROR ] Update or install lib's packeges" >> result.txt
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
    git clone https://github.com/Drauwood/nvim.git ~/.config/nvim
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

CopyConfigs
#MakeExecutable
NvimCopy

cd
cat result.txt
rm result.txt
