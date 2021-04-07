eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

export PATH="$HOME/.cargo/bin:$PATH"

# pyenv
export PATH="/home/jim/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
    fi
fi

eval "$(rbenv init -)"
