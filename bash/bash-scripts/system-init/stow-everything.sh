#!/bin/bash

echo "Would you like to run everything? [y/N]"
read theworks

if [[ "$theworks" == "y" ]]; then

  exit 0
fi

fish
ghostty
hyprland
nvim
starship
tmux
wallpaper
waybar
wlogout
wofi
yazi
