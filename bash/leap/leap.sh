#!/usr/bin/env bash

# Sanity check:
# Only one argument permitted,
# which must be a valid year (natural number)
year="$1"

if [[ "$#" -ne 1 || ! "$year" =~ ^[0-9]+$ ]]; then
  echo "Usage: leap.sh <year>"
  exit 1
fi

# MAIN
is_div () {
  test $((year%$1)) -eq 0
}

if is_div 4 && ( ! is_div 100 || is_div 400 ); then
  echo "true"
else
  echo "false"
fi

