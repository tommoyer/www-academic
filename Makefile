# Use bash instead of sh
SHELL := bash

# Spawn one shell per rule instead of one per line
.ONESHELL:

# Ensure that bash runs in strict mode
.SHELLFLAGS := -eu -o pipefail -c

# Delete any generated files on errors
.DELETE_ON_ERROR:

# Warn if using an undefined variable
MAKEFLAGS += --warn-undefined-variables

# Remove all "magic" rules
MAKEFLAGS += --no-builtin-rules

# Use "> " instead of tabs for indents in rules
ifeq ($(origin .RECIPEPREFIX), undefined)
  $(error This Make does not support .RECIPEPREFIX. Please use GNU Make 4.0 or later)
endif
.RECIPEPREFIX = >

jekyll_version = 3.8

.PHONY: build
build: buildCV
> podman run --rm --volume=".:/srv/jekyll" -it docker.io/jekyll/jekyll:$(jekyll_version) jekyll build

.PHONY: buildCV
buildCV:
> pushd vita; latexrun --bibtex-cmd biber vita ; popd

.PHONY: serve
serve:
> podman run --rm --expose 4000 --volume=".:/srv/jekyll" -it docker.io/jekyll/jekyll:$(jekyll_version) jekyll serve
