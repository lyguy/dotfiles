#!/usr/bin/env bash

# start the gpg-agent if it's not running
if ! pgrps -x -u "${USER}" gpg-agent >/dev/null 2>&1; then
    gpg-connect-agent /bye >/dev/null 2>&1
fi
gpg-connect-agent updatestartuptty /bye >/dev/null
# use a tty for gpg
# addresses: "gpg: signing faile: Inappropriate ioctl for device"
GPG_TTY=$(tty)
export GPG_TTY
# Set SSH to use gpg-agent
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
	  if [[ -z "$SSH_AUTH_SOCK" ]] || [[ "$SSH_AUTH_SOCK" == *"apple.launchd"* ]]; then
		    SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
		    export SSH_AUTH_SOCK
	  fi
fi
# add alias for ssh to update the tty
alias ssh="gpg-connect-agent updatestartuptty /bye >/dev/null; ssh"
