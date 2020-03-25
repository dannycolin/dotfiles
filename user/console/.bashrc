# ----------------------------------------
# ~/.bashrc
# ----------------------------------------

# Shell options
shopt -s checkwinsize
shopt -s histappend

# Set history preferences
HISTCONTROL=ignoreboth
HISTFILESIZE=500
HISTIGNORE="cd*:clear:ls*:la*:lla*:rm*:tree*"
HISTSIZE=500

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

# Temporary PS1
PS1=" \w \$ "

# Bashd
[ -f ~/Projects/bash.d/bashd ] && . "$HOME/Projects/bash.d/bashd"
