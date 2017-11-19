-- My Solution
import Data.Char

fac :: Int -> Int
fac a = product [1..a]

sumFac :: Int -> Integer
sumFac x = sum . map (toInteger . fac . digitToInt) $ show x

-- Solve 9!*n <= 10^n resolve n <= 6, i.e. it's not possible to have
-- numbers more than 6 digits
main = print . sum $ [n | n <-[11..999999], sumFac n == toInteger n]
