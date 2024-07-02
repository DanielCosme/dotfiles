#! /usr/bin/env fish

sudo apt update
sudo apt install nala

sudo nala install cmake build-essential libudev-dev libevdev-dev libboost-system-dev libboost-thread-dev libboost-program-options-dev libboost-test-dev
echo "Making fish default shell"
chsh -s (which fish)

echo "Installing Interception tools"
git clone https://gitlab.com/interception/linux/tools.git interception-tools
cd interception-tools
cmake -B build -DCMAKE_BUILD_TYPE=Release
cmake --build build
sudo cp ../udevmon.service /etc/systemd/system/udevmon.service
sudo mkdir /etc/interception
sudo cp ../udevmon.yaml /etc/interception/udevmon.yaml
cd build
sudo make install
cd ../../
rm -rf interception-tools

echo "Installing caps2esc"
git clone https://gitlab.com/interception/linux/plugins/caps2esc.git
cd caps2esc
cmake -B build -DCMAKE_BUILD_TYPE=Release
cmake --build build
cd build
sudo make install
cd ../../
rm -fr caps2esc

sudo systemctl daemon-reload
sudo systemctl enable udevmon
sudo systemctl start udevmon

sudo nala install snapd kitty tmux neofetch btop htop

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

if not command -q go 
    snap install go --classic 
end
if not command -q go 
    go install golang.org/x/tools/gopls@latest 
end
if not command -q gh
    snap install gh --classic 
end
if not command -q alacritty 
    snap install alacritty --classic 
end
if not command -q nvim 
    snap install alacritty --classic 
end

if not command -q neovide
    sudo apt install -y curl \
        gnupg ca-certificates git \
        gcc-multilib g++-multilib cmake libssl-dev pkg-config \
        libfreetype6-dev libasound2-dev libexpat1-dev libxcb-composite0-dev \
        libbz2-dev libsndio-dev freeglut3-dev libxmu-dev libxi-dev libfontconfig1-dev \
        libxcursor-dev
    
    cargo install --git https://github.com/neovide/neovide
end

# 1password
curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg
