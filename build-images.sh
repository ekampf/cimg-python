#!/usr/bin/env bash
# Do not edit by hand; please use build scripts/templates to make changes
set -eo pipefail

docker context create cimg
docker buildx create --use cimg
docker buildx build --platform=linux/amd64,linux/arm64 --file 3.12/Dockerfile -t cimg/python:3.12.1 -t cimg/python:3.12 --push .
docker buildx build --platform=linux/amd64,linux/arm64 --file 3.12/node/Dockerfile -t cimg/python:3.12.1-node -t cimg/python:3.12-node --push .
docker buildx build --platform=linux/amd64 --file 3.12/browsers/Dockerfile -t cimg/python:3.12.1-browsers -t cimg/python:3.12-browsers --push .
