#!/usr/bin/env bash

mode="$1"
num="$2"

id () {
  echo $1
}

square () {
  echo $(($1**2))
}

total () {
  for ((i=0;i<=$num;i++)); do
    ((total+=$($1 $i)))
  done
  echo $($2 $total)
}

square_of_sum () {
  total id square
}

sum_of_squares () {
  total square id
}

difference () {
  echo $(( $(square_of_sum) - $(sum_of_squares) ))
}

if [[ $# -ne 2 ]] || [[ ! $num =~ ^[0-9]+$ ]]; then
  echo "Usage: ./difference_of_squares.sh [mode] [number]"
  exit 1
fi

case "$mode" in
  "square_of_sum") square_of_sum ;;
  "sum_of_squares") sum_of_squares ;;
  "difference") difference ;;
  *) echo "Error: Mode must be 'square_of_sum', 'sum_of_squares', or 'difference'." ;;
esac

