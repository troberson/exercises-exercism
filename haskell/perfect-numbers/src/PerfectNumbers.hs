module PerfectNumbers (classify, Classification(..)) where

data Classification = Deficient | Perfect | Abundant deriving (Eq, Show)

classify :: Int -> Maybe Classification
classify x
  | x <= 0 = Nothing
  | otherwise =
    case compare (aliquot x) x of
      LT -> Just Deficient
      EQ -> Just Perfect
      GT -> Just Abundant
  where
    factors x = filter ((0 ==) . mod x) [1..x `div` 2]
    aliquot = sum . factors

