#!/bin/bash
# Author: Abhishek Anand Amralkar
# This script installs kubectl

unset CDPATH
CURDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
KCTL_BIN=${KCTL_BIN:-"/usr/local/bin/kubectl"}
set -e


install_kubectl() {
    if [ ! -e "$KCTL_BIN" ];
    then
        echo "Installing kubectl..."
        curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
        curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.7.0/bin/linux/amd64/kubectl
        chmod +x ./kubectl
        sudo mv ./kubectl /usr/local/bin/kubectl
        echo "Done!"
    else
        echo "kubectl is installed"
    fi
}

main() {
    install_kubectl
}

main
