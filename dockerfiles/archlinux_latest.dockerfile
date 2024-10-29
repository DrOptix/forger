FROM archlinux:latest

# Update the package database and install packages
RUN pacman -Syu --noconfirm \
    && pacman -S --noconfirm \
        sudo \
        util-linux \
        ansible \
    && pacman -Scc --noconfirm \
    && rm -rf /var/cache/pacman/pkg/* /var/cache/pacman/archives/*

# Create `test` user with no password sudo access
RUN useradd -m test \
    && echo 'test ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

COPY --chown=test:test . /home/test/.forger

USER test
