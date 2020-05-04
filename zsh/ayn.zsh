alias ansible='nocorrect ansible'
alias be='bundle exec'
alias cookall='knife cookbook upload -a'
alias fixopenwith='/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain user;killall Finder;echo "Open With has been rebuilt, Finder will relaunch"'
alias flushdns='sudo dscacheutil -flushcache'
alias gl='git pull --rebase'
alias grom='git rebase origin/master'
alias knife='nocorrect knife'
alias lal='ls -alFh'
alias llspec='rake "parallel:spec[4]"'
alias lt='ls -ltrh'
alias riptags='be ripper-tags -R --exclude=assets --exclude=vendor'
alias rmdd='rm -rf ~/Library/Developer/Xcode/DerivedData/*'
alias rst='touch tmp/restart.txt'
alias sc2='be ./script/console'
alias sc='rails c'
alias src='source ~/.zshrc'
alias srd='screen -r -d'
alias synccontacts='/System/Library/PrivateFrameworks/GoogleContactSync.framework/Versions/A/Resources/gconsync --sync com.google.ContactSync'
alias tlog='tail -f log/development.log'
alias uproles='find roles -type f -name \*.rb  -exec knife role from file {} \;'
#alias vi='mvim -v'
alias python='/usr/local/bin/python3'
alias pip='pip3'

export ANSIBLE_HOSTS=~/Dropbox/Private/ansible_hosts
export ARCHFLAGS="-arch x86_64"
export EDITOR='vim'
export ICLOUD=~/Library/Mobile\ Documents/com~apple~CloudDocs/

c(){ cd ~/work/$1 }
grepall(){ find . -type f -print0 | xargs -0 grep -n "$@" }
wi(){ whois -h geektools.com "$*" }

# iTrackBites
itb_prod() {
  local private_dns_name=$(aws ec2 describe-instances --profile itrackbites --filters 'Name=tag:Name,Values="Prod (codedeploy)"' --query 'Reservations[0].Instances[0].PrivateDnsName' --output text)
  ssh -oStrictHostKeyChecking=accept-new -Jitrackbites-dev $private_dns_name -lubuntu
}

# Predictable SSH authentication socket location.
SOCK="/tmp/ssh-agent-$USER-screen"

if test $SSH_AUTH_SOCK && [ $SSH_AUTH_SOCK != $SOCK ]
then
    rm -f /tmp/ssh-agent-$USER-screen
    ln -sf $SSH_AUTH_SOCK $SOCK
    export SSH_AUTH_SOCK=$SOCK
fi

# Search backwards and forwards with a pattern
bindkey -v
bindkey -M vicmd '?' history-incremental-pattern-search-backward
bindkey -M vicmd '/' history-incremental-pattern-search-forward

# set up for insert mode too
bindkey -M viins '^P' history-incremental-pattern-search-backward
bindkey -M viins '^N' history-incremental-pattern-search-forward

function define_vim_wrappers()
{
  vim_commands=(
    eview evim gview gvim gvimdiff gvimtutor rgview
    rgvim rview rvim vim vimdiff vimtutor xxd mvim
  )

  for cmd in ${vim_commands[@]}; do
    cmd_path=`/usr/bin/env which -a "${cmd}" 2>/dev/null | grep '^/'`
    if [ -x "${cmd_path}" ]; then
      eval "function ${cmd} () { (unset GEM_HOME; unset GEM_PATH; $cmd_path \$@) }"
    fi
  done
}

define_vim_wrappers

#export SSL_CERT_FILE=/usr/local/etc/openssl/certs/cert.pem
