FROM golang:1.21-alpine

ENV GOPATH=/go

WORKDIR /go/src/github.com/loveRhythm1990/simple-go-server

COPY go.mod ./
COPY *.go ./
COPY vendor/ vendor

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build --mod=vendor -o /simple-server

EXPOSE 8080

CMD ["/simple-server"]