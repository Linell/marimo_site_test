# Define the image name
IMAGE_NAME := cool_report

# Define default port number
PORT ?= 8080

.PHONY: build
build:
	docker build -f Dockerfile -t $(IMAGE_NAME):latest .

.PHONY: start
start:
	docker run -d --name $(IMAGE_NAME) -p $(PORT):8080 $(IMAGE_NAME):latest

.PHONY: stop
stop:
	docker stop $(IMAGE_NAME) || true
	docker rm $(IMAGE_NAME) || true

.PHONY: clean
clean:
	docker rm $(IMAGE_NAME) || true
	docker rmi $(IMAGE_NAME):latest || true