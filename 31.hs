-- Solution taken from https://wiki.haskell.org/Euler_problems/31_to_40
ways :: [Int] -> [Int]
ways [] = 1 : repeat 0
ways (coin: coins) = n where
    n = zipWith (+) (ways coins) (replicate coin 0 ++ n)

main = print $ ways [1,2,5,10,20,50,100,200] !! 200
