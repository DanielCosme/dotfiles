#!/bin/sh

# When you hold Option + Left/Right Arrow to skip words, the speed is limited by your Mac's global keyboard settings.
# 	1. Open System Settings and go to Keyboard.
# 	2. Set the Key repeat rate slider to the maximum (Fast).
# 	3. Set the Delay until repeat slider to the minimum (Short)

defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 10
