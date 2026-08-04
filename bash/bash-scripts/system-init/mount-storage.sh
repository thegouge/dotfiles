#!/bin/bash

sudo echo "

# 4TB Storage Drive
UUID=4b95a440-41f3-40a2-b42c-da42632cbdaf /storage       btrfs   rw,noatime,exec 0 0" >> /etc/fstab
