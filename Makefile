include make.defaults
include config.make

.PHONY: build
build:
> pushd vita; latex-docker latexrun --bibtex-cmd biber vita ; popd
> docker run --rm --volume="$PWD:/srv/jekyll" -it jekyll/jekyll:$(jekyll_version) jekyll build
> git commit -a -m "Build and commit"
> git push

.PHONY: deploy
deploy:
> ssh $(docker_user)@$(docker_host) "cd www; git pull"
> docker-compose -H ssh://$(docker_user)@$(docker_host) up -d