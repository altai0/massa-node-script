#!/bin/bash


bold=$(tput bold)
underline=$(tput smul)
italic=$(tput sitm)
info=$(tput setaf 2)
error=$(tput setaf 160)
warn=$(tput setaf 214)
reset=$(tput sgr0)

clear;
echo "*********************---*********************"
echo "Massa - The decentralized and scaled blockchain"
echo "*********************---*********************"
sleep 4

# server update and port settings
sudo apt-get update -y
sudo apt install ufw -y
sudo ufw enable
sudo ufw allow 22
sudo ufw allow ssh
sudo ufw allow 31244/tcp
sudo ufw allow 31245/tcp
sudo ufw status

clear;
echo "${info}INFO${reset}: installation is ${bold}set${reset} please wait... "

sleep 5

# required libraries
sudo apt install pkg-config curl git build-essential libssl-dev libclang-dev -y
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
rustc --version
rustup toolchain install nightly
rustup default nightly
rustc --version
git clone --branch testnet https://github.com/massalabs/massa.git

# rustc explain fixed
sudo apt install make clang pkg-config libssl-dev -y
rustup default nightly 
rustup update

# settings file
clear;
echo "---------------------"
echo "${info}INFO${reset}: Node installed ${bold}successfully${reset}..."
echo "---------------------"
sleep 2

echo "Enter your server's ip address :"
read ipadr
echo -e "[network]\nroutable_ip = '$ipadr'" >> massa/massa-node/config/config.toml
#echo -e '[network]\nroutable_ip = "$ipadr"' >> massa/massa-node/config/config.toml

# reboot to take effect
echo "${info}INFO${reset}: Restarting the server for the settings to take ${bold}effect${reset}..."
sleep 5
reboot
