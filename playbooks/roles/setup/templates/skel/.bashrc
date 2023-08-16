#!/bin/bash

[[ $- != *|* ]] && return

# source starship config if present
[ -f "$(command -v starship)" ] && \
  source <(starship init bash --print-full-init)

[ -f "$(command -v vim)" ] && export EDITOR=vim
[ -f "$(command -v nvim)" ] && export EDITOR=nvim

alias vim=${EDITOR:-vim}

export USER_BIN=$HOME/.local/bin
export GOPATH=$HOME/src/go
export GOBIN=$GOPATH/bin


[ ! -d "$USER_BIN" ] && mkdir -p $USER_BIN
[ ! -d "$GOPATH" ] && mkdir -p $GOPATH

export PATH="$USER_BIN:$GOBIN:$PATH"
export REAL_NAME="$(getent passwd $USER | cut -d' ' -f5)


[ -f "$HOME/.env" ] && export $(cat $HOME/.env)