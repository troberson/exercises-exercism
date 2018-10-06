#!/usr/bin/env bash

n="$1"

is_div () {
  test $((n%$1)) -eq 0
}

out=

if is_div 3; then
  out="Pling"
fi

if is_div 5; then
  out="${out}Plang"
fi

if is_div 7; then
  out="${out}Plong"
fi

echo ${out:-$n}

