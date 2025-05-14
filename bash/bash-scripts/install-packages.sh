#!/bin/bash

# List of base packages to install, feel free to comment out what you don't want
packages=(
    "discord"
    "docker"
    "dolphin"
    "fzf"
    "ghostty"
    "go"
    "godot"
    "gparted"
    "hypridle"
    "hyprlock"
    "hyprshot"
    "neovim"
    "nerd-fonts-git"
    "nodejs"
    "npm"
    "obs-studio"
    "parted"
    "steam"
    "stow"
    "syncthing"
    "timeshift"
    "tmux"
    "vivaldi"
    "wofi"
    "wpaperd"
    "xclip"
    "yazi"
    "zen-browser"
    "zoom")

sudo pacman -S yay
yay -S "${packages[@]}"

# Set up Node Version Manager
# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
# nvm install node

# Install vencord
bash -c "$(curl -sS https://raw.githubusercontent.com/Vendicated/VencordInstaller/main/install.sh)"

# Append to our .bashrc
echo "
# Alias Definitions
# this line shoves all the aliases into a .bash_aliases file
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Environment Variables
#this line defines all the environment variables in a seperate file
if [ -f ~/.bash_vars ]; then
    . ~/.bash_vars
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash" >> ~/.bashrc
