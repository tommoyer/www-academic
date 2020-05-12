include make.defaults
include config.make

.PHONY: buildCV
buildCV:
> pushd vita; latexrun --bibtex-cmd biber vita ; popd

.PHONY: build
build:
> docker run --rm --volume="${PWD}:/srv/jekyll" -it jekyll/jekyll:$(jekyll_version) jekyll build

.PHONY: serve
serve:
> docker run --rm --expose 4000 --volume="${PWD}:/srv/jekyll" -it jekyll/jekyll:$(jekyll_version) jekyll serve
