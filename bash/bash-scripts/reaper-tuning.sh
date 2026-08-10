#!/bin/bash

echo "first off, we'll install and run the rtcqs script. This will let us know what if anything to change"

git clone https://codeberg.org/rtcqs/rtcqs.git
./rtcqs/src/rtcqs/rtcqs.py

echo "would you like to continue with tweaks? [Y/n]"
read start

if [[ "$start" == "n" ]]; then
  exit 0
fi

yay -Rdd pulseaudio pulseaudio-alsa pulseaudio-jack jack2
yay -S pipewire-alsa pipewire-pulse pipewire-jack realtime-privileges yabridge yabridgectl

echo "do we need to add $USER to the 'realtime' and 'audio' groups? [Y/n]"
read adduser

if [[ "$adduser" != "n" ]]; then
  sudo usermod -a -G realtime,audio $USER
fi

echo "do we need to edit grubconfig? [Y/n]"
read grubconfig

if [["$grubconfig" != "n"]]; then
  echo 'REMOVE THIS LINE AND THE NEXT!!!!! 
  Change GRUB_CMDLINE_LINUX="" to GRUB_CMDLINE_LINUX="threadirqs"' >> /etc/default/grub

  sudo nvim -+ /etc/default/grub

  sudo grub-mkconfig -o /boot/grub/grub.cfg
fi

echo "do you want to set your CPU to 'performance' mode? [Y/n]"
read performance

if [[ "$performance" != "n" then
  sudo cpupower frequency-set -g performance
fi

echo "

Now all you should need to do is set Reaper to the ALSA audio system, and set the inputs and outputs to default.

Once you've done that, restart and you SHOULD be good to go. "
