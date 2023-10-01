#!/usr/bin/env bash
# Install kubectl

# curl -sSLo $HOME/bin/kubectl "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
curl -LO https://dl.k8s.io/release/v1.28.1/bin/linux/amd64/kubectl
sudo chmod +x ./kubectl
# sudo mv ./kubectl /usr/local/bin/kubectl
mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$HOME/bin:$PATH
kubectl version --client

# chmod +x $HOME/bin/kubectl && export PATH=$HOME/bin:$PATH