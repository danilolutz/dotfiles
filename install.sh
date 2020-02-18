#!/bin/bash

PWD=$(pwd)

source "${PWD}/src/helpers.bash"
source "${PWD}/src/logo.bash"
source "${PWD}/src/zsh.bash"
source "${PWD}/src/vscode.bash"
source "${PWD}/src/docker.bash"

logo
zsh
apt_start
docker
docker_group
vscode
vscode_extensions
vscode_config

out "$LB"