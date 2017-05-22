.PHONY: build push clean
default: push

ORG?=rneugeba
IMAGE=devenv

HASH?=$(shell git ls-tree HEAD -- ../$(notdir $(CURDIR)) | awk '{print $$3}')

build:
	docker build --squash --no-cache -t $(ORG)/$(IMAGE):$(HASH) .

push: build
	docker push $(ORG)/$(IMAGE):$(HASH)
	docker tag $(ORG)/$(IMAGE):$(HASH) $(ORG)/$(IMAGE):latest
	docker push $(ORG)/$(IMAGE):latest

clean:
	rm -rf rneugeba-dev-*
