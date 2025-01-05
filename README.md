# forger

Ansible based opinionated system forger

> [!IMPORTANT]
> Current branch represents a rewrite of `forger`, other two attempts of
> rewriting `forger` were made, but were abandoned. With this approach I want to
> do an incremental rewrite.

This playbook installs and configures most of the software I use on my machine
mainly for software development, but also daily usage. Because I'm setting stuff
for both public and private work I'll make use of `ansible-vault` [^1] to guard
sensitive informations, but I'll document the format so you can adapt it for
yourself.

## Dependencies

- A Linux machine
- Ansible [^2]

## Install

1. Clone or download this repository to your machine
2. Install `ansible`

   - Fedora: `sudo dnf install ansible`
   - Ubuntu: `sudo apt install ansible`
   - Windows Subsystem for Linux: `sudo apt install ansible`

3. Define an environment variable `FORGER_VAULT_KEY` containing the path to the
   key file used to encrypt and decrypt Ansible vaults

4. Run
   ```sh
   ansible-playbook ./playbooks/localhost.yml \
       --ask-become-pass \
       --vault-pass-file "$FORGER_VAULT_KEY"
   ```

## Development

I don't use GitHub issues, Trello or other fancy task tracker, instead, at least
for now I'm using the `TODO.md` file to keep track of what I'm working on at the
moment.

> [!NOTE]
> Write more instructions on how to contribute after I figure it out myself

[^1]: https://docs.ansible.com/ansible/latest/cli/ansible-vault.html

[^2]: https://docs.ansible.com/ansible/latest/installation_guide/index.html
