#!/usr/bin/env bash

for w in $(echo "${1^^}" | tr -c '[:upper:]' ' '); do
  echo -n ${w:0:1}
done

echo

