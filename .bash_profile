#!/bin/bash

# Load the shell dot-files
for file in [~/.bashrc]; do
    if [[ -r "$file" ]] && [[ -f "$file" ]]; then
        source "$file"
    fi
done
unset file

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend


# Autocorrect typos in path names when using `cd`
shopt -s cdspell


# Homwbrew root directory helper var
brew_dir=$(brew --prefix)

#Disable Homebrew analytics
export HOMEBREW_NO_ANALYTICS=1

# Enable bash Completion
if [ -f "${brew_dir}/etc/bash_completion" ]; then
    source "${brew_dir}/etc/bash_completion"
fi

alias e='emacsclient -t'
alias ec='emacsclient -c'

# Set up OPAM
if [ -f "$HOME/.opam/opam-init/init.sh" ]; then
  source "$HOME/.opam/opam-init/init.sh" > /dev/null 2> /dev/null || true
  eval "$(opam config env)"
fi

# Add Rust's Cargo to the path path
if [ -d "$HOME/.cargo/bin/" ]; then
   export PATH=$HOME/.cargo/bin:$PATH
fi

# Put Brew's Python2 on the path if it's installed
if [ -d "${brew_dir}/opt/python@2/libexec/bin" ]; then
  export PATH="${brew_dir}/opt/python/libexec/bin:$PATH"
fi

## Use homebrew's virtualenvwrapper
if [ -f "${brew_dir}/bin/virtualenvwrapper.sh" ]; then
  export WORKON_HOME="${HOME}/py_venvs"
  source "${brew_dir}/bin/virtualenvwrapper.sh"
fi

## Use janky local dir on Darwin
if [ "$(uname)" == "Darwin" ]; then
   export PYTHONUSERBASE="${HOME}/local"
   export PATH="${HOME}/local/bin:$PATH"
fi

# Activate thefuck
eval "$(thefuck -a)"

