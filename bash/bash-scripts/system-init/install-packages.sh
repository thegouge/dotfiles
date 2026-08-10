#!/bin/bash

echo "What base distro are you running?"
read distro

# List of base packages to install
packages=(
    "discord"
    "docker"
    "fzf"
    "ghostty"
    "go"
    "godot"
    "input-remapper"
    "lazygit"
    "lutris"
    "neovim"
    "nerd-fonts"
    "obs-studio"
    "parted"
    "sshfs"
    "steam"
    "stow"
    "syncthing"
    "tmux"
    "vivaldi"
    "vlc"
    "xclip"
    "zen-browser-bin"
    "zoom")

if [[ "$distro" == "arch" ]]; then
    archpackages=(
        "gvfs"
        "gvfs-smb"
    )

    echo "which Desktop environment are you using?"
    echo "Hyprland=1, other=2"
    read DE

    sudo pacman -S --needed git base-devel
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si

    yay -S "${packages[@]}" "${archpackages[@]}"

    if [[ "$DE" == "1"]]; then
        hyprPackages=(
            "hypridle"
            "hyprland"
            "hyprlock"
            "hyprshot"
            "waybar"
            "wlogout"
    	    "pavucontrol"
    	    "wofi"
    	    "tumbler"
            "wpaperd")
        
        yay -S "${hyprPackages[@]}"
    fi

    source ./nvm.sh

elif [[ "$distro" == "fedora" ]]; then
    debpackages=()
    
    dnf copr enable lihaohong/yazi
    sudo dnf copr enable atim/lazygit -y

    sudo dnf install "${packages[@]}" "${debpackages[@]}" --skip-unavailable

    source ./nvm.sh

elif [[ "$distro" == "debian" ]]; then
    aptpackages=(
        "nala"
        "ffmpeg"
    )
        
    # Adding all the repositories we need
    sudo add-apt-repository ppa:neovim-ppa/stable -y
    sudo add-apt-repository ppa:obsproject/obs-studio -y

    sudo apt-get update

    # install everything
    sudo apt-get install "${packages[@]}" "${aptpackages[@]}" -y

    # set up docker
    sudo apt-get install ca-certificates curl
    install -m 0755 -d /etc/apt/keyrings

    curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc

    sudo chmod a+r /etc/apt/keyrings/docker.asc

    echo \ "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \ $(. /etc/os-release && echo "$UBUNTU_CODENAME") stable" | \ tee /etc/apt/sources.list.d/docker.list > /dev/null

    sudo apt-get update

    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

    source ./nvm.sh

else
    echo "I didn't recognize your base distro, please enter 'arch', 'debian', or 'fedora'"
fi

