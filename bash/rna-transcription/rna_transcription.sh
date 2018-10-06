#!/usr/bin/env bash

strand="$1"

if [[ ! "$strand" =~ ^[GCTA]*$ ]]; then
  echo "Invalid nucleotide detected." 
  exit 1
fi

echo "$strand" | tr 'GCTA' 'CGAU'

