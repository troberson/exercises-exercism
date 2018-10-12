#!/usr/bin/env bash

declare -l phrase="$1"
phrase=${phrase// /}
phrase=${phrase//-/}

is_iso=true
for ((i=0;i<${#phrase};i++)); do
  letter=${phrase:$i:1}
  occurrences=${phrase//[^$letter]/}
  if (( ${#occurrences} > 1 )); then
    is_iso=false
    break
  fi
done

$is_iso && echo "true" || echo "false"

