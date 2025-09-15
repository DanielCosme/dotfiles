#!/usr/bin/env fish

stow  --verbose --dotfiles .
sudo stow  --verbose --dir ./dabs/config --target /etc/ly ly
