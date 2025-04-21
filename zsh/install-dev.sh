#!/bin/bash


set -e



echo "Updating package lists..."

sudo apt update



echo "Installing Zsh, Tmux, and dependencies..."

sudo apt install -y zsh tmux curl wget git unzip



echo "Installing Oh My Posh..."

curl -s https://ohmyposh.dev/install.sh | bash -s -- -d ~/bin


echo "Setting up Oh My Posh theme..."

mkdir -p ~/.config/oh-my-posh

curl -s https://raw.githubusercontent.com/Jacksilky/.dotfiles/refs/heads/main/oh-my-posh/.amro.omp.json -o ~/.config/oh-my-posh/amro.opm.json

chmod u+rw ~/.config/oh-my-posh/*.json


echo "Adding Oh My Posh to Zsh config..."

if ! grep -q "oh-my-posh" ~/.zshrc; then

  echo 'eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/amro.opm.json)"' >> ~/.zshrc

fi



echo "Installing Neovim 0.11.0 AppImage..."

NVIM_VERSION="v0.11.0"

wget -O nvim.appimage https://github.com/neovim/neovim/releases/download/${NVIM_VERSION}/nvim-linux-x86_64.appimage

chmod u+x nvim.appimage

sudo mv nvim.appimage /usr/local/bin/nvim



echo "Verifying installations..."

echo -n "Zsh version: "; zsh --version

echo -n "Tmux version: "; tmux -V

echo -n "Oh My Posh version: "; ~/.local/bin/oh-my-posh --version

echo -n "Neovim version: "; nvim --version | head -n 1



echo "Setting Zsh as default shell for user $USER..."

chsh -s $(which zsh)



echo "✅ All done! Restart your terminal or run \`zsh\` to get started."


