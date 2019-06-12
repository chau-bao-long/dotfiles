#!/bin/bash
echo "options snd-hda-intel index=1,0" > /etc/modprobe.d/sound.conf
echo "QT_SCALE_FACTOR=2
GDK_DPI_SCALE=2" > /etc/environment
"FONT=latarcyrheb-sun32" > /etc/vconsole.conf
sudo pacman -S --noconfirm noto-fonts noto-fonts-cjk noto-fonts-emoji papirus-icon-theme
echo "options hid_apple fnmode=2" > /etc/modprobe.d/hid_apple.conf
