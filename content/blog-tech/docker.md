---
title: Docker Commands
description: Basic Docker Commands
date: 2022-07-25
tags: ["docker","config"]
---
```
docker images // show all images

docker run --name (container name) -ti ubuntu:latest bash // -ti means terminal interactive
cat /etc/lsb-release

docker ps // show all running container

docker ps -a // show all container

docker ps -l // last runned container

docker ps
docker commit (container ID) // save container to an image
docker tag (image ID) (image name) // name the new image
docker images // check the new image

docker commit (container ID) (image name):(image tag)

docker run --rm -ti ubuntu sleep 5 // --rm means delete container after stopped

docker run -ti ubuntu bash -c "sleep 3; echo all done"

docker run -d -ti ubuntu bash // -d means running in the background (detach)
docker ps // see the container, match ID, record name
docker attach (container name)

ctrl p + ctrl q // detach and keep running

docker exec -ti (container name) bash // running more process in a container, cannot add ports, volumns

docker logs // see all logs
docker logs (container name) // see logs
 
docker kill (container name) // stop container
docker rm (container name) // delete container

docker run --memory (maximum memory) (image name) (command)
docker run --cpu-shares 
docker run --cpu-quota


docker run --rm -ti -p 45678:45678 -p 45679:45679 --name (name) ubuntu:14.04 bash // machine_port:docker_port/(tcp/udp)
nc -lp 45678 | nc -lp 45679
nc -ulp (port number) // for udp connection
nc localhost 45678
nc host.docker.internal 45678

docker port (container name) // show all ports used in this container

docker network ls // show all docker networks
docker network create (network name) // can link several dockers onto one network
docker run --rm -ti --net (network name) --name (docker name) ubuntu:14.04 bash

docker run -e (ENVNAME)=(VARVALUE) --name (docker name) ubuntu:14.04 bash

docker commit (container name) registry.example.com:port/organization/image-name:version-tag

docker pull/push

docker rmi (image ID) // remove image
docker rmi (image name):(image tag)


docker run -ti -v (host folder):(docker folder) ubuntu bash // absolute path, shared folder, eternal

docker run -ti -v (docker1 folder) ubuntu bash // share folder between containers, ephemeral
docker run -ti --volumns-from (docker1 name) ubuntu bash

docker search (image name) // search for images

docker login
docker pull debian:sid
docker tag debian:sid thearthur/test-image-42:v99.9
docker push
```
