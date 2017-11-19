module Basics
( doubleMe,
  doubleUs,
  doubleSmallNumber,
  boomBangs,
  removeNonUppercase,
  lucky,
  factorial,
  addVectors,
  head,
  firstLetter,
  bmiTell,
  bmiTell',
  initials,
  calcBmis,
  calcBmis',
  cylinder,
  maximum',
  replicate',
  take',
  reverse',
  repeat',
  zip',
  elem',
  quicksort,
  compareWithHundred,
  divideByTen,
  applyTwice,
  zipWith',
  flip',
  map',
  filter',
  chain,
  sum',
  myMap',
  wordNums,
  isIn,
  encode,
  digitSum,
  firstTo,
  findKey
  ) where

-- | Imports:
import Data.List
import Data.Char
import qualified Data.Map as Map

-- | Basics:

doubleMe x = x + x
doubleUs x y = doubleMe x + doubleMe y
doubleSmallNumber x = if x > 100 then x else doubleMe x

conanO'Brien = "It's a-me Conan O'Brien!!!"


-- | Lists: 
-- Functions: head/tail/init/last/length/null/reverse/take/drop/maxium/minimum/sum/product/elem
-- Infinite functions: cycle/repeat/replicate

boomBangs :: [Integer] -> [[Char]]
boomBangs xs = [if x < 10 then "BOOM!" else "BANG" | x <- xs, odd x]

removeNonUppercase :: [Char] -> [Char]
removeNonUppercase st = [c | c <- st, c `elem` ['A'..'Z']]


-- | Tuples:
-- Functions: fst/snd (on pairs), zip


-- | Types:
-- Types: Int/Integer, Float/Double, Bool, Char, String, Tuples.
-- Type classes: Eq, Ord, Show, Read, Enum, Bounded, Num, Floating, Integral.


-- | Functions:

lucky :: Int -> String
lucky 7 = "Hey lucky number!"
lucky _ = "Try again..."

factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n-1)

addVectors :: (Double, Double) -> (Double, Double) -> (Double, Double)
addVectors (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)

head' :: [a] -> a
head' [] = error "Can't call head on empty"
head' (x:_) = x

firstLetter :: String -> String
firstLetter "" = "Empty String"
firstLetter all@(x:xs) = "The first letter of " ++ all ++ " is " ++ [x];

bmiTell :: Double -> String
bmiTell bmi
	| bmi <= 18.5 = "Underweight sir/madam."
	| bmi <= 25.0 = "Good."
	| bmi <= 30.0 = "Fat boy!"
	| otherwise = "what?"

bmiTell' :: Double -> Double -> String
bmiTell' weight height
	| bmi <= 18.5 = "Underweight sir/madam."
	| bmi <= 25.0 = "Good."
	| bmi <= 30.0 = "Fat boy!"
	| otherwise = "what?"
	where bmi = weight / height ^ 2

initials :: String -> String -> String
initials firstname lastname = [f] ++ ". " ++ [l] ++ "."
	where (f:_) = firstname
	      (l:_) = lastname

calcBmis :: [(Double, Double)] -> [Double]
calcBmis xs = [bmi w h | (w,h) <- xs]
	where bmi weight height = weight / height ^ 2

calcBmis' :: [(Double, Double)] -> [Double]
calcBmis' xs = [bmi | (w,h) <- xs, let bmi = w / h ^ 2]

cylinder :: Double -> Double -> Double
cylinder r h = 
	let sideArea = 2 * pi * r * h
	    topArea = pi * r * r
	in sideArea + 2 * topArea


-- | Recursion:

maximum' :: (Ord a) => [a] -> a
maximum' [x] = x
maximum' (x:xs) = max x (maximum' xs)

replicate' :: Int -> a -> [a]
replicate' n x
	| n <= 0  = []
	| otherwise =  x : replicate' (n-1) x

take' :: Int -> [a] -> [a]
take' n _
	| n <= 0 = []
take' _ [] = []
take' n (x:xs) = x : take' (n-1) xs

reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = reverse' xs ++ [x]

repeat' :: a -> [a]
repeat' x = x : repeat' x

zip' :: [a] -> [b] ->[(a,b)]
zip' _ [] = []
zip' [] _ = []
zip' (x:xs) (y:ys) = (x,y) : zip' xs ys

elem' :: (Eq a) => a -> [a] -> Bool
elem' _ [] = False
elem' x (y:ys) = x == y || elem' x ys

quicksort:: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) = quicksort smalls ++ [x] ++ quicksort bigs
	where smalls = [a | a <- xs, a<=x]
	      bigs = [a | a <- xs, a >=x]


-- | High order functions:

compareWithHundred :: Int -> Ordering
compareWithHundred = compare 100

divideByTen :: (Floating a) => a -> a
divideByTen = (/10)

applyTwice :: (a -> a) -> a -> a
applyTwice f x = f . f $ x

zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ _ [] = []
zipWith' _ [] _ = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys

flip' :: (a -> b -> c) -> (b -> a -> c)
flip' f x y = f y x

map' :: (a -> b) -> [a] -> [b]
map' _ [] = []
map' f (x:xs) = f x : map f xs

filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' f (x:xs)
	| f x = x : filter' f xs
	| otherwise = filter' f xs

chain :: Integer -> [Integer]
chain 1 = [1]
chain x
	| even x = x : chain (x `div` 2)
	| otherwise = x : chain (3 * x + 1)

numLongChains :: Int
numLongChains = length $ filter (\xs -> length xs > 15) $  (map chain [1..100])

sum' :: (Num a) => [a] -> a
sum' = foldl (+) 0

myMap' :: (a -> b) -> [a] -> [b]
myMap' f xs = foldl (\acc x -> acc ++ [f x]) [] xs

oddSquareSum :: Integer
oddSquareSum = sum . takeWhile (<10000) . filter odd $ map (^2) [1..]


-- | Modules:

wordNums :: String -> [(String, Int)]
wordNums = map (\ws -> (head ws, length ws)) . group . sort . words

isIn :: (Eq a) => [a] -> [a] -> Bool
isIn needle haystack = any (needle `isPrefixOf`) (tails haystack)

encode :: Int -> String -> String
encode off s = map (\c -> chr $ ord c + off) s

digitSum :: Int -> Int
digitSum = sum . map digitToInt . show

firstTo :: Int -> Maybe Int
firstTo n = find (\x -> digitSum x == n) [1..]

findKey :: (Eq k) => k -> [(k,v)] -> Maybe v
findKey _ [] = Nothing
findKey key ((k,v):xs)
	| key == k = Just v
	| otherwise = findKey key xs

