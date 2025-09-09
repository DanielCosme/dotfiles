#!/usr/bin/env fish


if test $SHELL != "/usr/bin/fish"
	echo Making Fish Shell Default
	chsh -s (which fish)
else
	echo "Shell $SHELL" 
end

if not command -q yay
	echo Seting up AUR
	mkdir $HOME/tmp
	cd $HOME/tmp
	git clone https://aur.archlinux.org/yay-bin.git
	cd yay-bin
	makepkg -si
	rm -fr $HOME/tmp
else
	echo "yay installed"
end

if not command -q Hyprland
	echo Window manager setup
	sudo pacman -S --noconfirm hyprland xdg-desktop-portal-hyprland mako waybar wofi wl-clipboard
else
	echo "hyprland installed"
end

if note command -q zen-browser
	yay -S brave-bin zen-browser-bin
end
