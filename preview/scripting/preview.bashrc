#==============================================================================
# Esron Dark - .bashrc Preview
#==============================================================================

# Prompt
export PS1="\u@\h:\w\$ "

# History
export HISTSIZE=10000
export HISTFILESIZE=20000

# Editor
export EDITOR="nvim"

# Pager
export PAGER="less"

# Locale
export LANG="pt_BR.UTF-8"

# Aliases
alias ll='ls -lah'
alias la='ls -A'
alias gs='git status'
alias gc='git commit'
alias gp='git push'
alias grep='grep --color=auto'

# Functions
mkcd() {
    mkdir -p "$1"
    cd "$1"
}

extract() {

    if [[ -f "$1" ]]; then

        case "$1" in
            *.zip) unzip "$1" ;;
            *.tar.gz) tar -xzf "$1" ;;
            *.tar.xz) tar -xJf "$1" ;;
            *) echo "Unsupported file" ;;
        esac

    fi
}

# Environment
export PATH="$HOME/.local/bin:$PATH"

export GOPATH="$HOME/go"

export CARGO_HOME="$HOME/.cargo"

export RUSTUP_HOME="$HOME/.rustup"

# Completion
if [[ -f /etc/bash_completion ]]; then
    source /etc/bash_completion
fi