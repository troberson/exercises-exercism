#!/usr/bin/env bash

is_question () {
  [[ ${q: -1} == "?" ]]
}

is_yelling () {
  [[   $q =~ [[:upper:]] ]] &&
  [[ ! $q =~ [[:lower:]] ]]
}

is_blank () {
  [[ -z "$q" ]]
}

q="${1//[[:space:]]/}"

if is_yelling && is_question; then
  echo "Calm down, I know what I'm doing!"
elif is_question; then
  echo "Sure."
elif is_yelling; then
  echo "Whoa, chill out!"
elif is_blank; then
  echo "Fine. Be that way!"
else
  echo "Whatever."
fi
