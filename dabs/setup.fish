#!/usr/bin/env fish

if test $SHELL != /usr/bin/fish
    echo Making Fish Shell Default
    chsh -s (which fish)
else
    echo "Shell $SHELL"
end
fish_add_path ~/.local/share/dabs/bin

systemctl --user enable --now syncthing

sudo systemctl disable getty@tty2.service # This is to make sure the login manager (ly) works properly.
sudo systemctl enable ly
sudo cp $HOME/.dotfiles/dabs/ly/config.ini /etc/ly/config.ini
# sudo cp $HOME/.dotfiles/other/limine/limine.conf /boot/EFI/limine.conf

sudo systemctl enable --now tailscaled
sudo tailscale set --operator=$USER

fc-cache -fv

cp ./applications/*.desktop ~/.local/share/applications/
balooctl6 disable
