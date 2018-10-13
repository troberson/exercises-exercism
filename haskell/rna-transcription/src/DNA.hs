module DNA (toRNA) where

toRNA :: String -> Maybe String
toRNA = mapM convert
  where
    convert x =
      case x of
        'G' -> Just 'C'
        'C' -> Just 'G'
        'T' -> Just 'A'
        'A' -> Just 'U'
        _   -> Nothing

