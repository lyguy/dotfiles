#!/bin/bash

# Load the shell dot-files
for file in ~/.{bashrc,aliases,path,exports,extras}; do
    if [[ -r "$file" ]] && [[ -f "$file" ]]; then
        #shellcheck source=/dev/null
        source "$file"
    fi
done

# If we're on macos handle homebrew
if [ "$(uname)" == "Darwin" ]; then
    file="${HOME}/.homebrew_rc"
    if [[ -r "$file" ]] && [[ -f "$file" ]]; then
        #shellcheck source=/dev/null
        source "$file"
    fi
fi
unset file

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

export PATH="$HOME/.cargo/bin:$PATH"
