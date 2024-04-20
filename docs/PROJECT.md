# Projects Guide

This guide explains how to properly set up an isolated project

## Setup

- Choose a root directory. This can be git repo, but also a parent containing multiple repos
- Run `devbox init`
- Create a `.envrc` in the root directory and add all customization needed
- Add auto-entering the devbox shell by adding `eval "$(devbox generate direnv --print-envrc)"` to `.envrc`
- Add additional tools to the project with `devbox search` and `devbox add`
- Create a `.gitconfig` file and add your user details + anything else needed (e.g. auth helpers)
- Add to `~/.gitconfig.local` (important: matcher has to end with `/`)
  ```
  [includeIf "gitdir:/path/to/project/root/"]
   path = /path/to/projects/gitconfig
  ```
