#!/usr/bin/env bash

# Maths functions
min () {
  (($1 < $2)) && echo "$1" || echo "$2"
}

is_coprime () {
  local -ir x="$1"
  local -ir y="$2"
  local -ir min_xy=$(min $x $y)
  local -i result=0

  for ((i=2;i<=min_xy;i++)); do
    if ((x%i==0)) && ((y%i==0)); then
      result=1
      break
    fi
  done
  return "$result"
}

modInverse () {
  local -i i="$1"
  local -i j="$2"
  local -i j0=$j
  local -i y=0
  local -i x=1

  if (( j == 1 )); then
    echo "0"
    return
  fi

  while (( i > 1 )); do
    local -i q=i/j
    local -i t=j

    j=i%j
    i=t
    t=y

    y=x-q*y
    x=t
  done

  (( x < 0 )) && x+=j0

  echo "$x" 
}

letter_value () {
  local letter="$1"
  local tmp=${alpha%%$letter*}

  [[ "$tmp" == "$alpha" ]] && echo -1 || echo ${#tmp}
}

# Encode
# E(x) = (ax + b) mod m
#   where x is the letter's index in the alphabet (zero-indexed)
#   m is the length of the alphabet
#   a and b are the key
encode_letter () {
  local -r letter="$1"
  local -ir x=$(letter_value $letter)
  local result="$letter"

  if (( x > -1 )); then
    local -ir val2=(a*x+b)%m
    result="${alpha:$val2:1}"
  fi

  echo -n "$result"
}

encode () {
  for ((i=0;i<${#phrase};i++)); do
    ((i%5==0)) && echo -n " "
    encode_letter ${phrase:$i:1}
  done
}

# Decode
# D(y) = a^-1(y - b) mod m
# where y is the numeric value of an encrypted letter (y = E(x))
# a^-1 is the modular multiplicative inverse of a mod m
# the modular multiplicative inverse of 'a' only exists if 
#   'a' and 'm' are coprime
# To find the modular multiplicative inverse of 'a':
#   an mod m = 1
# where n is the modular multiplicative inverse of 'a mod m'
decode_letter () {
  local -r letter="$1"
  local -ir y=$(letter_value $letter)

  local result="$letter"

  if (( y > -1 )); then
    local -ir mmi=$(modInverse $a $m)
    local -ir val=$(( mmi*(y-b)%m ))
    result="${alpha:$val:1}"
  fi

  echo -n "$result"
}

decode () {
  for ((i=0;i<${#phrase};i++)); do
    echo -n $(decode_letter ${phrase:$i:1})
  done
}

### MAIN ###

#alpha=$(for c in {a..z}; do echo -n $c; done)
declare -r alpha="abcdefghijklmnopqrstuvwxyz"

declare -r mode="$1"
declare -ir a="$2"
declare -ir b="$3"
declare -l phrase="$4"
phrase="${phrase//[^[:alnum:]]/}"
phrase="${phrase// /}"
readonly $phrase

declare -ir m=${#alpha}

if ! is_coprime $a $m; then
  echo "a and m must be coprime."
  exit 1
fi

case $mode in
  encode) echo $(encode) ;;
  decode) echo $(decode) ;;
  *) echo "'mode' must be 'encode' or 'decode'." && exit 1 ;;
esac

