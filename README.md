sudo docker build -t alpine_bash ./

sudo docker container run -it --name alpine1 --mount type=bind,source="$(pwd)",target=/app alpine_bash bash
sudo docker container run -it --name alpine2 --mount type=bind,source="$(pwd)",target=/app alpine_bash bash

sudo docker network create my_bridge_network
sudo docker network connect my_bridge_network alpine1
sudo docker network connect my_bridge_network alpine2

sudo docker network my_bridge_network inspect