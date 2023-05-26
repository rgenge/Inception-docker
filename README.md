# Inception-docker
Project using docker-compose to generate 3 containers- Nginx, Mariadb, Wordpress.

# inception

## Info
This project is about Docker and Docker Compose, where we will generate 3 containers for a wordpress website using mariadb as database and nginx as web server.

## How to run

- run `make`
- run `make down` to stop the containers.
- run `make clean` to stop the containers and clean images and clean volumes.
- - run `make fclean` to do a clean and then delete every folder created for wordpress and database, everything will be deleted and back to "zero".

## About this project
In this project we will setup 3 containers using the configurations below.

- NGINX w/ TLSv1.3. ( It is important to install a SSL for security reasons that will generated in nginx dockerfile)
- Wordpress + php-fpm .( Wordpress needs php-fpm to run, because nginx is only for javascript, so you need php to install php package before running Wordpress)
- MariaDB. ( This is our database, which is generated to store all the info for wordpress, we have to use SQL dump to save all wordpress info)

We have to set the following volumes:

- v-worpress that will store all web site files for wordpress.
- v-mariadb that will store all database for wordpress.

Some useful commands:

```sh
#Start docker containers
docker-compose up -d
#Stop docker containers
docker-compose down
#List all containers
docker container ls
#List all volumes
docker volume ls
#Access a container
docker exec -it [container_name] sh
#access mariadb dataase
docker exec -it mariadb mysql -u root -p (the pass word is in env file)
#backup wordpress database
docker exec mariadb /usr/bin/mysqldump -u root --password=(your password) wordpress > wordpress.sql
```
