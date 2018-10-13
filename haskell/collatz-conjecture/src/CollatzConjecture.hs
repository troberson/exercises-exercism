module CollatzConjecture (collatz) where

import Data.List (elemIndex)

collatz :: Integer -> Maybe Integer
collatz n
  | n <= 0    = Nothing
  | otherwise = toInteger <$> 1 `elemIndex` iterate step n
  where
    step x
      | even x    = x `div` 2
      | otherwise = 3*x+1


