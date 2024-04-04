#
#    __        _ __        _                     __                     _____      
#   / /___ _  (_) /______ ( )_____   ____  _____/ /_  _________  ____  / __(_)___ _
#  / / __ `/ / / //_/ __ `/// ___/  /_  / / ___/ __ \/ ___/ __ \/ __ \/ /_/ / __ `/
# / / /_/ / / / ,< / /_/ / (__  )    / /_(__  ) / / / /__/ /_/ / / / / __/ / /_/ / 
#/_/\__,_/_/ /_/|_|\__,_/ /____/    /___/____/_/ /_/\___/\____/_/ /_/_/ /_/\__, /  
#       /___/                                                             /____/   
#

#-------------------- exports --------------------

export PATH="$PATH:~/.local/bin/:~/scripts:$HOME/.cargo/bin"
export EDITOR="nvim"
export VISUAL="nvim"
export BROWSER="firefox-bin"

# change colors of directories listed by ls to light purple 
LS_COLORS=$LS_COLORS:"di=1;95:" ; export LS_COLORS  

#-------------------- prompt --------------------

autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# add an empty line before each prompt
precmd() { echo }

#-------------------- vi mode --------------------

# enable vi mode and bind to ctrl-v
bindkey -v
bindkey -M viins "" vi-cmd-mode
bindkey -v "^?" backward-delete-char
KEYTIMEOUT=1

# edit current command with neovim using ctrl-e
autoload -z edit-command-line
zle -N edit-command-line
bindkey "" edit-command-line

#-------------------- tab completion --------------------

# enable tab completion menu
autoload -U compinit
zstyle ":completion:*" menu select
zmodload zsh/complist
compinit
# show hidden files
_comp_options+=(globdots)

# configure vi hjkl-motions for tab completion menu
bindkey  -M menuselect "h" vi-backward-char
bindkey  -M menuselect "j" vi-down-line-or-history
bindkey  -M menuselect "k" vi-up-line-or-history
bindkey  -M menuselect "l" vi-forward-char


#-------------------- cursor --------------------

# functions for setting cursor style
set_cursor_block () {
    echo -ne "\e[1 q"
}

set_cursor_beam () {
    echo -ne "\e[5 q"
}

# set cursor on startup
set_cursor_beam

# set cursor on new prompt
precmd_functions+=(set_cursor_beam)

# set cursor based on current vi mode
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

#-------------------- history --------------------

HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history
# don't save command if identical to previous command 
setopt HIST_IGNORE_ALL_DUPS
# save after every command instead of on exit
setopt INC_APPEND_HISTORY
# use shared history for up/down-line between shells
setopt SHARE_HISTORY

# enable reverse search
bindkey -M viins "" history-incremental-search-backward

#-------------------- aliases --------------------

alias vim="nvim"
alias cat="bat"

# replace ls with eza
base_ls="eza --group-directories-first --icons=auto --git -h"
alias ls=$base_ls
alias lsl="${base_ls} -l"
# list directories only 
alias lsd="${base_ls} -D"
# list files only 
alias lsf="${base_ls} -f"

# ask before removing
alias rm="rm -i"
alias rmd="rm -Ir"

alias df="df -h"

alias zathura="zathura --fork"

alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"

#-------------------- syntax highlighting --------------------

source /usr/share/zsh/site-functions/zsh-syntax-highlighting.zsh

#-------------------- run on startup --------------------

date
ufetch

