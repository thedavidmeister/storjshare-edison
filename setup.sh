#!/usr/bin/env bash

echo "=> Ensuring ~/.bashrc"
touch ~/.bashrc

echo "=> Installing nvm"
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.1/install.sh | bash

echo "=> Sourcing ~/.bashrc"
source ~/.bashrc

echo "=> Installing node"
nvm install 6.9.1
