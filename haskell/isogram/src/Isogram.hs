module Isogram (isIsogram) where

import Data.Char (toLower, isAlpha)
import qualified Data.Set as Set

isIsogram :: String -> Bool
isIsogram str = length unique == length cleanString
  where
    unique = Set.fromList cleanString
    cleanString = toLower <$> filter isAlpha str

