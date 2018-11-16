export DISPLAY=:0
export NO_AT_BRIDGE=1
GOPATH=$HOME/go
export GOPATH
PATH="/usr/local/bin:/usr/bin:/bin:/usr/games:/usr/local/sbin:/usr/sbin:/sbin"
PATH=$PATH:$GOPATH/bin


#(wal -r -t &)
#[ -n "$XTERM_VERSION" ] && transset-df --id "$WINDOWID" >/dev/null
case $- in
    *i*) ;;
      *) return;;
esac

set -o vim
set -o functrace
HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000
HISTFILE=/dev/null
shopt -s checkwinsize
trap 'echo -ne "\e]0;"; echo -n $BASH_COMMAND; echo -ne "\007"' DEBUG


if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi


if [[ $TERM == xterm-termite ]]; then
  . /etc/profile.d/vte.sh
  __vte_prompt_command
fi

# prompt
#PS1='┌─[\d][\u@\h:\w]\n└─> '
#PS1="\[\e[0m\].\[\e[1;37m\]\u\[\e[0m\] » [\[\e[1;32m\]\W\[\e[0m\]]\[\e[1;37m\]:\[\e[0m\] "
PS1="\[\e[0m\].\[\e[1;37m\]\u\[\e[0m\] » [\[\e[1;32m\]\W\[\e[0m\]]\[\e[1;37m\]:\[\e[0m\] "
clear
sh ~/.scripts/bars
mpc current
echo "====="
cal



