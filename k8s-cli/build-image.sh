#!/bin/bash

KUBECTL_VERSION=$(cat versions.json | jq -r ".kubectl")
HELM_VERSION=$(cat versions.json | jq -r ".helm")
KUBIE_VERSION=$(cat versions.json | jq -r ".kubie")

docker build -t paulbouwer/k8s-cli:$KUBECTL_VERSION \
  --build-arg KUBECTL_VERSION="$KUBECTL_VERSION" \
  --build-arg HELM_VERSION="$HELM_VERSION" \
  --build-arg KUBIE_VERSION="$KUBIE_VERSION" \
  --file Dockerfile .
