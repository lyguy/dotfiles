#!/bin/bash
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac


# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob


# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Load the shell dot-files
for file in ~/.{aliases,bash_prompt,exports,extras,path,"fzf.bash"}; do
    if [[ -r "$file" ]] && [[ -f "$file" ]]; then
        #shellcheck source=/dev/null
        source "$file"
    fi
done

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        #shellcheck source=/dev/null
    source /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        #shellcheck source=/dev/null
    source /etc/bash_completion
  fi
fi

## Uncomment below to use gpg-agent for ssh
# source "${HOME}/.gnupg/use-gpg-agent.sh"
