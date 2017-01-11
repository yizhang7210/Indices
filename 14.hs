-- My Solution
import Data.List

calcCollatzLength :: Int -> Int
calcCollatzLength 1 = 1
calcCollatzLength n
    | even n = 1 + calcCollatzLength (n `div` 2)
    | otherwise = 1 + calcCollatzLength (3*n+1)

lengths = map calcCollatzLength [1..1000000]

main = print $ elemIndex (maximum lengths) lengths

