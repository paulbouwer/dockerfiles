#!/bin/bash

AZURECLI_VERSION=$(cat versions.json | jq -r ".azurecli")
KUBECTL_VERSION=$(cat versions.json | jq -r ".kubectl")
HELM_VERSION=$(cat versions.json | jq -r ".helm")
AZBROWSE_VERSION=$(cat versions.json | jq -r ".azbrowse")

docker build -t paulbouwer/azure-cli:$AZURECLI_VERSION \
  --build-arg AZURECLI_VERSION="$AZURECLI_VERSION" \
  --build-arg KUBECTL_VERSION="$KUBECTL_VERSION" \
  --build-arg HELM_VERSION="$HELM_VERSION" \
  --build-arg AZBROWSE_VERSION="$AZBROWSE_VERSION" \
  --file Dockerfile .
