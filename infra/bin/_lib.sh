#!/bin/bash

set -e

# K8 config, assumes 1 config available
export TF_VAR_client_certificate=$(cat $(kubectl config view -o jsonpath='{.users[0].user.client-certificate}'))
export TF_VAR_client_key=$(cat $(kubectl config view -o jsonpath='{.users[0].user.client-key}'))
export TF_VAR_cluster_ca_certificate=$(cat $(kubectl config view -o jsonpath='{.clusters[0].cluster.certificate-authority}'))
export TF_VAR_host=$(kubectl config view -o jsonpath='{.clusters[0].cluster.server}')
export TF_VAR_username=$(kubectl config view -o jsonpath='{.users[0].name}')

# ec2 instance pub/priv key
export TF_VAR_priv_key=$(realpath ./keys/id_rsa)
export TF_VAR_pub_key=$(realpath ./keys/id_rsa.pub)

# aws access
export TF_VAR_aws_region=${AWS_REGION:-"eu-central-1"}
export TF_VAR_aws_access_key_id=${AWS_ACCESS_KEY_ID:-"token"}
export TF_VAR_aws_secret_access_key=${AWS_SECRET_ACCESS_KEY:-"token"}

# ansible playbooks
# FYI: not ideal location
export TF_VAR_ansible_playbook=$(realpath ../apps/message_queue)
