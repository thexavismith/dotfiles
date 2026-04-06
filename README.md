# Xavi’s Dotfiles

These are my dotfiles.

On a mission to version control everything I possibly can. Not only does this make tinkering easier (I can always revert), it makes setting up a new machine a cinch! You're welcome future Tim!

<!-- @import "[TOC]" {cmd="toc" depthFrom=1 depthTo=6 orderedList=false} -->

<!-- code_chunk_output -->

- [Xavi’s Dotfiles](#xavis-dotfiles)
  - [Installing](#installing)
  - [How things are organized](#how-things-are-organized)
  - [What's inside](#whats-inside)
    - [Components](#components)
  - [Reporting bugs](#reporting-bugs)
  - [Thank you ❤️](#thank-you-️)

<!-- /code_chunk_output -->

## Installing

Run this:

```sh
# Clone the repo
git clone git@github.com:thexavismith/dotfiles.git ~/.dotfiles

# Move into directory
cd ~/.dotfiles

# Install Development Dependencies
npm install

# Install dotfiles
npm run install:dotfiles

```

This will symlink the appropriate files in `.dotfiles` to your home directory. Everything is configured and tweaked within `~/.dotfiles`.

The main file you'll want to change right off the bat is `zsh/zshrc.symlink`, which sets up a few paths that'll be different on your particular machine.

`dot` is a simple script that installs some dependencies, sets sane macOS
defaults, and so on. Tweak this script, and occasionally run `dot` from
time to time to keep your environment fresh and up-to-date. You can find
this script in `bin/`.

## How things are organized

Everything's built around topic areas. If you're adding a new area to your forked dotfiles — say, "JavaScript" — you can simply add a `javascript` directory and put files in there. Anything with an extension of `.zsh` will get automatically included into your shell. Anything with an extension of `.symlink` will get symlinked without extension into `$HOME` when you run `npm run install:dotfiles`.

## What's inside

Lots of stuff. Check them out in the file browser above and see what components may mesh up with you. [Fork it](https://github.com/thexavismith/dotfiles/fork), remove what you don't use, and build on what you do use.

### Components

There's a few special files in the hierarchy.

- **bin/**: Anything in `bin/` will get added to your `$PATH` and be made
  available everywhere.
- **Brewfile**: This is a list of applications for [Homebrew Cask](https://formulae.brew.sh/cask/) to install: things like Chrome, 1Password, VS Code, and stuff. Might want to edit this file before running any initial setup.
- **topic/\*.zsh**: Any files ending in `.zsh` get loaded into your
  environment.
- **topic/path.zsh**: Any file named `path.zsh` is loaded first and is
  expected to setup `$PATH` or similar.
- **topic/completion.zsh**: Any file named `completion.zsh` is loaded
  last and is expected to setup autocomplete.
- **topic/\*.symlink**: Any files ending in `*.symlink` get symlinked into
  your `$HOME`. This is so you can keep all of those versioned in your dotfiles
  but still keep those autoloaded files in your home directory. These get
  symlinked in when you run `npm run install:dotfiles`.

## Reporting bugs

I want this to work for everyone. That said, I do use this as _my_ dotfiles, so there's a good chance I may break something if I forget to make a check for a dependency.

If you're brand-new to the project and run into any blockers, please
[open an issue](https://github.com/thexavismith/dotfiles/issues/new) on this repository and I'll try to help you out!

## Thank you ❤️

I forked [Holman's](https://github.com/holman/dotfiles) awesome dotfiles and it really helped me get started. I've customized some, but boy did he have some awesome stuff.
