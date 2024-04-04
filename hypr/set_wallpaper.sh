#!/bin/bash

echo "preload = ~/wallpapers/${1}" > ~/.config/hypr/hyprpaper.conf
echo "wallpaper = ,~/wallpapers/${1}" >> ~/.config/hypr/hyprpaper.conf
echo "splash = false" >> ~/.config/hypr/hyprpaper.conf

killall hyprpaper ; hyprpaper&
disown hyprpaper



