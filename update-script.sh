# UPDATE
while true; do
    read -p "Massa node will be completely deleted and reloaded (this may mean losing your addresses, please do not start this without saving your address) " yn
    case $yn in
        [Yy]* ) sudo rm script.sh; sudo rm -r massa; wget https://github.com/massalabs/massa/releases/download/TEST.23.1/massa_TEST.23.1_release_linux.tar.gz; tar -zxf massa_TEST.23.1_release_linux.tar.gz; echo "Done...";
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
