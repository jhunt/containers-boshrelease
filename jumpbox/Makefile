DOCKER_IMAGE   ?= huntprod/cf-jumpbox
CONTAINER_NAME ?= jumpbox-16974f84-6f20-4f95-9aa4-5d2b30146cb9-flatten

build:
	docker build -t $(DOCKER_IMAGE):latest .

push: build
	docker push $(DOCKER_IMAGE):latest

.PHONE: build push
