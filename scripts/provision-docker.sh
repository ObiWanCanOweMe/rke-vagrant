#!/bin/sh -e

echo 'provision docker'

if ! command -v docker >/dev/null; then
  apt install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg 
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  sudo apt-get update && sudo apt-get install docker-ce docker-ce-cli containerd.io -y
  usermod -aG docker ubuntu
fi

# allow a few seconds for the docker.sock to be available
sleep 5
