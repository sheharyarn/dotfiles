#!/bin/bash

# Vim Functions
# ============

v() {
  # If MacVim exists
  if hash mvim 2>/dev/null; then
    mvim "$@" > /dev/null 2>&1  # disable all exceptions
  else
    gvim "$@"
  fi
}
