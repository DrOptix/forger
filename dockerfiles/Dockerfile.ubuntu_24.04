# Use the Ubuntu 24.04 base image
FROM ubuntu:24.04

# Upgrade the system and install sudo and ansible
RUN apt-get update \
    && apt-get --yes upgrade \
    && apt-get --yes --no-install-recommends install \
        systemd systemd-sysv dbus dbus-user-session \
        sudo \
        ansible \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN useradd --create-home test \
    && echo 'test ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

COPY ./dockerfiles/entrypoint.sh /usr/local/bin/entrypoint.sh

RUN systemctl mask systemd-firstboot.service systemd-udevd.service systemd-modules-load.service
RUN systemctl unmask systemd-logind

# Copy forger into the container
COPY --chown=test:test . /home/test/.forger

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
