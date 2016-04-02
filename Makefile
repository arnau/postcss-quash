VERSION ?= ps

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
test: dist
	@$(call job, $(TEST_CMD))
.PHONY: test

shell:
	@$(call job, bash)
.PHONY: shell

check:
	@rm -rf dist
	@$(call job, npm outdated)
.PHONY: check


dist:
	@rm -rf dist
	@$(call job, babel src --out-dir dist)
.PHONY: dist

publish: dist
	@$(call job, npm login;npm publish)
.PHONY: publish


define job
  $(DOCKER_JOB) --volume $(PWD)/reference:/home/quash/reference \
                --volume $(PWD)/src:/home/quash/src \
                --volume $(PWD)/test:/home/quash/test \
                --volume $(PWD)/dist:/home/quash/dist \
                --volume $(PWD)/package.json:/home/quash/package.json \
                --volume $(PWD)/bower.json:/home/quash/bower.json \
                --workdir /home/quash \
                $(image_name) \
                $1
endef
