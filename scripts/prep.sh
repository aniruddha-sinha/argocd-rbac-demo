#!/usr/bin/env bash

set -euo pipefail

build_yamls() {
    kustomize build ./argocd-installation > ./argocd-installation/argocd-install-final.yaml 
    kustomize build ./dev > ./dev/app-dev-final.yaml
    kustomize build ./dev-platform > ./dev-platform/app-dev-platform-final.yaml
    kustomize build ./prod > ./prod/app-prod-final.yaml
    kustomize build ./argocd-users > ./argocd-users/argocd-cm-with-rbac-final.yaml
}

generate_app_manifests() {
    kustomize build ./. > ./final.yaml
}

build_yamls
generate_app_manifests
