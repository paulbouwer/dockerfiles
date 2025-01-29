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

A custom image built from the `ubuntu:24.04` base image and bundling the current `kubectl` and `helm` binaries. 

`Nushell` is provided as the terminal shell, and a custom prompt is provided via `oh-my-posh`. Shell completion is provided for all cli binaries via `carapace`. 

A custom kubernetes context switcher is provided. It is built using a combination of Nushell custom commands and `gum` - it supports multiple clusters and shell instances.
