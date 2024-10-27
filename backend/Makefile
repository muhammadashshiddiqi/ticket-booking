# build: 
# 	docker-compose down && docker-compose build --no-cache && docker-compose up
# run:
# 	docker-compose rm -v --force --stop
# 	docker compose down --rmi all
# 	docker compose up --build
# stop:
# 	docker-compose rm -v --force --stop
# 	docker rmi ticket-booking-app

start: 
	@docker compose up --build
	
stop:
	@docker-compose rm -v --force --stop
	@docker rmi ticket-booking-app