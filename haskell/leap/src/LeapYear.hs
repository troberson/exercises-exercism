module LeapYear (isLeapYear) where

isLeapYear :: Integer -> Bool
isLeapYear year = yearDiv 4 && (not (yearDiv 100) || yearDiv 400)
  where yearDiv x = year `mod` x == 0
