#!/bin/bash

IsRoot(){
    if [[ $EUID -ne 0 ]]; then
        echo "This script must be run as root"
        exit 1
    fi
}

HelloScreen(){
    echo '==========================================================='
    echo 'Hyprland install script'
    echo 'Author: https://github.com/Drauwood'
    echo '==========================================================='
}

UpdateReposytoryesDB() {
    echo "Updating system..."
    sudo pacman --noconfirm -Sy
}

InstallXorg() {
    echo "Install xorg..."
    sudo pacman --noconfirm -S xorg-server xorg-xinit xorg-xset xorg-xsetroot xorg-xrandr xorg-xrdb
}

InstallMainPackeges() {
    echo "Install Programs..."
    sudo pacman --noconfirm -S hyprland hyprpaper waybar firefox neovim alacritty mc cmake smplayer cmus wofi btop numlockx udiskie pamixer grim slurp feh zip unzip
}

InstallFont() {
	echo "Install Fonts..."
	sudo pacman --noconfirm -S ttf-liberation ttf-dejavu opendesktop-fonts ttf-bitstream-vera ttf-arphic-ukai ttf-arphic-uming ttf-hanazono ttf-jetbrains-mono-nerd
}

InstallOrUpdateBaseBasedevel() {
    echo "Update or install base, base-devel packeges..."
    sudo pacman --noconfirm -S base base-devel
}

CopyConfigs() {
    cp -rf .config ~/
    cp -rf .bash_profile ~/
    cp -rf .bashrc ~/
}

MakeExecutable() {
    chmod +x ~/.config/bspwm/bspwmrc
    chmod +x ~/.config/polybar/launch.sh
    chmod +x ~/.config/polybar/launch_additional.sh
}

#IsRoot
HelloScreen
UpdateReposytoryesDB

#InstallXorg
InstallMainPackeges
InstallFont
InstallOrUpdateBaseBasedevel

CopyConfigs
#MakeExecutable

echo "Volume 100%..."
pamixer --set-volume 100
