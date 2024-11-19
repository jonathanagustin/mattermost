#!/usr/bin/env bash

minikube start

helm repo add mattermost https://helm.mattermost.com

helm upgrade \
    --install mattermost \
    mattermost/mattermost-team-edition \
    --namespace mattermost \
    --create-namespace \
    --set mysql.mysqlUser=sampleUser \
    --set mysql.mysqlPassword=samplePassword \
    --set ingress.enabled=true
