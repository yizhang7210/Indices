-- My Solution

fib :: Int -> Integer
fib n = fibList !! n
    where fibList = map fib' [0..n]
          fib' 0 = 1
          fib' 1 = 1
          fib' x = fibList !! (x-1) + fibList !! (x-2)

-- Binary search with memoization, relying on xs being lazily evaluated.
binarySearch :: (Integer -> Bool) -> Int -> Int
binarySearch f n = binarySearch' f 0 n where
    binarySearch' g from to
        | g (xs !! from) = from
        | g (xs !! mid) = binarySearch' g from mid
        | otherwise = binarySearch' g (mid+1) to where
            mid = from + (to - from) `div` 2
            xs = map fib [0..n]

main = print $ 1 + binarySearch (\x -> length (show x) >= 1000) 5000

-- The naive way which didn't seem to work
-- For a large on like this, O(n) is no longer good enough. O(log(n)) is better.
--main = print . snd . (!! 0) . take 1 . filter (\(x, ind) -> length (show x) >= 100) $ zip (map fib [0..]) [1..]
