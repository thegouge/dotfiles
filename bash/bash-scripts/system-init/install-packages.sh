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
    "input-remapper"
    "lazygit"
    "lutris"
    "neovim"
    "nerd-fonts"
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
    "wofi"
    "xclip"
    "yazi"
    "zen-browser"
    "zoom")

if [[ $1 = "arch" ]]; then
    archPackages = (
        "hypridle"
        "hyprland"
        "hyprlock"
        "hyprshot"
        "waybar"
        "wpaperd"
       )

    sudo pacman -S --needed git base-devel
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si

    yay -S "${packages[@]}" "${archPackages[@]}"

elif [[ $1 = "fedora" ]]; then
    dnf copr enable lihaohong/yazi
    sudo dnf copr enable atim/lazygit -y

    sudo dnf install "${packages[@]}" --skip-unavailable

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

