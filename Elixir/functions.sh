# Elixir Functions
# ----------------

# A shortcut for elixir phoenix mix commands
exp() {
    if [[ $# -eq 0 ]] ; then
        echo "usage: exp command [args...]"
    else
        local command="mix phx.$@"

        echo "Executing:\n  $command\n\n"
        eval "$command"
    fi
}


# A shortcut for elixir phoenix generators
expg() {
    if [[ $# -eq 0 ]] ; then
        echo "usage: expg command [args...]"
    else
        local command="mix phx.gen.$@"

        echo "Executing:\n  $command\n\n"
        eval "$command"
    fi
}

