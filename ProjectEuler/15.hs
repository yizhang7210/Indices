-- My Solution with help from
-- http://www.ryanhmckenna.com/2015/05/memoization-in-haskell.html
import Data.Array

nPath :: Int -> Int -> Integer
nPath n k = table ! (n, k) where
    bounds = ((0,0), (n, k))
    table = listArray bounds . map nPath' $ range bounds
    nPath' (_, 0) = 1
    nPath' (0, _) = 1
    nPath' (i, j) = table ! (i-1, j) + table ! (i, j-1)

main = print $ nPath 20 20

-- Or you can just do:
-- 40!/(20!*20!)
