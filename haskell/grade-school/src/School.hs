module School (School, add, empty, grade, sorted) where

import qualified Data.Set as Set

import Data.IntMap.Strict (IntMap)
import qualified Data.IntMap.Strict as IntMap

type School = IntMap [String]

add :: Int -> String -> School -> School
add gradeNum student = IntMap.insertWith addSorted gradeNum [student]
  where
    addSorted [] old = old
    addSorted (new:_) old = Set.toAscList . Set.fromList $ new : old

empty :: School
empty = IntMap.empty

grade :: Int -> School -> [String]
grade = IntMap.findWithDefault []

sorted :: School -> [(Int, [String])]
sorted = IntMap.toAscList

