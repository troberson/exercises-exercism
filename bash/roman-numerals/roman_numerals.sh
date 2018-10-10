#!/usr/bin/env bash

num="$1"

unary () {
  for ((i=1;i<=$1;i++)); do echo -n "I"; done
}

num=$(unary "$num")
num=${num//IIIII/V}
num=${num//IIII/IV}
num=${num//VV/X}
num=${num//VIV/IX}
num=${num//XXXXX/L}
num=${num//XXXX/XL}
num=${num//LL/C}
num=${num//LXL/XC}
num=${num//CCCCC/D}
num=${num//CCCC/CD}
num=${num//DD/M}
num=${num//DCD/CM}

echo $num
