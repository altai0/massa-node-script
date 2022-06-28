#!/bin/bash

echo "*********************---*********************"
echo "Massa - Update a node"
echo "*********************---*********************"
sleep 2

rustup default nightly
rustup update
cd massa/
git stash
git remote set-url origin https://github.com/massalabs/massa.git
git checkout testnet
git pull
