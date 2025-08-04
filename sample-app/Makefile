APP_NAME=app
DOCKER_USER=your-dockerhub-user
DOCKER_TAG=latest

.PHONY: all build test docker-build docker-push

all: build

build:
	go build -o $(APP_NAME)

test:
	go test ./...

docker-build:
	docker build -t $(DOCKER_USER)/$(APP_NAME):$(DOCKER_TAG) .

docker-push:
	docker push $(DOCKER_USER)/$(APP_NAME):$(DOCKER_TAG)