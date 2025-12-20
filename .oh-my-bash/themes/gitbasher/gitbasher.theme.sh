#!/usr/bin/env bash

DEFAULT="\[\033[0;00m\]"
RED="\[\033[1;31m\]" # with bold
GREEN="\[\033[0;32m\]"
YELLOW="\[\033[0;33m\]"
MAGENTA="\[\033[0;35m\]"
CYAN="\[\033[0;36m\]"
LIGHT_GREEN="\[\033[0;92m\]"

prompt_sys_name() {
  echo -e $(uname -a | head -n1 | awk '{print $1;}')
}

prompt_git() {
  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    echo -e "($(git branch --show-current))"
  fi
}

has_cmd() {
  [[ -n $(command -v $1 2>/dev/null) ]]
}

prompt_node() {
  node_exec="node"

  if [[ "$OSTYPE" == "cygwin" ]]; then
    node_exec="node.exe"
  elif [[ "$OSTYPE" == "msys" ]]; then
    node_exec="node.exe"
  elif [[ "$OSTYPE" == "win32" ]]; then
    node_exec="node.exe"
  else
    node_exec="node"
  fi

  versions=""

  has_cmd $node_exec && \
    versions="node $($node_exec -v) | "

  has_cmd npm && {
    versions=${versions::${#versions}-3}
    versions="${versions} (npm $(npm -v)) | "
  }

  has_cmd python && \
    versions="${versions}python $(python --version | awk '{print $2}') | "

  # has_cmd terraform && \
  #   versions="${versions}terraform $(terraform --version | head -n 1 | awk '{print $2}') | "

  # Cut the last three character " | "
  versions=${versions::${#versions}-3}

  echo -e "${versions}"
}

prompt_git_dirty() {
  dirty=$(git status -s 2>/dev/null | tail -n 1)
  [[ -n $dirty ]] && echo "$LIGHT_GREEN$1 *"
  [[ -z $dirty ]] && echo "$CYAN$1"
}

prompt_error() {
  [[ "$1" = "0" ]] || echo -e "error: $1"
}

build_prompt() {
  ERROR_NUM=$?
  PS1="$GREEN\u@\h $MAGENTA$(prompt_sys_name) $YELLOW\w $(prompt_git_dirty $(prompt_git)) $RED$(prompt_error $ERROR_NUM)\n$DEFAULT$(prompt_node)$DEFAULT\n$ "
}

PROMPT_COMMAND=build_prompt
