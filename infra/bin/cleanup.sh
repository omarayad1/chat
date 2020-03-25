#!/bin/bash

set -ex

source ./bin/_lib.sh

echo yes | terraform destroy
