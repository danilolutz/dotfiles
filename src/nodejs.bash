nodejs()
{
    out "$TX_BOLD$CL_GREEN$LB* Checking if Nodejs already installed ...$CL_DEFAULT$TX_NORMAL"
    if ! command_exists nodejs; then
        out "$TX_BOLD$CL_GREEN$LB* Installing Nodejs ...$CL_DEFAULT$TX_NORMAL$LB"

        VERSION=node_14.x
        DISTRO="$(dpkg --status tzdata|grep Provides|cut -f2 -d'-')"
        echo "deb https://deb.nodesource.com/$VERSION $DISTRO main" | sudo tee /etc/apt/sources.list.d/nodesource.list
        echo "deb-src https://deb.nodesource.com/$VERSION $DISTRO main" | sudo tee -a /etc/apt/sources.list.d/nodesource.list
        curl -fsSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | sudo apt-key add -

        sudo apt-get update
        sudo apt-get install nodejs
        npm install -g yarn
    else
        out "Ok it's installed$LB"
    fi
}