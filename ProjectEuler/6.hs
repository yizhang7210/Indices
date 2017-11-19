-- My Solution
--main = print $ foldl (\x y -> x + y*(5050-y)) 0 [1..100]

-- Best I saw:
main = print $ 5050^2 - 100 * 101 * 201 `div` 6
