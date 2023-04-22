#!/bin/sh

# Enable extra repos
sudo dnf install dnf-plugins-core -y
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/ \
  && sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc

sudo dnf config-manager \
    --add-repo https://download.docker.com/linux/fedora/docker-ce.repo \
    --add-repo https://cli.github.com/packages/rpm/gh-cli.repo

sudo rpm --import https://downloads.1password.com/linux/keys/1password.asc
sudo sh -c 'echo -e "[1password]\nname=1Password Stable Channel\nbaseurl=https://downloads.1password.com/linux/rpm/stable/\$basearch\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=\"https://downloads.1password.com/linux/keys/1password.asc\"" \
  > /etc/yum.repos.d/1password.repo'

sudo dnf config-manager --set-enabled google-chrome

sudo dnf copr enable eddsalkield/swaylock-effects -y
sudo dnf copr enable @kicad/kicad -y

# Core utilities
sudo dnf update -y && sudo dnf install -y \
  util-linux-user \
  zsh \
  fish \
  fd-find \
  fzf \
  kitty \
  age \
  direnv \
  neofetch \
  openssl-devel bzip2-devel libffi-devel zlib-devel readline-devel sqlite\
  lxpolkit \
  sway ulauncher wofi mako waybar wlsunset swayidle swaylock-effects light wl-clipboard maim \
  pulseaudio-utils \
  acpid.x86_64 \
  libappindicator \
  libusb-devel.x86_64 \
  blueman

chsh -s "$(which fish)"

# Dev Tools
sudo dnf install -y \
  meson autoconf automake ccache dtc dfu-util g++ gcc libtool ninja-build cmake xz \
  go-task \
  tio \
  qt5-qtbase-devel expat-devel \
  wayland-protocols-devel \
  gh \
  mpv mpv-libs mpv-devel \
  yamllint \
  wireguard-tools

if [ ! -f "$(which sops)" ]; then
  SOPS_VERSION=3.7.3
  sudo dnf install -y https://github.com/mozilla/sops/releases/download/v${SOPS_VERSION}/sops-${SOPS_VERSION}-1.x86_64.rpm
fi

# zsh
mkdir -p ~/.zsh/antigen
sudo curl -L git.io/antigen > ~/.zsh/antigen/antigen.zsh

# fzf
[[ ! -f ~/.fzf.zsh ]] \
  && git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf \
  && ~/.fzf/install --key-bindings --completion --no-update-rc
