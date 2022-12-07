FROM golang:1.16-alpine

WORKDIR /app

# Download necessary Go modules
COPY go.mod ./
RUN go mod download


COPY *.go ./

RUN go build -o /simple-server

EXPOSE 8080

CMD ["/simple-server"]