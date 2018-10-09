#!/usr/bin/env bash

alpha=$(for c in {a..z}; do echo -n $c; done)

encode () {
  space="$1"
  for ((i=0;i<${#phrase};i++)); do
    c=${phrase:i:1}
    pos_tmp="${alpha%%$c*}"
    if [[ $pos_tmp != $alpha ]]; then
      pos=${#pos_tmp}
      c=${alpha: -pos-1:1}
    fi
    echo -n $c
    $space && (((i+1)%5==0)) && ((i!=${#phrase}-1)) && echo -n " "
  done
  echo
}

mode="$1"
phrase="${2,,}"
phrase=${phrase// /}
phrase=${phrase//[^[:alnum:]]/}

case $mode in
  "encode") encode true ;;
  "decode") encode false ;;
  *) echo "Invalid mode. Must be 'encode' or 'decode'." && exit 1 ;;
esac

