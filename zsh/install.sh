#!/bin/sh

# This script installs 'oh-my-zsh' and different plugins

if ! command -v zsh --version >/dev/null 2>&1; then
    echo "'zsh' not found. Please install it before continuing pluging installation (https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)." >&2
    exit 1
fi

if ! command -v omz --version >/dev/null 2>&1; then
    echo "'oh-my-zsh' is not installed. Installing latest version."
    ZSH=~/.oh-my-zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

if [ -z "$ZSH_CUSTOM" ]; then
    ZSH_CUSTOM="$ZSH/custom"
fi

# Powerlevel10k theme. The following line must be added to .zshrc:
# ZSH_THEME="powerlevel10k/powerlevel10k"

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

# Install plugins. They must be added to .zshrc file
git clone --depth=1 https://github.com/TamCore/autoupdate-oh-my-zsh-plugins $ZSH_CUSTOM/plugins/autoupdate
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

# This plugin must appear last in .zshrc
git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
