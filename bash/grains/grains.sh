#!/usr/bin/env bash

NUM="$1"

calc_square () {
  n=$1
  echo "2^$((n-1))" | bc
}

calc_total () {
  t=0
  for i in {1..64}; do
    val=$(calc_square $i)
    t=$(echo $t + $val | bc)
  done
  echo $t
}

if [ "$NUM" == "total" ]; then
  calc_total
elif [ -z "$NUM" -o "$NUM" -lt 1 -o "$NUM" -gt 64 ]; then
  echo "Error: invalid input"
  exit 1
else
    calc_square $NUM
fi

