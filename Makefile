include make.defaults
include config.make

.PHONY: build
build: buildCV
> docker run --rm --volume="${PWD}:/srv/jekyll" -it jekyll/jekyll:$(jekyll_version) jekyll build

.PHONY: buildCV
buildCV:
> pushd vita; latexrun --bibtex-cmd biber vita ; popd

.PHONY: serve
serve:
> docker run --rm --expose 4000 --volume="${PWD}:/srv/jekyll" -it jekyll/jekyll:$(jekyll_version) jekyll serve
