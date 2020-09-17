#! /usr/bin/zsh

###global variables###
#name docker network
dnetworkname=nginx-loadbalance
#name docker container image behind loadbalancer
dcontainerimage=nginx
#number of containers
number=3
#name docker image nginx loadbalancer
dloadbalancer=nginx-loadbalancer


###creation of nginx images using i as name variable###
for i in {1..$number}
do
    echo "<html><body><h1>This is a Site created from a Dockerfile and running on nginx${i}</h1></body></html>" > html/index.html
    docker build -f Dockerfile-nginx -t  $dcontainerimage"$i" .
    rm html/index.html
done

###creating docker network for loadbalancer application###
docker network create $dnetworkname

###creating docker image for loadbalancer###
docker build -f Dockerfile-loadbalancer -t  $dloadbalancer .

###creating webapp / nginx docker container###
for j in {1..$number}
do
    docker run --network $dnetworkname --rm -d --name nginx"$j"-container $dcontainerimage"$j"
done

###creating loadbalancer docker container###
docker run --network $dnetworkname --name $dloadbalancer  --rm -p 8080:80 $dloadbalancer
