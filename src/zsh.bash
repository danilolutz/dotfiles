zsh()
{
    out "$TX_BOLD$CL_GREEN$LB* Installing Oh My ZSH ...$CL_DEFAULT$TX_NORMAL$LB"
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}