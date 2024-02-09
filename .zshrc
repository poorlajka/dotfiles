# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"

plugins=(git zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Set colors for ls
LS_COLORS=$LS_COLORS:'di=0;35:' ; export LS_COLORS
#LS_COLORS=$LS_COLORS:'rs=0;36:' ; export LS_COLORS
LS_COLORS=$LS_COLORS:'ex=0;45:' ; export LS_COLORS

alias vim="nvim"
alias ls="lsd"

neofetch
