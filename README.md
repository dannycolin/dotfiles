# ~/.dotfiles

## Table of Content

0. [Installation]()
0. [System Configuration]()
0. [Window Manager Keybindings]()
0. [Browser Extensions]()
0. [Text Editor Extensions]()

## Installation

```
git clone git@gitlab.com:dannycolin/dotfiles ~/.dotfiles
cd ~/.dotfiles/user
stow --target=$HOME *
```

## System Configuration

|||
| --- | --- |
| Operating System       | [Debian](https://debian.org)                  |
| Window Manager         | [bspwm](https://github.com/baskerville/bspwm) |
| Applications' Launcher | [Rofi](https://github.com/davatorium/rofi)    |
| Status Bar             | [Polybar](https://github.com/jaagr/polybar)   |

### Window Manager Keybindings

| Key binding                | Action                              |
| :------------------------- | :---------------------------------- |
| Super + [0-9]              | Switch to workspace [0-9]           |
| Super + Shift + [0-9]      | Move application to workspace [0-9] |
| Super + a                  | Open application menu               |
| Super + d                  | Set to tiled window                 |
| Super + f                  | Set to float (detach) window        |
| Super + h                  | Focus left window                   | 
| Super + j                  | Focus bottom window                 |
| Super + k                  | Focus top window                    |
| Super + l                  | Focus right window                  |
| Super + Shift + h          | Move window to left                 |
| Super + Shift + j          | Move window to bottom               |
| Super + Shift + k          | Move window to top                  |
| Super + Shift + l          | Move window to right                |
| Super + Shift + q          | Close focused application           |
| Super + Shift + r          | Reload configuration                |
| Super + minus              | Shrink window horizontally          |
| Super + equal              | Grow window horizontally            |
| Super + Shift + underscore | Shrink window vertically            |
| Super + Shift + plus       | Grow window vertically              |
| **Modes**                  |                                     |
| **System**                 |                                     |
| Super + Shift + s          | System mode                         |
|         p                  | Poweroff                            |
|         r                  | Restart                             |

## Browser Extensions

- [Axe Developer Tools](https://addons.mozilla.org/en-US/firefox/addon/axe-devtools/)
- [Firefox Multi-Account Containers](https://addons.mozilla.org/en-US/firefox/addon/multi-account-containers/)
- [HTTPS Everywhere](https://addons.mozilla.org/en-US/firefox/addon/https-everywhere/)
- [Privacy Badger](https://addons.mozilla.org/en-US/firefox/addon/privacy-badger17/)
- [Stylus](https://addons.mozilla.org/en-US/firefox/addon/styl-us/)
- [uBlock Origin](https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/)
- [uMatrix](https://addons.mozilla.org/en-US/firefox/addon/umatrix/)
- [Unpaywall](https://addons.mozilla.org/en-US/firefox/addon/unpaywall/)
- [Zotero Connector](https://www.zotero.org/download/)

## Text Editor Extensions

- [buftabline](https://github.com/ap/vim-buftabline)
- [emmet](https://github.com/mattn/emmet-vim)
- [gitgutter](https://github.com/airblade/vim-gitgutter)
- [nerdtree](https://github.com/scrooloose/nerdtree)
- [onedark](https://github.com/joshdick/onedark.vim)
- [surround](https://github.com/tpope/vim-surround)
- [indentline](https://github.com/Yggdroot/indentLine)

