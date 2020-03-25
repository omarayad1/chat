#!/bin/bash

set -ex

ansible-playbook -i local/hosts.ini install.yml --check -vv | exit 0
