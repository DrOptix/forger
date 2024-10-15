#!/bin/bash

# Run the Ansible playbook with the vault password file
ANSIBLE_CONFIG=/home/test/.forger/ansible.cfg \
ansible-playbook \
    --vault-pass-file /etc/forger/secrets/ansible_vault.txt \
    /home/test/.forger/playbooks/localhost.yml

# Start Fish shell
exec fish
