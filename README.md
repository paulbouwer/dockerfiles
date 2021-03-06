# Dockerfiles

This is a collection of custom dockerfiles I use in my workflows.

## Azure CLI

paulbouwer/azure-cli

[![image version](https://img.shields.io/docker/v/paulbouwer/azure-cli?sort=semver)](https://hub.docker.com/repository/docker/paulbouwer/azure-cli)
[![image size](https://img.shields.io/docker/image-size/paulbouwer/azure-cli?sort=semver)](https://hub.docker.com/repository/docker/paulbouwer/azure-cli)

A custom image built from the `mcr.microsoft.com/azure-cli` base image and bundling the current `kubectl`, `helm`, and `azbrowse` binaries.  It includes a custom prompt and tab completion for all cli binaries.

## Kubernetes CLI

paulbouwer/k8s-cli

[![image version](https://img.shields.io/docker/v/paulbouwer/k8s-cli?sort=semver)](https://hub.docker.com/repository/docker/paulbouwer/k8s-cli)
[![image size](https://img.shields.io/docker/image-size/paulbouwer/k8s-cli?sort=semver)](https://hub.docker.com/repository/docker/paulbouwer/k8s-cli)

A custom image built from the `ubuntu` base image and bundling the current `kubectl`, `helm`, and `kubie` binaries.  It includes a custom prompt and tab completion for all cli binaries.
