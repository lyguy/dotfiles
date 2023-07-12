#!/bin/bash

# If we're on macos handle homebrew
if [ "$(uname)" == "Darwin" ]; then
    # I'm a bash user and you can't make me stop.
    # No matter how much better zsh is in practice.
    export BASH_SILENCE_DEPRECATION_WARNING=1
    file="${HOME}/.homebrew_rc"
    if [[ -r "$file" ]] && [[ -f "$file" ]]; then
        #shellcheck source=/dev/null
        source "$file"
    fi
fi
unset file

# Load the shell dot-files
if [[ -r "${HOME}/.bashrc" ]] && [[ -f "${HOME}/.bashrc" ]]; then
    #shellcheck source=/dev/null
    source "${HOME}/.bashrc"
fi

