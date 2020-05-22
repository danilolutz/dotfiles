files()
{
    out "$TX_BOLD$CL_GREEN$LB* Copying Configuration Files...$CL_DEFAULT$TX_NORMAL$LB"

    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    mkdir -p ~/.vim/plugged
    mkdir -p ~/.vim/swapfiles
    chmod 777 ~/.vim/swapfiles

    cp -fv .bash_aliases $HOME/.bash_aliases
    cp -fv .gitconfig $HOME/.gitconfig
    cp -fv .vimrc $HOME/.vimrc
    cp -fv .zshrc $HOME/.zshrc
    cp -fv .tmux.conf $HOME/.tmux.conf

    sudo cp -fv composer /usr/local/bin/composer
    sudo chmod +x /usr/local/bin/composer
}