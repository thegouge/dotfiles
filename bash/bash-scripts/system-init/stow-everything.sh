#!/bin/bash

cd ~/dotfiles

echo "Are you using Fish? [y/N]"
read fish
if [[ "$fish" == "y" ]]; then
  stow fish
else
  stow bash
fi

echo "Are you on Hyprland? [y/N]"
read hypr
if [[ "$hypr" == "y" ]]; then
  stow hyprland
fi

echo "are you using Ghostty? [Y/n]"
read ghost
if [[ "$ghost" != "n" ]]; then
  stow ghostty
fi

echo "are you still a based developer? [Y/n]"
read based
if [[ "$based" != "n" ]]; then
  stow nvim tmux
fi

echo "would you like to use Starship? [y/N]"
read ship

if [[ "$ship" == "y" ]]; then
  stow starship
fi

echo "Would you like to use Yazi? [y/N]"
read yazi

if [[ "$yazi" == "y" ]]; then
  stow yazi
fi

echo "Would you like to use Godot? [Y/n]"
read godot

if [[ "$godot" != "n" ]]; then
  stow godot
fi

echo "Would you like to use Blender? [Y/n]"
read blender

if [[ "$blender" != "n" ]]; then
  stow blender
fi

cd ~
