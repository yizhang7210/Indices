import Data.List

isPanDigital :: String -> Bool
isPanDigital s = sort s == "123456789"

main = print . take 1. filter isPanDigital . map (\x -> show x ++ show (2*x)) $ [9876,9875..1234]

