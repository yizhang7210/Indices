-- My Solution

leapYearDays = [31,29,31,30,31,30,31,31,30,31,30,31]
nonLeapYearDays = [31,28,31,30,31,30,31,31,30,31,30,31]

slice :: Int -> Int -> [a] -> [a]
slice from to xs = take (to - from + 1) (drop from xs)

isLeapYear :: Int -> Bool
isLeapYear x
    | x `mod` 4 /= 0 = False
    | x `mod` 100 == 0 && x `mod` 400 /= 0 = False
    | otherwise = True

daysFromJanFirst :: Int -> Int -> Int
daysFromJanFirst month year
    | isLeapYear year = sum . slice 0 (month-1) $ leapYearDays
    | otherwise = sum . slice 0 (month-1) $ nonLeapYearDays

daysFrom1900 :: Int -> Int -> Int
daysFrom1900 0 1900 = 0
daysFrom1900 0 year
    | isLeapYear (year-1) = daysFrom1900 0 (year-1) + 366
    | otherwise = daysFrom1900 0 (year-1) + 365
daysFrom1900 month year = daysFromJanFirst month year + daysFrom1900 0 year

main = print . length . filter (\x -> x `mod` 7 == 6) $ [daysFrom1900 m y | m <- [0..11], y <-[1901..2000]]
