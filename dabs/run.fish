#!/usr/bin/env fish

sudo pacman -Syu; or exit 1

cd ~/.dotfiles
./stow.sh; or exit 1
./packages.fish; or exit 1
./setup.fish
./mimetypes.sh
