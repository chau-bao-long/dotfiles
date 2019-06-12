#! /bin/bash

# copy scripts to user bin
if [ ! -d ~/bin ]; then
  mkdir -p ~/bin
  cp ./scripts/* ~/bin
fi
# core command
sudo pacman -S --noconfirm net-tools openbsd-netcat htop xclip xsel mlocate unzip ntp
sudo pacman -S --noconfirm alsa-utils libnotify dunst feh dnsutils
# sync time with time server
sudo systemctl enable ntpd
sudo systemctl start ntpd
sudo timedatectl set-ntp on
