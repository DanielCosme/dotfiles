#!/usr/bin/env sh

stow --verbose --adopt --dotfiles --dir $HOME/.dotfiles --target $HOME .
