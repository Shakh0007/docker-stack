#!/bin/bash
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo systemctl start docker 
sudo systemctl enable docker 
systemctl status docker 

docker swarm join --token SWMTKN-1-4okiq3uwqroe1o9mbx1rr9fpotxenmu2wivgoxho6nnfalwg7g-4orjw2pncewmne7envjwsc9p8 159.65.182.125:2377