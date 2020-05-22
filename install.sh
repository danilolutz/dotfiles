#!/bin/bash

PWD=$(pwd)
DIST=$(lsb_release -is)

source "${PWD}/src/helpers.bash"
source "${PWD}/src/logo.bash"
source "${PWD}/src/zsh.bash"
source "${PWD}/src/vscode.bash"
source "${PWD}/src/docker.bash"
source "${PWD}/src/files.bash"

logo

out "$TX_BOLD$CL_GREEN$LB»»» INSTRUCTIONS «««$CL_DEFAULT$TX_NORMAL"
out "• Stay seated, maybe I need your sudo password for apt."
out "• If isn't the first time you are are runnig me, I'll check if"
out "  you have a .dotfile folder at you user's home and ask if you"
out "  wants to reset you dotfiles.$CL_DEFAULT$LB"


if [ -d $HOME/.dotfiles ]; then
    out "Well this is not you first time..."
    read -p "This will reset you dotfiles. Are you sure to proceed? (y|n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        start_install
    fi
else
    start_install
fi

out "$LB"
