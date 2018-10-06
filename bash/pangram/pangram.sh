#!/usr/bin/env bash

word="${1^^}"

ok=true
for c in {A..Z}; do
  if [[ ! "$word" =~ "$c" ]]; then
    ok=false
    break
  fi
done

if $ok; then
  echo "true"
else
  echo "false"
fi

