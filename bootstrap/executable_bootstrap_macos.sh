#!/bin/sh

# install homebrew
if [ ! "$(command -v brew)" ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# install kitty

if [ ! "$(command -v kitty)" ]; then
  curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
fi

brew install \
  homebrew/cask-fonts/font-fontawesome \
  koekeishiya/formulae/yabai \
  koekeishiya/formulae/skhd \
  git-delta \
  ripgrep \
  fd \
  tree \
  automake \
  fish \
  tmux \
  jq \
  xsv \
  sops \
  openssl readline sqlite3 xz zlib libffi \
  noti \
  websocat \
  gettext \
  just

# fzf
if [ ! "$(command -v fzf)" ]; then
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf \
  && ~/.fzf/install --key-bindings --completion --no-update-rc
fi
