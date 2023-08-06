#!/bin/bash


# PsyNAS Helpers
# --------------

# Create tunnel for Jellyfin.
#
# This will expose Jellyfin on http://mbp:8096/ (use IP for
# external devices). Tailscale must be connected for this.
#
# https://unix.stackexchange.com/questions/57721/
alias jellyfin-tunnel='ssh -L 8096:localhost:8096 -N -o GatewayPorts=yes root@10.10.2.10'
