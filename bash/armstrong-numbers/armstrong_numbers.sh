#!/usr/bin/env bash

n="$1"

digits=${#n}
for ((i=0;i<$digits;i++)); do
  ((total+=${n:i:1}**digits))
done

if [[ "$n" -eq "$total" ]]; then
  echo "true"
else
  echo "false"
fi

