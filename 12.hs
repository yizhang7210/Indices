-- My Solution
import Data.Map (fromListWith, toList)
-- After cabal install primes
import Data.Numbers.Primes (primeFactors)

triangle :: Integer -> Integer
triangle n = sum [1..n]

frequency :: (Ord a) => [a] -> [(a, Integer)]
frequency xs = toList . fromListWith (+) $ [(x, 1) | x <- xs]

-- After the prime factor, the product of the power plus ones is the the number of divisors.
numDivisors :: Integer -> Integer
numDivisors n = foldl (\acc (x,c) -> acc * (c+1)) 1 . frequency . primeFactors $ n

main = print . take 1 . filter (\x -> numDivisors x > 500) $ map triangle [1..]

