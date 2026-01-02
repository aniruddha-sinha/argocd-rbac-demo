#!/usr/bin/env bash

set -euo pipefail

build_yamls() {
    kustomize build ./argocd-installation > ./argocd-installation/argocd-install.yaml 
    kustomize build ./dev > ./dev/app-dev.yaml
    kustomize build ./prod > ./prod/app-prod.yaml
    kustomize build ./argocd-users > ./argocd-users/argocd-cm-with-rbac.yaml
}

generate_app_manifests() {
    kustomize build ./. > ./final.yaml
}

build_yamls
generate_app_manifests
