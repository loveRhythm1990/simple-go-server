
IMG ?= simple-go-server:latest

.PHONY: run
run:
	go run ./main.go

.PHONY: run
docker-build:
	docker build -t ${IMG} .