#!/bin/bash

HOST_PORT=3000
JEKYLL_VERSION=3.8
IMAGE=tommoyer/www

build () {
  docker run --rm \
             --volume="$PWD:/srv/jekyll" \
             -it jekyll/jekyll:$JEKYLL_VERSION \
             jekyll build

  docker build -t $IMAGE .
}

preview () {
  build
  echo "Navigate to http://localhost:${HOST_PORT} in your browser to view"
  echo "Press <CTRL+C> in this window when done to kill the running server"
  docker run -p ${HOST_PORT}:80 --rm -it --name www $IMAGE:latest
}

push () {
  docker push $IMAGE
}

usage () {
  echo "$0 [usage|build|preview|preview]"
  echo "  usage   -- Print this help message"
  echo "  build   -- Builds the site"
  echo "  preview -- Builds the site and runs the resulting container"
  echo "  push    -- Builds the site and then pushes the resulting container to Docker Hub"
}

if [ -z $1 ]
then
  usage
  exit -1
else
  if declare -f "$1" > /dev/null
  then
    # call arguments verbatim
    "$@"
  else
    # Show a helpful error
    echo "'$1' is not a known function name" >&2
    exit 1
  fi
fi
