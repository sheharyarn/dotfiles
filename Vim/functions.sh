#!/bin/bash

# Vim Functions
# ============

v() {
  if hash nvim 2>/dev/null; then
    nvim "$@"
  elif hash mvim 2>/dev/null; then
    mvim "$@" > /dev/null 2>&1  # disable all exceptions
  elif hash gvim 2>/dev/null; then
    gvim "$@"
  else
    vim "$@"
  fi
}
