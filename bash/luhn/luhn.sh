#!/usr/bin/env bash

num=${1// /}

if [[ ! $num =~ ^[0-9]{2,}$ ]]; then
  echo "false"
  exit 0
fi

for ((i=1;i<=${#num};i++)); do
  d=${num: -$i:1}
  if ((i%2==0)); then
    ((d*=2))
    ((d>9)) && ((d-=9))
  fi
  ((total+=d))
done

(($total%10==0)) && echo "true" || echo "false"

