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
plugins=(chruby bundler gem git git-flow git-open github node macos pow ruby vi-mode mosh gpg-agent tmux golang nvm) # ssh-agent)

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
  path=(/usr/local/opt/gnu-sed/libexec/gnubin /opt/homebrew/bin /usr/bin /bin /usr/sbin /sbin ~/bin)
fi

source $ZSH/oh-my-zsh.sh
unsetopt auto_name_dirs

export SSL_CERT_FILE=/usr/local/etc/openssl/cert.pem

if [[ -f "/Users/ayn/.acme.sh/acme.sh.env" ]]; then
  . "/Users/ayn/.acme.sh/acme.sh.env"
fi
