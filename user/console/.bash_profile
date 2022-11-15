# ---------------------------------------
# ~/.bash_profile
# ---------------------------------------

# Set DPI for Gtk and Qt applications
export GDK_DPI_SCALE=0.5
export GDK_SCALE=2
export QT_AUTO_SCREEN_SET_FACTOR=0
export QT_SCALE_FACTOR=1.75
export QT_FONT_DPI=96

# Set qt5ct as the QT platform theme manager
export QT_QPA_PLATFORMTHEME=qt5ct

# source ~/.bashrc if running bash
if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
	    . "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi

# set PATH so it includes git-cinnabar if it exists
if [ -d "$HOME/.mozbuild/git-cinnabar" ]; then
    PATH="$HOME/.mozbuild/git-cinnabar:$PATH"
fi

# set XDG DIRS
if [ -f "$HOME/.config/user-dirs.dirs" ]; then
  . "$HOME/.config/user-dirs.dirs"
fi

# Autostart X at login
if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
  exec startx
fi

. "$HOME/.cargo/env"
