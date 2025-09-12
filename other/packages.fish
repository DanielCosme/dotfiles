#!/usr/bin/env fish

sudo pacman -S --noconfirm --needed \
    wget \
    curl \
    git \
    stow \
    vim \
    btop \
    fish \
    tmux \
    man \
    man-db \
    man-pages \
    nvim \
    ripgrep \
    luarocks \
    fd \
    fzf \
    tree-sitter-cli \
    tree-sitter \
    npm \
    base-devel \
    ghostty \
    fontconfig \
    ttf-cascadia-mono-nerd \
    pavucontrol \
    bat \
    blueberry \
    clang \
    docker \
    docker-buildx \
    docker-compose \
    dust \
    dolphin \
    okular \
    eza \
    fastfetch \
    fd \
    fontconfig \
    fzf \
    gcc14 \
    github-cli \
    hypridle \
    hyprland \
    hyprland-qtutils \
    hyprlock \
    hyprpicker \
    hyprcursor \
    hyprshot \
    hyprsunset \
    hyprpolkitagent \
    xdg-desktop-portal-hyprland \
    mako \
    waybar \
    wofi \
    wl-clipboard \
    wl-clip-persist \
    imagemagick \
    impala \
    imv \
    inetutils \
    iwd \
    jq \
    kvantum-qt5 \
    lazydocker \
    lazygit \
    less \
    libqalculate \
    libreoffice \
    llvm \
    luarocks \
    mako \
    noto-fonts \
    noto-fonts-cjk \
    noto-fonts-emoji \
    noto-fonts-extra \
    pamixer \
    playerctl \
    qt5-wayland \
    ripgrep \
    starship \
    swaybg \
    swayosd \
    tree-sitter-cli \
    ttf-cascadia-mono-nerd \
    ttf-jetbrains-mono-nerd \
    unzip \
    woff2-font-awesome \
    xdg-desktop-portal-gtk \
    gnome-keyring \
    foot \
    foot-terminfo \
    syncthing \
    ly # Terminal based login screen thing.

if not command -q yay
    echo Seting up AUR
    mkdir $HOME/tmp
    cd $HOME/tmp
    git clone https://aur.archlinux.org/yay-bin.git
    cd yay-bin
    makepkg -si
    rm -fr $HOME/tmp
end

yay -S --noconfirm --needed \
    1password-beta \
    1password-cli \
    brave-bin \
    zen-browser-bin \
    spotify \
    tlrc-bin \
    logseq-desktop-bin

# To consider
#   avahi
