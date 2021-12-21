#!/bin/bash

su
sudo pacman-mirrors --geoip && sudo pacman -Syyu
systemctl enable --now systemd-timesyncd
cfdisk /dev/sda
mkfs.vfat -F 32 -n EFI /dev/sda1
mkfs.ext4 -L BOOT /dev/sda2
