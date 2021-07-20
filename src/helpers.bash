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

get_latest_release() {
    curl --silent "https://api.github.com/repos/$1/releases/latest" | # Get latest release from GitHub api
        grep '"tag_name":' |                                            # Get tag line
        grep -Po '"tag_name": "\K.*?(?=")'
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
        git zsh \
        libevent-dev \
        make \
        libncurses5-dev libncursesw5-dev
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

command_exists() {
    type -P "$1" >/dev/null 2>&1
}

start_install()
{
    configure_terminal
    # apt_start
    zsh
    tmux
    files
    nodejs
    vscode
    docker
}

