#!/bin/bash

HelloScreen() {
    echo '==========================================================='
    echo ':: Hyprland Install Script'
    echo ':: Author: Drauwood'
    echo ':: GitHub: https://github.com/Drauwood'
    echo '==========================================================='
}

UpdateReposytoryesDB() {
    echo ":: Updating system..."
    sudo pacman --noconfirm -Sy
}

InstallMainPackeges() {
    echo ":: Install Programs..."
    sudo pacman --noconfirm -S hyprland hyprpaper hyprshot waybar alacritty
}

InstallFont() {
    echo ":: Install Fonts..."
    sudo pacman --noconfirm -S ttf-jetbrains-mono-nerd
}

CopyConfigs() {
    cp -rf .config ~/
    cp -rf .bash_profile ~/
    cp -rf .bashrc ~/
}

HelloScreen
UpdateReposytoryesDB

InstallMainPackeges
InstallFont

CopyConfigs
