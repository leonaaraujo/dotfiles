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
  PS1="$GREEN\u@\h $MAGENTA$(prompt_sys_name) $YELLOW\w $(prompt_git_dirty $(prompt_git)) $RED$(prompt_error $ERROR_NUM)$DEFAULT\n$ "
}

PROMPT_COMMAND=build_prompt
