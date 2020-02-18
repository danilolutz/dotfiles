files()
{
    out "$TX_BOLD$CL_GREEN$LB* Copying Configuration Files...$CL_DEFAULT$TX_NORMAL$LB"
    cp -fv .bash_aliases $HOME/.bash_aliases
    cp -fv .gitconfig $HOME/.gitconfig
    cp -fv .vimrc $HOME/.vimrc
    cp -fv .zshrc $HOME/.zshrc
}