# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="gianu"
export ZSH_CUSTOM=$HOME/.zsh

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(chruby bundler gem git git-flow git-open github node osx pow ruby vi-mode mosh gpg-agent tmux) # ssh-agent)

fpath=(~/.zsh/Completion $fpath)
#path=(/usr/local/opt/gnu-sed/libexec/gnubin /usr/local/bin /opt/homebrew/bin /usr/local/mysql/bin /usr/bin /bin /usr/sbin /sbin /usr/X11/bin /usr/local/share/npm/bin ~/bin)
path=(/usr/local/opt/gnu-sed/libexec/gnubin /usr/local/bin /usr/local/mysql/bin /usr/bin /bin /usr/sbin /sbin /usr/X11/bin /usr/local/share/npm/bin ~/bin)

source $ZSH/oh-my-zsh.sh
unsetopt auto_name_dirs

export SSL_CERT_FILE=/usr/local/etc/openssl/cert.pem

if [[ -f "/Users/ayn/.acme.sh/acme.sh.env" ]]; then
  . "/Users/ayn/.acme.sh/acme.sh.env"
fi

# chruby omz plugin doesn't load properly on M1 Mac rn
#if [[ -d "/opt/homebrew/opt/chruby" ]]; then
#  source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
#  source /opt/homebrew/opt/chruby/share/chruby/auto.sh
#fi
