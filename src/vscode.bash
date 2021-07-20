vscode_extensions()
{
    out "$TX_BOLD$CL_GREEN$LB* Installing Visual Studio Code Extensions...$CL_DEFAULT$TX_NORMAL$LB"
    cat code.extensions.list | grep -v '^#' | xargs -L1 code --install-extension
}

vscode_config()
{
    out "$TX_BOLD$CL_GREEN$LB* Configuring Visual Studio Code Preferences...$CL_DEFAULT$TX_NORMAL$LB"
    mkdir -p ~/.config/Code/User -v
    cp .config/Code/User/settings.json ~/.config/Code/User/settings.json -v
}

vscode()
{
    out "$TX_BOLD$CL_GREEN$LB* Checking if Visual Studio Code already installed ...$CL_DEFAULT$TX_NORMAL"
    if ! command_exists code; then
        out "$TX_BOLD$CL_GREEN$LB* Installing Visual Studio Code ...$CL_DEFAULT$TX_NORMAL$LB"
        wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
        sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"

        sudo apt update
        sudo apt install -y code

        vscode_extensions
        vscode_config
    else
        out "Ok it's installed$LB"
    fi
}
