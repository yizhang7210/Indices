-- My Solution
import Data.Char (intToDigit)
import Data.List (reverse)
import Numeric (showIntAtBase)

isPalindrom :: String -> Bool
isPalindrom a = compare a (reverse a) == EQ

isDoublePalindrom :: Integer -> Bool
isDoublePalindrom x = isPalindrom (show x) && isPalindrom (showIntAtBase 2 intToDigit x "")

main = print . sum $ filter isDoublePalindrom [1..999999]

