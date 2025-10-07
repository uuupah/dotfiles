export "MICRO_TRUECOLOR=1"


if ! [[ "$PATH" =~ "$HOME/.cargo/bin" ]]; then
    PATH="$HOME/.cargo/bin:$PATH"
fi
