fib :: Int -> Int
fib n = round $ phi ** fromIntegral n / sq5
    where
        sq5 = sqrt 5 :: Double
        phi = (1 + sq5) / 2

-- My Solution
main = print . sum $ filter (\x -> x < 4000000 && x `mod` 2 == 0) $ map fib [1..3000]
-- Returns 4613732

-- The best I saw
main = print . sum $ filter (even) $ takeWhile (<4000000) $ map fib [1..]
