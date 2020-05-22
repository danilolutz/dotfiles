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
        gnupg-agent \
        fonts-firacode \
        cmake \
        vim-gtk \
        git
}

configure_terminal()
{
    if [ "$DIST" = "Ubuntu" ]
    then
        out "$TX_BOLD$CL_GREEN$LB* Configuring terminal ...$CL_DEFAULT$TX_NORMAL$LB"
        GNOME_TERMINAL_PROFILE=`gsettings get org.gnome.Terminal.ProfilesList default | awk -F \' '{print $2}'`
        gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$GNOME_TERMINAL_PROFILE/ font 'Fira Code Regular 11'
        gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$GNOME_TERMINAL_PROFILE/ use-system-font false
    fi
}

start_install()
{
    configure_terminal
    apt_start
    docker
    vscode
    zsh
    files
}