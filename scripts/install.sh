#!/bin/bash

sudo apt-get remove docker docker-engine docker.io containerd runc

sudo apt-get update

read -p "Installing curl, gnupg, etc.. Continue?"

sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

read -p "Fetching GPG key. Continue?"

sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

read -p "Adding apt source. Continue?"

echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update

read -p "Installing Docker. Continue?"

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin