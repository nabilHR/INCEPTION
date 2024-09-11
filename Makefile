all:up


up:
	docker-compose -f  ./srcs/docker-compose.yml up
down:
	docker-compose -f ./srcs/docker-compose.yml down --rmi all 
clean:
	rm -rf /home/nbaghoug/data/mariadb/*
	rm -rf /home/nbaghoug/data/wordpress/*
fclean:
	docker network prune
	docker volume prune -f
