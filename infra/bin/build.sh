#!/bin/bash

set -ex

source ./bin/_lib.sh

terraform init
terraform plan
