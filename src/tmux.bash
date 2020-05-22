plugin_manager()
{
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
}

tmux()
{
    out "$TX_BOLD$CL_GREEN$LB* Checking if Tmux already installed ...$CL_DEFAULT$TX_NORMAL"
    if ! command -v tmux &> /dev/null; then
        out "$TX_BOLD$CL_GREEN$LB* Installing Tmux ...$CL_DEFAULT$TX_NORMAL$LB"
        VERSION=$(get_latest_release "tmux/tmux")
        DIR=$(pwd)
        cd /tmp
        curl -sL https://github.com/tmux/tmux/releases/download/${VERSION}/tmux-${VERSION}.tar.gz | tar zx
        cd tmux-${VERSION}
        ./configure && make
        sudo make install
        plugin_manager
        cd $DIR
    else
        out "Ok it's installed$LB"
    fi
}