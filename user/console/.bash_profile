# ---------------------------------------
# ~/.bash_profile
# ---------------------------------------

# Set DPI for Gtk and Qt applications
export GDK_DPI_SCALE=0.5
# .bash_profile

# source ~/.bashrc if running bash
if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
	    . "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ]; then
  export PATH="$HOME/.local/bin:$PATH"
fi

# add git-cinnabar to path
if [ -d "$HOME/.mozbuild/git-cinnabar" ]; then
  export PATH="$HOME/.mozbuild/git-cinnabar:$PATH"
fi

# set XDG DIRS
if [ -f "$HOME/.config/user-dirs.dirs" ]; then
  . "$HOME/.config/user-dirs.dirs"
fi
