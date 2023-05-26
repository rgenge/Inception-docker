all:
	@sudo mkdir -p /home/acosta-a/data/mariadb
	@sudo mkdir -p /home/acosta-a/data/wordpress
	@if ! grep -q "acosta-a.42.fr" /etc/hosts; then \
                echo "127.0.0.1 acosta-a.42.fr" >> /etc/hosts; \
        fi
	@docker-compose -f ./srcs/docker-compose.yml up -d --build

down:
	@docker-compose -f ./srcs/docker-compose.yml down

re:
	@docker-compose -f ./srcs/docker-compose.yml up -d --build

update-hosts:
	@if ! grep -q "acosta-a.42.fr" /etc/hosts; then \
		echo "127.0.0.1 acosta-a.42.fr" >> /etc/hosts; \
	fi

clean: down
	@-docker rmi all -f `docker images -qa`
	@-docker volume rm `docker volume ls -q`

fclean: clean
	@sudo rm -rf /home/acosta-a/data/wordpress
	@sudo rm -rf /home/acosta-a/data/mariadb
	@sudo docker system prune --volumes --all --force
.PHONY: all re down clean fclean
