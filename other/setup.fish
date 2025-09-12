#!/usr/bin/env fish

if test $SHELL != /usr/bin/fish
    echo Making Fish Shell Default
    chsh -s (which fish)
else
    echo "Shell $SHELL"
end

systemctl --user enable --now syncthing
sudo systemctl disable getty@tty2.service # This is to make sure the login manager (ly) works properly.
sudo systemctl enable ly
sudo cp $HOME/.dotfiles/other/ly/config.ini /etc/ly/config.ini
# sudo cp $HOME/.dotfiles/other/limine/limine.conf /boot/
fc-cache -fv
