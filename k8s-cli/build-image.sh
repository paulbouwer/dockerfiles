#!/bin/bash

KUBECTL_VERSION=$(cat versions.json | jq -r ".kubectl")
HELM_VERSION=$(cat versions.json | jq -r ".helm")
NUSHELL_VERSION=$(cat versions.json | jq -r ".nushell")
CARAPACE_VERSION=$(cat versions.json | jq -r ".carapace")
GUM_VERSION=$(cat versions.json | jq -r ".gum")

docker build -t paulbouwer/k8s-cli:$KUBECTL_VERSION \
  --build-arg KUBECTL_VERSION="$KUBECTL_VERSION" \
  --build-arg HELM_VERSION="$HELM_VERSION" \
  --build-arg NUSHELL_VERSION="$NUSHELL_VERSION" \
  --build-arg CARAPACE_VERSION="$CARAPACE_VERSION" \
  --build-arg GUM_VERSION="$GUM_VERSION" \
  --file Dockerfile .
