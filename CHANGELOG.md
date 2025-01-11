# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog], and this project adheres to [SemVer].

## [unreleased]

### Added

- playbooks: `workstaion`, a playbook for physical machines
- playbooks: `vault_demo`, a playbook meant as a demo for `ansible-vault` usage

- tasks: `sys_upgrade` task with support for Fedora
- tasks: `typewriter` task for installing and configuring `typewriter` neovim
  configuration.

- scripts: Make use of `$FORGER_SECRETS_DIR/vault.txt` as vault pass file
- scripts: `forger-workstation`, script for applying the `workstation` playbook
- scripts: `forger-demo-vault`, script for applying the `vault_demo` playbook

- test: Add test environment for Fedora 40
- test: Bind mount all needed files for testing, individually

[unreleased]: https://github.com/DrOptix/forger/tree/HEAD
[Keep a Changelog]: https://keepachangelog.com/en/1.1.0/
[SemVer]: https://semver.org/spec/v2.0.0.html
