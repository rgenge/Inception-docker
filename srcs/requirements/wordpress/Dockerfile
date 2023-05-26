FROM debian:buster

# Update image
RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get upgrade -y 

# Install WordPress packages
RUN apt-get install -y	\
	wget \
	apt-utils \
	vim \
	php7.3 \
	php7.3-fpm \
	php7.3-opcache \
	php7.3-cli \
	php7.3-gd \
	php7.3-curl \
	php7.3-mysql \
	php7.3-mbstring

#Installing wordpress
RUN mkdir /run/php && \
	mkdir -p /var/www/acosta-a && \
	wget https://wordpress.org/latest.tar.gz && \
	tar -xzvf latest.tar.gz && \
	rm latest.tar.gz && \
	mv wordpress /var/www/acosta-a/wordpress
#Set the folder where the program will run
WORKDIR /var/www/acosta-a/wordpress

#Copying folder with files to use in wordpress
COPY conf/ /srcs/
COPY tools/ /usr/local/bin/
#Copying files and run chmod to guarantee permission
RUN cp /srcs/www.conf /etc/php/7.3/fpm/pool.d/ &&  \
	chmod +x /usr/local/bin/wordpress.sh

#Starting wordpress config
ENTRYPOINT ["/usr/local/bin/wordpress.sh"]

EXPOSE 9000

#Running Php-fpm which is php using fast cgi used by wordpress
CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize"]
