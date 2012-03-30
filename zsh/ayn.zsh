alias be='bundle exec'
alias ec2='ssh andrewng.com'
alias gf='git diff'
alias lal='ls -alFh'
alias llspec='rake "parallel:spec[4]"'
alias lt='ls -ltrh'
alias pass='passenger start -a 127.0.0.1 -p 3000 -d'
alias rst='touch tmp/restart.txt'
alias sc3='be rails console'
alias sc='be ./script/console'
alias src='source ~/.zshrc'
alias srd='screen -r -d'
alias synccontacts='/System/Library/PrivateFrameworks/GoogleContactSync.framework/Versions/A/Resources/gconsync --sync com.google.ContactSync'
alias tlog='tail -f log/development.log'
alias vi='mvim -v'
bo(){ EDITOR=mvim bundle open $1 }
grepall(){ find . -type f -print0 | xargs -0 grep -n "$@" }
export EDITOR='vim'
export ARCHFLAGS="-arch x86_64"
c(){ cd ~/work/$1 }
# Search backwards and forwards with a pattern
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
