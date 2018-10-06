#!/usr/bin/env bash

#A, E, I, O, U, L, N, R, S, T       1
#D, G                               2
#B, C, M, P                         3
#F, H, V, W, Y                      4
#K                                  5
#J, X                               8
#Q, Z                               10

echo $(( $(echo "0$1" | 
  tr 'a-z' 'A-Z' |
  sed \
  -e "s/[AEIOULNRST]/+1/g"\
  -e "s/[DG]/+2/g"\
  -e "s/[BCMP]/+3/g"\
  -e "s/[FHVWY]/+4/g"\
  -e "s/K/+5/g"\
  -e "s/[JX]/+8/g"\
  -e "s/[QZ]/+10/g" ) ))

