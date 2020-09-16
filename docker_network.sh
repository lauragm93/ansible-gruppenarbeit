#! /usr/bin/zsh

docker create network nginx-loadbalancer

for (( i=1; i <= 3; i++ ))
do
   docker build -t  imagename"$i" .
done


for (( i=1; i <= 3; i++ ))
do
   docker run --network nginx-loadbalancer --rm --name containername"$i" imagename
done


docker run --network nginx-loadbalancer  --rm -p 8080:80 image_name