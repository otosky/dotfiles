# My Dotfiles

Managed via [`chezmoi`](https://github.com/twpayne/chezmoi)

## Install
```sh
sh -c "$(curl -fsLS chezmoi.io/get)" -- init --apply otosky
```
Note this will try to run a bootstrap script on a Linux environment. See run_once...

## Components:
Shell: 
- [oh-my-zsh](https://ohmyz.sh/)
- [antigen](https://github.com/zsh-users/antigen) for plugin management

Terminal-themes:
- [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
- [Nord](https://www.nordtheme.com/)

Toolchain Manager:
- [asdf](https://asdf-vm.com/)

### Fedora:
Tile Manager:
- [sway](https://github.com/swaywm/sway)

Status Bar:
- [waybar](https://github.com/Alexays/Waybar)

#### Framework Laptop Specific:

- setting Deep Sleep for Suspend:
  - https://community.frame.work/t/fedora-34-on-the-framework-laptop/2723/49

- turn off Automatic Brightness in Display

- set up systemd script to enable wake-up from suspend via external keyboard
  - https://askubuntu.com/a/1155666

- set udev rules for qmk and bootloaders
  - https://docs.qmk.fm/#/faq_build?id=linux-udev-rules

### MacOS:
Tile Manager:
- [yabai](https://github.com/koekeishiya/yabai)
- [skhd](https://github.com/koekeishiya/skhd)

Status Bar:
- [spacebar](https://github.com/cmacrae/spacebar)


```sh
brew install \
  chezmoi \
  asdf \
  homebrew/cask-fonts/font-fontawesome \
  koekeishiya/formulae/yabai \
  koekeishiya/formulae/skhd \
  cmacrae/formulae/spacebar \
  git-delta \
  fzf \
  ripgrep \
  fd \
  tree \
  the_silver_searcher 
```
