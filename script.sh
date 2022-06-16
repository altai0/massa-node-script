#!/bin/bash



echo "*********************"
echo "Massa - Create a Node"
echo "*********************"
sleep 5

sudo apt update
sudo ufw enable
sudo ufw allow 22
sudo ufw allow ssh
sudo ufw allow 31244/tcp
sudo ufw allow 31245/tcp
sudo ufw status

echo "---------------------"
echo "--------------------- Portlar ayarlandı"
echo "--------------------- Düğüm yükleniyor..."
echo "---------------------"
sleep 5

sudo apt install pkg-config curl git build-essential libssl-dev libclang-dev
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
rustc --version
rustup toolchain install nightly
rustup default nightly
rustup default nightly
rustc --version
git clone --branch testnet https://github.com/massalabs/massa.git
sudo apt install make clang pkg-config libssl-dev

echo "---------------------"
echo "Düğüm yüklendi... dosyalar oluşturuluyor lütfen bekleyin"
echo "---------------------"
sleep 5
echo "------------------------------"
echo "------------------------------"
echo " Sunucu ip adresini giriniz :"
read ipadr
echo -e "[network] \nroutable_ip = '$ipadr' \n" >> massa/massa-node/config/config.toml

echo "Routable dosyası oluşturuldu, ayarların geçerli olabilmesi için sunucu yeniden başlatılıyor..."
sleep 3
reboot
