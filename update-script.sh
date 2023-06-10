# UPDATE

#delete old version
sudo rm script.sh
sudo rm script.sh.1
sudo rm -r newVersion
sudo rm massa/massa-node/massa-node
sudo rm massa/massa-client/massa-client

# fetch new version 

mkdir newVersion
wget https://github.com/massalabs/massa/releases/download/TEST.23.1/massa_TEST.23.1_release_linux.tar.gz
tar -zxf massa_TEST.23.1_release_linux.tar.gz --directory /newVersion


# update node

mv newVersion/massa/massa-node/massa-node massa/massa-node/
mv newVersion/massa/massa-client/massa-client massa/massa-client/

echo "--------"
echo "Done..."
echo "--------"
