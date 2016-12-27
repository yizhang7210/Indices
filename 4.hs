-- My Solution
import Data.List

isPalindrom :: Integer -> Bool
isPalindrom a = compare (show a) (reverse $ show a) == EQ

main = print . last . sort $ [x * y | x <- [100..999], y <- [100..999], isPalindrom $ x*y]
-- Returns 906609
