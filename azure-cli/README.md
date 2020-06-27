# Azure CLI

paulbouwer/azure-cli 

![image version](https://img.shields.io/docker/v/paulbouwer/azure-cli?sort=semver)
![image size](https://img.shields.io/docker/image-size/paulbouwer/azure-cli?sort=semver)

## Description

This is a custom image built from the `mcr.microsoft.com/azure-cli` image and bundling the current `kubectl` and `helm 3.x` binaries.

It is automatically built whenever there is a new release of the `mcr.microsoft.com/azure-cli` image. The latest versions of the `kubectl` and `helm 3.x` binaries at the time are bundled.

The tag of the `paulbouwer/azure-cli` image matches the tag of the `mcr.microsoft.com/azure-cli` image on which it is based.

## GitHub Actions

| Workflow | Status |
|-|-|
| Fetch latest azure-cli version | ![workflow](https://img.shields.io/github/workflow/status/paulbouwer/dockerfiles/Fetch%20latest%20azure-cli%20version) |
| Build and publish azure-cli image | ![workflow](https://img.shields.io/github/workflow/status/paulbouwer/dockerfiles/Build%20and%20publish%20azure-cli%20image) |
| | |