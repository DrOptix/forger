FROM fedora:41

RUN dnf --assumeyes upgrade \
    && dnf --assumeyes install \
        systemd \
        util-linux \
        ansible \
    && dnf clean all \
    && rm -rf /var/cache/dnf 

RUN useradd --create-home test \
    && echo 'test ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

RUN mkdir -p /run/user/$(id -u test)
RUN chown test:test /run/user/$(id -u test)
RUN chmod 700 /run/user/$(id -u test)

COPY ./dockerfiles/entrypoint.sh /usr/local/bin/entrypoint.sh

RUN systemctl mask systemd-firstboot.service systemd-udevd.service systemd-modules-load.service
RUN systemctl unmask systemd-logind

# Copy forger into the container
COPY --chown=test:test . /home/test/.forger

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]


