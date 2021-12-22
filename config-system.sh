#!/bin/bash

vim /etc/locale.gen
locale-gen

ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime
hwclock --systohc --utc

echo pc > /etc/hostname
passwd
vim /etc/sudoers

systemctl enable dhcpcd
systemctl enable NetworkManager
systemctl enable systemd-timesyncd

vim /etc/mkinitcpio.conf
mkinitcpio -P

grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=manjaro --recheck
