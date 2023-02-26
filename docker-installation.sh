clear;
echo "Altay - Massa Node Installation (Docker)"
sleep 3

#uninstall old version docker
sudo apt-get remove docker docker-engine docker.io containerd runc

#install
sudo apt-get update
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
sudo mkdir -m 0755 -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo chmod a+r /etc/apt/keyrings/docker.gpg  
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin


#created docker-compose file
cat <<EOF >docker-compose.yml
version: '3'
services:

  massa-core:
    image: peterjah/massa-core
    container_name: massa-core
    restart: always
    environment:
      - DISCORD=
      - DYNIP=0
      - WALLETPWD=123123
      - NODE_MAX_RAM=90
      - TARGET_ROLL_AMOUNT=NULL

    ports:
     - "31244:31244"
     - "31245:31245"
     - "33035:33035"
    cap_add:
      - SYS_NICE
      - SYS_RESOURCE
      - SYS_TIME
    volumes:
     - ./massa_mount:/massa_mount

volumes:
  massa-core:
EOF

##start massa
docker compose up -d
