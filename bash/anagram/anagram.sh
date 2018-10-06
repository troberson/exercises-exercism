#!/usr/bin/env bash

word="$1"
choices="$2"

for choice in $choices; do
  # if the word and the choice aren't the same length, it can't be an anagram
  if (( ${#choice} != ${#word} )); then
    continue
  fi

  # lower-case versions for easy pattern-matching
  word2="${word,,}"
  choice2="${choice,,}"

  # a word can't be its own anagram
  if [[ "$word2" == "$choice2" ]]; then
    continue
  fi

  # remove all the letters found in the choice from the word
  for ((i=0;i<${#choice2};i++)); do
    c=${choice2:i:1}
    word2=${word2/$c/}
  done

  # if all letters were removed, it must be a match
  [[ -z "$word2" ]] && result+="$choice "
done

# print the results
echo $result
