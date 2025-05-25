#!/bin/bash

# List of base packages to install
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
    "hyprland"
    "hyprlock"
    "hyprshot"
    "input-remapper-bin"
    "lazygit"
    "lutris"
    "neovim"
    "nerd-fonts-git"
    "obs-studio"
    "parted"
    "reaper"
    "steam"
    "stow"
    "syncthing"
    "timeshift"
    "tmux"
    "vivaldi"
    "vlc"
    "waybar"
    "wofi"
    "wpaperd"
    "xclip"
    "yazi"
    "zen-browser-bin"
    "zoom")

if [[ $1 = "arch" ]]; then
    sudo pacman -S --needed git base-devel
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si

    yay -S "${packages[@]}"

elif [[ $1 = "fedora" ]]; then
    sudo dnf install "${packages[@]}"

elif [[ $1 = "ubuntu" ]]; then
    # Adding all the repositories we need
    sudo add-apt-repository ppa:neovim-ppa/stable -y
    sudo add-apt-repository ppa:obsproject/obs-studio -y

    sudo apt-get update

    # install everything
    sudo apt-get install "${packages[@]}" nala ffmpeg -y

    # set up docker
    sudo apt-get install ca-certificates curl
    install -m 0755 -d /etc/apt/keyrings

    curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc

    sudo chmod a+r /etc/apt/keyrings/docker.asc

    echo \ "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \ $(. /etc/os-release && echo "$UBUNTU_CODENAME") stable" | \ tee /etc/apt/sources.list.d/docker.list > /dev/null

    sudo apt-get update

    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

else
    echo "please enter a base distro as your first argument"
fi

