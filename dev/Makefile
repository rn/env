.PHONY: build push
default: push

ORG?=rneugeba
IMAGE=devenv

HASH?=$(shell git ls-tree HEAD -- ../$(notdir $(CURDIR)) | awk '{print $$3}')

build:
	docker build --squash --no-cache -t $(ORG)/$(IMAGE):$(HASH) .

push: build
	docker push $(ORG)/$(IMAGE):$(HASH)
	docker push $(ORG)/$(IMAGE):$(HASH)
