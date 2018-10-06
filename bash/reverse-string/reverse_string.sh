#!/usr/bin/env bash

word="$1"
for ((i=${#word};i>=0;i--)); do
  echo -n "${word:i:1}"
done
echo
