#!/bin/bash

set -e

export APP_NAME="chat_service"
export VERSION=$(cat pom.xml | xq -r .project.version)
