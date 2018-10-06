#!/usr/bin/env bash

if [[ $# -ne 2 ]]; then
  echo "Usage: hamming.sh <strand1> <strand2>"
  exit 1
fi

s1="$1"
s2="$2"

if (( ${#s1} != ${#s2} )); then
 echo "left and right strands must be of equal length" 
 exit 1
fi

count=0
for ((i=0;i<${#s1};i++)); do
  if [[ ${s1:$i:1} != ${s2:$i:1} ]]; then
    ((count++))
  fi
done
echo $count

