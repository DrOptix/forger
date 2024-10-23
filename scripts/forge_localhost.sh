#!/bin/bash

ansible-playbook \
    --vault-pass-file=/etc/forger/secrets/ansible_vault.txt \
    ./.forger/playbooks/localhost.yml

fish
