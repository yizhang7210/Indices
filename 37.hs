-- My Solution
import Data.Numbers.Primes (primes, isPrime)
import Data.List (reverse)

isLeftTruncatable :: Integer -> Bool
isLeftTruncatable x
    | x < 10 = isPrime x
    | otherwise = isPrime x && isLeftTruncatable y where
        y = (\a -> read a :: Integer) . tail . show $ x

isRightTruncatable :: Integer -> Bool
isRightTruncatable x
    | x < 10 = isPrime x
    | otherwise = isPrime x && isRightTruncatable y where
        y = (\a -> read a :: Integer) . reverse . tail . reverse. show $ x


isDoubleTruncatable :: Integer -> Bool
isDoubleTruncatable x = isLeftTruncatable x && isRightTruncatable x

main = print . sum . take 11. filter isDoubleTruncatable $ drop 4 primes
