# [dotfiles](https://github.com/lobis/dotfiles)

[![Install dependencies and verify scripts](https://github.com/lobis/dotfiles/actions/workflows/verify.yml/badge.svg)](https://github.com/lobis/dotfiles/actions/workflows/verify.yml)

## Installation

### Applications

This guide assumes the following directory exists:

```bash
mkdir -p ~/.local/bin
```

#### [Neovim](https://github.com/neovim/neovim)

To install Neovim in linux, run the following command:

```bash
NEOVIM_VERSION=v0.9.5
curl -L https://github.com/neovim/neovim/releases/download/$NEOVIM_VERSION/nvim-linux64.tar.gz | tar -xz -C ~/.local && ln -s ~/.local/nvim-linux64/bin/nvim ~/.local/bin/nvim
```

#### [LSD](https://github.com/lsd-rs/lsd)

```bash
LSD_VERSION=v1.1.2
curl -L https://github.com/lsd-rs/lsd/releases/download/$LSD_VERSION/lsd-$LSD_VERSION-x86_64-unknown-linux-gnu.tar.gz | tar -xz -C ~/.local && ln -s ~/.local/lsd-$LSD_VERSION-x86_64-unknown-linux-gnu/lsd ~/.local/bin/lsd
```

#### [BAT](https://github.com/sharkdp/bat)

```bash
BAT_VERSION=v0.24.0
curl -L https://github.com/sharkdp/bat/releases/download/$BAT_VERSION/bat-$BAT_VERSION-x86_64-unknown-linux-gnu.tar.gz | tar -xz -C ~/.local && ln -s ~/.local/bat-$BAT_VERSION-x86_64-unknown-linux-gnu/bat ~/.local/bin/bat
```

#### [FD](https://github.com/sharkdp/fd)

```bash
FD_VERSION=v9.0.0
curl -L https://github.com/sharkdp/fd/releases/download/$FD_VERSION/fd-$FD_VERSION-x86_64-unknown-linux-gnu.tar.gz | tar -xz -C ~/.local && ln -s ~/.local/fd-$FD_VERSION-x86_64-unknown-linux-gnu/fd ~/.local/bin/fd
```

#### [RIPGREP](https://github.com/BurntSushi/ripgrep)

```bash
RIPGREP_VERSION=14.1.0
curl -L https://github.com/BurntSushi/ripgrep/releases/download/$RIPGREP_VERSION/ripgrep-$RIPGREP_VERSION-x86_64-unknown-linux-musl.tar.gz | tar -xz -C ~/.local && ln -s ~/.local/ripgrep-$RIPGREP_VERSION-x86_64-unknown-linux-musl/rg ~/.local/bin/rg
```

### Dotfiles

To install the dotfiles, run the following command:

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/lobis/dotfiles/main/install.sh)"
```

This will copy the dotfiles into your home using [chezmoi](https://github.com/twpayne/chezmoi).

To install JetBrains Mono nerd fonts:

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/lobis/dotfiles/main/install-fonts.sh)"
```
