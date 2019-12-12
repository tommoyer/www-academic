host_port = 3000
jekyll_version = 3.8
image = tommoyer/www

do_size = s-1vcpu-1gb
do_image = ubuntu-16-04-x64
do_region = nyc3
do_ssh_key_fingerprint = 74:93:22:b4:63:40:14:61:c5:62:60:b4:ec:f0:68:ef
do_droplet_name = www

.PHONY: build
build:
	docker run --rm \
             --volume="$PWD:/srv/jekyll" \
             -it jekyll/jekyll:$(jekyll_version) \
             jekyll build
	docker-compose build

.PHONY: push
push: build
	docker-compose push

.PHONY: provision
provision:
ifeq ($(shell docker-machine ls --format "{{.Name}}" --filter name=$(do_droplet_name) | wc -l | awk '{print $$1}'),0)
	docker-machine -D create \
		 --driver=digitalocean \
		 --digitalocean-access-token=$(shell bash -c 'read -s -p "Digital Ocean Personal Access Token: " pwd; echo $$pwd') \
     --digitalocean-size=$(do_size) \
     --digitalocean-image=$(do_image) \
     --digitalocean-ssh-key-fingerprint=$(do_ssh_key_fingerprint) \
     --digitalocean-region=$(do_region) \
     $(do_droplet_name)
else
	@echo "Machine already created"
endif

.PHONY: deploy
deploy: push provision
ifndef DOCKER_MACHINE_NAME
	$(error DOCKER_MACHINE_NAME is not set)
endif
ifneq ($(DOCKER_MACHINE_NAME),$(do_droplet_name))
	$(error DOCKER_MACHINE_NAME does not match. Run `eval $$(docker-machine env $(do_droplet_name))` in your shell first)
endif

	docker-compose up -d

.PHONY: list
tasks:
	@$(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'