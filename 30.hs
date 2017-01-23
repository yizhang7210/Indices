-- My Solution
import Data.Char

fifthPowerSum :: Int -> Int
fifthPowerSum a = sum . map ((^5) . digitToInt) $ show a

main = print . sum $ filter (\x -> fifthPowerSum x == x) [2..999999]
