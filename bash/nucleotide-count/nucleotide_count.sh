#!/usr/bin/env bash

strand="$1"

if [[ ! $strand =~ ^[ACGT]*$ ]]; then
  echo "Invalid nucleotide in strand"
  exit 1
fi

for n in A C G T; do
  remaining=${strand//$n}
  echo "$n: $(( ${#strand} - ${#remaining} ))"
done

