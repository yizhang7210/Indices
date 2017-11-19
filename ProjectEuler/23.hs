-- My Solution
import Math.NumberTheory.ArithmeticFunctions
import qualified Data.Set as Set

limit :: Int
limit = 28123

sumFactors :: Int -> Int
sumFactors a = sum (divisors a) - a

isAbundant :: Int -> Bool
isAbundant a = sumFactors a > a

abundants :: [Int]
abundants = filter isAbundant [1..limit]

abundantSums :: Set.Set Int
abundantSums = Set.fromList [x + y | x <- abundants, y <- abundants, x + y <= limit]

--main = print . sum $ filter (\x -> x `Set.notMember` abundantSums) [1..limit]

-- A much more consise one.
main = print $ sum [1..limit] - sum (uniq (genSums abundants'))
    where uniq = Set.toList . Set.fromList
          abundants' = filter isAbundant [12..limit]
          genSums xs = [x + y | x <- xs, y <- xs, y >= x, x + y <= limit]

