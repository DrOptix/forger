# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog], and this project adheres to [SemVer].

## [unreleased]

## [v0.2.0] - 2025-02-11

### Fixes

- **Tasks**

  - `typewriter`: Fix Fedora vs Ubuntu/WSL `treesitter` highlighting issue

### Changes

- **Tasks**

  - `typewriter`: Update to version `v0.8.0`
  - `typewriter`: Build and install `neovim` `v0.10.4` from sources

### Removed

- **Test Containers**

  - Removed Fedora 40 test container, focus QA only on latest stable release
  - Removed Ubuntu 24.10 test container, focus QA only on Ubuntu LTS / WSL

## [v0.1.2] - 2025-02-09

### Fixed

- **Files**

  - `tmux`: Fix colors by using `tmux-256color` as terminal type

## [v0.1.1] - 2025-02-03

### Fixed

- **Tasks**

  - `typewriter`: Give admin rights when installing packages
  - `typewriter`: Always do a clean checkout of `typewriter`.
  - `typewriter`: Fix backup of old `nvim` directory

## [v0.1.0] - 2025-02-03

### Added

- **Playbooks**

  - `vault_demo` - A playbook demonstrating the usage of `ansible-vault`
  - `workstation` - A playbook intended for setting up a new host machine by
    upgrading the system, installing system packages, setting up the shell and
    `typewriter` Neovim configuration.

- **Tasks**

  - `sys_upgrade`: A collection of OS specific tasks meant for updating the
    system to the lates version. Only Fedora is supported at the moment.

  - `sys_packages`: A collection of tasks meant for installing system packages:
    `neovim`, `git`, `unzip` and `dotnet-sdk-9.0`.

  - `shell`: A collection of tasks mean to setup a basic shell environment on
    a machine. With this the following packages are installed and configured:
    `bash`, `fish`, `tmux`, `eza`, `fzf`, `procps-ng`.

  - `ssh`: Install `openssh`
  - `ssh`: Deploy personal and work SSH keys

  - `typewriter`: Configure `neovim` using `typewriter` configuration.
    See: https://github.com/DrOptix/typewriter.git

- **Files**

  - `bash`: Source system wide `bashrc` and the user's `.environment` file

  - `fish`: Source user's `.environment` file.
  - `fish`: Shell greeter to display OS version, uptime and hostname
  - `fish`: Launch `tmux-se` using `Ctrl+e` key binding
  - `fish`: Initialize `ssh-agent` when `fish` first starts.
  - `fish`: Custom prompt:

    ```
    [HH:MM] USER@HOSTNAME:PWD*BASE_NAME (GIT_PROMPT) | _
    ```

    - `[HH:MM]` is printed using the `normal` terminal color
    - `USER` is printed using the `yellow` terminal color
    - `@` is printed using the `normal` terminal color
    - `HOSTNAME` is printed using `blue` terminal color
    - `:PWD_BASE_NAME` is printed only when `$PWD != $HOME`
      - `:` is printed with the `normal` terminal color
      - `PWD_BASE_NAME` is printed with the `yellow` terminal color
    - `(GIT_PROMPT)` is printed using the `green` terminal color and is
      using the `fish` builtin function `__fish_git_prompt` to generate the
      actual text
    - `|` is printed using the `red` terminal color
    - `_` represents where the user will start typing the current command

  - `git`: Custom Git configuration
  - `git.cw`: Script to clone a repository with worktrees support

  - `tmux`: Enable modern terminal colors
  - `tmux`: Avoid `ESC` delay
  - `tmux`: Vim key and mouse support
  - `tmux`: Windows base index starts at 1
  - `tmux`: Renumber windows when deleting a window
  - `tmux`: Set history limit to 1000000
  - `tmux`: Use `Ctrl+a` as prefix
  - `tmux`: Launch `tmux-se` using `Ctrl+a, e`
  - `tmux`: Reload configuration using `Ctrl+a, r`
  - `tmux`: Split pane vertically with `Ctrl+a, |`
  - `tmux`: Split pane horizontally with `Ctrl+a, -`
  - `tmux`: Resize pane with `Ctrl+a, {h, j, k, l}`

  - `tmux-se`: Simple session manager for `tmux`. Starts a new `tmux` session or
    switches to an existing `tmux` session in a directory located in one of
    those locations: `~`, `~/.config/`, `~/Documents/work/` or
    `~/Documents/github/`

  - `ssh`: Add work and personal SSH keys for cloning and signing commits
  - `ssh`: Add custom Github aliases to differentiate between work and personal
    projects. `personal.github.com` and `work.github.com`.

- **Test Containers**

  - Fedora 40
  - Fedora 41
  - Ubuntu 24.04
  - Ubuntu 24.10

[unreleased]: https://github.com/DrOptix/forger/compare/v0.2.0...HEAD
[v0.2.0]: https://github.com/DrOptix/forger/compare/v0.1.2...v0.2.0
[v0.1.2]: https://github.com/DrOptix/forger/compare/v0.1.1...v0.1.2
[v0.1.1]: https://github.com/DrOptix/forger/compare/v0.1.0...v0.1.1
[v0.1.0]: https://github.com/DrOptix/forger/releases/tag/v0.1.0
[Keep a Changelog]: https://keepachangelog.com/en/1.1.0/
[SemVer]: https://semver.org/spec/v2.0.0.html
