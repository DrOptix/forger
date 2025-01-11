# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog], and this project adheres to [SemVer].

## [unreleased]

- tasks: `typewriter` task for installing and configuring `typewriter` neovim
  configuration.

### Added

- playbooks: Playbook for physical machines
- playbooks: A demo playbook for ansible-vault usage

- tasks: `sys_upgrade` task with support for Fedora

- scripts: Script to apply `workstation` playbook
- scripts: Make use of `$FORGER_SECRETS_DIR/vault.txt` as vault pass file

- test: Add test environment for Fedora 40
- test: Bind mount out of source secrets directory

[unreleased]: https://github.com/DrOptix/forger/tree/HEAD
[Keep a Changelog]: https://keepachangelog.com/en/1.1.0/
[SemVer]: https://semver.org/spec/v2.0.0.html
