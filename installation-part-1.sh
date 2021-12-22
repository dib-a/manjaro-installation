#!/bin/bash

#keep in mind to run su to become sudo before starting the script 

pacman-mirrors --geoip && sudo pacman -Syyu
systemctl enable --now systemd-timesyncd
cfdisk /dev/sda
mkfs.vfat -F 32 -n EFI /dev/sda1
mkfs.ext4 -L BOOT /dev/sda2
cryptsetup -v -y --cipher aes-xts-plain64 --key-size 256 --hash sha256 --iter-time 2000 --use-urandom --verify-passphrase luksFormat /dev/sda3
cryptsetup open /dev/sda3 SYSTEM
