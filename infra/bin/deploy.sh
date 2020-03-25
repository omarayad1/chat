#!/bin/bash

set -ex

source ./bin/_lib.sh

terraform init
echo yes | terraform apply
