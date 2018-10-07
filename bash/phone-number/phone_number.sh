#!/usr/bin/env bash

# strip non-numeric characters
num=${1//[^0-9]/}

# strip optional leading 1
num=${num#1}

# catch any invalid numbers
if [[ ! "$num" =~ ^[2-9][0-9]{2}[2-9][0-9]{6}$ ]]; then
  echo "Invalid number.  [1]NXX-NXX-XXXX N=2-9, X=0-9"
  exit 1
fi

# print
echo "$num"

