-- My Solution

digitSum :: Integer -> Integer
digitSum 0 = 0
digitSum x = d + digitSum ((x - d) `div` 10)
    where d = x `mod` 10

main = print . digitSum $ 2^1000

-- An easier solution:
--main = sum . map digitToInt . show $ 2^1000
