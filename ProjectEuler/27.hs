-- Brute force one
import Data.Numbers.Primes
import Data.List

as :: [Int]
as = [-999..999]

bs :: [Int]
bs = thePrimes ++ map (0 - ) thePrimes where
    thePrimes = takeWhile (<=1000) primes

longestCycle :: (Int, Int) -> Int
longestCycle (a, b) =  head $ filter (\x -> not . isPrime $ (x*x + x*a + b)) [0..]

tupleProduct :: (Int, Int) -> Int
tupleProduct (a,b) = a * b

main = print . tupleProduct $ theList !! maxInd where
    theList = [(a,b) | a <- as, b <- bs]
    maxInd = getElem $ elemIndex maxElem cycles
    getElem (Just a) = a
    getElem Nothing = -1
    cycles = map longestCycle theList
    maxElem = maximum cycles
