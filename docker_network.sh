#! /usr/bin/zsh

docker network create nginx-loadbalancer

#nginx loadbalancer
docker build -f /home/sebastian/gitrepos/ansible-gruppenarbeit/docker-image-nginx-loadbalancer/Dockerfile -t  nginx-loadbalancer .

#nginx container
docker build -f /home/sebastian/gitrepos/ansible-gruppenarbeit/docker-image-nginx-website/website1/Dockerfile -t  nginx1 .
docker build -f /home/sebastian/gitrepos/ansible-gruppenarbeit/docker-image-nginx-website/website2/Dockerfile -t  nginx2 .
docker build -f /home/sebastian/gitrepos/ansible-gruppenarbeit/docker-image-nginx-website/website3/Dockerfile -t  nginx3 .

#running nginx container with webseite
docker run --network nginx-loadbalancer --rm --name nginx1-container
docker run --network nginx-loadbalancer --rm --name nginx2-container
docker run --network nginx-loadbalancer --rm --name nginx3-container


docker run --network nginx-loadbalancer  --rm -p 8080:80 nginx-loadbalancer
