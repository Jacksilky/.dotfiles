#!/bin/bash
#Install Nix
sh <(curl -L https://nixos.org/nix/install) --no-daemon

#Source Nix
. ~/.nix-profile/etc/profile.d/nix.sh

#Install packages
nix-env -iA \
  nixpkgs.zsh \
  nixpkgs.oh-my-posh \
  nixpkgs.git \
  nixpkgs.neovim \
  nixpkgs.tmux \
  nixpkgs.stow \
  nixpkgs.yarn \
  nixpkgs.fzf \
  nixpkgs.ripgrep \
  nixpkgs.bat \
  nixpkgs.kubectl \
  nixpkgs.direnv

#Setup zsh
command -v zsh | sudo tee -a /etc/shells
sudo chsh -s $(which zsh) $USER

#WSL specifc? Fix not git.exe error with oh-my-posh
ln ~/.nix-profile/bin/git git.exe

#Install TMUX plugin manager (tpm)
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

#clone .dotfiles
git clone git@github.com:Jacksilky/.dotfiles.git ~/

#Setup stow symlinks
cd ~/.dotfiles
for dir in */; do
    # Remove trailing slash from directory name
    dirname="${dir%/}"
    # Run stow command
    echo "Running: stow $dirname"
    stow "$dirname"
done
