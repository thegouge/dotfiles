#!/bin/bash

# Generate an SSH key
ssh-keygen -t ed25519 -C "thegougedev@gmail.com"
cat ~/.ssh/id_ed25519.pub
echo "pausing here for you to add your new SSH key to github"
echo "go to https://github.com/settings/ssh/new"
echo "then press 'ENTER' to continue"

read input
while true; do
    if [[ $input = "" ]]; then
        break
    fi
done

# initialize my git credentials
git config --global user.name "thegouge"
git config --global user.email "thegougedev@gmail.com"

# clone my dotfiles repo
git clone git@github.com:thegouge/dotfiles.git
cd dotfiles

