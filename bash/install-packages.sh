#!/bin/bash

# Double check that we're running as sudo
if [ "$EUID" -ne 0 ];then
    echo "Please run this script as root"
    exit 1
fi

# List of base packages to install, feel free to comment out what you don't want
packages=(
    "neovim" 
    "tmux" 
    "discord" 
    "Godot" 
    "gnome-terminal" 
    "steam" 
    "syncthing" 
    "obs-studio" 
    "zoom" 
    "timeshift" 
    "fzf" 
    "stow",
    "xclip")

if [ -f /etc/apt/sources.list ]; then
    echo "we're in debian land!"

    # Adding all the repositories we need
    add-apt-repository ppa:neovim-ppa/stable -y
    add-apt-repository ppa:obsproject/obs-studio -y

    apt-get update

    # install everything
    apt-get install "${packages[@]}" nala ffmpeg -y

    # set up docker
    apt-get install ca-certificates curl
    install -m 0755 -d /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    chmod a+r /etc/apt/keyrings/docker.asc
    echo \ "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \ $(. /etc/os-release && echo "$UBUNTU_CODENAME") stable" | \ tee /etc/apt/sources.list.d/docker.list > /dev/null
    apt-get update
    apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

elif [ -f /etc/pacman.conf ]; then
    echo "we're in Arch land!"

    yay -S "${packages[@]}" docker go nerd-fonts-git -y

else
    echo "Unsupported distro!"
fi

# Set up Node Version Manager
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
nvm install node

# Install vencord
sh -c "$(curl -sS https://raw.githubusercontent.com/Vendicated/VencordInstaller/main/install.sh)"

# Append to our .bashrc
echo "# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

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
