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
- [AeroSpace](https://github.com/nikitabobko/AeroSpace)

see `./bootstrap/executable_bootstrap_macos.sh`

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
4. install wezterm
5. install [Microsoft Powertoys](https://learn.microsoft.com/en-us/windows/powertoys/install)
6. disable touchpad features
7. set multitasking settings to show tasks from `All Desktops`
8. run ~/bootstrap/bootstrap_wsl.sh
9. init chezmoi
