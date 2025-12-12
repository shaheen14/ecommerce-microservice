#!/bin/bash

echo "Installing Docker..."
sudo apt-get update -y
sudo apt-get install -y docker.io

echo "Installing Kubectl..."
sudo snap install kubectl --classic

echo "Installing Mysql client..."
sudo apt install -y mysql-client

echo "Setup completed successfully!"

