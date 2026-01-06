#!/bin/bash

IsRoot() {
  if [[ $EUID -ne 0 ]]; then
    echo ":: This script must be run as root"
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
  sudo pacman --noconfirm -Sy
}

InstallXorg() {
  echo ":: Install xorg..."
  sudo pacman --noconfirm -S xorg-server xorg-xinit xorg-xset xorg-xsetroot xorg-xrandr xorg-xrdb xorg-server-devel
}

InstallMainPackeges() {
  echo ":: Install Programs..."
  sudo pacman --noconfirm -S hyprland hyprpaper hyprshot waybar firefox neovim alacritty mc cmake smplayer btop numlockx udiskie pamixer feh zip unzip transmission-gtk fzf nodejs npm
}

InstallFont() {
  echo ":: Install Fonts..."
  sudo pacman --noconfirm -S ttf-liberation ttf-dejavu opendesktop-fonts ttf-bitstream-vera ttf-arphic-ukai ttf-arphic-uming ttf-hanazono ttf-jetbrains-mono-nerd
}

InstallOrUpdateBaseBasedevel() {
  echo ":: Update or install base, base-devel packeges..."
  sudo pacman --noconfirm -S base base-devel
}

InstallLib() {
  echo ":: Update or install lib's packeges..."
  sudo pacman --noconfirm -S libxcursor libxrandr libxinerama libxi libxkbcommon
}

InstallLogin() {
  echo ":: Install GDM ..."
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

echo ":: Volume 100%..."
pamixer --set-volume 100
