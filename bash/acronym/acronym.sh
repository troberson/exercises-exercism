#!/usr/bin/env bash

for w in $( echo "$1" | tr 'a-z' 'A-Z' | tr -c '[:upper:]' ' '  ); do
  echo -n ${w:0:1}
done

echo

