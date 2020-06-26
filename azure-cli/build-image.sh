#!/bin/bash

AZURECLI_VERSION=$(cat versions.json | jq -r ".azurecli")
KUBECTL_VERSION=$(cat versions.json | jq -r ".kubectl")
HELM_VERSION=$(cat versions.json | jq -r ".helm")

docker build -t paulbouwer/azure-cli:$AZURECLI_VERSION \
  --build-arg AZURECLI_VERSION="$AZURECLI_VERSION" \
  --build-arg KUBECTL_VERSION="$KUBECTL_VERSION" \
  --build-arg HELM_VERSION="$HELM_VERSION" \
  --file Dockerfile .
