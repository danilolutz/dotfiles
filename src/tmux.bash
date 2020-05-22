plugin_manager()
{
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
}

tmux()
{
    out "$TX_BOLD$CL_GREEN$LB* Checking if Tmux already installed ...$CL_DEFAULT$TX_NORMAL"
    if ! command -v tmux &> /dev/null; then
        out "$TX_BOLD$CL_GREEN$LB* Installing Tmux ...$CL_DEFAULT$TX_NORMAL$LB"
        # sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        plugin_manager
    else
        out "Ok it's installed$LB"
    fi
}