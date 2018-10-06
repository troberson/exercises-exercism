#!/usr/bin/env bash

n="$1"

if ((n <= 0)); then
  echo "Error: Only positive numbers are allowed" 
  exit 1
fi

for ((count=0; n > 1; count++)); do
  ((n = n%2==0 ? n/2 : 3*n+1))
done

echo "$count"

