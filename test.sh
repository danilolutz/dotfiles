#!/bin/bash

source "${PWD}/src/helpers.bash"
source "${PWD}/src/files.bash"

out "$TX_BOLD$CL_GREEN$LB* Checking if Git already installed ...$CL_DEFAULT$TX_NORMAL"
if ! command -v git &> /dev/null; then
    sudo apt install git 
else
    out "Ok it's installed$LB"
fi