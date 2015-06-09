# Elixir Functions
# ----------------

# A shortcut for elixir phoenix mix commands
exp() {
    if [[ $# -eq 0 ]] ; then
        echo "usage: exp command [args...]"
    else
        local args=""
        for i in "$@"; do   
            args="$args $i"
        done
        local command="mix phoenix.${args:1}"

        echo "Executing:\n  $command\n\n"
        eval "$command"
    fi
}

