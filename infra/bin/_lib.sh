#!/bin/bash

set -e

# K8 config, assumes 1 config available
export TF_VAR_client_certificate=$(cat $(kubectl config view -o jsonpath='{.users[0].user.client-certificate}'))
export TF_VAR_client_key=$(cat $(kubectl config view -o jsonpath='{.users[0].user.client-key}'))
export TF_VAR_cluster_ca_certificate=$(cat $(kubectl config view -o jsonpath='{.clusters[0].cluster.certificate-authority}'))
export TF_VAR_host=$(kubectl config view -o jsonpath='{.clusters[0].cluster.server}')
export TF_VAR_username=$(kubectl config view -o jsonpath='{.users[0].name}')
