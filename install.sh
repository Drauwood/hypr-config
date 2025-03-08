#!/bin/bash

echo "Installing programs..."
sudo pacman -S hyprland hyprpaper waybar firefox neovim alacritty mc cmake smplayer cmus wofi numlockx udiskie pamixer grim slurp feh zip unzip

echo "Installing fonts..."
sudo pacman -S ttf-liberation ttf-dejavu opendesktop-fonts ttf-bitstream-vera ttf-arphic-ukai ttf-arphic-uming ttf-hanazono ttf-jetbrains-mono-nerd

echo "Copying settings..."
cp -r .config ~/
cp -r .bash_profile ~/
cp -r .bashrc ~/
cp -r .xinitrc ~/

echo "Volume 100%..."
pamixer --set-volume 100
