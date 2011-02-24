alias be='bundle exec'
alias ec2='ssh andrewng.com'
alias gf='git diff'
alias lal='ls -alFh'
alias lt='ls -ltrh'
alias pass='passenger start -a 127.0.0.1 -p 3000 -d'
alias rst='touch tmp/restart.txt'
alias sc3='bundle exec rails console'
alias src='source ~/.zshrc'
alias srd='screen -r -d'
alias synccontacts='/System/Library/PrivateFrameworks/GoogleContactSync.framework/Versions/A/Resources/gconsync --sync com.google.ContactSync'
alias tlog='tail -f log/development.log'
grepall(){ find . -type f -print0 | xargs -0 grep -n "$@" }
c(){ cd ~/work/$1 }
export EDITOR='vim'
export ARCHFLAGS="-arch x86_64"
