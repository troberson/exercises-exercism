#!/usr/bin/env bash

declare -r isbn=${1//-/}

if ! ([[ $isbn =~ ^[0-9]{10}$ ]] || 
      [[ $isbn =~ ^[0-9]{9}X$ ]]); then
  echo "false"
  exit
fi

declare -r number=${isbn:0:9}
declare -r check_tmp=${isbn:9:1}
declare -ri check=${check_tmp//X/10}
 
declare -i total=0
for ((i=0;i<${#number};i++)); do
  total+=$(( ${number:$i:1}*(10-$i) ))
done
total+=$check

(( total % 11 == 0 )) && echo "true" || echo "false"

