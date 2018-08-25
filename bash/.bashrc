# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

alias pbcopy='xclip -selection c'
alias pbpaste='xclip -selection clipboard -o'

if [ -d ~/go ]; then
  export GOPATH=~/go
  export PATH=$PATH:$GOPATH/bin
fi

# disable C-s / C-q so I can use them elsewhere.
stty -ixon

if [ -f /usr/bin/foobar ]; then
  alias vim=nvim
fi
