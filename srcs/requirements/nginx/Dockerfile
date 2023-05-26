FROM debian:buster

# Update image
RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get upgrade -y 

# Install nginx packages
RUN apt-get install -y	\
    nginx \
    vim \
    openssl \
    procps
#Create folder for ssl keys and generate keys
RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
       -out /etc/nginx/ssl/acosta-a.crt \
       -keyout /etc/nginx/ssl/acosta-a.key \
       -subj "/C=BR/ST=SP/L=SP/O=42SP/OU=acosta-a/CN=acosta-a.42.fr"
#Copy nginx our configuration to nginx folder
COPY ./conf/nginx.conf /etc/nginx/conf.d/default.conf
#Create /run/niginx folder
RUN mkdir -p /run/nginx

EXPOSE	443
#Start nginx 
CMD ["nginx", "-g", "daemon off;"]
