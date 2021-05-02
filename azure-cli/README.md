# Azure CLI

paulbouwer/azure-cli 

[![image version](https://img.shields.io/docker/v/paulbouwer/azure-cli?sort=semver)](https://hub.docker.com/repository/docker/paulbouwer/azure-cli)
[![image size](https://img.shields.io/docker/image-size/paulbouwer/azure-cli?sort=semver)](https://hub.docker.com/repository/docker/paulbouwer/azure-cli)

## Description

This is a custom image built from the `mcr.microsoft.com/azure-cli` base image and bundling the current `kubectl`, `helm`, and `azbrowse` binaries.  It includes a custom prompt and tab completion for all cli binaries.

It is automatically built whenever there is a new release of the `mcr.microsoft.com/azure-cli` image. The latest versions of the `kubectl`, `helm`, and `azbrowse` binaries at the time are bundled.

The tag of the `paulbouwer/azure-cli` image matches the tag of the `mcr.microsoft.com/azure-cli` image on which it is based.

## GitHub Actions

| Workflow | Status |
|-|-|
| [azure-cli] Update docker image with latest azure-cli version | ![workflow](https://img.shields.io/github/workflow/status/paulbouwer/dockerfiles/%5Bazure-cli%5D%20Update%20docker%20image%20with%20latest%20azure-cli%20version) |
| | |