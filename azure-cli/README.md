# Azure CLI

paulbouwer/azure-cli

[![image version](https://img.shields.io/docker/v/paulbouwer/azure-cli?sort=semver)](https://hub.docker.com/repository/docker/paulbouwer/azure-cli)
[![image size](https://img.shields.io/docker/image-size/paulbouwer/azure-cli?sort=semver)](https://hub.docker.com/repository/docker/paulbouwer/azure-cli)

## Description

This is a custom image built from the `mcr.microsoft.com/azure-cli` base image and bundling the current `kubectl`, `helm`, and `azbrowse` binaries.  It includes a custom prompt and tab completion for all cli binaries.

It is automatically built whenever there is a new release of the `mcr.microsoft.com/azure-cli` image. The latest versions of the `kubectl`, `helm`, and `azbrowse` binaries at the time are bundled.

The tag of the `paulbouwer/azure-cli` image matches the tag of the `mcr.microsoft.com/azure-cli` image on which it is based.

## Build

| GitHub Action | Status |
|-|-|
| [azure-cli] Update docker image with latest azure-cli version | [![workflow](https://img.shields.io/github/workflow/status/paulbouwer/dockerfiles/%5Bazure-cli%5D%20Update%20docker%20image%20with%20latest%20azure-cli%20version)](https://github.com/paulbouwer/dockerfiles/actions/workflows/azure-cli-update-docker-image.yaml) |
| | |

## Included

| Component | License |
|-|-|
| [azure-cli](https://github.com/Azure/azure-cli) | [MIT License](https://github.com/Azure/azure-cli/blob/dev/LICENSE) |
| [kubectl](https://github.com/kubernetes/kubernetes) | [Apache License 2.0](https://github.com/kubernetes/kubectl/blob/master/LICENSE) |
| [helm](https://github.com/helm/helm) | [Apache License 2.0](https://github.com/helm/helm/blob/main/LICENSE) |
| [azbrowse](https://github.com/lawrencegripper/azbrowse) | [MIT License](https://github.com/lawrencegripper/azbrowse/blob/main/LICENSE) |
