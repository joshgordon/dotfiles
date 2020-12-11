# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH


alias pbcopy='xclip -selection c'
alias pbpaste='xclip -selection clipboard -o'

if [ -d ~/go ]; then
  export GOPATH=~/go
  export PATH=$PATH:$GOPATH/bin
fi

# disable C-s / C-q so I can use them elsewhere.
stty -ixon

if [ -f /usr/bin/nvim ]; then
  alias vim=nvim
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
AOC_API_KEY=53616c7465645f5fbaee1fcb25c0455f1bed9f3167547aa35afb36ff08995b1ea386960fdacdd69a817599c751e6ad87

if [ -x /usr/bin/python3 ]; then
  alias python='python3'
  alias pip='pip3'
fi
