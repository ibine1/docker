#!/usr/bin/bash

#######################################################################################################
###     Description : Script de déployement de conteneurs basé sur le scipt de la chaine Xavki.     ###
###                                                                                                 ###
###     source: https://gitlab.com/xavki/presentations-scripting/-/tree/master/shell                ###
###                                                                                                 ###
###     Auteur: Ibine                                                                               ###
###                                                                                                 ###
###     Date : 25/11/20                                                                             ###
###                                                                                                 ###
###     Version : 1.0                                                                               ###
###                                                                                                 ###
#######################################################################################################

 #si option --create
  if [ "$1" == "--create" ];then
    echo ""
    echo " notre option est --create"
    echo ""
    nb_machine=1
      
    [ "$2" != "" ] && nb_machine=$2
  # Initialisation du min/max      
  min=1
  max=0 

  #Recuperation de l'idmax
  idmax=`docker inspect --format '{{.Name}}' $(docker ps -aq) | grep $USER-alpine-$i| awk -F "-" -v user=$USER '$0 ~ user"-alpine" {print $3}' | sort -r| head -1`

  #Reinitialisation du min/max
  min=$(($idmax + 1))
  max=$(($idmax + $nb_machine)) 

  #Boucle
  for i in $(seq $min $max);do
  docker run -tid --name $USER-alpine-$i alpine:latest
 
    echo "Conteneurs $USER-alpine-$i créer"
    done

#opérateur filesystème :
#	- -z : variable vide
#	- -f : fichier existe
#	- -d : répertoire existe



  # si notre option est --drop
  elif [ "$1" == "--drop" ];then 

  echo " notre option est --drop " 
    docker rm -f $(docker inspect --format '{{.Name}}' $(docker ps -aq) | grep $USER-alpine-$i)

  echo "Vous avez supprimé la liste de conteneurs ci-dessus " 

  # si notre option est --infos
  elif [ "$1" == "--infos" ];then 
  
    echo "" 
    echo " Information des conteneurs " 
    echo "" 
    for conteneur in $(docker inspect --format '{{.Name}}' $(docker ps -aq) | grep $USER-alpine-$i); do 
      docker inspect --format '   ==>  {{.Name}} - {{.NetworkSettings.IPAddress}}' $conteneur
    done
  
    echo " Voici la liste des conteneurs en cours " 

  # si notre option est --start
  elif [ "$1" == "--start" ];then 

  echo " notre option est --start " 

  docker start $(docker inspect --format '{{.Name}}' $(docker ps -aq))

  # si notre option est --ansible
  elif [ "$1" == "--ansible" ];then 

  echo " notre option est --ansible "
  
  # sinon affichez l'aide
  else 

  echo "

  Option 

  - --create
  - --drop
  - --infos
  - --start
  - --ansible

"
fi