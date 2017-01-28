-- My Solution
import Data.Numbers.Primes
import Data.List

rotations :: String -> [String]
rotations a = [a] ++ rotations (next a) where
    next s = tail s ++ [head s]

isCircular :: Integer -> Bool
isCircular x = all isPrime . map (\a -> read a :: Int) . take (length s) $ rotations s where
    s = show x

main = print . length $ filter isCircular [1..999999]
