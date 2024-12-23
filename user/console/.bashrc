# .bashrc

# Shell options
shopt -s checkwinsize
shopt -s histappend

# Set history preferences
HISTCONTROL=ignoreboth
HISTFILESIZE=1000
HISTIGNORE="clear:ls:rm*"
HISTSIZE=1000

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Load user-specific bash completion
[ -s "$HOME/share/bash_completion" ] && . "$HOME/share/bash_completion"

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi

# Add Go to path
if ! [[ "$PATH" =~ "/opt/go/bin:" ]]; then
    PATH="/opt/go/bin:$PATH"
fi

# Load aliases
[ -f ~/.config/bash/aliases ] && . "$HOME/.config/bash/aliases"

# Load functions
[ -f ~/.config/bash/functions ] && . "$HOME/.config/bash/functions"

# Set SSH socket
if [ -z "$SSH_AUTH_SOCK" ]; then
  export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
fi

# Set dbus session
# TODO: Start Qtile with dbus-run-session
# if [ -z "$DBUS_SESSION_BUS_ADDRESS" ]; then
#   export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"
# fi

# Load NVM
export NVM_DIR="$HOME/.local/share/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

cd() {
  command cd "$@"
  if [[ -f ".nvmrc" ]]; then
    nvmrc_version="$(<".nvmrc")"
    nvm_version="$(nvm current)"
    if [[ "$nvmrc_version" != "$nvm_version" ]]; then
      nvm use
    fi
  fi
}

# Set prompt
prompt() {
  local git_branch;
  git_branch="$(git rev-parse --abbrev-ref HEAD 2> /dev/null)";
  PS1="\w";

  if [[ -n "$VIRTUAL_ENV" ]]; then
    PS1="$PS1 [venv]";
  fi

  if [[ -n "$git_branch" ]]; then
    PS1="$PS1 git:$git_branch";
  fi

  PS1="$PS1 \$ ";
}
PROMPT_COMMAND="prompt; $PROMPT_COMMAND";
