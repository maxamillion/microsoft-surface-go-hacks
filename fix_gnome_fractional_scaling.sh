#!/bin/bash

printf "SETTING GNOME FRACTIONAL SCALING... "
gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"
printf "DONE\n"
