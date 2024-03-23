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
LS_COLORS=$LS_COLORS:"di=1;33:" ; export LS_COLORS

# enable vim mode
bindkey -v
bindkey -M viins "" vi-cmd-mode
KEYTIMEOUT=1

# binding to edit command in vim
autoload -z edit-command-line
zle -N edit-command-line
bindkey "" edit-command-line

# enable reverse search
bindkey -M viins "" history-incremental-search-backward

# configure tab menu
autoload -U compinit
zstyle ":completion:*" menu select
zmodload zsh/complist
compinit
# show hidden files
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
    # normal mode
    if [[ $KEYMAP == vicmd ]] || 
        [[ $1 = block ]]; then
        set_cursor_block

    # insert mode
    elif [[ $KEYMAP == main ]] ||
        [[ $KEYMAP == viins ]] ||
        [[ $KEYMAP == "" ]] ||
        [[ $1 == beam ]]; then
        set_cursor_beam
    fi
}
zle -N zle-keymap-select

# Configure history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history
# don't save command if identical to prev 
setopt HIST_IGNORE_ALL_DUPS
# save after every command instead of just on exit
setopt INC_APPEND_HISTORY
# use history for previous/next between shells
setopt SHARE_HISTORY

# set aliases
alias vim="nvim"
alias cat="bat"

base_ls="eza --group-directories-first --icons=auto --git -h --width=100"
alias ls=$base_ls
alias lsl="${base_ls} -l"
alias lsd="${base_ls} -D"
alias lsf="${base_ls} -f"

alias rm="rm -i"
alias rmd="rm -Ir"

alias df="df -h"

alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"

# enable syntax highlighting
source /usr/share/zsh/site-functions/zsh-syntax-highlighting.zsh
