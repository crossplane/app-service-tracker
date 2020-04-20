STACK_VERSION ?= local
STACK_IMG ?= crossplane/app-service-tracker:$(STACK_VERSION)

build:
	docker build . -t ${STACK_IMG}
.PHONY: build

publish:
	docker push ${STACK_IMG}
.PHONY: publish