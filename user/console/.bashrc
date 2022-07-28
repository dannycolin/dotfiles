# ----------------------------------------
# ~/.bashrc
# ----------------------------------------

# Shell options
shopt -s checkwinsize
shopt -s histappend

# Set history preferences
HISTCONTROL=ignoreboth
HISTFILESIZE=1000
HISTIGNORE="clear:rm*"
HISTSIZE=1000

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Load aliases
[ -f ~/.config/bash/aliases ] && . "$HOME/.config/bash/aliases"

# Load functions
[ -f ~/.config/bash/functions ] && . "$HOME/.config/bash/functions"

# Load user-specific bash completion
[ -s "$HOME/share/bash_completion" ] && . "$HOME/share/bash_completion"

# Load NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"

# Set SSH socket
if [ -z "$SSH_AUTH_SOCK" ]; then
  export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
fi

if [ -z "$DBUS_SESSION_BUS_ADDRESS" ]; then
  export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"
fi

# File renaming with `mv`
#
# if there isn't a second parameter you'll be prompted to edit the filename on
# command line.
function mv() {
  if [ "$#" -ne 1 ] || [ ! -e "$1" ]; then
    command mv "$@"
    return
  fi

  read -ei "$1" newfilename
  command mv -v -- "$1" "$newfilename"
}

# Create a folder and cd into it
mkcd () {
  mkdir -p -- "$1" &&
  cd -P -- "$1"
}

# Temporary PS1
PS1=" \w \$ "

# Bashd
[ -f ~/Projects/bash.d/bashd ] && . "$HOME/Projects/bash.d/bashd"
