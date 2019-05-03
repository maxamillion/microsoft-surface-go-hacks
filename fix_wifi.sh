#!/bin/bash

#http://www.killernetworking.com/support/K1535_Debian/board.bin

printf "FIXING WIFI... \n"

sudo rm /lib/firmware/ath10k/QCA6174/hw2.1/board.bin
sudo rm /lib/firmware/ath10k/QCA6174/hw2.1/board-2.bin
sudo cp ./board.bin /lib/firmware/ath10k/QCA6174/hw2.1/board.bin
sudo cp ./board.bin /lib/firmware/ath10k/QCA6174/hw2.1/board-2.bin

sudo rm /lib/firmware/ath10k/QCA6174/hw3.0/board.bin
sudo rm /lib/firmware/ath10k/QCA6174/hw3.0/board-2.bin

sudo cp ./board.bin /lib/firmware/ath10k/QCA6174/hw3.0/board.bin
sudo cp ./board.bin /lib/firmware/ath10k/QCA6174/hw3.0/board-2.bin

cat "options ath10k_core skip_otp=y" > /tmp/ath10k.conf
sudo cp /tmp/ath10k.conf /etc/modprobe.d/ath10k.conf
rm -f /tmp/ath10k.conf
printf "DONE\n"
