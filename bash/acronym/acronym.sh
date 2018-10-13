#!/usr/bin/env bash

declare -ur phrase=${1//[^[:alpha:]]/ }
for w in $phrase; do
  echo -n ${w:0:1}
done

echo

