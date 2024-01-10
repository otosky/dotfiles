# My Dotfiles

Managed via [`chezmoi`](https://github.com/twpayne/chezmoi)

## Install
```sh
sh -c "$(curl -fsLS chezmoi.io/get)" -- init --apply otosky
```
Note this will try to run a bootstrap script on a Linux environment. See run_once...

## Components:
Shell:
- fish

Terminal-themes:
- [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
- [Tokyo Night](https://github.com/folke/tokyonight.nvim)

Toolchain Manager:
- [asdf](https://asdf-vm.com/)

### Fedora:
Window Manager:
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
Window Manager:
- [yabai](https://github.com/koekeishiya/yabai)
- [skhd](https://github.com/koekeishiya/skhd)

```sh
# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install kitty
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

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
  tmux
```

#### Extra

- Jetbrains products
- flux
- [1password](https://1password.com/downloads/mac/)
- [Brave Browser](https://brave.com/)
- [Raycast](https://www.raycast.com/)
  - set hotkey to CMD+SPACE
  - replace spotlight with Raycast
- Slack
- Zoom
- Notion

### Windows (sigh)

1. [install WSL](https://learn.microsoft.com/en-us/windows/wsl/install)
2. install nerdfonts
3. install windows terminal from microsoft store
4. set wsl distro as main terminal in windows terminal
5. set windows terminal as default terminal
6. install [Microsoft Powertoys](https://learn.microsoft.com/en-us/windows/powertoys/install)
7. swap capslock to ctrl
8. disable touchpad features
9. set multitasking settings to show tasks from `All Desktops`
10. run ~/bootstrap/bootstrap_wsl.sh
11. init chezmoi
