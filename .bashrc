case $- in   # bash executions flags list.
*i*) ;;      # if contains 'i' flag continue.
*) return ;; # else break.
esac

export OSH=$HOME/.oh-my-bash

OSH_THEME="gitbasher" # custom theme

OMB_USE_SUDO=true

completions=(
  awscli
  brew
  defaults
  django
  docker-compose
  docker
  gem
  gh
  git
  go
  gradle
  kubectl
  makefile
  maven
  minikube
  nvm
  pip
  pip3
  ssh
  terraform
  tmux
  vagrant
  virtualbox
)

aliases=(
  general
)

plugins=(
  ansible
  aws
  bashmarks
  brew
  git
  golang
  kubectl
  npm
  nvm
)

source "$OSH"/oh-my-bash.sh

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR="vim"
else
  export EDITOR="nvim"
fi

export PATH="$PATH:."

test -d "$HOME/.local/bin" && export PATH="$PATH:$HOME/.local/bin"

test -d "$HOME/.nvm" || {
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
}

test -f $HOME/.asdf/asdf.sh && . $HOME/.asdf/asdf.sh
test -f $HOME/.asdf/completions/asdf.bash && . $HOME/.asdf/completions/asdf.bash

test -f "$HOME/.cargo/env" && . "$HOME/.cargo/env"
test -d $HOME/.cargo/bin && export PATH="$PATH:$HOME/.cargo/bin"
test -d $HOME/.yarn/bin && export PATH="$PATH:$HOME/.yarn/bin"
test -d $HOME/.config/yarn/global/node_modules/.bin && export PATH="$PATH:$HOME/.config/yarn/global/node_modules/.bin"

# pnpm
test -d $HOME/.local/share/pnpm && {
  export PNPM_HOME="$HOME/.local/share/pnpm"
  export PATH="$PNPM_HOME:$PATH"
}

# add Pulumi to the PATH
test -d $HOME/.pulumi/bin && export PATH=$PATH:$HOME/.pulumi/bin

# msys2 paths
if [[ "$(uname -a)" == *"MSYS"* ]]; then
  test -d /c/msys64/mingw64/bin && export PATH="$PATH:/c/msys64/mingw64/bin"
  test -d /c/msys64/usr/bin && export PATH="$PATH:/c/msys64/usr/bin"

  # tmux fix
  tmux() {
    TMUX="command tmux ${@}"
    SHELL=/usr/bin/bash script -qO /dev/null -c "eval $TMUX"
  }
fi

# MacPorts
test -d "/opt/local/bin" && export PATH="/opt/local/bin:$PATH"
test -d "/opt/local/sbin" && export PATH="/opt/local/sbin:$PATH"

# Volta
test -d "$HOME/.volta" && export PATH="$HOME/.volta:$PATH"

has_tmux=$(command -v tmux 2>/dev/null)
[[ -n $has_tmux ]] && alias clear='clear && [[ -n $(pgrep tmux) ]] && tmux clear-history || clear'

# Setting PATH for Python 3.11
# The original version is saved in .bash_profile.pysave
MACOS_PY_BIN_FOLDER="/Library/Frameworks/Python.framework/Versions/3.11/bin"
test -d $MACOS_PY_BIN_FOLDER && export PATH="$MACOS_PY_BIN_FOLDER:${PATH}"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
test -d "$HOME/.rd/bin" && export PATH="$HOME/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

export VOLTA_FEATURE_PNPM=1

test -d "$HOME/.tfenv/bin" && export PATH="$HOME/.tfenv/bin:$PATH"

export BASH_SILENCE_DEPRECATION_WARNING=1

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

if [ -n "$(command -v javac)" ]; then
  export JAVA_HOME="$(dirname $(which java))"
fi

test -f ~/bin/boot && source ~/bin/boot

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH

# go
if [ -n "$(command -v go)" ]; then
  export GOPATH="$(dirname $(which go))"
fi

# Deno Version Manager
export DVM_DIR="$HOME/.dvm"
[ -f "$DVM_DIR/dvm.sh" ] && . "$DVM_DIR/dvm.sh"
[ -f "$DVM_DIR/bash_completion" ] && . "$DVM_DIR/bash_completion"

