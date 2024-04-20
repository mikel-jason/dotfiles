# Personal environment setup

## How it works

- Keep all config files in this git repo and symlink them to your `$HOME`
- Install and `zsh` shell. This can be run in a fresh Unix installation
- Use [`devbox`](https://github.com/jetify-com/devbox) as vendor-agnostic package manager (uses Nix in the background)
- Keep global apps and configs as few as possible, use devbox and direnv for setups per project/directory

## Paradigms

- Deterministic: Can run scripts multiple times
- As few assumptions/restrictions as possible
  - No hard-coded paths, use `$_SETUP` to reference files in this repository
  - (Almost) no apps on host system like python runtime
- Allow local customization:
  - Customize via `.envrc` and `devbox.json`
  - Integrate some `.local` files where needed, e.g. `~/.gitconfig.local`

## Install

- Install a nerdfont
- Install git
- Clone this repository to any location including submodules
  ```shell
  git clone --recurse-submodules https://github.com/mikel-jason/personal-env-setup
  ```
- Run `./scripts/install.sh` to install mandatory
- Run `./scripts/bootstrap.sh`
- Reload your terminal
- Optional: Add a post-receive hook to auto-update on every pull

## Usage

See [Project Guide](./PROJECT.md) to read about creating local project envs.

## References

- [GitHub: holman/dotfiles](https://github.com/holman/dotfiles): Method of loading files based on the file ending
- [YouTube: DevOps Toolkit - Nix for Everyone: Unleash Devbox for Simplified Development](https://www.youtube.com/watch?v=WiFLtcBvGMU): Why devbox
- [Arch Linux Wiki: XDG Base Directory](https://wiki.archlinux.org/title/XDG_Base_Directory): Extensive list of apps with respective options to change config locations
