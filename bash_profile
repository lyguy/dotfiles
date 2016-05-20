# Enable Bash Completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

alias e='emacsclient -t'
alias ec='emacsclient -c'

#Disable Homebrew analytics
HOMEBREW_NO_ANALYTICS=1

# Source OPAM
. $HOME/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# Activate thefuck
eval $(thefuck -a)

# Change the window title of X terminals
case ${TERM} in
        xterm*|rxvt*|Eterm|aterm|kterm|gnome*|interix)
                PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\007"'
                use_color=true
                ;;
        screen)
                PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\033\\"'
                use_color=true
                ;;
esac

if ${use_color} ; then
        # set color prompt
        if [[ ${EUID} == 0 ]] ; then
                PS1='\[\033[01;31m\]\h\[\033[01;34m\] \W \$\[\033[00m\] '
        else
                PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \W \$\[\033[00m\] '
        fi

        # enable ls colors
        alias ls='ls -G'
        # enable grep color
        #alias grep='grep -â€“color=auto'
else
        if [[ ${EUID} == 0 ]] ; then
                # show root@ when we donâ€™t have colors
                PS1='\u@\h \W \$ '
        else
                PS1='\u@\h \W \$ '
        fi
fi

# Try to keep environment pollution down
unset use_color
# End color settings
