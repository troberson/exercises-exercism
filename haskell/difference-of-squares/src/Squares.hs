module Squares (difference, squareOfSum, sumOfSquares) where

difference :: Integral a => a -> a
difference n = squareOfSum n - sumOfSquares n

squareOfSum :: Integral a => a -> a
squareOfSum = id `sumAnd` square

sumOfSquares :: Integral a => a -> a
sumOfSquares = square `sumAnd` id

square :: Integral a => a -> a
square x = x * x

sumAnd :: Integral a => (a -> a) -> (a -> a) -> a -> a
sumAnd f g n = g . sum $ f <$> [1..n]

