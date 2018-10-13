module Grains (square, total) where

powerOfTwo :: Integer -> Integer
powerOfTwo = (2 ^)

square :: Integer -> Maybe Integer
square n
  | n < 1 || n > 64 = Nothing
  | otherwise = Just $ powerOfTwo (n - 1)

total :: Integer
total = powerOfTwo 64 - 1

