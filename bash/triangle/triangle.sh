#!/usr/bin/env bash

# Triangle Inequality:
# The sum of the length of any two sides of a triangle are
# greater-than or equal-to the length of the third side.
# NOTE: Use 'bc' because Bash only does integer arithmetic.
is_triangle () {
  [[ $(echo "$a + $b >= $c" | bc ) == "1" ]] &&
  [[ $(echo "$a + $c >= $b" | bc ) == "1" ]] &&
  [[ $(echo "$b + $c >= $a" | bc ) == "1" ]]
}

# Equilateral:
# A triangle is equilateral if all sides are equal
is_eq () {
  [[ "$a" != "0" ]] &&
  [[ "$a" == "$b" ]] &&
  [[ "$a" == "$c" ]]
}

# Isosceles:
# A triangle is isosceles if at least two of the sides are equal
is_iso () {
  [[ "$a" == "$b" ]] ||
  [[ "$a" == "$c" ]] ||
  [[ "$b" == "$c" ]]
}

# Scalene:
# A triangle is scalene if none of the sides are equal
is_sca () {
  [[ "$a" != "$b" ]] &&
  [[ "$a" != "$c" ]] &&
  [[ "$b" != "$c" ]]
}

# MAIN
mode="$1"
a="$2"
b="$3"
c="$4"

if ! is_triangle; then
  echo "false"
  exit
fi

ok=false
case "$mode" in
  "equilateral") ok=is_eq  ;;
  "isosceles"  ) ok=is_iso ;;
  "scalene"    ) ok=is_sca ;;
  *)
    echo "Usage: ./triangle.sh mode a b c"
    echo -e "\tmode is 'equilateral', 'isosceles', 'scalene'"
    exit 1
    ;;
esac

# Print
if $ok; then
  echo "true"
else
  echo "false"
fi

