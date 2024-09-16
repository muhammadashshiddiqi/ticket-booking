FROM golang:1.22.6-alpine3.20

WORKDIR /src/app/go-ticket-booking
COPY . .
RUN go mod tidy
CMD [ "go run", "./cmd/api/main.go", "-b", "0.0.0.0" ]

