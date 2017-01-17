-- My solution
import Data.Char

fac :: Integer -> Integer
fac 1 = 1
fac x = x * fac (x-1)

main = print . sum . map digitToInt . show $ fac 100
