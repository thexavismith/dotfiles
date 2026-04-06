# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Topic-based dotfiles repository using a custom npm-based build system. Originally forked from Holman's dotfiles. Files are organized into topic directories, each containing shell configurations, symlinks, and install scripts that get auto-loaded or linked.

## Common Commands

```bash
# Initial setup (clones, symlinks, installs Homebrew packages)
npm run install:dotfiles

# Periodic maintenance (updates macOS defaults, upgrades Homebrew, runs install scripts)
bin/dot

# Install all Homebrew packages from Brewfile
brew bundle --file homebrew/Brewfile.symlink

# Run macOS defaults
./macos/set-defaults.sh
```

## Architecture

### File-Type Conventions

The zsh bootstrap (`zsh/zshrc.symlink`) dynamically sources all `.zsh` files across all topic directories in a specific order:
1. `path.zsh` files — loaded first, add to `$PATH`
2. All other `.zsh` files — general configuration, aliases, functions
3. `completion.zsh` files — loaded last, configure autocomplete

`*.symlink` files are linked to `$HOME` by `script/bootstrap`, stripping the `.symlink` extension (e.g. `git/gitconfig.symlink` → `~/.gitconfig`).

`install.sh` files within any topic directory are discovered and executed by `script/install`.

### Adding a New Tool/Topic

1. Create a new directory for the topic (e.g. `mytool/`)
2. Add `mytool/path.zsh` if it needs PATH modifications
3. Add `mytool/aliases.zsh`, `mytool/config.zsh`, etc. for shell config — these are auto-sourced
4. Add `mytool/something.symlink` for files that should live at `~/something`
5. Add `mytool/install.sh` for one-time setup steps

### Key Topic Directories

- **`zsh/`** — Core shell config: prompt, history, completion, aliases, keybindings
- **`git/`** — Git config (GPG signing enabled, trunk as default branch) and aliases
- **`homebrew/`** — Brewfile (apps + VS Code extensions), install script
- **`macos/`** — `defaults write` settings for Finder, Dock, screenshots, etc.
- **`system/`** — PATH, editor, GPG TTY, terminal `z` integration
- **`fnm/`** — Fast Node Manager init with recursive `.nvmrc` detection
- **`bin/`** — Scripts added to `$PATH` (e.g. `dot` maintenance script)

### Commit Conventions

Uses Angular conventional commits enforced by commitlint + Husky. Semantic-release auto-generates versions and changelogs:
- `feat:` → minor release
- `fix:` → patch release
- `docs:`, `refactor:` → patch release

### Local Git Config

Git user name/email are not stored in `git/gitconfig.symlink`. They live in `~/.gitconfig.local`, sourced via the `[include]` directive. Use `git/gitconfig.local.symlink.example` as a template.
