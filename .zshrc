#set path
export PATH=$HOME/bin:/usr/local/bin:$PATH

# set exports
export EDITOR="/usr/bin/nvim"

# run on start
date
ufetch

# configure prompt
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# set ls colors
LS_COLORS=$LS_COLORS:"di=0;33:" ; export LS_COLORS

# enable vim mode
bindkey -v
bindkey -M viins "" vi-cmd-mode
KEYTIMEOUT=1

# edit in vim
autoload -z edit-command-line
zle -N edit-command-line
bindkey "" edit-command-line

# enable reverse search
bindkey -M viins "" history-incremental-search-backward

# enable tab menu
autoload -U compinit
zstyle ":completion:*" menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# vi motions for tab menu
bindkey  -M menuselect "h" vi-backward-char
bindkey  -M menuselect "j" vi-down-line-or-history
bindkey  -M menuselect "k" vi-up-line-or-history
bindkey  -M menuselect "l" vi-forward-char

# functions for setting cursor style
set_cursor_block () {
    echo -ne "\e[1 q"
}

set_cursor_beam () {
    echo -ne "\e[5 q"
}

# set cursor for startup 
set_cursor_beam

# set cursor for each new prompt
precmd_functions+=(set_cursor_beam)

# set cursor for vim modes
zle-keymap-select () {
    if [[ $KEYMAP == vicmd ]] || 
        [[ $1 = block ]]; then
        set_cursor_block

    elif [[ $KEYMAP == main ]] ||
        [[ $KEYMAP == viins ]] ||
        [[ $KEYMAP == "" ]] ||
        [[ $1 == beam ]]; then
        set_cursor_beam
    fi
}
zle -N zle-keymap-select

# set aliases
alias vim="nvim"

#alias cat="bat"

alias ls="lsd --group-directories-first -v"

alias rm="rm -i"
alias rmd="rm -Ir"

alias df="df -h"

alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"


