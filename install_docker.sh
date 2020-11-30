#!/usr/bin/bash

#######################################################################################################
###     Description : Script de déployement de containeur basé sur le scipt de la chaine Xavki.     ###
###                                                                                                 ###
###     source: https://gist.github.com/EvgenyOrekhov/1ed8a4466efd0a59d73a11d753c0167b              ###
###                                                                                                 ###
###     Auteur: Ibine                                                                               ###
###                                                                                                 ###
###     Date : 25/11/20                                                                             ###
###                                                                                                 ###
###     Version : 1.0                                                                               ###
###                                                                                                 ###
#######################################################################################################

set -o errexit
set -o nounset

IFS=$(printf '\n\t')

# Docker
printf '\nRemove old version of Docker  \n\n'
sudo apt remove --yes docker docker.io containerd runc
sudo apt update

printf '\nDocker installation start \n\n'
sudo apt-get remove docker docker.io  
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=$(dpkg --print-architecture)] https://download.docker.com/linux/ubuntu $(lsb_release --codename --short) stable"
sudo apt update
sudo apt --yes --no-install-recommends install docker-ce docker-ce-cli containerd.io
sudo usermod --append --groups docker "$USER"
sudo systemctl enable docker
printf '\nDocker installed successfully\n\n'

printf 'Waiting for Docker to start...\n\n'
sleep 5

printf '\nDocker-Compose installation start \n\n'
# Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo wget --output-document=/etc/bash_completion.d/docker-compose "https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/bash/docker-compose"
printf '\nDocker Compose installed successfully\n\n'


printf '\n\n launch rancher container \n\n'
# Lancement du container Rancher 
sudo docker run -d --restart=unless-stopped -p 8080:8080 rancher/server
printf '\nContainer Rancher lauch successfully \n\n'
printf 'For login to Rancher interface, navigate to the following URL: http://<SERVER_IP>:8080 \n\n'