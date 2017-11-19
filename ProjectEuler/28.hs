-- My Solution

sumCorners :: Int -> Int
sumCorners n = 4*n*n - 6*n + 6

main = print . (+1) . sum $ map sumCorners [3,5..1001]
