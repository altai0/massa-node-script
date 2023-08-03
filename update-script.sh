
#!/bin/bash

read -p "Massa node will be completely deleted and reloaded (this may mean losing your addresses, please do not start this without saving your address. (yes/no) " yn

case $yn in 
	yes ) echo "ok, we will proceed";;
	no ) echo "exiting...";
		exit;;
	* ) echo "invalid response";
		exit 1;;
esac

sudo rm script.sh
sudo rm script.sh.1
sudo rm -r massa


wget https://github.com/massalabs/massa/releases/download/TEST.25.2/massa_TEST.25.2_release_linux.tar.gz
tar -zxf massa_TEST.25.2_release_linux.tar.gz

echo "--------"
echo "Done..."
echo "--------"
