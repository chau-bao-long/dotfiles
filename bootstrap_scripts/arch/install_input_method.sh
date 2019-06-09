#! /bin/bash

sudo pacman -S --noconfirm fcitx fcitx-unikey fcitx-im fcitx-configtool
echo "GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
XMODIFIERS=@im=fcitx
" > ~/.pam_environment
# Extra Work: still need to go to $ fcitx-configtool to set hot key alt + ; and unikey method
