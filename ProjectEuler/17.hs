-- My Solution
numToWord :: Int -> String
numToWord 0 = ""
numToWord 1 = "one"
numToWord 2 = "two"
numToWord 3 = "three"
numToWord 4 = "four"
numToWord 5 = "five"
numToWord 6 = "six"
numToWord 7 = "seven"
numToWord 8 = "eight"
numToWord 9 = "nine"
numToWord 10 = "ten"
numToWord 11 = "eleven"
numToWord 12 = "twelve"
numToWord 13 = "thirteen"
numToWord 14 = "fourteen"
numToWord 15 = "fifteen"
numToWord 16 = "sixteen"
numToWord 17 = "seventeen"
numToWord 18 = "eighteen"
numToWord 19 = "nineteen"
numToWord 20 = "twenty"
numToWord 30 = "thirty"
numToWord 40 = "forty"
numToWord 50 = "fifty"
numToWord 60 = "sixty"
numToWord 70 = "seventy"
numToWord 80 = "eighty"
numToWord 90 = "ninety"
numToWord 1000 = "oneThousand"
numToWord x
    | 20 < x && x < 100 = numToWord (x - x `mod` 10) ++ numToWord (x `mod` 10)
    | 100 <= x && x < 1000 && (x `mod` 100 == 0) = numToWord (x `div` 100) ++ "Hundred"
    | 100 < x && x < 1000 = numToWord (x `div` 100) ++ "HundredAnd" ++ numToWord (x `mod` 100)
numToWord _ = "Over OneThousand"

main = print . sum $ map (length . numToWord) [1..1000]

