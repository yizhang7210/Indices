-- My Solution
-- Starting with the next number, find the first number that none of the previous primes divide into it.
-- That should be the next prime. Add it to the list and recurs. I believe it's O(n*log n).
primes :: Integer -> [Integer]
primes 0 = []
primes 1 = [2]
primes n = prevs ++ (take 1 $ filter (\x -> not . or $ map ((==) 0 . mod x) prevs) [(l+1)..])
    where prevs =  primes (n-1)
          l = prevs !! (fromIntegral (n-2))

main = print . last $ primes 10001
