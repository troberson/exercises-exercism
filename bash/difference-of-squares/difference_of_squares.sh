#!/usr/bin/env bash

mode="$1"
num="$2"

square_of_sum () {
  for ((i=0;i<=$num;i++)); do
    ((total+=i))
  done
  echo $((total**2))
}

sum_of_squares () {
  for ((i=0;i<=$num;i++)); do
    ((total+=i**2))
  done
  echo $total
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

