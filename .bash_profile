#!/bin/bash

# Load the shell dot-files
if [[ -r "${HOME}/.bashrc" ]] && [[ -f "${HOME}/.bashrc" ]]; then
    #shellcheck source=/dev/null
    source "${HOME}/.bashrc"
fi

# If we're on macos handle homebrew
if [ "$(uname)" == "Darwin" ]; then
    file="${HOME}/.homebrew_rc"
    if [[ -r "$file" ]] && [[ -f "$file" ]]; then
        #shellcheck source=/dev/null
        source "$file"
    fi
fi
unset file
