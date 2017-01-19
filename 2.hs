fib :: Int -> Int
fib n = round $ phi ** fromIntegral n / sq5
    where
        sq5 = sqrt 5 :: Double
        phi = (1 + sq5) / 2

goodFib :: Int -> Integer
goodFib n = fibList !! n
    where fibList = map goodFib' [0..n]
          goodFib' 0 = 1
          goodFib' 1 = 1
          goodFib' x = fibList !! (x-1) + fibList !! (x-2)


-- My Solution
--main = print . sum $ filter (\x -> x < 4000000 && x `mod` 2 == 0) $ map fib [1..3000]
-- Returns 4613732

-- The best I saw
main = print . sum $ filter (even) $ takeWhile (<4000000) $ map goodFib [1..]
