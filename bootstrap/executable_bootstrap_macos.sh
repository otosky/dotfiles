#!/bin/sh

# install homebrew
if [ ! "$(command -v brew)" ]; then
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# install devbox, which will implicitly install nix pkg manager
if [ ! "$(command -v devbox)" ]; then
  curl -fsSL https://get.jetpack.io/devbox | bash
fi

/opt/homebrew/bin/brew install \
	homebrew/cask-fonts/font-fontawesome \
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
	lazygit

/opt/homebrew/bin/brew --cask nikitabobko/tap/aerospace

# fzf
if [ ! "$(command -v fzf)" ]; then
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf &&
		~/.fzf/install --key-bindings --completion --no-update-rc
fi

# install fish and set as default shell
sudo echo '/opt/homebrew/bin/fish' >>/etc/shells
eval $SHELL
sudo chsh -s /opt/homebrew/bin/fish

# install fish deps
/usr/bin/env fish fisher_install
/usr/bin/env fish fisher update
