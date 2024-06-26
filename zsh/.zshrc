# For additional information see for example https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/templates/zshrc.zsh-template
# If zsh is not the default shell, you can change via `chsh -s $(which zsh)`.

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# 'oh-my-zsh' installation path
export ZSH="$HOME/.oh-my-zsh"
export XDG_CONFIG_HOME="$HOME/.config"

# Custom theme that must be installed
ZSH_THEME="powerlevel10k/powerlevel10k"

# Update every day without asking
zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 7

# Plugings must be installed
plugins=(
    git
    autoupdate
    fzf
    zsh-autosuggestions
    zsh-syntax-highlighting
)

# Load fzf
export FZF_BASE=$ZSH/custom/plugins/fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[ -f ~/.p10k.zsh ] && source ~/.p10k.zsh

# Add to PATH
# https://stackoverflow.com/questions/11530090/adding-a-new-entry-to-the-path-variable-in-zsh/18077919#18077919

# Create directory in case it does not exist
mkdir -p "$HOME/.local/bin"

path=("$HOME/.local/bin" $path)
# export to sub-processes (make it inherited by child processes)
export PATH

# export LC_ALL=C # https://unix.stackexchange.com/questions/87745/what-does-lc-all-c-do
# If not set tmux will not render icons correctly unless opened with -u flag
[ -v LANG ] || export LANG=C.UTF-8

EDITOR="vim"

if [ -f ~/.aliases.sh ]; then
    source ~/.aliases.sh
fi

program_exists() {
    command -v "$1" > /dev/null 2>&1
}

if [ -f ~/anaconda3/bin/activate ]; then
    source ~/anaconda3/bin/activate
fi

# check if zoxide is installed
if program_exists zoxide; then
    eval "$(zoxide init zsh)"
fi

