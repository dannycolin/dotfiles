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

# Enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Set SSH socket
if [ -z "$SSH_AUTH_SOCK" ]; then
  export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
fi

# Set dbus session
if [ -z "$DBUS_SESSION_BUS_ADDRESS" ]; then
  export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"
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

# Load Rust
. "$HOME/.cargo/env"

# Load Perl
PATH="$HOME/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"$HOME/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"; export PERL_MM_OPT;

# Set prompt
prompt() {
  local git_branch="$(git rev-parse --abbrev-ref HEAD 2> /dev/null)"
  PS1="\w"

  if [[ -n "$git_branch" ]]; then
    PS1="$PS1 git:$git_branch"
  fi

  PS1="$PS1 \$ "
}
PROMPT_COMMAND="prompt; $PROMPT_COMMAND"

