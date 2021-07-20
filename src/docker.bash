docker()
{
    out "$TX_BOLD$CL_GREEN$LB* Checking if Docker already installed ...$CL_DEFAULT$TX_NORMAL"
    if ! command_exists docker; then
        out "$TX_BOLD$CL_GREEN$LB* Installing Docker ...$CL_DEFAULT$TX_NORMAL$LB"
        curl -fsSL https://mirrors.ustc.edu.cn/docker-ce/linux/debian/gpg | sudo apt-key add -
        sudo apt-key fingerprint 0EBFCD88

        echo 'deb [arch=amd64] https://mirrors.ustc.edu.cn/docker-ce/linux/debian buster stable' | sudo tee /etc/apt/sources.list.d/docker.list
        
        echo 'deb [arch=amd64] https://download.docker.com/linux/debian buster stable' | sudo tee /etc/apt/sources.list.d/docker.list

        sudo apt update
        sudo apt install -y docker-ce docker-ce-cli containerd.io

        docker_group
    else
        out "Ok it's installed$LB"
    fi

}

docker_group()
{
    out "$TX_BOLD$CL_GREEN$LB* Adding user ${USER} to Docker group...$CL_DEFAULT$TX_NORMAL$LB"
    sudo usermod -aG docker ${USER}
}