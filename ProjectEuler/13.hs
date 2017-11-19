-- My Solution
firstTenDigit :: [Integer] -> String
firstTenDigit xs = take 10 . show . sum $ xs

parse :: [String] -> [Integer]
parse x = [read s :: Integer | s <- x]

main = do
    content <- readFile "13.txt"
    putStrLn .firstTenDigit . parse $ lines content
