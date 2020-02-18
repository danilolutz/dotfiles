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
configure_terminal
apt_start
docker
docker_group
vscode
vscode_extensions
vscode_config
zsh
files

out "$LB"