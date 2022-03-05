#!/bin/sh

pass -c "$(fd -e gpg --base-directory=$HOME/.password-store |
	sed "s/\.gpg$//;" | fzf)"
