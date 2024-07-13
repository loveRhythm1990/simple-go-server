FROM golang:1.21

ENV GOPATH=/go

WORKDIR /go/src/github.com/loveRhythm1990/simple-go-server

COPY go.mod ./
COPY *.go ./

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /simple-server

EXPOSE 8080

CMD ["/simple-server"]