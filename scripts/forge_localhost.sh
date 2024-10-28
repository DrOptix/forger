#!/bin/bash

ansible-playbook \
    --vault-pass-file=$FORGER_SECRETS_DIR/ansible_vault.txt \
    ./.forger/playbooks/localhost.yml

fish
