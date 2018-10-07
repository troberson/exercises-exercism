#!/usr/bin/env bash

words="$1"
words=${words//,/ }
words=${words//'\n'/ }

# clean_word()
# strip the given word of extra symbols
# TODO: combine these regexes into one.
clean_word () {
  w="$1"
  [[ $w =~ ^[[:alnum:]\']+        ]] && w=${BASH_REMATCH[0]}
  [[ $w =~ ^\'([[:alnum:]\']+)\'$ ]] && w=${BASH_REMATCH[1]}
  echo "$w"
}

seen=","
for w in $words; do
  declare -l w=$(clean_word $w)

  [[ $seen =~ ,$w, ]] && continue
  seen+="$w,"

  count=0
  for w2 in $words; do
    declare -l w2=$(clean_word $w2)
    [[ $w == $w2 ]] && ((count++))
  done
  echo "$w: $count"
done

