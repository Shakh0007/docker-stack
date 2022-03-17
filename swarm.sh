#!/bin/bash
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo systemctl start docker 
sudo systemctl enable docker 
systemctl status docker 


docker swarm join --token SWMTKN-1-030mfkwm2fpdgx78p6llle7k587e9n952mhozocpnznj6y4r1z-55gph5mt8u70qean9bxfio8d5 161.35.139.51:2377


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