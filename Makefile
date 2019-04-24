VERSION := $(shell git describe --tags --always --dirty="-dev")
TAG := mirceaulinic/black:$(VERSION)

.PHONY: build
build:
	docker build . -t $(TAG)

.PHONY: publish
publish: build
	docker push $(TAG)

.PHONY: black
black:
	docker run --rm -v $(CODEPATH):/black -ti $(TAG) black --fast --skip-string-normalization --check /black

.PHONY: format
format:
	docker run --rm -v $(CODEPATH):/black -ti $(TAG) black --fast --skip-string-normalization /black
