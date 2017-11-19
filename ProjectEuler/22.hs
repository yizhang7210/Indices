-- My Solution
import Data.List.Split
import Data.Char
import Data.List

removeChar :: Char -> String -> String
removeChar c xs = [x | x <- xs, x /= c]

toValue :: String -> Integer
toValue s = sum . map (\c -> toInteger ((ord . toLower) c - a))  $ s
    where a = ord 'a' - 1

getScore :: [String] -> Integer
getScore names = sum . map (\(name, index) -> toValue name * index) $ zip (sort names) [1..]

main = do
    content <- readFile "22.txt"
    print . getScore . map (removeChar '\"') . splitOn "," $ content
