FROM nginx:latest

RUN rm /etc/nginx/conf.d/default.conf
COPY loadbalancer/default.conf.template /etc/nginx/conf.d/default.conf