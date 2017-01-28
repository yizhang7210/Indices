-- My Solution
import Data.Ratio
import Data.List

elimCommonDigit :: Int -> Int -> Ratio Int
elimCommonDigit a b
    | b `mod` 10 == 0 = -1
    | commonDigit == "" = -1
    | otherwise = read (delete (commonDigit!!0) (show a)) % read (delete (commonDigit!!0) (show b))
    where commonDigit = intersect (show a) (show b)

main = print . denominator . product $ [num % den | num <-[10..99], den <-[(num+1)..99], (num % den) == (elimCommonDigit num den)]
