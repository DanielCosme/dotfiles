#!/usr/bin/env bash
sudo pacman -S --noconfirm stow
../stow.sh
sudo xargs -a programs_pacman.txt pacman -S --noconfirm
fc-cache -fv
