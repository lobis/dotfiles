#!/bin/sh
set -e

# If zsh is available set it as the default shell
# We use `command -v` instead of which since its more readily available in my experience
if command -v zsh --version >/dev/null 2>&1; then
    echo "Setting zsh as default shell..."
    # it could fail if the user is not in /etc/passwd
    chsh -s $(command -v zsh) || true
fi

# This installs 'oh-my-zsh' and different plugins
ZSH=$HOME/.oh-my-zsh
rm -rf $ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

ZSH_CUSTOM=$ZSH/custom

# Powerlevel10k theme. The following line must be added to .zshrc: 'ZSH_THEME="powerlevel10k/powerlevel10k"''
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

# Install plugins. They must be added to .zshrc file
git clone --depth=1 https://github.com/TamCore/autoupdate-oh-my-zsh-plugins $ZSH_CUSTOM/plugins/autoupdate
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

git clone --depth 1 https://github.com/junegunn/fzf.git $ZSH_CUSTOM/plugins/fzf
yes | $ZSH_CUSTOM/plugins/fzf/install

# This plugin must appear last in .zshrc
git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

# Inspired by 'https://github.com/twpayne/dotfiles'
CHEZMOI=chezmoi
if ! command -v $CHEZMOI --version >/dev/null 2>&1; then
    echo "'chezmoi' not found in system."
    BINARY_DIRECTORY_LOCAL="$HOME/.local/bin"
    CHEZMOI="$BINARY_DIRECTORY_LOCAL/chezmoi"
    if ! command -v $CHEZMOI --version >/dev/null 2>&1; then
        echo "'chezmoi' not in local binary directory. Installing latest version."
        if [ "$(command -v curl)" ]; then
            sh -c "$(curl -fsSL https://git.io/chezmoi)" -- -b "$BINARY_DIRECTORY_LOCAL"
            elif [ "$(command -v wget)" ]; then
            sh -c "$(wget -qO- https://git.io/chezmoi)" -- -b "$BINARY_DIRECTORY_LOCAL"
        else
            echo "To install chezmoi, you must have curl or wget installed." >&2
            exit 1
        fi
    else
        echo "'chezmoi' found in local binary directory ($CHEZMOI)."
    fi
fi
$CHEZMOI --version
# Install dotfiles
$CHEZMOI init --apply https://github.com/lobis/dotfiles.git

# tmux plugin manager
TMUX_PLUGIN_MANAGER=$HOME/.tmux/plugins/tpm
rm -rf $TMUX_PLUGIN_MANAGER
git clone --depth=1 https://github.com/tmux-plugins/tpm $TMUX_PLUGIN_MANAGER
tmux -V # if we don't add this it will fail the CI workflow
sh -c $HOME/.tmux/plugins/tpm/bin/install_plugins

# If zsh is available reload the configuration
if command -v zsh --version >/dev/null 2>&1; then
    exec zsh
fi
