#!/bin/bash

set -e

export APP_NAME="chat_broadcast_sse"
export VERSION=$(cat pom.xml | xq -r .project.version)
