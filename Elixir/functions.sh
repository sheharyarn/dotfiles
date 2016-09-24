# Elixir Functions
# ----------------

# A shortcut for elixir phoenix mix commands
exp() {
    if [[ $# -eq 0 ]] ; then
        echo "usage: exp command [args...]"
    else
        local command="mix phoenix.$@"

        echo "Executing:\n  $command\n\n"
        eval "$command"
    fi
}


# A shortcut for elixir phoenix generators
epg() {
    if [[ $# -eq 0 ]] ; then
        echo "usage: epg command [args...]"
    else
        local command="mix phoenix.gen.$@"

        echo "Executing:\n  $command\n\n"
        eval "$command"
    fi
}

