  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi

alias e='emacsclient -t'
alias ec='emacsclient -c'

HOMEBREW_NO_ANALYTICS=1

. /Users/cirrius/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

eval $(thefuck -a)
