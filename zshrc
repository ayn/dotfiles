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
plugins=(rbenv bundler gem git git-flow github node osx pow rails ruby vi-mode mosh gpg-agent tmux)

fpath=(~/.zsh/Completion $fpath)
path=(/usr/local/bin /usr/local/mysql/bin /usr/bin /bin /usr/sbin /sbin /usr/X11/bin /usr/local/share/npm/bin ~/bin)

source $ZSH/oh-my-zsh.sh
unsetopt auto_name_dirs

export SSL_CERT_FILE=/usr/local/etc/openssl/cert.pem

eval "$(rbenv init -)"
. "/Users/ayn/.acme.sh/acme.sh.env"
