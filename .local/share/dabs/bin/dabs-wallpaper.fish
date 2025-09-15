#!/usr/bin/env fish

set ultrawide_path $HOME/Pictures/wallpapers/ultrawide
set vertical_path $HOME/Pictures/wallpapers/vertical

function get_img
    set path $argv[1]
    ls $path | shuf -n 1
end

set vertical (get_img $vertical_path)

hyprctl hyprpaper reload "desc:Samsung Electric Company LC34G55T HNTW600655","$ultrawide_path/"(get_img $ultrawide_path)
hyprctl hyprpaper reload "desc:BNQ BenQ PD2700U ET53N03984SL0","$vertical_path/$vertical"
