include make.defaults
include config.make

.PHONY: build
build:
> pushd vita; latexrun --bibtex-cmd biber vita ; popd
> docker run --rm --volume="$PWD:/srv/jekyll" -it jekyll/jekyll:$(jekyll_version) jekyll build

.PHONY: deploy
deploy:
> docker-compose -H ssh://$(docker_user)@$(docker_host) pull
> docker-compose -H ssh://$(docker_user)@$(docker_host) up -d