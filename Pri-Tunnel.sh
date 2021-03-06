#!/bin/bash
#OS: Ubuntu16/18-LTS
#Purpose:Automated deployment of Pritunl
#Owner:cloudelligent.com

apt update -y
apt install -y curl


mkdir docker
cd docker
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
systemctl start docker
systemctl enable docker
rm -rf get-docker.sh

docker volume create pritunl-conf
docker volume ls

docker run --name pritunl --privileged -v ~/pritunl/mondodb:/var/lib/mongodb -v ~/pritunl/pritunl:/var/lib/pritunl -v pritunl-conf:/etc -p 12323:1194/udp -p 12323:1194/tcp -p 80:80/tcp -p 443:443/tcp --restart unless-stopped -d jippi/pritunl

# Username & Password ---> Start
# Username: pritunl Password: pritunl


#END
