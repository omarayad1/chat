#!/bin/bash

set -ex

source ./bin/_lib.sh

kubectl set image deployment/chat-broadcast-sse chat-broadcast-sse=$APP_NAME:$VERSION --record
