build: 
	docker-compose up --build
start:
	go run ./cmd/api/main.go -b 0.0.0.0
stop:
	docker-compose rm -v --force --stop
	docker rmi ticket-booking