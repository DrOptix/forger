FROM ubuntu:24.10

# Upgrade the system and install sudo and ansible
RUN apt-get update \
    && apt-get --yes upgrade \
    && apt-get --yes --no-install-recommends install \
        sudo \
        ansible \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Create `test` user, don't care about password
RUN groupadd --gid 1001 test \
    && adduser --uid 1001 --gid 1001 test \
    && echo "test ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER test

WORKDIR /home/test
COPY --chown=test:test . ./.forger

# Pass the command to be executed as an argument
CMD ["/usr/bin/bash", "-c", "ANSIBLE_CONFIG=/home/test/.forger/ansible.cfg ansible-playbook --vault-pass-file ./.forger_secrets/vault.txt ./.forger/playbooks/localhost.yml"]
