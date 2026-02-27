#!/usr/bin/env sh

stow  --verbose --dotfiles --dir $HOME/.dotfiles --target $HOME .
# sudo stow  --verbose --dir ./dabs/config --target /etc/ly ly
