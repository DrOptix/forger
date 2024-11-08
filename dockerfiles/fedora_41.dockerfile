FROM fedora:41

RUN dnf upgrade -y \
    && dnf install -y \
        util-linux \
        ansible \
    && dnf clean all \
    && rm -rf /var/cache/dnf 

# Create `test` user, don't care about password
RUN groupadd --gid 1000 test \
    && adduser --uid 1000 --gid 1000 --create-home test \
    && echo "test ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER test

WORKDIR /home/test
COPY --chown=test:test . ./.forger

# Pass the command to be executed as an argument
CMD ["/usr/bin/bash", "-c", "ANSIBLE_CONFIG=/home/test/.forger/ansible.cfg ansible-playbook --vault-pass-file ./.forger_secrets/vault.txt ./.forger/playbooks/localhost.yml"]
