#!/usr/bin/env bash

print_spaces () {
  for ((i=0;i<$1;i++)); do
    echo -n " "
  done
}

print_line () {
  local -ri l_val="$1"
  local -r  l=${alpha:$l_val:1} 
  local -r  sp_side=$(print_spaces $letter_val-$l_val)
  echo -n "$sp_side$l"
  (( l_val > 0 )) && echo -n "$(print_spaces 2*$l_val-1)$l"
  echo "$sp_side"
}

declare -ru letter="$1"

if ! [[ $letter =~ ^[[:alpha:]]$ ]]; then
  echo "Invalid Letter: $letter"
  exit 1
fi

# MAIN
#declare -r  alpha=$(for c in {A..Z}; do echo -n $c; done)
declare -r  alpha="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
declare -r  letter_val_tmp=${alpha%%$letter*}
declare -ri letter_val=${#letter_val_tmp}

# Ascending
for ((i=0;i<=$letter_val;i++)); do
  print_line $i
done

# Descending
for ((i=$letter_val-1;i>=0;i--)); do
  print_line $i
done

