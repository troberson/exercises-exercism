#!/usr/bin/env bash

# NOTE: Bash uses 64-bit signed integers.
# So we have to utilize 'bc' instead.

NUM="$1"

calc_square () {
  echo "2^(($1-1))" | bc
}

calc_total () {
  echo "2^64-1" | bc
}


if [[ "$NUM" == "total" ]]; then
  calc_total
elif
  [[ -z "$NUM" ]] ||
  [[ "$NUM" -lt 1 ]] ||
  [[ "$NUM" -gt 64 ]]; then
    echo "Error: invalid input"
    exit 1
else
    calc_square $NUM
fi

