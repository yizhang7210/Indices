-- My Solution
main = print . sum $ filter (\x -> x `mod` 3 == 0 || x `mod` 5 == 0) [1..999]
-- Returns 233168

-- My favourite
main = print . sum $ [n | n <- [1..999], n `mod` 5 == 0 || n `mod` 3 == 0]
