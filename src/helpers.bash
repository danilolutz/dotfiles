CL_DEFAULT='\e[39m '
CL_GREEN='\e[32m '

TX_NORMAL='\e[0m '
TX_BOLD='\e[1m '
LB='\n\n'

out()
{
    local params
    local message

    params="-e"
    while [[ ${1} = -* ]]; do
        params="${params} ${1}"
        shift
    done

    message="${@}<0>"

    message=$(echo "${message}" | sed -E $'s/<([0-9;]+)>/\033\[\\1m/g')
    echo ${params} "${message}"
}

apt_start()
{
    out "$TX_BOLD$CL_GREEN$LB* Preparing environment ...$CL_DEFAULT$TX_NORMAL$LB"
    sudo apt autoremove -y
    sudo apt update
    sudo apt install -y \
        software-properties-common \
        apt-transport-https \
        wget curl \
        ca-certificates \
        gnupg-agent
}