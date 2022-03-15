#!/bin/bash
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo systemctl start docker 
sudo systemctl enable docker 
systemctl status docker 


docker swarm join --token SWMTKN-1-4okiq3uwqroe1o9mbx1rr9fpotxenmu2wivgoxho6nnfalwg7g-4orjw2pncewmne7envjwsc9p8 159.65.182.125:2377


docker service create    \
--replicas=2 \
--publish mode=host,target=8080,published=8080 \
--name=jenkins \
--constraint=node.role==worker \
jenkins/jenkins:latest


# docker service create    \
# --constraint=node.role==manager    \
# --mode=global \
# --publish mode=host,target=8081,published=8081  \
# --mount type=bind,src=/var/run/docker.sock,dst=/var/run/docker.sock \
# --name=visualizer \
# dockersamples/visualizer