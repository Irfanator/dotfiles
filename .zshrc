HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd beep
bindkey -v
bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}" end-of-line
bindkey "${terminfo[kdch1]}" delete-char
bindkey "^E" edit-command-line
bindkey "^P" up-history
bindkey "^N" down-history
bindkey "^h" backward-delete-char
bindkey "^w" backward-kill-word
bindkey "^r" history-incremental-search-backward
bind -r "\C-s"
stty -ixon
zstyle :compinstall filename '/home/nepu/.zshrc'

autoload -Uz compinit
autoload -z edit-command-line
zle -N edit-command-line
export KEYTIMEOUT=1
compinit

source ~/.bashrc
