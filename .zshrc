# For additional information see for example https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/templates/zshrc.zsh-template

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# Install my zsh dependencies (oh-my-zsh and plugins)
if [ ! -d "$ZSH" ]; then
    echo "'oh-my-zsh' not found, installing..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/lobis/dotfiles/main/zsh/install.sh)"
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Download fonts if missing
JETBRAINS_FONTS_DIR="~/.local/share/fonts/JetBrains"
if [ ! -d "$JETBRAINS_FONTS_DIR" ]; then
    echo "Downloading JetBrains Mono font to '$JETBRAINS_FONTS_DIR'..."
    # mkdir -p $JETBRAINS_FONTS_DIR
    mkdir -p /github/home/.local/share/fonts/JetBrains
    curl -f --output "$JETBRAINS_FONTS_DIR/JetBrains-Mono-Regular-Nerd-Font-Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/JetBrainsMono/Ligatures/Regular/complete/JetBrains%20Mono%20Regular%20Nerd%20Font%20Complete.ttf
    # Update fonts cache
    if command -v fc-cache --version >/dev/null 2>&1; then
        echo "Updating fonts cache..."
        fc-cache -f
    fi
fi

# Custom theme that must be installed
ZSH_THEME="powerlevel10k/powerlevel10k"

# Update every day without asking
zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 1

# Plugings must be installed
plugins=(
    git
    autoupdate
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
