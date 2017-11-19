-- My Solution

lastN :: Int -> [a] -> [a]
lastN n xs = drop (length xs - n) xs

main = print . lastN 10 . show . sum $ [x^x | x <- [1..1000]]
