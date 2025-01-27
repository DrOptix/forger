# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog], and this project adheres to [SemVer].

## [unreleased]

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
    `bash`, `fish`, `tmux` and `eza`.

  - `typewriter`: Configure `neovim` using `typewriter` configuration.
    See: https://github.com/DrOptix/typewriter.git

- **Files**

  - `bash`: Source system wide `bashrc` and the user's `.environment` file

  - `fish`: Source user's `.environment` file.
  - `fish`: Shell greeter to display OS version, uptime and hostname
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

  - `tmux`: Enable modern terminal colors
  - `tmux`: Avoid `ESC` delay
  - `tmux`: Vim key and mouse support
  - `tmux`: Windows base index starts at 1
  - `tmux`: Renumber windows when deleting a window
  - `tmux`: Set history limit to 1000000
  - `tmux`: Use `Ctrl+a` as prefix
  - `tmux`: Reload configuration using `Ctrl+a, r`
  - `tmux`: Split pane vertically with `Ctrl+a, |`
  - `tmux`: Split pane horizontally with `Ctrl+a, -`
  - `tmux`: Resize pane with `Ctrl+a, {h, j, k, l}`

  - `tmux-se`: Simple session manager for `tmux`. Starts a new `tmux` session or
    switches to an existing `tmux` session in a directory located in one of
    those locations: `~`, `~/.config/`, `~/Documents/work/` or
    `~/Documents/github/`

[unreleased]: https://github.com/DrOptix/forger/tree/HEAD
[Keep a Changelog]: https://keepachangelog.com/en/1.1.0/
[SemVer]: https://semver.org/spec/v2.0.0.html

