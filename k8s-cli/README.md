# Kubernetes CLI

paulbouwer/k8s-cli

[![image version](https://img.shields.io/docker/v/paulbouwer/k8s-cli?sort=semver)](https://hub.docker.com/repository/docker/paulbouwer/k8s-cli)
[![image size](https://img.shields.io/docker/image-size/paulbouwer/k8s-cli?sort=semver)](https://hub.docker.com/repository/docker/paulbouwer/k8s-cli)

## Description

This is a custom image built from the `ubuntu` base image and bundling the current `kubectl`, `helm`, and `kubie` binaries.  It includes a custom prompt and tab completion for all cli binaries. An example configuration for `kubie` is provided - ensure that you place the `kubie.yaml` file into your `~/.kube` folder.

It is automatically built whenever there is a new release of the `kubectl` cli binary. The latest versions of the `kubectl`, `helm`, and `kubie` binaries at the time are bundled.

The tag of the `paulbouwer/k8s-cli` image matches the version of the `kubectl` cli binary on which it is based.

## Build

| GitHub Action | Status |
|-|-|
| [k8s-cli] Update docker image with latest kubectl version | [![workflow](https://img.shields.io/github/workflow/status/paulbouwer/dockerfiles/%5Bk8s-cli%5D%20Update%20docker%20image%20with%20latest%20kubectl%20version)](https://github.com/paulbouwer/dockerfiles/actions/workflows/k8s-cli-update-docker-image.yaml) |
| | |

## Included

| Component | License |
|-|-|
| [kubectl](https://github.com/kubernetes/kubernetes) | [Apache License 2.0](https://github.com/kubernetes/kubectl/blob/master/LICENSE) |
| [helm](https://github.com/helm/helm) | [Apache License 2.0](https://github.com/helm/helm/blob/main/LICENSE) |
| [kubie](https://github.com/sbstp/kubie) | [zlib License](https://github.com/sbstp/kubie/blob/master/LICENSE) |
