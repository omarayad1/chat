#!/bin/bash

set -ex

source ./bin/_lib.sh

docker build -t $APP_NAME:$VERSION .
