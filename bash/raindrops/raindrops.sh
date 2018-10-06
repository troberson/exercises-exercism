#!/usr/bin/env bash

n="$1"

is_div () {
  test $((n%$1)) -eq 0
}

if is_div 3; then
  out="Pling"
fi

if is_div 5; then
  out+="Plang"
fi

if is_div 7; then
  out+="Plong"
fi

echo ${out-$n}

