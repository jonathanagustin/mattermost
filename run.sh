#!/usr/bin/env bash

# This script sets up and installs Mattermost using Minikube and Helm, 
# and then forwards the necessary port for access.

# Starts Minikube.
minikube start

# Adds the Mattermost Helm repository.
helm repo add mattermost https://helm.mattermost.com

# Installs or upgrades Mattermost Team Edition using Helm.
helm upgrade \
    --install mattermost \
    mattermost/mattermost-team-edition \
    --namespace mattermost \
    --create-namespace \
    --set mysql.mysqlUser=sampleUser \
    --set mysql.mysqlPassword=samplePassword \
    --set ingress.enabled=true

# Set context to the Mattermost namespace.
kubectl config set-context --current --namespace=mattermost

# Forwards port 8065 to access Mattermost.
kubectl port-forward svc/mattermost-team-edition 8065:8065 --namespace mattermost
