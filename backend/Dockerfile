# FROM golang:1.22.6-alpine AS builder

# WORKDIR /src/app

# COPY . .


# RUN go mod tidy
# RUN go mod vendor

# RUN CGO_ENABLED=0 \
#     GO111MODULE=on \
#     GOOS=linux \
#     GOARCH=amd64 \
#     go build -mod vendor -ldflags="-w -s" -o /.goapp ./cmd/api 

# FROM alpine:latest

# ENV TZ=Asia/Jakarta
# COPY --from=builder /.goapp /goapp
# RUN chmod +x /goapp
# CMD ["/goapp"]
    
FROM golang:1.22.6-alpine3.20

WORKDIR /src/app
COPY . .
RUN go mod tidy
CMD [ "go run", "./cmd/api/main.go", "-b", "0.0.0.0" ]