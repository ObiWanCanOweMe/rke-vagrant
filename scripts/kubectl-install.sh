#!/bin/sh -e

echo 'install kubectl'

# install kubectl
sudo mkdir -p /usr/local/bin
sudo curl -SsL \
  https://storage.googleapis.com/kubernetes-release/release/${curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl
sudo chmod +x /usr/local/bin/kubectl
