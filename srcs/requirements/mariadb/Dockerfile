FROM debian:buster

# Update image
RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get upgrade -y 

# Install mariadb packages
RUN apt-get install -y	\
			mariadb-server \
			procps \
			vim \
			&& mkdir -p /var/run/mysqld \
			&& chown -R mysql:mysql /var/run/mysqld \
                        && chmod 777 /var/run/mysqld

#Copy files to folder docker to respective folders to exec and read it
COPY		./tools/mariadb.sh /usr/local/bin/
COPY		./conf/wordpress.sql /

#Make sure files have permission
RUN chmod +x /usr/local/bin/mariadb.sh
RUN chmod +x /wordpress.sql

EXPOSE		3306
#Start executing the data creation script
ENTRYPOINT ["mariadb.sh"]
#Start the data to be used by wordpress
CMD ["mysqld", "--bind-address=0.0.0.0"]

