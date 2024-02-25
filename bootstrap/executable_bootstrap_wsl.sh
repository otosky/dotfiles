#!/bin/sh

fix_wsl_resolv_conf() {
  echo "Wiping faulty resolv.conf..."
  sudo rm /etc/resolv.conf
  sudo bash -c 'echo "nameserver 8.8.8.8" > /etc/resolv.conf'
  sudo bash -c 'echo "[network]" > /etc/wsl.conf'
  sudo bash -c 'echo "generateResolvConf = false" >> /etc/wsl.conf'
  sudo chattr +i /etc/resolv.conf
}

install_mise() {
  if [ ! "$(command -v mise)" ]; then
    curl https://mise.jdx.dev/install.sh | sh
  fi
}

install_fish() {
  if [ ! "$(command -v fish)" ]; then
    sudo apt-add-repository ppa:fish-shell/release-3
    sudo apt update && sudo apt upgrade
    sudo apt install fish
  fi
}

bootstrap_dotfiles() {
  sh -c "$(curl -fsLS chezmoi.io/get)" -- init --apply otosky
}

install_essential() {
  sudo apt install -y \
    build-essential \
    unzip
}

main() {
  [ -s /etc/wsl.conf ] || fix_wsl_resolv_conf

  bootstrap_dotfiles
  install_essential

  install_mise
  install_fish
}

main
