#!/bin/bash

set -ex

# should run molecule, a dry run is fine for now
ansible-playbook -i local/hosts.ini install.yml --become-user root --check -vv
