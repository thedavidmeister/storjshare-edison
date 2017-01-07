#!/usr/bin/env bash

# https://github.com/Storj/storjshare-cli

echo "=> Ensuring ~/.bashrc"
touch ~/.bashrc

echo "=> Installing nvm"
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.1/install.sh | bash

echo "=> Sourcing ~/.bashrc"
source ~/.bashrc

echo "=> Installing node"

# http://alextgalileo.altervista.org/edison-package-repo-configuration-instructions.html

"src/gz all http://repo.opkg.net/edison/repo/all\nsrc/gz edison http://repo.opkg.net/edison/repo/edison\nsrc/gz core2-32 http://repo.opkg.net/edison/repo/core2-32" > /etc/opkg/base-feeds.conf
opkg update
opkg upgrade tar
opkg install perl-module-cpan
opkg install perl-module-extutils-command
opkg install perl-module-extutils-command-mm

curl -o /tmp/git-2.11.0.tar.gz https://www.kernel.org/pub/software/scm/git/git-2.11.0.tar.gz
tar -zxf /tmp/git-2.11.0.tar.gz git-2.11.0
cd git-2.11.0/
make configure
./configure --prefix=/usr
make all
make install

nvm install 6.9.1

echo "=> Installing storjshare"
npm install -g storjshare-cli
npm update -g storjshare-cli

storjshare --help

storjshare setup
