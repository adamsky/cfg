alias cfg='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias vim nvim
alias hx helix

alias l='ls'
alias ll='ls -lah'

export FrameworkPathOverride=/lib/mono/4.7.1-api/

export RUSTC_WRAPPER=sccache

set PATH $HOME/.cargo/bin $PATH

set -gx WASMTIME_HOME "$HOME/.wasmtime"

string match -r ".wasmtime" "$PATH" > /dev/null; or set -gx PATH "$WASMTIME_HOME/bin" $PATH

alias bw='cargo run --release --manifest-path $HOME/projects/bigworlds/bigworlds-cli/Cargo.toml'
alias bwd='cargo run --manifest-path $HOME/projects/bigworlds/bigworlds-cli/Cargo.toml'
