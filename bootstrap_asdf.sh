#!/bin/sh

# install asdf
if [ ! -d "{{ .chezmoi.homeDir }}/.asdf" ]; then
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.9.0
fi

# neovim
if asdf list | grep -q '0.6.1'; then
  echo 'Neovim 0.6.1 already installed via asdf'
else
  asdf plugin add neovim
  asdf install neovim O.7.0
  asdf global neovim 0.7.0
fi

# python
asdf plugin add python
asdf install python 3.7.10
asdf install python 3.8.8
asdf install python 3.9.9
asdf global python 3.9.9

asdf plugin-add poetry https://github.com/asdf-community/asdf-poetry.git
asdf install poetry 1.1.12
asdf global poetry 1.1.12

asdf plugin add java
asdf install java adoptopenjdk-8.0.312+7
asdf global java adoptopenjdk-8.0.312+7

asdf plugin add golang

asdf plugin add nodejs
asdf install nodejs 17.3.0
asdf global nodejs 17.3.0

asdf plugin add erlang
asdf install erlang 24.0.4
asdf global erlang 24.0.4

asdf plugin add elixir
asdf install elixir 1.12.2-otp-24
asdf global elixir 1.12.2-otp-24

# utilities
asdf plugin-add terraform
asdf install terraform 1.1.3

asdf plugin-add yq

asdf plugin add awscli
asdf plugin-add kubectl

