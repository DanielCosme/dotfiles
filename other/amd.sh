#!/usr/bin/env fish

echo "Installing AMD Drivers"
sudo pacman -S --noconfirm mesa lib32-mesa vulkan-radeon lib32-vulkan-radeon libva-mesa-driver libva-utils
