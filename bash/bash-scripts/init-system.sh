#!/bin/bash

echo "Would you like to run everything? [y/N]"
read theworks

if [[ "$theworks" == "y"]]; then
  echo "running 'install-pacakages.sh'..."
  source ./system-init/install-packages.sh

  echo "running 'append-rc.sh'..."
  source ./system-init/append-rc.sh
  
  echo "running 'mount-storage.sh'..."
  source ./system-init/mount-storage.sh
  
  echo "running 'ge-wine-deps.sh'..."
  source ./system-init/ge-wine-deps.sh
  
  echo "running 'arch-audio-tuning.sh'..."
  source ./system-init/arch-audio-tuning.sh

  echo "running 'stow-everything.sh'..."
  source ./system-init/stow-everything.sh
  
  exit 0
fi

echo "Would you like to download your list of preferred packages? [y/N]"
read packageinstall

if [[ "$packageinstall" == "y"]]; then
  source ./system-init/install-packages.sh
fi

echo "Would you like to append the usual to bashrc? [y/N]"
read addrc

if [[ "$addrc" == "y"]]; then
  source ./system-init/append-rc.sh
fi

echo "Would you like to add your 4tb storage drive to fstab? [y/N]"
read storagemount

if [[ "$storagemount" == "y"]]; then
  source ./system-init/mount-storage.sh
fi

echo "Would you like to follow Glorious Eggroll's wine-dependencies? [y/N]"
read eggroll

if [[ "$eggroll" == "y" ]]; then
  source ./system-init/ge-wine-deps.sh
fi

echo "Would you like to tune your system for music-making? (Arch only) [y/N]"
read music

if [[ "$music" == "y" ]]; then
  source ./system-init/arch-audio-tuning.sh
fi

echo "Would you like to gnu-stow everything? [y/N]"
read gstow

if [[ "$gstow" == "y" ]]; then
  source ./system-init/stow-everything.sh
fi

