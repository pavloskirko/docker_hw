# Docker demo project

The project demonstrates creating a basic lightweight image from alpine image, creating two containers, connecting them to a non-default bridge network, bind to the folder outside container and transfer files between containers using netcat.

## Getting started
Building new image with bash and netcat from base alpine image
```sh
sudo docker build -t alpine_bash ./
```
Open two additioanal terminals and run containers from the new image:
```sh
sudo docker container run -it --name alpine1 --mount type=bind,source="$(pwd)",target=/app alpine_bash bash
sudo docker container run -it --name alpine2 --mount type=bind,source="$(pwd)",target=/app alpine_bash bash
```
Create new bridge network and connect two alpine containers to it:
```sh
sudo docker network create my_bridge_network
sudo docker network connect my_bridge_network alpine1
sudo docker network connect my_bridge_network alpine2
```
Check what ip addresses our containers got, modify nc_client.sh and nc_server.sh correspondingly.
```sh
sudo docker network my_bridge_network inspect
```

Run nc_client.sh and nc_server.sh from docker containers bash.

Now you can compare transmitted and received data:
```sh
cat file_to_send
cat received_file
```
