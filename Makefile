VERSION ?= dev

project_name := quash
image_name = $(project_name):$(VERSION)

DOCKER := docker
DOCKER_JOB := $(DOCKER) run --rm -it

default: build

build:
	@$(DOCKER) build -t $(image_name) .
.PHONY: build

TEST_FILES ?= $(wildcard test/*_test.js)
TEST_CMD ?= mocha --compilers js:babel-register $(TEST_FILES)
test:
	@$(call job, $(TEST_CMD))
.PHONY: test

shell:
	@$(call job, bash)
.PHONY: shell


define job
  $(DOCKER_JOB) --volume $(PWD)/lib:/home/quash/lib \
                --volume $(PWD)/reference:/home/quash/reference \
                --volume $(PWD)/test:/home/quash/test \
                --workdir /home/quash \
                $(image_name) \
                $1
endef
