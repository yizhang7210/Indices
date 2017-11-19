-- My Solution
import Math.NumberTheory.ArithmeticFunctions

sumFactors :: Int -> Int
sumFactors a = sum (divisors a) - a

isAmicable :: Int -> Bool
isAmicable x = sumFactors y == x && y /= x
    where y = sumFactors x

main = print . sum . filter isAmicable $ [2..10000]
