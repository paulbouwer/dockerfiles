# Kubernetes CLI

paulbouwer/k8s-cli

[![image version](https://img.shields.io/docker/v/paulbouwer/k8s-cli?sort=semver)](https://hub.docker.com/repository/docker/paulbouwer/k8s-cli)
[![image size](https://img.shields.io/docker/image-size/paulbouwer/k8s-cli?sort=semver)](https://hub.docker.com/repository/docker/paulbouwer/k8s-cli)

## Description

A custom image built from the `ubuntu:24.04` base image and bundling the current `kubectl` and `helm` binaries. 

`Nushell` is provided as the terminal shell, and a custom prompt is provided via `oh-my-posh`. Shell completion is provided for all cli binaries via `carapace`. 

A custom kubernetes context switcher is provided. It is built using a combination of Nushell custom commands and `gum` - it supports use across multiple clusters and shell instances. It leverages a `kube ctx` command to switch contexts and a `kube ns` command to switch namespaces in the current context.

This custom image is automatically built whenever there is a new release of the `kubectl` cli binary. The latest versions (at the time) of the `kubectl` and `helm` binaries, and the `nushell`, `carapace`, and `gum` components are bundled.

The tag of the `paulbouwer/k8s-cli` image matches the version of the `kubectl` cli binary on which it is based.

## Build

| GitHub Action | Status |
|-|-|
| [k8s-cli] Update docker image with latest kubectl version | [![workflow](https://img.shields.io/github/actions/workflow/status/paulbouwer/dockerfiles/k8s-cli-update-docker-image.yaml?branch=main)](https://github.com/paulbouwer/dockerfiles/actions/workflows/k8s-cli-update-docker-image.yaml) |
| | |

## Included

| Component | License |
|-|-|
| [kubectl](https://github.com/kubernetes/kubernetes) | [Apache License 2.0](https://github.com/kubernetes/kubectl/blob/master/LICENSE) |
| [helm](https://github.com/helm/helm) | [Apache License 2.0](https://github.com/helm/helm/blob/main/LICENSE) |
| [nushell](https://github.com/nushell/nushell) | [MIT License](https://github.com/nushell/nushell/blob/main/LICENSE) |
| [carapace](https://github.com/carapace-sh/carapace-bin) | [MIT License](https://github.com/carapace-sh/carapace-bin/blob/master/LICENSE) |
| [gum](https://github.com/charmbracelet/gum) | [MIT License](https://github.com/charmbracelet/gum/blob/main/LICENSE) |
