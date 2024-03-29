# Check if a program exists

program_exists() {
    command -v "$1" > /dev/null 2>&1
}

# Set aliases based on program existence

if program_exists nvim; then
    alias vim="nvim"
fi

if program_exists lsd; then
    alias ls="lsd"
    alias l="ls -l"
    alias la="ls -a"
    alias lla="ls -la"
    alias lt="ls --tree"
fi

if program_exists bat; then
    alias cat="bat"
fi

if program_exists fd; then
    alias find="fd"
fi

if program_exists rg; then
    alias grep="rg"
fi

if program_exists duf; then
    alias df="duf"
fi

