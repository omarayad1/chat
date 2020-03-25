#!/bin/bash

set -ex

source ./bin/_lib.sh

kubectl set image deployment/chat-service chat-service=$APP_NAME:$VERSION --record
