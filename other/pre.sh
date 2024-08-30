#! /usr/bin/env bash

# sudo apt update
# sudo apt install stow
# cd $HOME/.dotfiles
# stow .
# 
# if ! command -v rustup &> /dev/null
# then
#     curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# fi


# Nerd fonts
wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip \
&& cd ~/.local/share/fonts \
&& unzip JetBrainsMono.zip \
&& rm JetBrainsMono.zip \
&& sudo fc-cache -fv


# Starship
# if ! command -v startship &> /dev/null
# then
#     curl -sS https://starship.rs/install.sh | sh
# fi
# Exa
# cargo install exa
# 
# sudo apt install fish vim

