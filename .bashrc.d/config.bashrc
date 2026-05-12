export "MICRO_TRUECOLOR=1"

export EDITOR=$(which micro)

if ! [[ "$PATH" =~ "$HOME/.cargo/bin" ]]; then
    PATH="$HOME/.cargo/bin:$PATH"
fi

eval "$(starship init bash)"
