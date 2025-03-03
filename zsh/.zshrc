export ZSH="$HOME/.oh-my-zsh"
PATH="~/.nix-profile/bin/:$PATH"
if [ -e /home/jack/.nix-profile/etc/profile.d/nix.sh ]; then . /home/jack/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
eval "$(oh-my-posh init zsh --config ~/.amro.omp.json)"

ZSH_THEME="robbyrussell"
plugins=(git)

#source $ZSH/oh-my-zsh.sh

