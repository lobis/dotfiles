
if command -v nvim > /dev/null 2>&1; then
    alias vim="nvim"
fi

# 'lsd' (https://github.com/Peltoche/lsd)
if command -v lsd > /dev/null 2>&1; then
    alias ls="lsd"
    alias l="ls -l"
    alias la="ls -a"
    alias lla="ls -la"
    alias lt="ls --tree"
fi

# 'bat' (https://github.com/sharkdp/bat)
if command -v bat > /dev/null 2>&1; then
    alias cat="bat"
fi

# 'ripgrep' (https://github.com/BurntSushi/ripgrep)
if command -v rg > /dev/null 2>&1; then
    alias grep="rg"
fi

