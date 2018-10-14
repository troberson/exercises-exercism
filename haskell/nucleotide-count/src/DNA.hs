module DNA (nucleotideCounts, Nucleotide(..)) where

import Control.Monad (ap)
import Text.Read (readEither)
import Data.Map.Strict (Map)
import qualified Data.Map.Strict as Map

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show, Read, Enum)

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts = createMap . readString
  where
    readString = mapM (readEither . return)
    createMap  = (pure nucMap <*>)
    nucMap xs  = Map.fromList $ createList (count xs) [A ..]
    createList = map . ap (,)
    count xs x = length $ filter (== x) xs

