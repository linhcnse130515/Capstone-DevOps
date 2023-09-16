#!/usr/bin/env bash
# Install minikube

curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
chmod +x minikube
mkdir -p $HOME/bin && cp ./minikube $HOME/bin/minikube && export PATH=$HOME/bin:$PATH
minikube version

# chmod +x $HOME/bin/kubectl && export PATH=$HOME/bin:$PATH