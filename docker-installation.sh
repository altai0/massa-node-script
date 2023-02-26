clear;
echo "Altay - Massa Node Installation (Docker)"
sleep 3

### Docker and docker compose prerequisites
sudo apt install curl
sudo apt install gnupg
sudo apt install ca-certificates
sudo apt install lsb-release

### Download the docker gpg file to Ubuntu
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

### Add Docker and docker compose support to the Ubuntu's packages list
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-pluginsudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-pluginlinux/ubuntu   $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io docker-compose-plugin

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
