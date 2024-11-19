#!/usr/bin/env bash

minikube start || true

helm repo add mattermost https://helm.mattermost.com || true

helm upgrade \
    --install mattermost \
    mattermost/mattermost-team-edition \
    --namespace mattermost \
    --create-namespace \
    --set mysql.mysqlUser=sampleUser \
    --set mysql.mysqlPassword=samplePassword \
    --set ingress.enabled=true
