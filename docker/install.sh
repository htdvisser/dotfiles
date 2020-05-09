#!/usr/bin/env sh

dotpath=$(dirname $(readlink -f "$0"))
. "$dotpath/../util.sh"

if [ -e "$dotpath/completion.zsh" ]; then
  success "docker completion already installed"
else
  info "downloading docker completion"
  curl -sSL https://raw.githubusercontent.com/docker/cli/master/contrib/completion/zsh/_docker -o "$dotpath/completion.zsh"
fi

images=(
  alpine
  alpine:3.11
  alpine:3.10
  alpine:3.9
  alpine:3.8
  amazonlinux:2
  debian
  debian:10
  debian:9
  debian:8
  golang
  golang:1.14
  golang:1.13
  node
  node:14
  node:12
  node:10
  mongo
  mongo:4
  mongo:3
  nginx:mainline
  nginx:stable
  postgres
  postgres:12
  postgres:11
  postgres:10
  redis
  redis:6
  redis:5
  redis:4
  redis:3
  ubuntu
  ubuntu:20.04
  ubuntu:18.04
  ubuntu:16.04
  cockroachdb/cockroach
)

if command_exists docker; then
  if docker info > /dev/null 2>&1; then
    info "pulling ${#images[*]} Docker images"
    for image in ${images[*]}; do
      info "pulling $image"
      docker pull "$image"
    done
  else
    info "docker not active. Skip pulling images"
  fi
else
  info "docker command not found. Skip pulling images"
fi
