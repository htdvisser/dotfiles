#!/usr/bin/env sh

dotpath=$(dirname $(readlink -f "$0"))
. "$dotpath/../util.sh"

if [ -e "$dotpath/completion.zsh" ]; then
  success "docker completion already installed"
else
  info "downloading docker completion"
  curl -sSL https://raw.githubusercontent.com/docker/cli/master/contrib/completion/zsh/_docker -o "$dotpath/completion.zsh"
fi

pull_image() {
  info "pulling $1"
  docker pull "$1"
}

if command_exists docker; then
  if docker info > /dev/null 2>&1; then
    pull_image "alpine"
    pull_image "alpine:3.11"
    pull_image "alpine:3.10"
    pull_image "alpine:3.9"
    pull_image "alpine:3.8"
    pull_image "amazonlinux:2"
    pull_image "debian"
    pull_image "debian:10"
    pull_image "debian:9"
    pull_image "debian:8"
    pull_image "golang"
    pull_image "golang:1.14"
    pull_image "golang:1.13"
    pull_image "node"
    pull_image "node:14"
    pull_image "node:12"
    pull_image "node:10"
    pull_image "mongo"
    pull_image "mongo:4"
    pull_image "mongo:3"
    pull_image "nginx:mainline"
    pull_image "nginx:stable"
    pull_image "postgres"
    pull_image "postgres:12"
    pull_image "postgres:11"
    pull_image "postgres:10"
    pull_image "redis"
    pull_image "redis:6"
    pull_image "redis:5"
    pull_image "redis:4"
    pull_image "redis:3"
    pull_image "ubuntu"
    pull_image "ubuntu:20.04"
    pull_image "ubuntu:18.04"
    pull_image "ubuntu:16.04"
    pull_image "cockroachdb/cockroach"
  else
    info "docker not active. Skip pulling images"
  fi
else
  info "docker command not found. Skip pulling images"
fi
