#!/bin/bash

# Vim Functions
# ============

v() {
  if hash mvim 2>/dev/null; then
    mvim "$@"
  else
    gvim "$@"
  fi
}
