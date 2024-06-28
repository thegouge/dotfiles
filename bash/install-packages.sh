#!/bin/bash

packages = ["neovim", "tmux", "discord", "Godot", "gnome-terminal", "steam", "syncthing", "obs-studio", "zoom", "timeshift", "fzf", ""]

if [ -f /etc/apt ]; then
    # we're in debian land!

    # Adding all the repositories we need
    add-apt-repository ppa:neovim-ppa/stable -y
    add-apt-repository ppa:obsproject/obs-studio -y

    apt-get update

    # install everything
    apt-get install $packages nala ffmpeg -y

    # set up docker
    apt-get install ca-certificates curl
    install -m 0755 -d /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    chmod a+r /etc/apt/keyrings/docker.asc
    echo \ "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \ $(. /etc/os-release && echo "$UBUNTU_CODENAME") stable" | \ tee /etc/apt/sources.list.d/docker.list > /dev/null
    apt-get update
    apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

else 

    yay -S $packages docker -y

fi

# Set up Node Version Manager
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
nvm install node

# Install vencord
sh -c "$(curl -sS https://raw.githubusercontent.com/Vendicated/VencordInstaller/main/install.sh)"

