module Bob (responseFor) where

import Data.Char (isSpace, isUpper, isLower)
import Data.List (isSuffixOf)

responseFor :: String -> String
responseFor x
  | isYelling && isQuestion = "Calm down, I know what I'm doing!"
  | isQuestion              = "Sure."
  | isYelling               = "Whoa, chill out!"
  | null phrase             = "Fine. Be that way!"
  | otherwise               = "Whatever."
  where
    phrase = filter (not . isSpace) x
    isQuestion = "?" `isSuffixOf` phrase
    isYelling  = any isUpper phrase && (not . any isLower) phrase

