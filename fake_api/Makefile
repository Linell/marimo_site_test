IMAGE_NAME := fake_api
K8S_CONFIG := k8s-config.yaml
PORT ?= 8080

.PHONY: build
build:
	docker build -f Dockerfile -t $(IMAGE_NAME):latest .

.PHONY: push
push:
	docker push $(IMAGE_NAME):latest

.PHONY: deploy
deploy:
	kubectl apply -f $(K8S_CONFIG)

.PHONY: delete
delete:
	kubectl delete -f $(K8S_CONFIG)

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