# forger

Ansible based opinionated system forger

> NOTE: Current branch represents a rewrite of `forger`, other two attempts of
> rewriting `forger` were made, but were abandoned. With this approach I want to
> do an incremental rewrite.

This playbook installs and configures most of the software I use on my machine
mainly for software development, but also daily usage. Because I'm setting stuff
for both public and private work I'll make use of [`ansible-vault`] to guard
sensitive informations, but I'll document the format so you can adapt it for
yourself.

## Dependencies

- A Linux machine
- [Ansible]

## Install

1. Clone or download this repository to your machine
2. Install `ansible`

   2.1 Fedora: `sudo dnf install ansible`
   2.2 Ubuntu: `sudo apt install ansible`
   2.3 Windows Subsystem for Linux: `sudo apt install ansible`

3. Define an environment variable `FORGER_VAULT_KEY` containing the path to the
   key file used to encrypt and decrypt Ansible vaults

4. Run
   ```sh
   ansible-playbook ./playbooks/localhost.yml \
       --ask-become-pass \
       --vault-pass-file "$FORGER_VAULT_KEY"
   ```

[Ansible]: https://docs.ansible.com/ansible/latest/installation_guide/index.html
[`Ansible Vault`]: https://docs.ansible.com/ansible/latest/cli/ansible-vault.html

## Development

I don't use GitHub issues, Trello or other fancy task tracker, instead, at least
for now I'm using the `TODO.md` file to keep track of what I'm working on at the
moment.

> TODO: Write more instructions on how to contribute after I figure it out
> myself
