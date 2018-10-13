module SumOfMultiples (sumOfMultiples) where

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit = sum $ filter isMult [1..limit-1]
  where
    isMult n = any ((0 ==) . mod n) factors
