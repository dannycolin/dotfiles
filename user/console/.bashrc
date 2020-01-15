# ----------------------------------------
# ~/.bashrc
# ----------------------------------------

# Shell options
shopt -s checkwinsize
shopt -s histappend

# Set history preferences
HISTCONTROL=ignoreboth
HISTFILESIZE=2000
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
[ -f ~/.bash.d/aliases ] && . "$HOME/.bash.d/aliases"

# Load custom prompt
[ -f ~/.bash.d/prompt ] && . "$HOME/.bash.d/prompt"

# Move to latest known directory on startup
[ -f ~/.bash.d/lastdir ] && . "$HOME/.bash.d/lastdir"

# Load NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion" 

# Set SSH socket
if [ -z "$SSH_AUTH_SOCK" ]; then
  export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
fi

