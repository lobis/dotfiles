# For additional information see for example https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/templates/zshrc.zsh-template

export ZSH="$HOME/.oh-my-zsh"
# Install my zsh dependencies (oh-my-zsh and plugins)
[ ! -d "$ZSH" ] && sh -c "$(curl -fsSL https://raw.githubusercontent.com/lobis/dotfiles/main/zsh/install.sh)"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.

# custom theme that must be installed
ZSH_THEME="powerlevel10k/powerlevel10k"

# update every day without asking
zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 1

# plugings must be installed
plugins=(
    git
    autoupdate
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
