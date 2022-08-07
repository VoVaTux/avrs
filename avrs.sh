#!/bin/sh
[ $(whoami) != "root" ] && echo "Please run this script as root (sudo)"
echo "Welcome To AVRS - Automatic Void Ricing Script"
echo "This script will install and configure some basic software to get you started in the work of linux minimalism!"

read -p "\nAre you ready to begin? (y/n) " ready
[ $ready != "y" ] && echo "See you next time then!" ; exit

echo "\nWonderful! Then let's begin!"
read -p "\nWhat is the name of your user? " user
xbps-install -Syu
xbps-install dunst base-devel libX11-devel libXft-devel libXinerama-devel freetype-devel fontconfig-devel harfbuzz-devel firefox opendoas

echo "usermod :wheel as root" >> /etc/doas.conf

cd .config/dwm && make install && cd ../..
cd .config/st && make install && cd ../..
cd .config/dwmblocks && make install && cd ../..
cp * ~
chsh $user -s /bin/zsh
xbps-remove -f sudo
