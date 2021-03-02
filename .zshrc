# .zshrc for Mac OS

# ------------------------------------
# SETUP
#   $ mkdir -p ~/Workspaces/src/
#   $ cd ~/Workspaces/src/
#   $ git clone git@github.com:fffclaypool/dotfiles.git
#   $ ln -sf ~/Workspaces/src/dotfiles/.zshrc ~/.zshrc
#   $ source ~/.zshrc (=sz)
# ------------------------------------

# ------------------------------------
# ALIASES
# ------------------------------------

# cd
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

# git
alias ga='git add'
alias gb='git branch'
alias gco='git checkout'
alias gd='git diff'
alias gfa='git fetch -a'
alias gg='git grep -n'
alias h='history | grep'
alias ha='history -a'
alias gl='git log'
alias glf='git ls-files'
alias gpo='git push origin $(git branch --show-current)'
alias gpfo='git push -f origin $(git branch --show-current)'
alias gpuo='git pull origin $(git branch --show-current)'
alias gr='git reset'
alias grm='git reset --mixed HEAD^'
alias gs='git status'

function gcm() {
  fetch
  git commit -m $1
}

function gcam() {
  fetch
  git commit --amend -m $1
}

function fetch() {
  git fetch -a
  ret=`git status`
  if [[ $ret == *pull* ]]; then
    echo '*********************************************'
    echo '**** WARNING You need to do `git rebase` ****'
    echo '*********************************************'
    sleep 30
    exit 1
  fi
}

# ls
alias l='ls -alF'
alias ll='ls -l'

# other
alias sz='source ~/.zshrc'
alias c='code'

# ------------------------------------
# PATHS
# ------------------------------------

export GOPATH=$HOME/Workspaces/go

# ------------------------------------
# MOVE TO THE WORKSPACES DIRECTORY
# ------------------------------------

HOME_DIR=`echo ~`
TARGET_DIR="${HOME_DIR}/Workspaces/src"
if pwd | grep -v ${TARGET_DIR}; then cd ${TARGET_DIR}; fi
