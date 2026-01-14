fish_vi_key_bindings
fish_user_key_bindings

set fish_greeting

starship init fish | source

# environment
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_USER_CONFIG_DIR $XDG_CONFIG_HOME
set -gx BROWSER brave
set -gx EDITOR nvim

# Docker
set -gx DOCKER_BUILDKIT 1

# Golang
set -gx GOPATH $HOME/go
set -gx GOBIN $HOME/go/bin
set -gx GO111MODULE on
fish_add_path $GOBIN
fish_add_path /usr/local/go/bin

# Rust
set -gx CARGO_BIN $HOME/.cargo/bin
fish_add_path $CARGO_BIN

# Node
set -gx NPM_PACKAGES "$HOME/.npm_packages"
fish_add_path $NPM_PACKAGES
set -gx PNPM_HOME "$HOME/.local/share/pnpm"
fish_add_path $PNPM_HOME
if test ! -d "$HOME/.npm_packages"
    mkdir "$HOME/.npm_packages"
end
set -gx NPM_CONFIG_PREFIX $NPM_PACKAGES
fish_add_path $NPM_PACKAGES/bin

# Add ~/.local/bin to PATH
if test -d ~/.local/bin
    if not contains -- ~/.local/bin $PATH
        set -p PATH ~/.local/bin
    end
end

abbr -a nv neovide --fork
abbr -a mm mage
abbr -a vi nvim
# Kubernetes
abbr -a kk kubectl
abbr -a kks sudo kubectl

function pacman_fix
    sudo rm /var/lib/pacman/db.lck
end

# Cleanup orphaned packages
function pacman_cleanup
    sudo pacman -Rns (pacman -Qtdq)
end

# Fish command history
function history
    builtin history --show-time='%F %T '
end

# Fish syntax highlighting
set -U fish_color_normal normal
set -U fish_color_command 5f8700
set -U fish_color_quote ffaf00
set -U fish_color_redirection 8700af
set -U fish_color_end 0000ff
set -U fish_color_error ff0000
set -U fish_color_param afd700
set -U fish_color_selection white --bold --background=brblack
set -U fish_color_search_match bryellow --background=brblack
set -U fish_color_history_current --bold
set -U fish_color_operator 00a6b2
set -U fish_color_escape 00a6b2
set -U fish_color_cwd green
set -U fish_color_cwd_root red
set -U fish_color_valid_path --underline
set -U fish_color_autosuggestion 808080
set -U fish_color_user brgreen
set -U fish_color_host normal
set -U fish_color_cancel -r
set -U fish_pager_color_completion normal
set -U fish_pager_color_description B3A06D yellow
set -U fish_pager_color_prefix white --bold --underline
set -U fish_pager_color_progress brwhite --background=cyan
set -U fish_color_match --background=brblue
set -U fish_color_comment 990000
