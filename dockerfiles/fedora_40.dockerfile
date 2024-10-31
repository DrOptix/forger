FROM fedora:40

RUN dnf --assumeyes upgrade \
    && dnf --assumeyes install \
        util-linux \
        ansible \
    && dnf clean all \
    && rm -rf /var/cache/dnf 

# Create `test` user with no password sudo access
RUN useradd --create-home test \
    && echo 'test ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

COPY --chown=test:test . /home/test/.forger

USER test
