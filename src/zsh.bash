zsh()
{
    ZSH=${ZSH:-~/.oh-my-zsh}
    out "$TX_BOLD$CL_GREEN$LB* Checking if Oh My ZSH already installed ...$CL_DEFAULT$TX_NORMAL"
    if [ -d "$ZSH" ]; then
        out "Ok it's installed$LB"
    else
        out "$TX_BOLD$CL_GREEN$LB* Installing Oh My ZSH ...$CL_DEFAULT$TX_NORMAL$LB"
        sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    fi
}