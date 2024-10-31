FROM ubuntu:24.04

# Upgrade the system and install sudo and ansible
RUN apt-get update \
    && apt-get --yes upgrade \
    && apt-get --yes --no-install-recommends install \
        sudo \
        ansible \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Create `test` user with no password sudo access
RUN useradd --create-home test \
    && echo 'test ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

COPY --chown=test:test . /home/test/.forger

USER test
