#!/usr/bin/env bash

[[ -z "$REPOSITORY" ]] && REPOSITORY="grafana-plugins"
[[ -z "$REGISTRY" ]] && REGISTRY="aiwin"
[[ -z "$TAG" ]] && TAG="latest"

GF_INSTALL_PLUGINS="grafana-clock-panel,grafana-simple-json-datasource"
GRAFANA_VERSION="latest"

# Build docker image
docker build --build-arg "GRAFANA_VERSION=$GRAFANA_VERSION" --build-arg "GF_INSTALL_PLUGINS=$GF_INSTALL_PLUGINS" -t $REGISTRY/$REPOSITORY:$TAG .

# Push image to registry
docker push $REGISTRY/$REPOSITORY:$TAG
