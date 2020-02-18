docker()
{
    out "$TX_BOLD$CL_GREEN$LB* Installing Docker ...$CL_DEFAULT$TX_NORMAL$LB"
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo apt-key fingerprint 0EBFCD88

    sudo add-apt-repository \
        "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
        $(lsb_release -cs) \
        stable"

    sudo apt update
    sudo apt install -y docker-ce docker-ce-cli containerd.io
}

docker_group()
{
    out "$TX_BOLD$CL_GREEN$LB* Adding user ${USER} to Docker group...$CL_DEFAULT$TX_NORMAL$LB"
    sudo usermod -aG docker ${USER}
}