# ---------------------------------------
# ~/.bash_profile
# ---------------------------------------

# Needed for qt5ct to work correctly
export QT_QPA_PLATFORMTHEME=qt5ct

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# set XDG DIRS
if [ -f "$HOME/.config/user-dirs.dirs" ]; then
  . "$HOME/.config/user-dirs.dirs"
fi

# Autostart X at login
if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
  exec startx
fi

