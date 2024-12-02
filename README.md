# Docker Commands Cheat Sheet

## Registry & Repository

- **docker login** : To log in to a registry.
- **docker logout** : To log out from a registry.
- **docker search** : It will search the registry for the image.
- **docker pull** : It will pull an image from the registry to the local machine.
- **docker push** : It will push an image to the registry from the local machine.


## Images 

- **docker images** : It will display all images.
- **docker import** : You can create an image from a tarball.
- **docker build**: You can create an image from Dockerfile.
- **docker rmi** : It will remove an image.
- **docker history** : To display the history of an image
- **docker tag** : It will tag the image to a name.
- **docker push repo[:tag]** : It will push an image or repo from the registry.
- **docker pull repo[:tag]** : It will pull an image or repo from the registry.


## Container 

- **docker create** : It will create a container without starting it.
- **docker rename** : To remane the container.
- **docker run**: It will create and start the container in one task.
- **docker rm** : It will delete a container.
- **docker update** : It will update a container's resource limits.
- **docker run -td container_id** : It will keep the container running, -t will allocate a pseudo-TTY session, and -d will detach the container automatically.
- **docker run --rm** : It will remove the container once it stops.
- **docker rm -v** : It will remove the volumes associated with the container.
- **docker start** : It will start a container, so it is running.
- **docker stop** : It will stop a running container.
- **docker restart** : It stops and starts a container.
- **docker wait** : It will block until the running container stops.
- **docker kill** : It sends a SIGKILL to a running container.
- **docker ps: It will display the running containers.
- **docker logs** : Provide the logs from the container. (You can use a custom log driver, but logs are only available for json-file and journald in 1.10).
- **docker inspect** : It checks all the information on a container (including IP address).
- **docker events** : It will get the events from the container.
- **docker port** : It will display the public-facing port of the container.
- **docker ps -a** : It will display the running and stopped containers.
- **docker cp** : It will copy the files or folders between a container and the local filesystem.
- **docker exec** : To execute a command in a container.
- **docker exec -it foo /bin/bash** : To enter a running container, attach a new shell process to a running container called foo.
- **docker commit container image** : It will commit a new docker image.
 


## Networks 

- **docker network create NAME** : It will create a new network of bridge type by default.
- **docker network rm NAME** : It will remove one or more networks specified by name and make sure that no containers are connected to the deleted network.
- **docker network ls** : It will list all the networks.
- **docker network inspect NAME** : It will show the detailed information on one or more networks.
- **docker network connect NETWORK CONTAINER** : It will connect a container to a network
- **docker network disconnect NETWORK CONTAINER** : It will disconnect a container from a network.

## Volumes

- **docker volume create** : to create volumes.
- **docker volume rm** : To remove volumes.
- **docker volume ls** : To list the volumes.
- **docker volume inspect** : To inspect the volumes.

## Build 

- **Docker build -t myapp** :1.0- will build an image from the Docker file and tag it.
- **Docker images** : it will list all the images that are locally stored
- **Docker rmi alpine** : 3.4 will delete an image from the Docker Store.


## Cleanup
- **Docker image prune** : It will clean an unused/dangling image
- **Docker image prune -a** : It will remove an image not used in a container.
- **Docker system prune** : It will prune the entire system.
- **Docker kill $(docker ps -a)** : It will stop all running Docker containers.
- **docker rm $(docker ps -a -q)** : It will delete all stopped containers
- **docker rmi $(docker images -q)** : It will delete all images.
 



 Commands based on [hackr.io](https://hackr.io/blog/docker-cheat-sheet-docker-commands)
