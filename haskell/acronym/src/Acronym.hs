module Acronym (abbreviate) where

import Data.Char (isUpper, isAlpha, toUpper)

abbrWord :: String -> String
abbrWord [] = ""
abbrWord word
  | null uppers || uppers == word = [toUpper $ head word]
  | otherwise                     = uppers
  where uppers = filter isUpper word

abbreviate :: String -> String
abbreviate xs = concatMap abbrWord . words $ convert <$> xs
  where convert c = if isAlpha c then c else ' '
