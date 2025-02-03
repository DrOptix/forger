# forger

Ansible based opinionated system forger.

This playbook installs and configures most of the software I use on my machine
mainly for software development, but also daily usage.

Because I'm setting stuff for both public and private work I'll make use of
`ansible-vault` [^1] to guard sensitive informations, but I'll document the
format so you can adapt it for yourself.

## Dependencies

- On of the supported OS: Fedora 40, Fedora 41, Ubutnu 24.04, Ubutnu 24.10 or
  Windows Subsystem for Linux. Other operatiing systems may work, but I don't
  support them, therefore don't file bugs about them.

- Ansible [^2]

## Install

1. Clone or download this repository to your machine
2. Install `ansible`

   - Fedora: `sudo dnf install ansible`
   - Ubuntu: `sudo apt install ansible`
   - Windows Subsystem for Linux: `sudo apt install ansible`

3. Define an environment variable `FORGER_SECRETS_DIR` containing the path to
   directory where the needed secrets are located:

   - `vault.txt`: The key file used to decrypt vaults

4. Run one of the playbooks

   - `./scripts/playbook-workstation`: Setup the main workstation
   - `./scripts/forger-demo-vault`: Small demo to showcase how to use vaults

## Development

I'm contributing to this project only when I find myself doing something more
than 3 times. I don't have a particular road map. Currently I'm not accepting
PRs.

--------------------------------------------------------------------------------

[^1]: https://docs.ansible.com/ansible/latest/cli/ansible-vault.html

[^2]: https://docs.ansible.com/ansible/latest/installation_guide/index.html
