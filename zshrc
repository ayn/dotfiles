# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="gianu"
export ZSH_CUSTOM=$HOME/.zsh
export NVM_LAZY_LOAD=true

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(chruby bundler gem git git-flow github node macos pow ruby vi-mode mosh gpg-agent tmux golang nvm) # ssh-agent)

# Only load git-open as plugin on macOS
if [[ "$OSTYPE" == darwin* ]]; then
  plugins+=(git-open)
fi

fpath=(~/.zsh/Completion $fpath)

arch_name="$(uname -m)"

if [ "${arch_name}" = "x86_64" ]; then
  if [ "$(sysctl -in sysctl.proc_translated)" = "1" ]; then
    # Running on Rosetta 2
    echo "running on Rosetta 2"
  else
    # Running on native Intel
    echo "running on x86"
  fi
  export GOPATH=$HOME/go
  path=(/usr/local/opt/gnu-sed/libexec/gnubin /usr/local/bin /usr/local/mysql/bin /usr/bin /bin /usr/sbin /sbin /usr/local/sbin /usr/X11/bin /usr/local/share/npm/bin ~/bin $GOPATH/bin)
elif [ "${arch_name}" = "arm64" ]; then
  #echo "running on arm"
  path=(/usr/local/opt/gnu-sed/libexec/gnubin /opt/homebrew/bin /usr/local/bin /usr/bin /bin /usr/sbin /sbin ~/bin)
fi

source $ZSH/oh-my-zsh.sh
unsetopt auto_name_dirs

if [[ "$OSTYPE" == "darwin"* ]]; then
  export SSL_CERT_FILE=/usr/local/etc/openssl/cert.pem
fi

if [[ -f "/Users/ayn/.acme.sh/acme.sh.env" ]]; then
  . "/Users/ayn/.acme.sh/acme.sh.env"
fi

# 1password completion
if [[ "$OSTYPE" == darwin* ]] && command -v op &>/dev/null && [[ -t 0 ]]; then
  source $ZSH/plugins/1password/1password.plugin.zsh
  eval "$(op completion zsh)"; compdef _op op
fi

export PATH="$PATH:/Users/ayn/.local/bin"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# Fix SSH agent in tmux — find the REAL socket
if [ -n "$SSH_AUTH_SOCK" ]; then
    # Resolve through any symlink chain to the real socket
    real_sock=$(readlink -f "$SSH_AUTH_SOCK")
    if [ -S "$real_sock" ] && [ "$real_sock" != "$HOME/.ssh/auth_sock" ]; then
        ln -sf "$real_sock" "$HOME/.ssh/auth_sock"
    fi
    export SSH_AUTH_SOCK="$HOME/.ssh/auth_sock"
fi
