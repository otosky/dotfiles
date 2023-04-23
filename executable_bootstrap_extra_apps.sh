#!/bin/sh

# Apps
sudo dnf install -y \
  aerc w3m \
  google-chrome-stable \
  brave-browser \
  podman-docker docker-compose containerd.io \
  1password \
  kicad \
  wxGTK wxGTK-devel wxGTK-gl wxGTK-media \
  gmp-devel.x86_64 \
  brasero \
  hyperfine

# extras for decoding media
sudo dnf install -y \
  rpmfusion-free-release-tainted \
  libdvdcss \
  && sudo dnf groupupdate -y multimedia \
    --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin \
  && sudo dnf groupupdate -y sound-and-video

# dragon for drag-and-drop, necessary for certain web UIs
if [ ! -f "$(which dragon)" ]; then
  git clone https://github.com/mwh/dragon.git {{ .chezmoi.homeDir }}/Downloads/dragon
  cd {{ .chezmoi.homeDir }}/Downloads/dragon && sudo make PREFIX=/usr/local/bin install
  cd {{ .chezmoi.homeDir }}
fi

sudo systemctl enable containerd.service
sudo systemctl enable podman.socket

