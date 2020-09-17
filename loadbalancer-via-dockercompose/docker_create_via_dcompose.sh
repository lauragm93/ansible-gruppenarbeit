#! /usr/bin/zsh
###global variables####
webapp_instances=3


#creating loadbalancing network via docker compose with 3 webapp instances
docker-compose up -d --scale webapp=$webapp_instances

#copying different index files into webapp-container via dockercp
for i in {1...$webapp_instances}
do
    docker cp nginx-html/app"$i"/index.html loadbalancer-via-dockercompose_webapp_"$i":/usr/share/nginx/html
done